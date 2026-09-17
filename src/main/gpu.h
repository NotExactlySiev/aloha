#pragma once

#include <libgpu.h>

void gpu_init(void);
void call_ResetGraph(int mode);
int call_SetGraphDebug(int level);
void call_SetDispMask(int mask);
DISPENV *call_SetDefDispEnv(DISPENV *env, int x, int y, int w, int h);
DRAWENV *call_SetDefDrawEnv(DRAWENV *env, int x, int y, int w, int h);
void wait_frame(void);
void call_wait_frame(void);
int call_DrawSync(int mode);
DRAWENV *call_PutDrawEnv(DRAWENV *env);
DISPENV *call_PutDispEnv(DISPENV *env);
