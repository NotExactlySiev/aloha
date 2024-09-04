// caller functions for jumptable
#include "common.h"
#include <libgpu.h>

extern volatile s32 D_800234B0;

int call_StoreImage(RECT *rect, u_long *p) {
    return StoreImage(rect, p);
}

int call_MoveImage(RECT *rect, int x, int y) {
    return MoveImage(rect, x, y);
}

DISPENV *call_GetDispEnv(DISPENV *env) {
    return GetDispEnv(env);
}

DRAWENV *call_GetDrawEnv(DRAWENV *env) {
    return GetDrawEnv(env);
}

void call_SetDrawEnv(DR_ENV *dr_env, DRAWENV *env) {
    SetDrawEnv(dr_env, env);
}

void call_SetDrawOffset(DR_OFFSET *p, u_short *ofs) {
    SetDrawOffset(p, ofs);
}

void call_SetDrawArea(DR_AREA *p, RECT *r) {
    SetDrawArea(p, r);
}

#undef GetGraphType
int call_GetGraphType(void) {
    return GetGraphType();
}

DISPENV *call_SetDefDispEnv(DISPENV *env, int x, int y, int w, int h) {
    return SetDefDispEnv(env, x, y, w, h);
}

DRAWENV *call_SetDefDrawEnv(DRAWENV *env, int x, int y, int w, int h) {
    return SetDefDrawEnv(env, x, y, w, h);
}

void call_SetDrawMode(DR_MODE *p, int dfe, int dtd, int tpage, RECT *tw) {
    SetDrawMode(p, dfe, dtd, tpage, tw);
}

int call_ClearImage(RECT *rect, u_char r, u_char g, u_char b) {
    return ClearImage(rect, r, g, b);
}

int call_LoadImage(RECT *rect, u_long *p) {
    return LoadImage(rect, p);
}

u_long *call_ClearOTag(u_long *ot, int n) {
    return ClearOTag(ot, n);
}

u_long *call_ClearOTagR(u_long *ot, int n) {
    return ClearOTagR(ot, n);
}

void call_DrawOTag(u_long *p) {
    DrawOTag(p);
}

DISPENV *call_PutDispEnv(DISPENV *env) {
    return PutDispEnv(env);
}

DRAWENV *call_PutDrawEnv(DRAWENV *env) {
    return PutDrawEnv(env);
}

int call_DrawSync(int mode) {
    return DrawSync(mode);
}

int call_ResetGraph(int mode) {
    return ResetGraph(mode);
}

void call_wait_frame(void) {
    wait_frame();
}

int call_VSync(int mode) {
    return VSync(mode);
}

int get_vsync_event_cnt(void) {
    return D_800234B0;
}

void wait_frame(void) {
    int curr = get_vsync_event_cnt();
    while (curr == get_vsync_event_cnt());
}

int call_SetGraphDebug(int level) {
    return SetGraphDebug(level);
}

void call_SetDispMask(int mask) {
    SetDispMask(mask);
}

void call_DrawPrim(void *p) {
    DrawPrim(p);
}

u_short call_LoadClut(u_long *clut, int x, int y) {
    return LoadClut(clut, x, y);
}

u_short call_LoadTPage(u_long *pix, int tp, int abr, int x, int y, int w, int h) {
    return LoadTPage(pix, tp, abr, x, y, w, h);
}

long call_SetVideoMode(long mode) {
    return SetVideoMode(mode);
}

long call_GetVideoMode(void) {
    return GetVideoMode();
}

void jt_series_gpu(void) {
    jt_set(call_ResetGraph, 0x180);
    jt_set(call_wait_frame, 0x181);
    jt_set(call_SetGraphDebug, 0x182);
    jt_set(call_SetDispMask, 0x183);
    jt_set(get_vsync_event_cnt, 0x184);
    jt_set(call_PutDispEnv, 0x185);
    jt_set(call_PutDrawEnv, 0x186);
    jt_set(call_ClearOTag, 0x187);
    jt_set(call_ClearOTagR, 0x188);
    jt_set(call_DrawOTag, 0x189);
    jt_set(call_LoadImage, 0x18A);
    jt_set(call_ClearImage, 0x18B);
    jt_set(call_DrawSync, 0x18C);
    jt_set(call_SetDrawMode, 0x18D);
    jt_set(call_SetDefDispEnv, 0x18E);
    jt_set(call_SetDefDrawEnv, 0x18F);
    jt_set(call_GetGraphType, 0x190);
    jt_set(call_VSync, 0x191);
    jt_set(call_GetDispEnv, 0x192);
    jt_set(call_GetDrawEnv, 0x193);
    jt_set(call_SetDrawEnv, 0x194);
    jt_set(call_SetDrawOffset, 0x195);
    jt_set(call_SetDrawArea, 0x196);
    jt_set(call_StoreImage, 0x197);
    jt_set(call_MoveImage, 0x198);
    jt_set(call_DrawPrim, 0x199);
    jt_set(call_LoadTPage, 0x19A);
    jt_set(call_LoadClut, 0x19B);
    jt_set(call_SetVideoMode, 0x19C);
    jt_set(call_GetVideoMode, 0x19D);
}