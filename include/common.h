#ifndef COMMON_H
#define COMMON_H

#include "include_asm.h"
#include "macros.h"
#include "types.h"
#include <sys/types.h>

#define LEN(x) ((s32)(sizeof(x) / sizeof(*(x))))
#define LENU(x) ((u32)(sizeof(x) / sizeof(*(x))))
#define STRCPY(dst, src) __builtin_memcpy(dst, src, sizeof(src))
// TODO: figure out how to use this and if it works
#define CALLER(func, ...)    call_## func(__VA_ARGS__) { return func(__VA_ARGS__); }

typedef struct EXEC EXEC;

#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   240

#define SCRTCHPAD(p)    ((void*) (0x1F800000 + (p)))
#define NOT_IMPL(fn)  int fn() { printf("called non-implemented function " #fn "\n"); while (1); }

#endif
