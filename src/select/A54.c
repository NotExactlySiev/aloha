#include "common.h"
#include "jmptable.h"

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0254);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E02F8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0330);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0374);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0388);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0398);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E03D0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0400);



// random_range
u32 func_800E0254(u32, u32);

#define SCREEN_WIDTH    320
#define SCREEN_HEIGHT   240

// stars.c

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
} Star;

extern Star stars[64];

void stars_init(void)
{
    for (int i = 0; i < 64; i++) {
        stars[i].x = func_800E0254(0 , 2*(SCREEN_WIDTH-1));   // screen width 
        stars[i].y = func_800E0254(0 , SCREEN_HEIGHT-1);   // height
        stars[i].r = func_800E0254(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].g = func_800E0254(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].b = func_800E0254(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].speed = func_800E0254(STARS_SPEED_MIN, jt.get_tv_system() == TV_NTSC ? STARS_SPEED_MAX_NTSC : STARS_SPEED_MAX_PAL); 
    }
}

void stars_update(void)
{
    for (int i = 0; i < 64; i++) {
        stars[i].x += stars[i].speed;
        if (stars[i].x <= 2*(SCREEN_WIDTH-1)) continue;
        stars[i].x = -func_800E0254(0, STARS_ENTRY_OFFSET);
        stars[i].y = func_800E0254(0 , SCREEN_HEIGHT-1);
        stars[i].r = func_800E0254(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].g = func_800E0254(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].b = func_800E0254(STARS_COLOR_MIN, STARS_COLOR_MAX);
        stars[i].speed = func_800E0254(STARS_SPEED_MIN, jt.get_tv_system() == TV_NTSC ? STARS_SPEED_MAX_NTSC : STARS_SPEED_MAX_PAL); 
    }
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E06B8);  // starts_render

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E078C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E088C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E08F4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0960);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E09CC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0A64);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0BFC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0D48);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0EE4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0F60);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0F9C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1124);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1288);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E13EC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1500);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1514);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E156C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E16F0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1704);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E175C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E18E0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E198C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1A38);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1AE4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1B58);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1C68);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1CA0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1DDC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1DF0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1E48);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1F88);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2070);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2090);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E230C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E236C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E23E0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2588);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E25E4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E278C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2A30);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2B74);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E32B0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E32D8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3308);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E357C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E38A8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3A5C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3B20);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3CB8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3CD4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3D20);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3D70);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3E90);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3ED0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4064);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E40E8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E413C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E444C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E44E0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E45B4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4698);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E47D8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4CCC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5258);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E561C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E56B8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E56EC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5714);

extern const u32 common_assets[];
extern u32 D_80060000[];
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5824);
void func_800E5824(void) {
    __builtin_memcpy(D_80060000, common_assets, 0x20000);
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E58C4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E58D4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5B68);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5B80);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5EFC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5FE8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6050);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E60D0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6324);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E637C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6548);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6598);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E65EC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6640);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E66C8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E68E4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6928);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6AAC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6B1C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6D00);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6D94);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6E5C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6F5C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7078);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7358);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7670);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E76B8);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7724);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E77A4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E77D4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E799C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7AA4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7B68);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7D8C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7F68);
