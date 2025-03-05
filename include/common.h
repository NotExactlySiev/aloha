#ifndef COMMON_H
#define COMMON_H

#include "include_asm.h"
#include "macros.h"
#include "types.h"
#include <sys/types.h>

typedef struct EXEC EXEC;

#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   240

#define SCRTCHPAD(p)    ((void*) (0x1F800000 + (p)))
#define NOT_IMPL(fn)  int fn() { printf("called non-implemented function " #fn "\n"); while (1); }

#endif
