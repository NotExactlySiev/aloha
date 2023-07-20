#include "common.h"

typedef struct {
    u16 val;
    u16 _pad0;
    u16 mode;
    u16 _pad1;
    u16 max;
    u16 _pad2;
    u32 _pad;
} cntregs_t;

extern cntregs_t TIMER_REGS[4];
extern cntregs_t *g_TimerRegs;// = TIMER_REGS; // TODO

INCLUDE_ASM("asm/main/nonmatchings/libapi/rcnt", SetRCnt);

u16 GetRCnt(s32 arg0) {
    arg0 = arg0 & 0xFFFF;
    if (arg0 >= 3) {
        return 0;
    }
    return g_TimerRegs[arg0].val;
}

INCLUDE_ASM("asm/main/nonmatchings/libapi/rcnt", StartRCnt);

INCLUDE_ASM("asm/main/nonmatchings/libapi/rcnt", StopRCnt);

s32 ResetRCnt(s32 arg0) {
    arg0 = arg0 & 0xFFFF;
    if (arg0 >= 3) return 0;
    g_TimerRegs[arg0].val = (u16) 0;
    return 1;
}