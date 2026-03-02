#ifndef _GBUFFER_H
#define _GBUFFER_H

#include <ints.h>
#include <libgpu.h>

#define OT_SIZE 567

typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u32 *ot;
    void *nextfree;
} GBuffer;

// this actually holds the primitive data
typedef struct {
    u32 ot[OT_SIZE];
    u32 prims[40960];
} PrimBuffer;

extern GBuffer *gbuffer_get_current(void);

#endif
