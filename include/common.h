#ifndef COMMON_H
#define COMMON_H

#include "include_asm.h"
#include "macros.h"
#include "types.h"
#include <sys/types.h>

typedef struct EXEC EXEC;

#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   240

enum {
        REGION_NONE = 0,        // Japan?
        REGION_USA = 1,
        REGION_EUROPE = 2,
        REGION_DEBUG = 3,
};

#define SCRTCHPAD(p)    ((void*) (0x1F800000 + (p)))
#define NOT_IMPL_FN(fn)  int fn() { printf("called non-implemented function " #fn "\n"); while (1); }
#define NOT_IMPL(s)     \
    printf(__FILE__ ":%d %s: not implemented: " s "\n", __LINE__, __func__); \
    while (1);


#endif
