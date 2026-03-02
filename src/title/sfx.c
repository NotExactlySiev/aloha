#include "sfx.h"
#include <shared.h>

static short D_800F4CFC = 0; // sfx handle
static int D_800F4D00 = -1; // sfx counter
static short D_800F4D04 = -1; // sfx return code

short sfx_play(u32 id)
{
    if (id == 0x2900) {
        if (D_800F4D00 > -1) {
            jt.sfx_release(D_800F4CFC);
        }
        D_800F4CFC = jt.sfx_play(id, 62, 100);
        D_800F4D00 = 0;
        D_800F4D04 = D_800F4CFC;
    } else {
        D_800F4D04 = jt.sfx_play(id, 62, 100);
    }
    return D_800F4D04;
}

void func_800E0C24(void)
{
    if (D_800F4D00 > -1) {
        jt.sfx_release(D_800F4CFC);
        D_800F4D00 = -1;
    }
}

// sfx_tick
void func_800E0C74(void)
{
    if (D_800F4D00 > -1) {
        if (++D_800F4D00 >= 32) {
            jt.sfx_release(D_800F4CFC);
            D_800F4D00 = -1;
        }
    }
}
