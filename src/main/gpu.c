#include "gpu.h"
#include "jumptable.h"
#include "main.h"
#include <libetc.h>
#include <libgte.h>

extern volatile int vsync_counter;

// 80022854
int call_StoreImage(RECT *rect, u_long *p)
{
    return StoreImage(rect, p);
}

// 80022874
int call_MoveImage(RECT *rect, int x, int y)
{
    return MoveImage(rect, x, y);
}

// 80022894
DISPENV *call_GetDispEnv(DISPENV *env)
{
    return GetDispEnv(env);
}

// 800228b4
DRAWENV *call_GetDrawEnv(DRAWENV *env)
{
    return GetDrawEnv(env);
}

// 800228d4
void call_SetDrawEnv(DR_ENV *dr_env, DRAWENV *env)
{
    SetDrawEnv(dr_env, env);
}

// 800228F4
void call_SetDrawOffset(DR_OFFSET *p, u_short *ofs)
{
    SetDrawOffset(p, ofs);
}

// 80022914
void call_SetDrawArea(DR_AREA *p, RECT *r)
{
    SetDrawArea(p, r);
}

// switching to newer psy-q, doesn't have this
// TODO: get rid of this once all uses of it have been decompiled.
// 80022934
int call_GetGraphType(void)
{
    return 0;
}

// 80022954
DISPENV *call_SetDefDispEnv(DISPENV *env, int x, int y, int w, int h)
{
    DISPENV *ret = SetDefDispEnv(env, x, y, w, h);
#ifdef VERSION_WORLD
    env->pad0 = get_video_mode() == MODE_PAL ? 1 : 0;
#endif
    return ret;
}

// 800229B0
DRAWENV *call_SetDefDrawEnv(DRAWENV *env, int x, int y, int w, int h)
{
    return SetDefDrawEnv(env, x, y, w, h);
}

// 800229D4
void call_SetDrawMode(DR_MODE *p, int dfe, int dtd, int tpage, RECT *tw)
{
    SetDrawMode(p, dfe, dtd, tpage, tw);
}

// 800229F8
int call_ClearImage(RECT *rect, u_char r, u_char g, u_char b)
{
    return ClearImage(rect, r, g, b);
}

// 80022A20
int call_LoadImage(RECT *rect, u_long *p)
{
    return LoadImage(rect, p);
}

// 80022A40
u_long *call_ClearOTag(u_long *ot, int n)
{
    return ClearOTag(ot, n);
}

// 80022A60
u_long *call_ClearOTagR(u_long *ot, int n)
{
    return ClearOTagR(ot, n);
}

// 80022A80
void call_DrawOTag(u_long *p)
{
    DrawOTag(p);
}

// 80022AA0
DISPENV *call_PutDispEnv(DISPENV *env)
{
    return PutDispEnv(env);
}

// 80022AC0
DRAWENV *call_PutDrawEnv(DRAWENV *env)
{
    return PutDrawEnv(env);
}

// 80022AE0
int call_DrawSync(int mode)
{
    return DrawSync(mode);
}

// 80022B00
void call_ResetGraph(int mode)
{
#ifdef VERSION_WORLD
    static int D_80047E64 = 0;
    if (mode == 0) {
        if (D_80047E64 == 0) {
            ResetGraph(0);
            D_80047E64 = 1;
        }

        return;
    }
#endif

    ResetGraph(mode);
}

// US: 80022B54
// JP: 800218BC
void call_wait_frame(void)
{
    wait_frame();
}

// US: 80022B74
// JP: 800218DC
int call_VSync(int mode)
{
    return VSync(mode);
}

// US: 80022B94
// JP: 800218FC
int get_vsync_event_cnt(void)
{
    return vsync_counter;
}

// US: 80022BA4
// JP: 8002190C
void wait_frame(void)
{
    int curr = get_vsync_event_cnt();
    while (curr == get_vsync_event_cnt());
}

// US: 80022BD8
// JP: 80021940
int call_SetGraphDebug(int level)
{
#ifdef VERSION_WORLD
    static int D_80047E68 = 0;
    int ret = 1;
    if (D_80047E68 == 0) {
        ret = SetGraphDebug(level);
        D_80047E68 = 1;
    }
    return ret;
#else
    return SetGraphDebug(level);
#endif
}

// US: 80022C1C
// JP: 80021960
void call_SetDispMask(int mask)
{
    SetDispMask(mask);
}

#ifdef VERSION_WORLD
// US: 80022C3C
void call_DrawPrim(void *p)
{
    DrawPrim(p);
}

// US: 80022C5C
u_short call_LoadClut(u_long *clut, int x, int y)
{
    return LoadClut(clut, x, y);
}

// US: 80022C7C
u_short call_LoadTPage(u_long *pix, int tp, int abr, int x, int y, int w, int h)
{
    return LoadTPage(pix, tp, abr, x, y, w, h);
}

// US: 80022CB0
long call_SetVideoMode(long mode)
{
    return SetVideoMode(mode);
}

// US: 80022CD0
long call_GetVideoMode(void)
{
    return GetVideoMode();
}
#endif

// US: 80022CF0
// JP: 80021980
void gpu_init(void)
{
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

#ifdef VERSION_WORLD
    jt_set(call_DrawPrim, 0x199);
    jt_set(call_LoadTPage, 0x19A);
    jt_set(call_LoadClut, 0x19B);
    jt_set(call_SetVideoMode, 0x19C);
    jt_set(call_GetVideoMode, 0x19D);
#endif

    // Extra exports not done by the original game
    // TODO: ifdef NEW_PSYQ
    jt_set(SetSemiTrans, 0x19E);
    jt_set(SetShadeTex, 0x19F);
    jt_set(SetTexWindow, 0x1A0);
}
