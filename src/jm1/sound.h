#pragma once

#include <ints.h>

void func_800CE098(int a, int b);
void func_800CE0E4(int v);
int func_800CE0F8(void);
void func_800CE108(void);
// func_800CE158
void func_800CE168(short a, int vol, short pan, int *p, int prio);
void func_800CE2E0(short a, int vol, short pan, int *p);
void func_800CE304(short a, int vol, short pan);
// func_800CE324
int func_800CE3A8(int handle);
void func_800CE3F4(int handle);
//
//
//
//
//
void func_800CE6FC(int v);
void func_800CE77C(void);
// func_800CE820
void func_800CE8A8(void);
// func_800CE8D8
int func_800CE9A8(void);
u32 func_800CE9B8(void);
int func_800CEA14(void);
int func_800CEA48(void);
int func_800CEA7C(int v);
int func_800CEAAC(void);
void func_800CEADC(int id, int repeat);
int func_800CEB2C(void);
int func_800CEB6C(int z, int x);
int func_800CEC30(int val, int x, int y, int z);

#define sfx_play func_800CE304
#define sound_calculate_pan func_800CEB6C
#define sound_calculate_volume func_800CEC30
