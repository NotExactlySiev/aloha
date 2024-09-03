#include "common.h"
#include <libspu.h>
#include <libgpu.h>
#include <libetc.h>

#include "shared.h"

#include "gameover.h"
#include "sprite.h"

#include "gbuffer.h"

static  s32      gbuffer_current_idx; 
static  GBuffer  gbuffers[2];

GBuffer *gbuffer_current;

void gbuffer_init(void)
{
    int i;
    int tv_standard;
    DRAWENV *draw;
    DISPENV *disp;

    jt.wait_for_vsync();    // wait_frame
    jt.SetDispMask(0);   // SetDispMask
    gbuffer_current_idx = 0;
    gbuffer_swap();    // clear
    sprite_init();
    jt.SetDefDispEnv(&gbuffers[0].disp, 0, 0, 256, 240);
    jt.SetDefDispEnv(&gbuffers[1].disp, 0, 256, 256, 240);
    jt.SetDefDrawEnv(&gbuffers[0].draw, 0, 256, 256, 240);
    jt.SetDefDrawEnv(&gbuffers[1].draw, 0, 0, 256, 240);
    
    for (i = 0; i < 2; i++) {
        draw = &gbuffers[i].draw;
        disp = &gbuffers[i].disp;


        draw->isbg = 1;
        draw->r0 = 0;
        draw->g0 = 0;
        draw->b0 = 0;
        draw->tw = D_800ED398;

        draw->dtd = 0;
        draw->dfe = 0;
        tv_standard = jt.get_tv_system();
        disp->screen.x = 4;
        disp->screen.y = tv_standard == MODE_PAL ? 36 : 12;
        disp->screen.w = 248;
        disp->screen.h = 216;
        disp->pad0 = tv_standard == MODE_PAL ? 1 : 0;
    }
}

void gbuffer_swap(void)
{
    // swap buffer
    gbuffer_current_idx = !gbuffer_current_idx;
    gbuffer_current = &gbuffers[gbuffer_current_idx];
    // clear ots and reset prim buffer
    jt.ClearOTag(gbuffer_current->ot, 4);
    gbuffer_current->next = gbuffer_current->prims;
}

void gbuffer_draw(void)
{
    jt.snd_queue_exec();
    jt.DrawSync(0);
    jt.VSync(0);
    // put env and draw
    jt.PutDispEnv(&gbuffer_current->disp);
    jt.PutDrawEnv(&gbuffer_current->draw);
    // draw ot
    jt.DrawOTag(gbuffer_current->ot);
}
