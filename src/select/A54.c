#include "common.h"
#include <shared.h>

#include <libetc.h>
// TODO: freeplay has the bug when going across pages

s32 random_range(s32, s32);

extern u32 D_80060000[];

extern GlobalData* global_data;

extern u32 screen_brightness;  // screen brightness (or maybe fade value is better?)

void sprite_draw_by_id(u32 arg0, u32 id, u32 x, u32 y, u8 brightness, s32 size);
void printf(const char* fmt, ...);
s32 random_byte(void);
void func_800E278C(void); // chain_init
void func_800E6640(char* str, s32 x, s32 y, u8 brightness);
void func_800E6548(s32 priority, s32 id, s32 x, s32 y, u8 brightness);
void func_800E6598(s32 priority, s32 id, s32 x, s32 y, u8 brightness);

// TODO: I'm pretty sure these are all void

void func_800E6D00(void);
void func_800E77A4(void);
void func_800E3CB8(void);
void func_800E3D20(void);
void func_800E3D70(void);
void func_800E6D94(void);
void func_800E4064(void);
void func_800E1500(void);
void func_800E16F0(void);
void func_800E1C68(void);
void func_800E1DDC(void);
void func_800E40E8(void);
void func_800E7358(void);
void func_800E2070(void);

u32  func_800E77D4();   // TODO: does this take in an int?

void func_800E0398(int);
void func_800E0F9C(int);
void func_800E03D0(int);
void func_800E32D8(int);
void func_800E1124(int);
void func_800E2A30(int, int, int);  // TODO: I think actually bool?
void func_800E1288(int);
void func_800E1CA0(int);

void func_800E7B68(char*, char*, int, int);
void func_800E7D8C(char*, char*, int, int);
//void (int);


void func_800E02F8(s32 arg0)
{
    jt.audio_unk0(arg0, 0x3E, 100);
}

void func_800E0330(s32 arg0, s16 arg1, s16 arg2, s16 arg3)
{
    // TODO: is this the correct number of arguments?
    //jt.audio_unk1(arg0, arg1, arg2, arg3, -1);
    jt.audio_unk1(arg0, arg1, arg2, arg3);
}


extern s32 D_8013ED24;

void func_800E0374(void)
{
    D_8013ED24 = 16;    // never read?
}

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
    val = rsin(stage_text_anim_t);    // rsin
    if (val < 0) val = -val;
    stage_text_size = val + ONE;
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E078C);

extern s32 D_8013ED1C; // state thing. which island is bright (FF none FE all)

void render_island1(s32 world, s32 x, s32 y)
{
    s32 brightness = screen_brightness / 2;
    if (D_8013ED1C == 0 || D_8013ED1C == 0xFE) {
        brightness = screen_brightness;
    }
    sprite_draw_by_id(4, world << 2 | 1, x, y, brightness, 0x1000);
}

void render_island2(s32 world, s32 x, s32 y)
{
    s32 brightness = screen_brightness / 2;
    if (D_8013ED1C == 1 || D_8013ED1C == 0xFE) {
        brightness = screen_brightness;
    }
    sprite_draw_by_id(4, world << 2 | 2, x, y, brightness, 0x1000);
}

void render_island3(s32 world, s32 x, s32 y)
{
    s32 brightness = screen_brightness / 2;
    if (D_8013ED1C == 2 || D_8013ED1C == 0xFE) {
        brightness = screen_brightness;
    }
    sprite_draw_by_id(4, world << 2 | 3, x, y, brightness, 0x1000);
}

// animation.c

extern s32 world_text_anim0_t;
extern s32 world_text_anim0_target;
extern s32 world_text_anim0_magnitude;

extern u32 world_text_anim1_enabled;  // world caption animation. i don't think ever enabled?
extern u32 world_text_anim1_t;

extern s32 robbit_anim_playing;  // wrong one

s32 scrolling;
s32 scroll_amount;
s32 scroll_delta;
s32 selected_world;
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
        size_offset = rsin(world_text_anim1_t);
        if (size_offset < 0) size_offset = -size_offset;
        world_text_anim1_t += 32;
        brightness_offset = 48;
    } else {
        world_text_anim1_t = 0;
    }

    if (scrolling) x += scroll_amount;

    sprite_draw_by_id(11, 0x18 + world, x, y, screen_brightness + brightness_offset, ONE + size_offset);

}

#define SPRITE_WORLD_1  0x26
#define SPRITE_WORLD_2  0x27
#define SPRITE_WORLD_3  0x28

extern u32 D_8013ED20;  // selected
//extern s32 stage_text_size;  // bumping size

//INCLUDE_ASM("asm/select/nonmatchings/A54", render_stage_text);
void render_stage_text(void)
{
    u32 brightness0 = screen_brightness / 2;
    u32 brightness1 = screen_brightness / 2;
    u32 brightness2 = screen_brightness / 2;
    u32 size0 = 4096;
    u32 size1 = 4096;
    u32 size2 = 4096;

    switch (D_8013ED20) {
    case 0:
        size0 = stage_text_size;
        brightness0 = screen_brightness;
        break;
    case 1:
        size1 = stage_text_size;
        brightness1 = screen_brightness;
        break;
    case 2:
        size2 = stage_text_size;
        brightness2 = screen_brightness;
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





s32 island1_offx;
s32 island1_offy;
s32 island2_offx;
s32 island2_offy;
s32 island3_offx;
s32 island3_offy;
s32 tower_offx;
s32 tower_offy;

void islands_anim_update(void)
{
    island1_offx = 0;
    island2_offx = 0;
    island3_offx = 0;
    tower_offx = 0;
    island1_offy = rsin(island1_anim_t) / 0x555;
    island2_offy = rsin(island2_anim_t) / 0x555;
    island3_offy = rsin(island3_anim_t) / 0x555;
    tower_offy = rsin(tower_anim_t) / 0x555;
    island1_anim_t += 0x44;
    island2_anim_t += 0x44;
    island3_anim_t += 0x44;
    tower_anim_t += 0x3A;
}

typedef struct {
    s32 offx;
    s32 offy;
    s32 frame;
    s32 timer;   // timer
    s32 size;
} Explosion;


Explosion D_8013F340[4];

extern s32 tower_state;  // tower state
s32 tower_fall_height = 0;
extern s32 D_8013EF00;
s32 D_8013EF08 = 0;
s32 D_8013ED84 = 4;

#define TOWER_STATE_NORMAL  0
#define TOWER_STATE_FALLING 1
#define TOWER_STATE_FALLEN  2

// start tower exploding animation
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1F88);
void func_800E1F88(void)
{
    for (int i = 0; i < 4; i++) {
        Explosion* p = &D_8013F340[i];
        p->offx = -53 + random_range(0, 106);
        p->offy = -52 + random_range(0, 104);
        p->size = random_range(0.5*ONE, 1.5*ONE);
        p->frame = random_range(0, 6);
        p->timer = D_8013ED84;
    }

    tower_state = TOWER_STATE_FALLING;     // start explosion
    tower_fall_height = 0; 
    D_8013EF00 = 0; 
    D_8013EF08 = 2; 
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2070);

// render tower
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2090);
void func_800E2090(s32 x, s32 y)
{
    if (tower_state == TOWER_STATE_FALLING) {
        if (tower_fall_height > 199) {
            tower_state = TOWER_STATE_FALLEN;
            return;
        }
        D_8013EF00 += 1;    // where the chain is connected?

        s32 delta = 2;
        if (D_8013EF08 == 2) {
            delta = -1;
        }
        tower_fall_height += delta;
        D_8013EF08 = delta;
        for (int i = 0; i < 4; i++) {
            Explosion* p = &D_8013F340[i];
            sprite_draw_by_id(7, 0x1E + p->frame, x + p->offx, y + D_8013EF00/4 + p->offy, screen_brightness, p->size);
            if (p->frame == 0 && p->timer == D_8013ED84) {
                // oh this is directional sound????
                func_800E0330(0x3700, 100, ((x + p->offx) * 0x7F) / 0x140, 0x3A);
            }

            if (--(p->timer) == 0) {   // oh it's the timer
                p->frame += 1;
                p->timer = D_8013ED84;
            }

            if (p->frame == 8) {
                p->offx = -53 + random_range(0, 106);
                p->offy = -52 + random_range(0, 104);
                p->size = random_range(ONE*0.5, ONE*1.5);
                p->frame = 0;
            }
        }
    } else {
        y += tower_offy;
    }

    if (tower_state != TOWER_STATE_FALLEN)
        sprite_draw_by_id(4, shown_world << 2 | 0, x + tower_offx, y + (tower_fall_height / 2), screen_brightness, 0x1000);
}

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
}


// chains.c

extern s32 D_8013ED8C;  // mag

#define UNK(a,b)    u8 unk##a[b - a + 1]
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
#undef UNK

extern Chain D_8013F390[3];

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E278C);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2A30);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E2B74);
/*
void _func_800E2B74(void)
{
    s32 val;

    for (int i = 0; i < 3; i++) {
        //printf("0x44 %d\n", );
        Chain* c = &D_8013F390[i];
        if (c->unk88 == 2) continue;
        for (int j = 0; j < 6; j++) {
            // ignore middle one for now
            val = rsin(c->unk60 + c->unk64 * D_8013ED8C * (j + 1));
            val *= c->unk12[8+j*2];
            if (val < 0) val += 0xFFF;
            c->unk12[j*2] = val >> 12;
            c->unk60 += c->unk64;
        }
        // TODO: jesus fucking christ I have no idea what's happening
        func_800E6548(2, 3, 40, 40, 128);
    }
}*/


INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E32B0);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E32D8);

typedef struct {
    s32 unk0;
    s32 unk1;
} UnkStruct;

extern UnkStruct D_80170A28[3];

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E3308);
/*void _func_800E3308(void)
{
    static int frame = 0;
    for (int i = 0; i < 3; i++) {
        UnkStruct* p = &D_80170A28[i];
        //printf("%d: %d %d\n", i, p->unk0, p->unk1);
        
    }
    sprite_draw_by_id(12, 0x1E + (frame/4), 0x80, 0x5E, screen_brightness, 0x1800);
    frame++;
}*/


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
// WORKING!!! this is controls (not for freeplay mode)
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
                    //func_800E6640("PUSH START BUTTON", 0x54, 0xB0, screen_brightness);
                    func_800E6640("PUSH START PLZ UWU", 0x54, 0xB0, screen_brightness);
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

#define WAIT_WHILE(x) \
    do { func_800E6D00(); func_800E3D20();  \
         func_800E3D70(); func_800E6D94(); } while ((x));

// 4 callers
// this function plays the jump on island 1 animation and then goes to loop
int sequence_enter_world(void) // entrace sequence 1
{
    // 0xFE no text highlighted and all light
    // 0xFF no text highlighted and all dark
    func_800E0398(0xFE);    // highlight all islands
    stage_text_anim_set_enabled(0); // don't animate until sequence is over
    func_800E278C();        // chain_init
    func_800E4064();        // wait for the screen appearing animation to fully finish
    func_800E0F9C(0x23);    // start robbit and ship animation
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (robbit_anim_playing);
    // highlight level text but don't change island highlight (keeps all highlighted?)
    func_800E03D0(0); 
    stage_text_anim_set_enabled(1);
    func_800E3CB8();    // start press start blinking text
    return func_800E413C();
}

extern s32 D_8013F418;
extern s32 D_8013F6AC;

// TODO: test this lol
s32 sequence_finished_1(void)
{
    func_800E0398(0xFE);
    stage_text_anim_set_enabled(0);
    func_800E1500();    // set robbit on island 1?
    func_800E4064();
    func_800E32D8(0);   // explode island and chains
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (D_8013F418 != 2);
    func_800E1124(0x23);    // robbit jump to island 2
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (robbit_anim_playing);
    func_800E03D0(1);
    stage_text_anim_set_enabled(1);
    func_800E3CB8();
    return func_800E413C();
}

s32 sequence_finished_2(void)
{    
    func_800E0398(0xFE);
    stage_text_anim_set_enabled(0);
    func_800E2A30(0, 1, 1); // disable the chain for island 1
    func_800E16F0();        // set robbit on island 2
    func_800E4064();
    func_800E32D8(1);       // explode island 2
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
    } while (robbit_anim_playing);
    func_800E03D0(2);
    stage_text_anim_set_enabled(1);
    func_800E3CB8();
    return func_800E413C();
}

// timer for this seqs first part. why is it a global?
extern s32 D_8013ED9C;

//INCLUDE_ASM("asm/select/nonmatchings/A54", sequence_finished_3);
// basically two things need to be fixed:
// TODO: what does robbit_anim_playing do and how can I fix it?
//       basically scrolling (0x8013EDE8) and robbit_anim_playing (0x8013EDE0) are mixed
s32 sequence_finished_3(void)
{
    func_800E0398(0xFE);
    stage_text_anim_set_enabled(0);
    func_800E2A30(0, 1, 1);
    func_800E2A30(1, 1, 1);
    func_800E1C68();    // show the exit ship?
    func_800E1DDC();    // set on island 3
    func_800E4064();    // wait
    func_800E1F88();  // the whole tower exploding and going down
    func_800E32D8(2);   // explode 3
    s32 counter = D_8013ED9C;
    do {
        D_8013ED9C = counter;
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
        counter = D_8013ED9C + 1;
    } while (D_8013ED9C < 201);
    func_800E1CA0(0x1E);    // I think is duration?
    do {
        func_800E6D00();
        func_800E3D20();
        func_800E3D70();
        func_800E6D94();
    } while (robbit_anim_playing != 0);
    D_8013EDD8 = 2; // start fading?
    if (global_data->unkE8 == 0) {
        jt.sound_fade_out(12, 0, 0);
    }
    func_800E40E8();    // wait until fadeout finished
    return func_800E413C();
}

// movie data
//const char* weird_str = "$$$$$$$$.$$$";
char* D_800EAA04[13] = {
    /*weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str,
    weird_str*/
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$",
    "$$$$$$$$.$$$"
};
char* D_800EAA38[13] = {
    "MOVIE\\W1ST.STR",
    "MOVIE\\W2ST.STR",
    "MOVIE\\W3ST.STR",
    "MOVIE\\W4ST.STR",
    "MOVIE\\W5ST.STR",
    "MOVIE\\W6ST1.STR",
    "MOVIE\\W1ST.STR",
    "MOVIE\\W2ST.STR",
    "MOVIE\\W3ST.STR",
    "MOVIE\\W4ST.STR",
    "MOVIE\\W5ST.STR",
    "MOVIE\\W6ST2.STR",
    "MOVIE\\W6ST2.STR"
};
s32 D_800EAA6C[13] = {
    0x00, 0xAF, 0x96, 0xA5, 0x87, 0x80, 0x00, 0xAF, 0x96, 0xA5, 0x87, 0x80, 0x80
};
s32 D_800EAAA0[13] = {
    0x66, 0x66, 0x67, 0x66, 0x66, 0xAF, 0x66, 0x66, 0x67, 0x66, 0x66, 0xAF, 0xAF
};

// normal selection
void func_800E47D8(void) // TODO: this
{
    int rc = 0;   
    if (global_data->stage < 0) goto end;   // TODO: make this not shit. maybe default in switch?
    if (global_data->stage == 0 && global_data->unkE8 == 0) {
        func_800E7B68(D_800EAA38[global_data->world], 0, D_800EAAA0[global_data->world], 0);
        func_800E7358();    // setup scene
    }
    if (global_data->stage > 3) goto end;
    jt.audio_play_by_id(2);

    switch (global_data->stage) {
    case 1:
        rc = sequence_finished_1();
        break;
    case 2:
        rc = sequence_finished_2();
        break;
    case 3:
        // TODO: going to 3 is a bit more complicated
        jt.audio_play_by_id(2);
        
        if (global_data->world != 6 && global_data->world != 12) {
            if (shown_world == 0) {
                sequence_finished_3();
            } else {
                shown_world -= 1;
                sequence_finished_3();
                shown_world += 1;
            }
            if (global_data->unkE8 == 0) {
                while (jt.unk_flags() & 4);
                s32 world = global_data->world;
                func_800E7B68(D_800EAA04[world], D_800EAA38[world], D_800EAA6C[world], D_800EAAA0[world]);
                func_800E7358();
                jt.audio_play_by_id(2);
            }
            func_800E2070();
            func_800E278C();
            world_text_anim0_start(0x1E, 0xC000);
            D_8013EDD8 = 0;
            global_data->stage = 0;
        } else {
            shown_world = 5;
            sequence_finished_3();
            while (jt.unk_flags() & 4);
            if (global_data->world == 6) {
                if (global_data->unk500 > 999999)
                    global_data->unkE9 |= 1;
                // if here, but never taken?
                func_800E7D8C("MOVIE\\NL_END1.STR", "MOVIE\\NL_END2.STR", 0x97, 0x56);
                global_data->unkE4 = 7;
                global_data->world = 7;
            } else {
                func_800E7D8C("MOVIE\\NL_END1.STR", "MOVIE\\NL_END2.STR", 0x13B, 0x804);
                global_data->unkE4 = 12;
                global_data->world = 12;
                if (global_data->unk500 > 999999) {
                    global_data->unkE9 |= 2;
                    global_data->unkE4 = 13;
                    global_data->world = 13;
                    if (global_data->unkE9 & 1) {
                        global_data->unkE4 += 1;
                        global_data->world += 1;
                    }
                }
            }
            func_800E7358();
            rc = -1;
            break;
        }
    case 0:
        rc = sequence_enter_world();
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
        buttons = scrolling ? 0 : func_800E77D4(0);
        //jt.PadRead(0);  // why? print the raw for debug?
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
                global_data->world = shown_world + 6 * ((buttons & PADRleft) != 0);
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
    
    // TODO: does this need to return anything?
    //return tmp;
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
    while ((c = *str++)) {
        if (c > 0x7F) c -= 0x31;    // why?
        func_800E6548(10, c, x, y, brightness);
        x += 8;
    }
}


// so are these also a separate system for drawing sprites?
typedef struct {
    u16 u, v, w, h;
} SpriteThing;

void func_800E66C8(u32, Sprite*, u32, u32, u8, s32);
void func_800E6E5C(Sprite*, SpriteThing*, u8, u8, u32, u32);


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


// das input stuff, the same as the one from GAMEOVER
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7724);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E77A4);
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E77D4);

// movie playing stuff
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E799C);  // callback
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7AA4);  // init struct viddct
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7B68);  // play two movies
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7D8C);  // play two movies

// asm thingy (syscall)
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E7F68);
