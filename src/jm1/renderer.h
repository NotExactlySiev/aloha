#pragma once

#include "mesh.h"
#include <ints.h>
#include <libgpu.h>

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
