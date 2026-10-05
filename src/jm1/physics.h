#pragma once

#include "entity.h"

void func_800D7A64(void); // collision_init?
void func_800D7AC0(Entity *e); // collision
// func_800D7B3C
// func_800D7BDC
void func_800D7C70(Entity *e);
// func_800D7FD4
// func_800D81D4
// func_800D8374
void func_800D8514(Entity *e);
// func_800D861C
// func_800D86E4
void func_800D8720(s16 val);
// func_800D8730

// 0x100    bounce
// 0x200    solid
void func_800D8788(uint id, short v); // set collision?

// func_800D88B4
// func_800D8CEC
// func_800D8F40
// func_800D9150
// func_800D9354
void func_800D95E8(Entity *e, int *z, int *x);
void func_800D96B0(Entity *e, int z, int x, int y);
void func_800D973C(Entity *e);
// func_800D99C8
// func_800D99E8
void func_800D9A00(Entity *e, int *z, int *x, int *y);
int func_800D9CF8(Entity *e);
int func_800D9DD4(Entity *e);
int func_800D9E40(Entity *e);
// func_800D9EAC
int func_800D9F2C(Entity *e);

#define prepare_entity_collision func_800D7AC0
