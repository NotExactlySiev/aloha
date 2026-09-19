#pragma once

#include <ints.h>

void fnt_init(void);
u8 *fnt_get(u32 c, int set);
void *fnt_set_tiles(void *ptr, int set);
