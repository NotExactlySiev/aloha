#ifndef COMMON_H
#define COMMON_H

#include "include_asm.h"
#include "macros.h"
#include <ints.h>
#include <sys/types.h>

#define NULL ((void *)0)

#include <pad.h>
#define BUTTONS_ACCEPT (Pad1Start | Pad1sqr | Pad1crc)
#define BUTTONS_CANCEL (Pad1x)

typedef struct EXEC EXEC;
typedef struct DIRENTRY DIRENTRY;

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 240

enum {
    REGION_JAPAN = 0,
    REGION_USA = 1,
    REGION_EUROPE = 2,
    REGION_DEBUG = 3,
};

#define SCRTCHPAD(p) ((void *)(0x1F800000 + (p)))

int printf(const char *fmt, ...);

#define NOT_IMPL_FN(fn)                                      \
    int fn()                                                 \
    {                                                        \
        printf("called non-implemented function " #fn "\n"); \
        while (1)                                            \
            ;                                                \
    }
#define NOT_IMPL(s)                                                          \
    printf(__FILE__ ":%d %s: not implemented: " s "\n", __LINE__, __func__); \
    while (1)                                                                \
        ;

#endif
