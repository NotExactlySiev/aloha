#pragma once

#include "mesh.h"
#include <ints.h>
#include <libgpu.h>

// The id parameter in this function has this format:
//          ffff ffii iiii iiii
// Where the lower bits are the mesh index and the upper ones are flags defined
// in this enum.

enum {
    MODEL_FLAG_BIT0 = 0x400, // Unk
    MODEL_STATIC_OT = 0x800, // Has static OT layer
    MODEL_FLAG_BIT2 = 0x1000, // Also has to do with facing the camera
    MODEL_FLAG_BIT3 = 0x2000, // Face the camera?
    MODEL_BLACK_SHADOW = 0x4000, // Also has to do with facing the camera
    MODEL_WHITE_SHADOW = 0x8000,
    MODEL_SHADE_AT_MEDIUM = 0x10000, // Don't use flat shading for medium distance.
};

void func_800E543C(s16 x, s16 y, s16 z); // set_camera_position
void func_800E5458(s16 x, s16 y, s16 z); // set_camera_angle
void func_800E5B88(s16, s16, s16); // does this do anything?
int func_800E5DD8(SVECTOR *v, u32 meshid); // camera frustum check?
void func_800E5E60(SVECTOR *pos, SVECTOR *angle, u32 id); // render model
//

// Assembly functions
void func_800F42E0(void *p);
void func_800F42F4(u32 val);
u32 func_800F4338(void);
int func_800F4354(SVECTOR *in, VECTOR *out, Mesh *m);
// func_800F443C

#define camera_frustum_cull func_800E5DD8
#define draw_model func_800E5E60
