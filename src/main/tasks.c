#include "tasks.h"

typedef struct {
    TaskFunc fn;
    short wait;
    short counter;
} RoutineTask;

extern RoutineTask D_80023370[40];

// why is the freaking array backwards
// these are all fucked

// US: 80023144
// JP: 80021D84
int tasks_add(TaskFunc fn, short interval)
{
    for (int i = 0; i < 32; i++) {
        RoutineTask *p = &D_80023370[i];
        if (p->fn == 0) {
            p->fn = fn;
            p->wait = interval;
            p->counter = 0;
            return 32 - i;
        }
    }
    return -1;
}

// US: 80023188
// JP: 80021DC8
int tasks_add_reserved(TaskFunc fn, short interval)
{
    for (int i = 32; i < 40; i++) {
        RoutineTask *p = &D_80023370[i];
        if (p->fn == 0) {
            p->fn = fn;
            p->wait = interval;
            p->counter = 0;
            return 40 - i;
        }
    }
    return -1;
}

// US: 800231CC
// JP: 80021E0C
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

// US: 80023260
// JP: 80021EA0
void tasks_remove_reserved(int handle)
{
    tasks_set_enabled(0);

    if (handle >= 0 && handle <= 8) {
        D_80023370[40 - handle].fn = 0;
    }

    tasks_set_enabled(1);
}

// US: 800232C4
// JP: 80021F04
void tasks_set_enabled(int val)
{
    extern int tasks_enabled;
    tasks_enabled = val;
}
