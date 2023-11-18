#include "common.h"
#include "jmptable.h"

extern u32 D_80060000[];


u32 random_byte(void);

#define RANDOM_MAX  255

u32 random_range(u32 a, u32 b)
{
    u32 width = b - a;
    return a + ((random_byte() * width) / RANDOM_MAX) % width;
}

// 2 jt
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E02F8);  // play_effect
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0330);  // play_effect the underlying func

// 4 trivial
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0374);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0388);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0398);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E03D0);



INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0400);
// level_animation_update
void _func_800E0400(void)
{

}

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

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E078C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E088C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E08F4);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0960);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E09CC);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0A64);

void sprite_draw_by_id(u32 arg0, u32 id, u32 x, u32 y, u8 brightness, s32 size);

#define SPRITE_WORLD_1  0x26
#define SPRITE_WORLD_2  0x27
#define SPRITE_WORLD_3  0x28

extern u32 D_8013ED20;  // selected
extern u32 D_8013EDD0;  // screen brightness
extern u32 D_80170A58;  // bumping size

//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0BFC);
void func_800E0BFC(void)
{
    u32 brightness0 = (D_8013EDD0 / 2) % 256;
    u32 brightness1 = (D_8013EDD0 / 2) % 256;
    u32 brightness2 = (D_8013EDD0 / 2) % 256;
    u32 size0 = 4096;
    u32 size1 = 4096;
    u32 size2 = 4096;

    switch (D_8013ED20) {
    case 0:
        size0 = D_80170A58;
        brightness0 = D_8013EDD0;
        break;
    case 1:
        size1 = D_80170A58;
        brightness1 = D_8013EDD0;
        break;
    case 2:
        size2 = D_80170A58;
        brightness2 = D_8013EDD0;
        break;
    }

    // TODO: val reset and state

    sprite_draw_by_id(8, SPRITE_WORLD_1,  56, 56, brightness0 % 256, size0);
    sprite_draw_by_id(8, SPRITE_WORLD_2, 150, 38, brightness1 % 256, size1);
    sprite_draw_by_id(8, SPRITE_WORLD_3, 250, 56, brightness2 % 256, size2);
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0D48);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0EE4);

// an animation is a series of steps
typedef struct {
    u32 duration;
    u32 spriteid;
    u32 offx;
    u32 offy;
} AnimStep;


// current step
extern u32 D_8013EED0;  // counter
extern u32 D_8013EED8;
extern u32 D_8013EEE0;
extern u32 D_8013EEE8;
extern AnimStep* D_8013EEF0;

// animation stuff
// set first step
void func_800E0F60(AnimStep* anim)
{
    D_8013EED0 = 0;
    D_8013EED8 = anim[0].spriteid;
    D_8013EEE0 = anim[0].offx;
    D_8013EEE8 = anim[0].offy;
    D_8013EEF0 = anim;
}


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

extern s32 D_8013ED30;

extern s32 D_8013ED90;  // blink state

extern s32 D_8013EDD8;

extern s16 D_80170502;
extern s32 D_8017050C;
extern u16 D_80170500;  // handler index (state)



// oh god ghidra messed up again, this is a switch case aaaaaaaaaaah
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E413C);
int _func_800E413C(void)
{
    s32 s0;
    s32 s3 = 0;
    D_8017050C = 0;
    D_80170502 = 0;
    D_80170500 = 0;

    do {
        func_800E77D4();
        func_800E6D00();
        printf("calling %d\n", D_80170500);
        switch (D_80170500) {
        case 0:
            s0 = func_800E77A4();
            D_8013ED30 = 0;
            func_800E3CB8();    // blink reset
            D_80170500 = 1;
        case 1:
            if (s3 == 0) {
                D_80170500 = 2;
                if (s0 & 0x8A0) continue;
                D_80170500 = 3;
                if (s0 & 0x40) continue;
                if (D_8013ED90 == 1) {
                    func_800E6640("PUSH START BUTTON", 0x54, 0xB0, D_8013EDD0);
                }
            }
            break;
        case 3:
            func_800E77A4();
            D_8013ED30 = 1;
            func_800E02F8(0x2700);
            D_80170500 = 4;
            break;
        case 4:
            // TODO: loads of shit here
            D_80170500 = 0;
            break;
        default:
            printf("oh no fuck\n");
            break;
        }
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013EDD8 != 3);
    return 0;
}

//__asm__(".section .text\n" "\t.align\t2\n" ".include \"" "asm/select/nonmatchings/A54" "/" "func_800E413C" ".s\"\n" "\t.set reorder\n" "\t.set at\n");

extern s32 D_8013EDE0;

// 4 callers
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E444C);
// this function plays the jump on island 1 animation and then goes to next
int func_800E444C(void)
{
    // 0xFE none selected and all light
    // 0xFF none selected and all dark
    func_800E0398(0xFE);
    func_800E0388(0);
    func_800E278C();
    func_800E4064();
    func_800E0F9C(0x23);
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013EDE0);
    //} while (1);
    func_800E03D0(0);
    func_800E0388(1);
    return func_800E413C();
}


INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E44E0);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E45B4);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4698);

// game config ptr (shared data)
extern u8* D_80170A50;

// 3 big functions
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E47D8);
// normal selection
void func_800E47D8(void)
{
    int rc;
    printf("0x514 = %d\n", D_80170A50[0x514]);
    printf("0x515 = %d\n", D_80170A50[0x515]);
    printf("0xE8  = %d\n", D_80170A50[0xE8]);
    rc = func_800E444C();    // begin0
    printf("returned %d\n", rc);
    if (rc < 1)
        jt.execs_set_next(0);
    else
        jt.execs_set_next(1);
    //for(;;);
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4CCC);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5258);

// apparently unused?
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E561C);
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E56B8);
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E56EC);


// vab_files (level entry sound)
const char* const D_800EAC70[6][3] = {
    { "VAB\\W1_1.VAB", "VAB\\W1_2.VAB", "VAB\\W1_3.VAB" },
    { "VAB\\W2_1.VAB", "VAB\\W2_2.VAB", "VAB\\W2_3.VAB" },
    { "VAB\\W3_1.VAB", "VAB\\W3_2.VAB", "VAB\\W3_3.VAB" },
    { "VAB\\W4_1.VAB", "VAB\\W4_2.VAB", "VAB\\W4_3.VAB" },
    { "VAB\\W5_1.VAB", "VAB\\W5_2.VAB", "VAB\\W5_3.VAB" },
    { "VAB\\W6_1.VAB", "VAB\\W6_2.VAB", "VAB\\W6_3.VAB" },
};
/*
.word 0x800E011C
.word 0x800E010C
.word 0x800E00FC
.word 0x800E00FC
*/

// play level effect
void func_800E5714(void)
{
    if (jt.execs_get_next() - 2 < 18) {
        while (1) {
            jt.cd_fs_read(D_800EAC70[D_80170A50[0x514] % 6][D_80170A50[0x515]], D_80060000, 0);
            if (D_80060000[0] == 0x56414270) break;
            printf("VAB file Reload\n");
        }
        jt.play_vab(1, D_80060000, 0);
    }
}

extern const u32 common_assets[];
void func_800E5824(void) {
    __builtin_memcpy(D_80060000, common_assets, 0x20000);
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E58C4);

// main
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E58D4);

// unused
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E5B68);

// loading textures

typedef struct {
    u32 unk0;
    u32 unk1;
    u32 unk2;
    u32 unk3;
    u32 unk4;
    u16 clut[256];
    u32 unk5;
    u32 unk6;
    u32 unk7;
    u8  pix[];
} ImgFormat;    // TODO: is this TIM? what is this

#define TEXTURE_TOWER_WIDTH     106
#define TEXTURE_TOWER_HEIGHT    104
#define TEXTURE_ISLAND_WIDTH    70
#define TEXTURE_ISLAND_HEIGHT   76

// tower and island textures
void func_800E5B80(
    void* island1_data,
    void* island2_data,
    void* island3_data,
    void* tower_data,
    s16 tx, s16 ty,
    s16 clutx, s16 cluty)
{
    RECT rect;
    ImgFormat* image = &D_80060000;

    // tower
    jt.decompress_lz1(tower_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_TOWER_WIDTH/2;
    rect.h = TEXTURE_TOWER_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);

    ty += 128;
    cluty += 1;

    // island 1
    jt.decompress_lz1(island1_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_ISLAND_WIDTH/2;
    rect.h = TEXTURE_ISLAND_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);


    tx += 0x28;
    cluty += 1;

    // island 2
    jt.decompress_lz1(island2_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_ISLAND_WIDTH/2;
    rect.h = TEXTURE_ISLAND_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);


    tx += 0x28;
    cluty += 1;

    // island 3
    jt.decompress_lz1(island3_data+4, image);

    rect.x = tx;
    rect.y = ty;
    rect.w = TEXTURE_ISLAND_WIDTH/2;
    rect.h = TEXTURE_ISLAND_HEIGHT;
    jt.LoadImage(&rect, image->pix);
    jt.DrawSync(0);

    rect.x = clutx;
    rect.y = cluty;
    rect.w = 256;
    rect.h = 1;
    image->clut[0] = 0;
    jt.LoadImage(&rect, image->clut);
    jt.DrawSync(0);
}

// font characters
void func_800E5EFC(void* data, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 4,
        .h = 8
    };
    jt.decompress_lz1(data+4, D_80060000);
    u16* p = D_80060000;
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 32; j++) {
            jt.LoadImage(&rect, p);
            jt.DrawSync(0);
            rect.x += rect.w;
            p += rect.w*rect.h;
        }
        rect.x = x;
        rect.y += rect.h;
    }    
}

// load clut
void func_800E5FE8(void* data, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 256,
        .h = 1
    };

    jt.LoadImage(&rect, data);
    jt.DrawSync(0);
}

// load 256*256
void func_800E6050(void* data, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 128,
        .h = 256
    };
    jt.decompress_lz1(data+4, D_80060000);
    jt.LoadImage(&rect, D_80060000+2);
    jt.DrawSync(0);
}

// cluts
extern u16 D_800EC3AC[5][256];
extern u8 D_800FC9F8[]; // image3
extern u8 D_800ECDAC[]; // image2
extern u8 D_800FDA4C[]; // image0
extern u8 D_800FE478[]; // image1

extern u8 D_800FBABC[]; // tiles

extern u8 texture_isle_1_1[]; // texture_isle_1_1
extern u8 texture_isle_1_2[]; // texture_isle_1_2
extern u8 texture_isle_1_3[]; // texture_isle_1_3
extern u8 texture_isle_2_1[]; // texture_isle_2_1
extern u8 texture_isle_2_2[]; // texture_isle_2_2
extern u8 texture_isle_2_3[]; // texture_isle_2_3
extern u8 texture_isle_3_1[]; // texture_isle_3_1
extern u8 texture_isle_3_2[]; // texture_isle_3_2
extern u8 texture_isle_3_3[]; // texture_isle_3_3
extern u8 texture_isle_4_1[]; // texture_isle_4_1
extern u8 texture_isle_4_2[]; // texture_isle_4_2
extern u8 texture_isle_4_3[]; // texture_isle_4_3
extern u8 texture_isle_5_1[]; // texture_isle_5_1
extern u8 texture_isle_5_2[]; // texture_isle_5_2
extern u8 texture_isle_5_3[]; // texture_isle_5_3
extern u8 texture_isle_6_1[]; // texture_isle_6_1
extern u8 texture_isle_6_2[]; // texture_isle_6_2
extern u8 texture_isle_6_3[]; // texture_isle_6_3


extern u8 texture_tower_1[]; // texture_tower_1
extern u8 texture_tower_2[]; // texture_tower_2
extern u8 texture_tower_3[]; // texture_tower_3
extern u8 texture_tower_4[]; // texture_tower_4
extern u8 texture_tower_5[]; // texture_tower_5
extern u8 texture_tower_6[]; // texture_tower_6

// load everything
void func_800E60D0(void)
{
    func_800E5B80(texture_isle_1_1, texture_isle_1_2, texture_isle_1_3, texture_tower_1, 0x140,   0, 0, 0x1E2);
    func_800E5B80(texture_isle_2_1, texture_isle_2_2, texture_isle_2_3, texture_tower_2, 0x1C0,   0, 0, 0x1E6);
    func_800E5B80(texture_isle_3_1, texture_isle_3_2, texture_isle_3_3, texture_tower_3, 0x240,   0, 0, 0x1EA);
    func_800E5B80(texture_isle_4_1, texture_isle_4_2, texture_isle_4_3, texture_tower_4, 0x140, 256, 0, 0x1EE);
    func_800E5B80(texture_isle_5_1, texture_isle_5_2, texture_isle_5_3, texture_tower_5, 0x1C0, 256, 0, 0x1F2);
    func_800E5B80(texture_isle_6_1, texture_isle_6_2, texture_isle_6_3, texture_tower_6, 0x240, 256, 0, 0x1F6);

    func_800E5EFC(D_800FBABC, 704, 0);

    func_800E6050(D_800FC9F8, 704, 256);
    func_800E6050(func_800E58C4() ? D_800FE478 : D_800FDA4C, 832, 0);
    func_800E6050(D_800ECDAC, 832, 256);

    func_800E5FE8(D_800EC3AC[0], 0, 509);
    func_800E5FE8(D_800EC3AC[1], 0, 510);
    func_800E5FE8(D_800EC3AC[2], 0, 508);
    func_800E5FE8(D_800EC3AC[3], 0, 507);
    func_800E5FE8(D_800EC3AC[4], 0, 511);
}

// sprites.c

typedef struct {
    u8  u, v;
    u8  w, h;
    u8  x, y;
    u16 tpage;
    u16 clut;
} Sprite;

extern Sprite D_80170510[];

// meta sprites
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6324);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E637C);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6548);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6598);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E65EC);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6640);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E66C8);

void sprite_draw_by_id(u32 arg0, u32 id, u32 x, u32 y, u8 brightness, s32 size)
{
    func_800E66C8(arg0, &D_80170510[id], x, y, brightness, size);
}

// more drawing stuff
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6928);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6AAC);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6B1C);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6D00);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6D94);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6E5C);

// what on earth is this thing
typedef struct {
    u16 u, v, w, h;
} SpriteThing;

// the tower and island textures are stored in vram like this:
// tower at 
void func_800E6F5C(Sprite* group, u16 u, u16 v, u32 clutx, u32 cluty)
{
    SpriteThing thing;
    // tower
    thing.w = 106;
    thing.h = 104;
    thing.u = u;
    thing.v = v;
    func_800E6E5C(&group[0], &thing, 53, 52, clutx, cluty);

    // islands
    thing.w = 70;
    thing.h = 76;
    thing.v += 128;

    thing.u = u;
    func_800E6E5C(&group[1], &thing, 35, 38, clutx, cluty+1);
    thing.u = u + 40;
    func_800E6E5C(&group[2], &thing, 35, 38, clutx, cluty+2);
    thing.u = u + 80;
    func_800E6E5C(&group[3], &thing, 35, 38, clutx, cluty+3);
    
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7078);


// graphics init
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7358);


extern u8 random_array_seed[64];    // seed
extern u8 random_array[64];         // array
extern u32 random_counter;

void random_init(void)
{
    random_counter = 0;
    for (int i = 0; i < 64; i++)
        random_array[i] = random_array_seed[i];
}

u32 random_byte(void)
{
    u8 ret;
    random_counter = (random_counter + 1) % 64;
    
    ret = random_array[(random_counter - 24) % 64]
        ^ random_array[(random_counter - 55) % 64];
    random_array[random_counter] = ret;
    return ret;
}

// 2 simple functions
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7724);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E77A4);

// 2 slightly long functions
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E77D4);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E799C);

// reset cool struct
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7AA4);

// 2 similar funcs that call loads of jt stuff
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7B68);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7D8C);

// asm thingy (syscall)
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7F68);
