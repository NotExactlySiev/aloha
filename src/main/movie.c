#include "common.h"
#include <libcd.h>
#include <libpress.h>
#include <libgpu.h>
#include <libetc.h>
#include "cd/cd.h"
#include "movie.h"

typedef struct {
    // TODO: rename these to something better later
    void *vlc_buffers[2];
    int curr_buffer;
    u32 *img_data;
    RECT img_rects[2];
    int curr_rect;
    RECT rect;  // macroblock rect
    u32 img_loaded;
} Decoder;

static Decoder decoder;
static CdlLOC movie_loc;
static int width = 0;
static int height = 0;
static int frame_count;
static int curr_frame;
static int fading_out;
static int finished;

static void init_decoder(Decoder *dec, MovieArgs *args)
{
    *dec = (Decoder) {
        .vlc_buffers[0] = args->buffers[0],
        .vlc_buffers[1] = args->buffers[1],
        .curr_buffer = 0,
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

static void seek_and_stream(CdlLOC *loc, u32 mode)
{
    while (CdControl(CdlSeekL, (u8*) loc, NULL) == 0);
    while (CdRead2(mode | CdlModeStream) == 0);
}

static void start_stream(CdlLOC *loc, MovieArgs *args, void (*cb)(void))
{
    func_8001E608(0);
    finished = 0;
    DecDCToutCallback(cb);
    StSetRing(args->ring_addr, args->ring_size);
    StSetChannel(args->channel);
    frame_count = args->frame_count;
    StSetStream(1, 1, -1, NULL, NULL);
    seek_and_stream(loc, args->mode);
    fading_out = 0;
}

static u32 *next_frame(Decoder *dec)
{
    u32 *addr;
    StHEADER *hdr;
    int timeout = 0x800000;
    while (1) {
        timeout -= 1;
        if (StGetNext(&addr, &hdr) == 0) break;
        if (timeout == 0) return NULL;
    }

    if (addr[0] != hdr->dummy1 || addr[1] != hdr->dummy2)
        return NULL;
    
    if (hdr->width != width || hdr->height != height) {
        // first frame (always?)
        ClearImage(&(RECT) { 0, 0, 640, 480 }, 0, 0, 0);
        width = hdr->width;
        height = hdr->height;
    }

    dec->img_rects[0].w = dec->img_rects[1].w = width * 3 / 2;
    dec->img_rects[0].h = dec->img_rects[1].h = height;
    dec->rect.h = height;

    if (curr_frame++ < hdr->frameCount) {
        curr_frame = hdr->frameCount;
    }

    if ((frame_count <= curr_frame + 3) && !fading_out) {
        fade_out(4, 0, 0);
        sndqueue_exec_all();
        fading_out = 1;
    }

    if (curr_frame >= frame_count)
        finished = 1;

    return addr;
}


static void dct_out_callback(void)
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

static void prepare_frame(Decoder *dec) 
{
    uint *bs = 0;
    while ((bs = next_frame(dec)) == 0);
    dec->curr_buffer = dec->curr_buffer != 1;
    DecDCTvlc(bs, dec->vlc_buffers[dec->curr_buffer]);
    StFreeRing(bs);
}

static void wait_for_decode(Decoder *dec)
{
    int timeout = 0x800000;
    while (dec->img_loaded == 0) {
        timeout -= 1;
        if (timeout == 0) {
            // the decode chain is dead. swap it yourself
            dec->img_loaded = 1;
            dec->curr_rect = !dec->curr_rect;
            dec->rect.x = dec->img_rects[dec->curr_rect].x;
            dec->rect.y = dec->img_rects[dec->curr_rect].y;
        }
    }
    dec->img_loaded = 0;
}

int play_movie_str(char *filename, MovieArgs *args, int (*cb)(void))
{
    int ret = 0;
    DISPENV dispenv;
    DRAWENV drawenv;

    curr_frame = 0;
    call_wait_frame();
    call_SetDispMask(0);
    
    CdlFILE f;
    if (cd_fs_get_file(&f, filename) == 0)
        return -1;
    movie_loc = f.pos;
    init_decoder(&decoder, args);
    start_stream(&movie_loc, args, dct_out_callback);
    prepare_frame(&decoder); // fill one buffer
    while (1) {
        DecDCTin(decoder.vlc_buffers[decoder.curr_buffer], 3);
        DecDCTout(decoder.img_data, decoder.rect.w * decoder.rect.h / 2);
        prepare_frame(&decoder); // and the other one
        wait_for_decode(&decoder);

        if (cb && ((*cb)() == 1)) {
            ret = 1;
            break;
        }
        
        if (finished == 1) {
            ret = 0;
            break;
        }

        // FIXME: if you remove this printf, the function breaks :/ it'll never
        // swap buffer and keep timing out on wait_for_decode. the thread
        // synchronization is broken in ways beyond my comprehension.
        printf("");

        int other = decoder.curr_rect != 1;
        call_VSync();
        call_SetDefDispEnv(&dispenv, decoder.img_rects[other].x, decoder.img_rects[other].y, decoder.img_rects[other].w, decoder.img_rects[other].h);
        if (get_video_mode() == MODE_PAL)
            dispenv.screen.y += 24;
        SetDefDrawEnv(&drawenv, decoder.img_rects[other].x, decoder.img_rects[other].y, decoder.img_rects[other].w, decoder.img_rects[other].h);
        dispenv.screen = args->rect;
        dispenv.isrgb24 = 1;
        dispenv.disp.w = (2 * dispenv.disp.w) / 3;
        call_PutDispEnv(&dispenv);
        PutDrawEnv(&drawenv);
        call_SetDispMask(1);
    }

    // cleanup
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