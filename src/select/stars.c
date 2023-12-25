#include "common.h"
#include <shared.h>

// TODO: header
s32 random_range(s32 a, s32 b);


#define STARS_COLOR_MIN 32
#define STARS_COLOR_MAX 128
#define STARS_ENTRY_OFFSET  128
#define STARS_SPEED_MIN         1
#define STARS_SPEED_MAX_NTSC    4
#define STARS_SPEED_MAX_PAL     5

typedef struct {
    u32 x, y;
    u32 speed;
    u8 r,g,b;
    u8 _pad;
} Star;

Star stars[64];

void stars_init(void)
{
    for (int i = 0; i < 64; i++) {
        stars[i].x = random_range(0 , 2*(SCREEN_WIDTH-1));   // screen width 
        stars[i].y = random_range(0 , SCREEN_HEIGHT-1);   // height
        stars[i].r = random_range(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].g = random_range(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].b = random_range(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].speed = random_range(STARS_SPEED_MIN, jt.get_tv_system() == TV_NTSC ? STARS_SPEED_MAX_NTSC : STARS_SPEED_MAX_PAL); 
    }
}

void stars_update(void)
{
    for (int i = 0; i < 64; i++) {
        stars[i].x += stars[i].speed;
        if (stars[i].x <= 2*(SCREEN_WIDTH-1)) continue;
        stars[i].x = -random_range(0, STARS_ENTRY_OFFSET);
        stars[i].y = random_range(0 , SCREEN_HEIGHT-1);
        stars[i].r = random_range(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].g = random_range(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].b = random_range(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].speed = random_range(STARS_SPEED_MIN, jt.get_tv_system() == TV_NTSC ? STARS_SPEED_MAX_NTSC : STARS_SPEED_MAX_PAL); 
    }
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E06B8);  // starts_render