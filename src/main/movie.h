#include "common.h"
#include <libcd.h>
#include <libgpu.h>

typedef struct {
    RECT rect;
    s16 x1;
    s16 _pad0;
    s16 y1;
    s16 _pad1;
    s16 x2;
    s16 _pad2;
    s16 y2;
    s16 _pad3;
    int mode;
    int frame_count;
    int ring_size;
    u32 *buffers[2];
    u32 *data_addr;
    StHEADER *ring_addr;
    int channel;
} MovieArgs;

int func_80022474(char *filename, MovieArgs *args, int (*cb)(void));
