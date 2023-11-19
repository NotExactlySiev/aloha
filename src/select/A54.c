#include "common.h"
#include "jmptable.h"

#include <libetc.h>

#define UNK(a,b)    u8 unk##a[b - a + 1]
typedef struct {
    UNK(0, 0xE7);
    s8  unkE8;  // played before?
    UNK(0xE9, 0x513);
    s8  world;
    s8  stage;  // next one to play
    s8  unk516;
    s8  debug_features;
    s8  unk519; // have beaten the game?
} GlobalData;

extern GlobalData* global_data;

extern u32 D_80060000[];

extern u32 D_8013EDD0;  // screen brightness (or maybe fade value is better?)

void sprite_draw_by_id(u32 arg0, u32 id, u32 x, u32 y, u8 brightness, s32 size);


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





extern s32 scrolling;

extern s32 stage_text_anim_enabled;
extern s32 stage_text_anim_t;
extern s32 stage_text_anim_delta;
extern s32 stage_text_size;

void stage_text_anim_set_enabled(s32 enabled)
{
    stage_text_anim_enabled = enabled;
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0398);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E03D0);

void stage_text_anim_update(void)
{
    s32 val;
    if (stage_text_anim_enabled == 1)
        stage_text_anim_t += stage_text_anim_delta;
    else
        stage_text_anim_t = 0;
    
    if (scrolling == 1) stage_text_anim_t = 0;
    val = sin(stage_text_anim_t);    // sin
    if (val < 0) val = -val;
    stage_text_size = val + ONE;
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

extern s32 D_8013ED1C; // state thing. which island is bright (FF none FE all)

void render_island1(s32 world, s32 x, s32 y)
{
    s32 brightness = D_8013EDD0 / 2;
    if (D_8013ED1C == 0 || D_8013ED1C == 0xFE) {
        brightness = D_8013EDD0;
    }
    sprite_draw_by_id(4, world << 2 | 1, x, y, brightness, 0x1000);
}

void render_island2(s32 world, s32 x, s32 y)
{
    s32 brightness = D_8013EDD0 / 2;
    if (D_8013ED1C == 1 || D_8013ED1C == 0xFE) {
        brightness = D_8013EDD0;
    }
    sprite_draw_by_id(4, world << 2 | 2, x, y, brightness, 0x1000);
}

void render_island3(s32 world, s32 x, s32 y)
{
    s32 brightness = D_8013EDD0 / 2;
    if (D_8013ED1C == 2 || D_8013ED1C == 0xFE) {
        brightness = D_8013EDD0;
    }
    sprite_draw_by_id(4, world << 2 | 3, x, y, brightness, 0x1000);
}

// animation.c

extern s32 world_text_anim0_t;
extern s32 world_text_anim0_target;
extern s32 world_text_anim0_magnitude;

extern u32 world_text_anim1_enabled;  // world caption animation. i don't think ever enabled?
extern u32 world_text_anim1_t;

extern s32 wrong_one;  // wrong one

extern s32 scrolling;
extern s32 scroll_amount;
extern s32 scroll_delta;
extern s32 selected_world;
extern s32 shown_world;

void world_text_anim0_start(s32 target, s32 magnitude)
{
    if (jt.get_tv_system() == TV_PAL)
        target = (target * 5) / 6;

    world_text_anim0_t = 0;
    world_text_anim0_target = target;
    world_text_anim0_magnitude = magnitude;
}

void render_world_text(s32 world, s32 x, s32 y)
{
    // there are two different animations that this element can have
    s32 size_offset = 0;
    s32 brightness_offset = 0;
    if (world_text_anim0_t < world_text_anim0_target) {
        // anim0
        s32 diff = world_text_anim0_target - world_text_anim0_t++;
        
        size_offset = diff * world_text_anim0_magnitude / world_text_anim0_target;
        y += diff * 120 / world_text_anim0_target;
        world_text_anim1_t = 0;
        // TODO: disable anim1 here
    } else if (world_text_anim1_enabled) {
        size_offset = sin(world_text_anim1_t);
        if (size_offset < 0) size_offset = -size_offset;
        world_text_anim1_t += 32;
        brightness_offset = 48;
    } else {
        world_text_anim1_t = 0;
    }

    if (scrolling) x += scroll_amount;

    sprite_draw_by_id(11, 0x18 + world, x, y, D_8013EDD0 + brightness_offset, ONE + size_offset);

}

#define SPRITE_WORLD_1  0x26
#define SPRITE_WORLD_2  0x27
#define SPRITE_WORLD_3  0x28

extern u32 D_8013ED20;  // selected
//extern s32 stage_text_size;  // bumping size

//INCLUDE_ASM("asm/select/nonmatchings/A54", render_stage_text);
void render_stage_text(void)
{
    u32 brightness0 = D_8013EDD0 / 2;
    u32 brightness1 = D_8013EDD0 / 2;
    u32 brightness2 = D_8013EDD0 / 2;
    u32 size0 = 4096;
    u32 size1 = 4096;
    u32 size2 = 4096;

    switch (D_8013ED20) {
    case 0:
        size0 = stage_text_size;
        brightness0 = D_8013EDD0;
        break;
    case 1:
        size1 = stage_text_size;
        brightness1 = D_8013EDD0;
        break;
    case 2:
        size2 = stage_text_size;
        brightness2 = D_8013EDD0;
        break;
    }

    s32 offx = scrolling ? scroll_amount : 0;


    // TODO: highlighted island

    sprite_draw_by_id(8, SPRITE_WORLD_1,  56 + offx, 56, brightness0 % 256, size0);
    sprite_draw_by_id(8, SPRITE_WORLD_2, 150 + offx, 38, brightness1 % 256, size1);
    sprite_draw_by_id(8, SPRITE_WORLD_3, 250 + offx, 56, brightness2 % 256, size2);
}

extern s32 island1_anim_t;
extern s32 island2_anim_t;
extern s32 island3_anim_t;
extern s32 tower_anim_t;

extern s32 island1_offx;
extern s32 island1_offy;
extern s32 island2_offx;
extern s32 island2_offy;
extern s32 island3_offx;
extern s32 island3_offy;
extern s32 tower_offx;
extern s32 tower_offy;

void islands_anim_update(void)
{
    island1_offx = 0;
    island2_offx = 0;
    island3_offx = 0;
    tower_offx = 0;
    island1_offy = sin(island1_anim_t) / 0x555;
    island2_offy = sin(island2_anim_t) / 0x555;
    island3_offy = sin(island3_anim_t) / 0x555;
    tower_offy = sin(tower_anim_t) / 0x555;
    island1_anim_t += 0x44;
    island2_anim_t += 0x44;
    island3_anim_t += 0x44;
    tower_anim_t += 0x3A;
}

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




#define ISLAND1_X   53
#define ISLAND2_X   147
#define ISLAND3_X   249

#define ISLAND1_Y   98
#define ISLAND2_Y   74
#define ISLAND3_Y   98

#define TOWER_X     151
#define TOWER_Y     168

void func_800E2588(s32 world)
{
    if ((world < 6) && (world != shown_world)) {
        scrolling = 1;
        scroll_amount = 0;
        scroll_delta = (-24) * (world - shown_world);
    }
    selected_world = world;
}

// render_islands_and_tower
void func_800E25E4(void)
{
    int scroll_off = 0;
    if (scrolling) {
        scroll_amount += scroll_delta;
        if (shown_world != selected_world) {
            if (scroll_delta > 0 && scroll_amount >= 336) {
                // got to target, switch shown world
                shown_world = selected_world;
                scroll_amount = -336;
            } else if (scroll_delta < 0 && scroll_amount <= -336) {
                shown_world = selected_world;
                scroll_amount = 336;
            }
        }
        scroll_off = scroll_amount;
    }

    // stop if reached the target
    if (scroll_amount == 0 && selected_world == shown_world)
        scrolling = 0;

    render_island1(shown_world, scroll_off + ISLAND1_X + island1_offx, ISLAND1_Y + island1_offy);
    render_island2(shown_world, scroll_off + ISLAND2_X + island2_offx, ISLAND2_Y + island2_offy);
    render_island3(shown_world, scroll_off + ISLAND3_X + island3_offx, ISLAND3_Y + island3_offy);
    func_800E2090(scroll_off + TOWER_X, TOWER_Y);
    // TODO: draw tower
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E278C);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2A30);

//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2B74);
// balls?

extern s32 D_8013ED8C;  // mag

typedef struct {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    UNK(0x8, 0x11);
    s16 unk12[16];
    UNK(0x32, 0x5F);
    s16 unk60;
    s16 unk62;
    s16 unk64;
    s16 unk66;
    UNK(0x68, 0x87);
    s32 unk88;
    s32 unk8C;
    s32 unk90;
    UNK(0x94, 659);
} Chain;    // 660 bytes

s32 meow = sizeof(Chain);

extern Chain D_8013F390[3];

void func_800E2B74(void)
{
    s32 val;

    for (int i = 0; i < 3; i++) {
        //printf("0x44 %d\n", );
        Chain* c = &D_8013F390[i];
        if (c->unk88 == 2) continue;
        for (int j = 0; j < 6; j++) {
            // ignore middle one for now
            val = sin(c->unk60 + c->unk64 * D_8013ED8C * (j + 1));
            val *= c->unk12[8+j*2];
            if (val < 0) val += 0xFFF;
            c->unk12[j*2] = val >> 12;
            c->unk60 += c->unk64;
        }
        // TODO: jesus fucking christ I have no idea what's happening
        func_800E6548(2, 3, 40, 40, 128);
    }
}

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
extern s32 D_8013ED28;

#define PAD_ACCEPT  (PADstart | PADRleft | PADRright)
#define PAD_CANCEL  (PADRdown)
// WORKING!!! this is ccontrols (not for freeplay mode)
int func_800E413C(void)
{
    s32 s0;
    s32 s1 = 0;
    s32 s2 = 0;
    s32 s3 = 0;

    s32 v1; // state

    D_8017050C = 0;
    D_80170502 = 0;
    D_80170500 = 0;

    do {
        s0 = func_800E77D4(0);
        func_800E6D00();
        v1 = D_80170500;
bruh:
        switch (v1) {
        case 0:     // init first time/close menu -> 1
            func_800E77A4();
            D_8013ED30 = 0;
            func_800E3CB8();    // blink reset
            D_80170500 = 1;
        case 1:     // normal, check input -> 2 / 3
            if (s3 == 0) {  // should I check input?
                v1 = 2;
                if (s0 & PAD_ACCEPT) goto bruh;   // accept?
                v1 = 3;
                if (s0 & PAD_CANCEL) goto bruh;    // cancel?
                if (D_8013ED90 == 1) {
                    //func_800E6640("PUSH START BUTTON", 0x54, 0xB0, D_8013EDD0);
                    func_800E6640("PUSH START PLZ UWU", 0x54, 0xB0, D_8013EDD0);
                }
            }
            break;

        case 2: // accept -> out
            s3 = 1; // stop showing the text and reading input
            func_800E77A4();
            func_800E02F8(0x2600);
            D_8013EDD8 = 2;
            jt.sound_fade_out(12, 0, 0);
            break;

        case 3: // cancel -> 4 (opens menu)
            s2 = 0;
            func_800E77A4();
            D_8013ED30 = 1; // show menu? darken screen?
            s1 = 0;
            func_800E02F8(0x2700);
            D_80170500 = 4;
            break;

        case 4: // menu controls
            if (s1 == 0) {
                if (s0 & PADLdown) {
                    func_800E02F8(0x2C00);
                    s1 = 1;
                }
            } else {
                if (s0 & PADLup) {
                    func_800E02F8(0x2C00);
                    s1 = 0;
                }
            }

            if (s0 & PAD_CANCEL) {    // back out
                func_800E02F8(0x2700);
                D_80170500 = 0;
            } else if (s0 & PAD_ACCEPT) {
                func_800E02F8(0x2600);
                if (s1 == 1) {
                    // retire
                    s3 = -1; // result
                    D_8013EDD8 = 2; // begin fading out the screen
                    jt.sound_fade_out(12, 0, 0);
                }
                D_80170500 = 0;
            } else {
                // draw the menu
                s2 = (s2 + 1) % (D_8013ED28 * 4);
                func_800E6548(10, 0xB0 + (s2 / D_8013ED28), s1 ? 100 : 86, 158 + s1*18, 128);
                func_800E6598(10, 0xD0 | s1, 152, 176, 128);
            }
            break;
        }
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013EDD8 != 3);
    return s3;
}


// 4 callers
// this function plays the jump on island 1 animation and then goes to next
int func_800E444C(void) // entrace sequence 1
{
    // 0xFE none selected and all light
    // 0xFF none selected and all dark
    func_800E0398(0xFE);
    stage_text_anim_set_enabled(0);
    func_800E278C();
    func_800E4064();
    func_800E0F9C(0x23);
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (wrong_one);
    func_800E03D0(0);
    stage_text_anim_set_enabled(1);
    func_800E3CB8();
    return func_800E413C();
}

extern s32 D_8013F418;
extern s32 D_8013F6AC;

// TODO: test this lol
s32 func_800E44E0(void)
{
    func_800E0398(0xFE);
    stage_text_anim_set_enabled(0);
    func_800E1500();
    func_800E4064();
    func_800E32D8(0);
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013F418 != 2);
    func_800E1124(0x23);
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (wrong_one);
    func_800E03D0(1);
    stage_text_anim_set_enabled(1);
    func_800E3CB8();
    return func_800E413C();
}

s32 func_800E45B4(void)
{    
    func_800E0398(0xFE);
    stage_text_anim_set_enabled(0);
    func_800E2A30(0, 1, 1);
    func_800E16F0();
    func_800E4064();
    func_800E32D8(1);
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013F6AC != 2);
    func_800E1288(0x23);
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (wrong_one);
    func_800E03D0(2);
    stage_text_anim_set_enabled(1);
    func_800E3CB8();
    return func_800E413C();
}


INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4698);

// movie data
extern char* D_800EAA04[13];
extern char* D_800EAA38[13];
extern s32 D_800EAA6C[13];
extern s32 D_800EAAA0[13];


// 3 big functions
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E47D8);
// normal selection
void func_800E47D8(void) // TODO: this
{
    int rc = 0;
    printf("world = %d\n", global_data->world);  // world
    printf("stage = %d\n", global_data->stage);  // stage
    printf("0xE8  = %d\n", global_data->unkE8);
    
    if (global_data->stage < 0) goto end;   // TODO: make this not shit. maybe default in switch?

    if (global_data->stage == 0 && global_data->unkE8 == 0) {
        func_800E7B68(D_800EAA38[global_data->world], 0, D_800EAAA0[global_data->world], 0);
        func_800E7358();    // setup scene
    }
    if (global_data->stage > 3) goto end;
    jt.audio_play_by_id(2);
    switch (global_data->stage) {
    case 0:
        rc = func_800E444C();
        break;
    case 1:
        rc = func_800E44E0();
        break;
    case 2:
        rc = func_800E45B4();
        break;
    case 3:
        break;
    }    
    // TODO: the rest of this thing lol
    printf("returned %d\n", rc);

end:
    if (rc < 1)
        jt.execs_set_next(0);
    else
        jt.execs_set_next((global_data->world % 6) * 3 + global_data->stage + 2);
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E4CCC);      // other selection (time attack?)

extern u32 D_8013EDA4;  // which island is selected


void func_800E5258(void)
{
    u32 buttons;
    s32 tmp = 0;    // selected a level yet?
    // the controls loop is right here

    if (global_data->stage == 3)
        global_data->stage = 0;

    D_8013EDA4 = global_data->stage;

    // clamp the page number
    if (shown_world < 0)
        shown_world = 0;
    else
    if (shown_world > 5)
        shown_world = 5;

    func_800E0398(D_8013EDA4);
    stage_text_anim_set_enabled(1);   // start caption animation
    // set island selected animation

    do {
        //printf("SHIT: %d\n", scrolling);
        if (scrolling == 0) {
            buttons = func_800E77D4(0);
        }
        jt.PadRead(0);  // why? print the raw for debug?
        world_text_anim1_enabled = 0; // world caption animation
        if (buttons & PADLleft) {
            if (scrolling == 0) {
                if (D_8013EDA4 > 0) {
                    // same page
                    func_800E02F8(0x2C00);
                    D_8013EDA4 -= 1;
                    func_800E0398(D_8013EDA4);
                } else if (shown_world > 0) {
                    // flip page
                    func_800E02F8(0x2E00);
                    func_800E2588(shown_world - 1);  // set page
                    D_8013EDA4 = 2;
                    func_800E0398(D_8013EDA4);
                }
                stage_text_anim_set_enabled(1);
            } else {
                stage_text_anim_set_enabled(0);
                func_800E0398(0xFF);
            }
        }

        if (buttons & PADLright) {
            if (scrolling == 0) {
                if (D_8013EDA4 < 2) {
                    // same page
                    func_800E02F8(0x2C00);
                    D_8013EDA4 += 1;
                    func_800E0398(D_8013EDA4);
                } else if (shown_world < 5) {
                    // flip page
                    func_800E02F8(0x2D00);
                    func_800E2588(shown_world + 1);  // set page
                    D_8013EDA4 = 0;
                    func_800E0398(D_8013EDA4);
                }
                stage_text_anim_set_enabled(1);
            } else {
                stage_text_anim_set_enabled(0);
                func_800E0398(0xFF);
            }
        }

        if (tmp == 0) {
            if (buttons & PAD_CANCEL) {
                func_800E02F8(0x2700);
                tmp = -1;
                jt.execs_set_next(0);   // back to title screen
                
                D_8013EDD8 = 2; // start fade
                jt.sound_fade_out(12, 0, 0);
            } else if (buttons & PAD_ACCEPT) {
                func_800E02F8(0x2700);
                tmp = -1;
                // selecting with square sends you to extra version of the world
                global_data->world = shown_world + 6 * (buttons & PADRleft != 0);
                global_data->stage = D_8013EDA4;
                jt.execs_set_next(3 * shown_world + D_8013EDA4 + 2);
                D_8013EDD8 = 2; // start fade
                jt.sound_fade_out(12, 0, 0);
            }
        }
        // routines
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013EDD8 != 3);  // exit when the fade is done
    
    return tmp;
}

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
            jt.cd_fs_read(D_800EAC70[global_data->world % 6][global_data->stage], D_80060000, 0);
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

// TODO: take these assets out of asm and link separately
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

// TODO: make this a real struct
extern struct {
    void* tile_data;   // pointer to sprite metadata. huh ptr.
    u16 unk;
    u16 clut[5];
    void* unk1;
} D_80170A10;

// meta sprites (tiles?)
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E6324);

void func_800E637C(void* arg0, s32 priority, s32 id, s16 x, s16 y, u8 brightness, s32 clutid, s32 transparent);

// draw tile
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E637C);

void func_800E6548(s32 priority, s32 id, s32 x, s32 y, u8 brightness)
{
    func_800E637C(&D_80170A10, priority, id, x, y, brightness, 0, 0);
}

void func_800E6598(s32 priority, s32 id, s32 x, s32 y, u8 brightness)
{
    func_800E637C(&D_80170A10, priority, id, x, y, brightness, 0, 1);
}

void func_800E65EC(s32 priority, s32 id, s16 x, s16 y, u8 brightness, s32 clutid)
{
    func_800E637C(&D_80170A10, priority, id, x, y, brightness, clutid, 0);
}

// draw text
void func_800E6640(char* str, s32 x, s32 y, u8 brightness)
{
    char c;
    while (c = *str++) {
        if (c > 0x7F) c -= 0x31;    // why?
        func_800E6548(10, c, x, y, brightness);
        x += 8;
    }
}


// so are these also a separate system for drawing sprites?
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
