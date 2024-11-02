#include "common.h"
#include <libcd.h>
#include <libpress.h>
#include <libgpu.h>
#include <libetc.h>
#include "cd/cd.h"
#include "movie.h"

// private
// TODO: make this stuff static

typedef struct {
    // rename these to something better later
    void *ptrs[2];
    int i;
    u32 *img_data;
    RECT img_rects[2];
    int curr_rect;
    RECT rect;  // macroblock rect
    u32 img_loaded;
} Decoder;

int D_80048014;  // movie_fading_out
int D_80048024;  // movie_over
int D_80048034;  // movie_frame_count
CdlLOC movie_loc;
Decoder decoder;


void init_decoder(Decoder *dec, MovieArgs *args)
{
    *dec = (Decoder) {
        .ptrs[0] = args->buffers[0],
        .ptrs[1] = args->buffers[1],
        .i = 0,
        .curr_rect = 0,
        .img_loaded = 0,
        .img_data = args->data_addr,
        .img_rects[0] = {
            .x = args->x1,
            .y = args->y1,
            .w = 960,
            .h = 240,
        },
        .img_rects[1] = {
            .x = args->x2,
            .y = args->y2,
            .w = 960,
            .h = 240,
        },
        .rect = {
            .x = args->x1,
            .y = args->y1,
            .w = 24,
            .h = 240,
        },
    };
}

void func_80021F7C(CdlLOC *loc, u32 mode)
{
    while (CdControl(CdlSeekL, (u8*) loc, NULL) == 0);
    while (CdRead2(mode | CdlModeStream) == 0);
}

void func_80021FD0(CdlLOC *loc, MovieArgs *args, void (*cb)(void))
{
    func_8001E608(0);
    D_80048024 = 0;
    DecDCToutCallback(cb);
    StSetRing(args->ring_addr, args->ring_size);
    StSetChannel(args->channel);
    D_80048034 = args->frame_count;
    StSetStream(1, 1, -1, NULL, NULL);
    func_80021F7C(loc, args->mode);
    D_80048014 = 0;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022074);       // 

void func_80022260(void)
{
    extern u_long StCdIntrFlag;
    if (StCdIntrFlag) {
        StCdInterrupt();
        StCdIntrFlag = 0;
    }

    LoadImage(&decoder.rect, decoder.img_data);
    decoder.rect.x += decoder.rect.w;
    RECT curr_img = decoder.img_rects[decoder.curr_rect];
    if (decoder.rect.x < curr_img.x + curr_img.w) {
        DecDCTout(decoder.img_data, decoder.rect.w * decoder.rect.h / 2);
    } else {
        decoder.img_loaded = 1;
        decoder.curr_rect = decoder.curr_rect != 1;
        decoder.rect.x = decoder.img_rects[decoder.curr_rect].x;
        decoder.rect.y = decoder.img_rects[decoder.curr_rect].y;
    }
}

void func_8002237C(Decoder *dec)
{
    uint *bs = 0;
    while ((bs = func_80022074(dec)) == 0);
    dec->i = dec->i != 1;
    DecDCTvlc(bs, dec->ptrs[dec->i]);
    StFreeRing(bs);
}

void func_800223EC(Decoder *dec)
{
    int timeout = 0x800000;
    while (dec->img_loaded == 0) {
        timeout -= 1;
        if (timeout == 0) {
            // what?
            printf("timeout!!\n");
            dec->img_loaded = 1;
            dec->curr_rect = !dec->curr_rect;
            dec->rect.x = dec->img_rects[dec->curr_rect].x;
            dec->rect.y = dec->img_rects[dec->curr_rect].y;
        }
    }
    dec->img_loaded = 0;
}

// FIXME: this doesn't work sometimes
int func_80022474(char *filename, MovieArgs *args, int (*cb)(void))
{
    int ret = 0;
    DISPENV dispenv;
    DRAWENV drawenv;

    call_wait_frame(); // argument?
    call_SetDispMask(0);
    
    CdlFILE f;
    if (cd_fs_get_file(&f, filename) == 0)
        return -1;
    movie_loc = f.pos;
    init_decoder(&decoder, args);
    func_80021FD0(&movie_loc, args, func_80022260);
    func_8002237C(&decoder); // fill one buffer
    while (1) {
        DecDCTin(decoder.ptrs[decoder.i], 3);
        DecDCTout(decoder.img_data, decoder.rect.w * decoder.rect.h / 2);
        func_8002237C(&decoder); // and the other one
        func_800223EC(&decoder);

        // TODO: this breaks it for some reason?? can't skip
        /*
        if (cb && ((*cb)() == 1)) {
            ret = 1;
            break;
        }
        */
        
        if (D_80048024 == 1) {
            ret = 0;
            break;
        }
        
        int other = decoder.curr_rect != 1;
        call_VSync();        
        call_SetDefDispEnv(&dispenv, decoder.img_rects[other].x, decoder.img_rects[other].y, decoder.img_rects[other].w, decoder.img_rects[other].h);
        if (get_tv_system() == MODE_PAL)
            dispenv.screen.y += 24;
        SetDefDrawEnv(&drawenv, decoder.img_rects[other].x, decoder.img_rects[other].y, decoder.img_rects[other].w, decoder.img_rects[other].h);
        dispenv.screen = args->rect;
        dispenv.isrgb24 = 1;
        dispenv.disp.w = (2 * dispenv.disp.w) / 3;
        call_PutDispEnv(&dispenv);
        PutDrawEnv(&drawenv);
        call_SetDispMask(1);
    }

    CdSync(0, NULL);
    u8 cdparam[8] = { CdlModeSpeed };
    u8 buffer[SECTOR_BYTES];

    while (CdControlB(CdlSetmode, cdparam, NULL) != 1);
    if (CdReady(1, NULL) == 1) {
        CdGetSector(buffer, 512);
    }

    DecDCToutCallback(0);
    CdDataCallback(0);
    CdReadyCallback(0);
    StUnSetRing();
    while (CdControlB(CdlPause, NULL, NULL) != 1);
    return ret;
}