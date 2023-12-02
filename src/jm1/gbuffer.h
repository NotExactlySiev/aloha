#ifndef _GBUFFER_H
#define _GBUFFER_H

#include "common.h"
#include <libgpu.h>

typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u32* ot;
    u32* nextfree;
} GBuffer;

extern GBuffer *gbuffer_get_current(void);


#endif