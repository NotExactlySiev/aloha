#include "common.h"
#include "tasks.h"

typedef struct {
    TaskFunc fn;
    s16 wait;
    s16 counter;
} RoutineTask;

extern RoutineTask D_80023370[40];
extern int tasks_enabled;

// why is the freaking array backwards

int tasks_add(TaskFunc fn, s16 arg1)
{
    for (int i = 0; i < 32; i++) {
        RoutineTask *p = &D_80023370[i];
        if (p->fn == 0) {
            p->fn = fn;
            p->wait = arg1;
            p->counter = 0;
            return 31 - i;
        }
    }
    return -1;
}

// engine only (TODO: _reserved you idiot)
int tasks_add_reserved(TaskFunc fn, s16 arg1)
{
    for (int i = 32; i < 40; i++) {
        RoutineTask *p = &D_80023370[i];
        if (p->fn == 0) {
            p->fn = fn;
            p->wait = arg1;
            p->counter = 0;
            return 39 - i;
        }
    }
    return -1;
}

void tasks_remove(int handle)
{
    tasks_set_enabled(0);

    if (handle < 0)
        for (int i = 0; i < 32; i++)
            D_80023370[i].fn = 0;
    else if (handle <= 32)
        D_80023370[32 - handle].fn = 0;

    tasks_set_enabled(1);
}

void tasks_remove_reserved(int i)
{
    tasks_set_enabled(0);

    if (i >= 0 && i <= 8) {
        D_80023370[40 - i].fn = 0;
    }
    
    tasks_set_enabled(1);
}

void tasks_set_enabled(s32 val)
{
    extern int tasks_enabled;
    tasks_enabled = val;
}