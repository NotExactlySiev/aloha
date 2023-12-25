// loads all the textures needed into VRAM

#include "common.h"
#include <shared.h>

#include <libgpu.h>

//extern u32 D_80060000[];
int func_800E58C4(void);
void *const tmp_data_buffer = (void*) 0x80060000;

#define TEXTURE_TOWER_WIDTH     106
#define TEXTURE_TOWER_HEIGHT    104
#define TEXTURE_ISLAND_WIDTH    70
#define TEXTURE_ISLAND_HEIGHT   76

typedef struct {
    u32 unk0;
    u32 unk1;
    u32 unk2;
    u32 unk3;
    u32 unk4;
    u16 clut[256];
    u32 unk5;
    u32 unk6;
    u32 unk7;
    u8  pix[];
} ImgFormat;    // TODO: is this TIM? what is this

// TODO: take these assets out of asm and link separately
// cluts
extern u16 D_800EC3AC[5][256];
extern u8 D_800FC9F8[]; // image3
extern u8 D_800ECDAC[]; // image2
extern u8 D_800FDA4C[]; // image0
extern u8 D_800FE478[]; // image1

extern u8 D_800FBABC[]; // tiles

extern u8 texture_isle_1_1[]; // texture_isle_1_1
extern u8 texture_isle_1_2[]; // texture_isle_1_2
extern u8 texture_isle_1_3[]; // texture_isle_1_3
extern u8 texture_isle_2_1[]; // texture_isle_2_1
extern u8 texture_isle_2_2[]; // texture_isle_2_2
extern u8 texture_isle_2_3[]; // texture_isle_2_3
extern u8 texture_isle_3_1[]; // texture_isle_3_1
extern u8 texture_isle_3_2[]; // texture_isle_3_2
extern u8 texture_isle_3_3[]; // texture_isle_3_3
extern u8 texture_isle_4_1[]; // texture_isle_4_1
extern u8 texture_isle_4_2[]; // texture_isle_4_2
extern u8 texture_isle_4_3[]; // texture_isle_4_3
extern u8 texture_isle_5_1[]; // texture_isle_5_1
extern u8 texture_isle_5_2[]; // texture_isle_5_2
extern u8 texture_isle_5_3[]; // texture_isle_5_3
extern u8 texture_isle_6_1[]; // texture_isle_6_1
extern u8 texture_isle_6_2[]; // texture_isle_6_2
extern u8 texture_isle_6_3[]; // texture_isle_6_3


extern u8 texture_tower_1[]; // texture_tower_1
extern u8 texture_tower_2[]; // texture_tower_2
extern u8 texture_tower_3[]; // texture_tower_3
extern u8 texture_tower_4[]; // texture_tower_4
extern u8 texture_tower_5[]; // texture_tower_5
extern u8 texture_tower_6[]; // texture_tower_6

// tower and island textures
void func_800E5B80(
    void* island1_data,
    void* island2_data,
    void* island3_data,
    void* tower_data,
    s16 tx, s16 ty,
    s16 clutx, s16 cluty)
{
    RECT rect;
    //ImgFormat* image = &D_80060000;
    ImgFormat* image = (void*) 0x80060000;

    // tower
    jt.decompress_lz1(tower_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_TOWER_WIDTH/2;
    rect.h = TEXTURE_TOWER_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);

    ty += 128;
    cluty += 1;

    // island 1
    jt.decompress_lz1(island1_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_ISLAND_WIDTH/2;
    rect.h = TEXTURE_ISLAND_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);


    tx += 0x28;
    cluty += 1;

    // island 2
    jt.decompress_lz1(island2_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_ISLAND_WIDTH/2;
    rect.h = TEXTURE_ISLAND_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);


    tx += 0x28;
    cluty += 1;

    // island 3
    jt.decompress_lz1(island3_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_ISLAND_WIDTH/2;
    rect.h = TEXTURE_ISLAND_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);
}

// font characters
void func_800E5EFC(void* data, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 4,
        .h = 8
    };
    jt.decompress_lz1(data+4, tmp_data_buffer);
    u16* p = tmp_data_buffer;
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 32; j++) {
            jt.LoadImage(&rect, p);
            jt.DrawSync(0);
            rect.x += rect.w;
            p += rect.w*rect.h;
        }
        rect.x = x;
        rect.y += rect.h;
    }    
}

// load clut
void func_800E5FE8(void* data, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 256,
        .h = 1
    };

    jt.LoadImage(&rect, data);
    jt.DrawSync(0);
}

// load 256*256
void func_800E6050(void* data, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 128,
        .h = 256
    };
    jt.decompress_lz1(data+4, tmp_data_buffer);
    jt.LoadImage(&rect, tmp_data_buffer+2);
    jt.DrawSync(0);
}

// load everything
void func_800E60D0(void)
{
    func_800E5B80(texture_isle_1_1, texture_isle_1_2, texture_isle_1_3, texture_tower_1, 0x140,   0, 0, 0x1E2);
    func_800E5B80(texture_isle_2_1, texture_isle_2_2, texture_isle_2_3, texture_tower_2, 0x1C0,   0, 0, 0x1E6);
    func_800E5B80(texture_isle_3_1, texture_isle_3_2, texture_isle_3_3, texture_tower_3, 0x240,   0, 0, 0x1EA);
    func_800E5B80(texture_isle_4_1, texture_isle_4_2, texture_isle_4_3, texture_tower_4, 0x140, 256, 0, 0x1EE);
    func_800E5B80(texture_isle_5_1, texture_isle_5_2, texture_isle_5_3, texture_tower_5, 0x1C0, 256, 0, 0x1F2);
    func_800E5B80(texture_isle_6_1, texture_isle_6_2, texture_isle_6_3, texture_tower_6, 0x240, 256, 0, 0x1F6);

    func_800E5EFC(D_800FBABC, 704, 0);

    func_800E6050(D_800FC9F8, 704, 256);
    func_800E6050(func_800E58C4() ? D_800FE478 : D_800FDA4C, 832, 0);
    func_800E6050(D_800ECDAC, 832, 256);

    func_800E5FE8(D_800EC3AC[0], 0, 509);
    func_800E5FE8(D_800EC3AC[1], 0, 510);
    func_800E5FE8(D_800EC3AC[2], 0, 508);
    func_800E5FE8(D_800EC3AC[3], 0, 507);
    func_800E5FE8(D_800EC3AC[4], 0, 511);
}