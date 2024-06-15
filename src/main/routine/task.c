#include "common.h"


typedef struct {
    int (*fn)();
    s16 wait;
    s16 counter;
} RoutineTask;

int regular_add(int (*fn)(), s16 arg1);
int regular_add_tmp(int (*fn)(), s16 arg1);
void regular_remove(s32 arg0);
void regular_clear_tmps(int i);
void regular_active(s32 val);

// I think these two are defined in the assembly file to make sure they're adjacent
extern RoutineTask D_80023370[];
extern RoutineTask D_80023470[];
extern int D_800234B4;

int regular_add(int (*fn)(), s16 arg1)
{
    RoutineTask *p;
    int i;
    p = D_80023370;
    i = 32;
    while (--i) {
        if (p->fn == 0) {
            p->fn = fn;
            p->wait = arg1;
            p->counter = 0;
            return i;
        }
        p++;
    }
    return -1;
}

int regular_add_tmp(int (*fn)(), s16 arg1)
{
    RoutineTask *p;
    int i;
    p = D_80023470;
    i = 8;
    while (--i) {
        if (p->fn == 0) {
            p->fn = fn;
            p->wait = arg1;
            p->counter = 0;
            return i;
        }
        p++;
    }
    return -1;
}

void regular_remove(s32 arg0)
{
    regular_active(0);

    if (arg0 < 0)
        for (int i = 0; i < 32; i++)
            D_80023370[i].fn = 0;
    else if (arg0 <= 32)
        D_80023370[32 - arg0].fn = 0;

    regular_active(1);
}


void regular_clear_tmps(int i)
{
    regular_active(0);

    if (i >= 0 && i <= 8) {
        D_80023470[8 - i].fn = 0;
    }
    
    regular_active(1);
}

void regular_active(s32 val)
{
    D_800234B4 = val;
}