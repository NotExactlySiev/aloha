#pragma once

#include "mesh.h"
#include <ints.h>
#include <libgpu.h>

void func_800E5B88(s16, s16, s16); // does this do anything?
int func_800E5DD8(SVECTOR *v, u32 meshid); // camera frustum check?
void func_800E5E60(SVECTOR *pos, SVECTOR *angle, u32 id); // render model
//
int func_800F4354(SVECTOR *in, VECTOR *out, Mesh *m);

#define camera_frustum_cull func_800E5DD8
#define draw_model func_800E5E60
