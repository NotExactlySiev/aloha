#pragma once

#include <ints.h>
#include <types.h>

void func_800D9F98(void);
// func_800DA018
// func_800DA03C
// func_800DA060
// func_800DA07C
// func_800DA0D8
// func_800DA134
// func_800DA144
void func_800DA154(void *data);
void set_render_distance_horizontal(uint v);
void set_render_distance_vertical(uint v);
void set_simulation_distance(uint hor, uint down, uint up);
void func_800DA4C8(uint v);
int func_800DA4D8(void);
void func_800DA4E8(void);
//
//
void func_800DAAB4(void);
void func_800DAAFC(int v);
int is_outside_simulation_range(int x, int y, int z); // 800DAB0C
int is_outside_render_range(int x, int y, int z);
//
