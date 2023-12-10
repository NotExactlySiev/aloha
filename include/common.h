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

// these need somewhere else to exist
#define TV_NTSC 0
#define TV_PAL  1

#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   240

#endif
