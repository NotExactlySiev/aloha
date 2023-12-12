#ifndef _SPRITE_H
#define _SPRITE_H

#include "common.h"

typedef struct {
    void *sprt_data;
    u16 tpage;
    u16 cluts[3];
} SpriteSet;

typedef struct {
    s8  dx;
    s8  dy;
    u16 uv;     // tile index 0-255
} SpriteThing;  // SpriteTile

typedef struct {
    u32    count;
    SpriteThing sprts[];
} Sprite;


void sprite_init(void);   // init sprite system
void sprite_load_tiles(u32 *raw, s16 x, s16 y);
void sprite_load_data(u32* data);
void _sprite_render(SpriteSet *set, s32 z, s32 id, s32 x, s32 y, u8 col, s32 clutidx);
// I think stuff above this are shared between files, and the other functions are file specific (not defined here)

void sprite_render(s32 z, s32 idx, s32 offx, s32 offy, u8 col, s32 clutidx);

#endif  // _SPRITE_H