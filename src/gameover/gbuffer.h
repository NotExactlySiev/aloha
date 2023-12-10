#ifndef _GBUFFER_H
#define _GBUFFER_H

#include "common.h"
#include <libgpu.h>

#define LAYER_BG    0
#define LAYER_robbit_anim_keyframes   1 // don't know what this one is
#define LAYER_MENU  2

typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u32     ot[4];   // layers
    void    *next;
    u32     prims[0x8000];
} GBuffer;

extern GBuffer *gbuffer_current;

void gbuffer_init(void);
void gbuffer_swap(void);
void gbuffer_draw(void);


#endif  // _GBUFFER_H