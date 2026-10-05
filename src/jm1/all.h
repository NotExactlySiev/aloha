#pragma once

#include <ints.h>
#include <libgpu.h>

// Putting here the declerations that we don't know which modules they belong to yet.

// ???
void func_800CFFB0(SVECTOR *pos, SVECTOR *rot, int id);

// ???
void func_800D1CBC(int x, int y, int z, int ground_y, int type);

// level stuff

// ???
int func_800E6684(int *frames, int *factors, int n);

// There's a collection of functions/modules related to the HUD here.

// score stuff

int func_800EB124(void);
void func_800EB134(int v);
void func_800EB16C(int points); // give_points
// func_800EB23C

#define give_points func_800EB16C

// timer stuff

// func_800EB354
// ...
// func_800EBCB8

// health stuff

// func_800EBE5C
// ...
// func_800EC2F4

// radar
void func_800EC408(s16 z, s16 x, u16 color); // radar_add
// func_800EC450
// func_800EC490
// func_800EC4A8
// func_800EC4E4
// func_800EC4F4
void func_800EC5C8(void);

#define radar_add_dot func_800EC408
