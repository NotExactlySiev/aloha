#include "common.h"
#include <shared.h>

// TODO: these go in a common header
extern u32 screen_brightness;  // screen brightness (or maybe fade value is better?)
void sprite_draw_by_id(u32 arg0, u32 id, u32 x, u32 y, u8 brightness, s32 size);
extern s32 island1_offx;
extern s32 island1_offy;
extern s32 island2_offx;
extern s32 island2_offy;
extern s32 island3_offx;
extern s32 island3_offy;
extern s32 tower_offx;
extern s32 tower_offy;


// this code is kinda ass

// one system controls the sprite shown every frame (with AnimStep)
// and a seperate one controls robbit's position and movement
// using a state machine. except it also sometimes sets the sprite?
// the AnimStep system can be turned off at points and the state machine
// just jumps in and controls everything

// the AnimStep system:
// TODO: perhaps these should be called Keyframes instead?

// an animation is a series of steps
typedef struct {
    s32 duration;
    s32 frame;
    s32 offx;
    s32 offy;
} AnimStep;

AnimStep D_800EAAD4 = { -1, 0, 0, 0 };

AnimStep D_800EAAE4[4] = {
    {  3, 0, 0, 0 },
    {  3, 1, 0, 0 },
    {  6, 2, 0, 0 },
    { -1, 3, 0, 0 }
};

AnimStep D_800EAB24[2] = {
    {  4, 1, 0, 0 },
    { -1, 0, 0, 0 }
};

// SOME VARS ARE USED BY BOTH SYSTEMS AAAAAAAAAAA

// AnimStep vars
extern s32 robbit_step_counter;  // counter
extern s32 robbit_frame;
extern s32 robbit_offx;
extern s32 robbit_offy;
extern AnimStep* robbit_current_step;


// state machine vars
s32 robbit_x = 0;
s32 robbit_y = 0;
extern s32 D_8013EE78;  //
extern s32 D_8013EE80;  //
extern s32 robbit_dx;
extern s32 robbit_ddy;
extern s32 robbit_anim_interval;
s32 ship_x = 0;
s32 ship_y = 0;
extern s32 D_8013EEB8;  // 
extern s32 D_8013EEC0;  // 
extern s32 D_8013EEC8;  // 
extern s32 robbit_state;
extern s32 D_8013ED64;  //
extern s32 D_8013ED6C;  //
extern s32 D_8013ED74;  //
extern s32 D_8013ED7C;  //
extern s32 robbit_t;
extern s32 robbit_anim_playing;

void func_800E0EE4(void)
{
    if (robbit_current_step->duration == -1) return;
    robbit_step_counter += 1;
    if (robbit_step_counter > robbit_current_step->duration) {
        // go to next step
        robbit_current_step += 1;
        robbit_frame = robbit_current_step->frame;
        robbit_offx = robbit_current_step->offx;
        robbit_offy = robbit_current_step->offy;
        robbit_step_counter = 0;
    }
}

// animation stuff
// set first step
void func_800E0F60(AnimStep* anim)
{
    robbit_step_counter = 0;
    robbit_frame = anim[0].frame;
    robbit_offx = anim[0].offx;
    robbit_offy = anim[0].offy;
    robbit_current_step = anim;
}

// the state machine system:

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E0F9C);
/*void _func_800E0F9C(s32 speed)
{
    robbit_dx = (93*ONE) / speed;
    //robbit_ddy = ((58*ONE) / (speed*speed)) << 1;
    D_8013EEC0 = (ONE*0.25) / speed;
    robbit_step_counter = 0;
    //robbit_x 
}*/


INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1124);

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1288);

// island 1 stuff

void func_800E13EC(void)
{
    if (robbit_state != 4) return;
    if (robbit_t < robbit_anim_interval) {
        robbit_x += robbit_dx;
        robbit_y += robbit_ddy * robbit_t;
        sprite_draw_by_id(5, 0x2D, 
            robbit_x/ONE + robbit_offx,
            robbit_y/ONE + robbit_offy,
            screen_brightness,
            ONE);        
        robbit_t += 1;
    } else {
        robbit_state = 7;
        func_800E0F60(D_800EAB24);
    }
}

void func_800E1500(void)
{
    robbit_state = 1;
}

void func_800E1514(void)
{
    if (robbit_state != 1) return;
    sprite_draw_by_id(5, 0x2A, 53, 90 + island1_offy, screen_brightness, 0x1000);
}

// island 2 stuff

void func_800E156C(void)
{
    if (robbit_state != 5) return;
    if (robbit_t < robbit_anim_interval) {
        s32 x = robbit_x;
        s32 y = robbit_y;
        s32 offy;
        if (robbit_frame < 2) {
            offy = island1_offy * ONE;
        } else {
            // physics
            robbit_x += robbit_dx;
            robbit_y += robbit_ddy;
            D_8013EEB8 += D_8013EEC0;
            robbit_t += 1;
            offy = sin(D_8013EEB8);
            offy = -(offy * D_8013EEC8);
        }
        y += offy;
        sprite_draw_by_id(5, robbit_frame + 0x2A, 
            x/ONE + robbit_offx,
            y/ONE + robbit_offy,
            screen_brightness,
            ONE);        
        func_800E0EE4();
    } else {
        robbit_state = 8;
        func_800E0F60(D_800EAB24);
    }
}

void func_800E16F0(void)
{
    robbit_state = 2;
}

void func_800E1704(void)
{
    if (robbit_state != 2) return;
    sprite_draw_by_id(5, 0x2A, 147, 65 + island2_offy, screen_brightness, 0x1000);
}

// island 3 stuff

void func_800E175C(void)
{
    if (robbit_state != 6) return;
    if (robbit_t < robbit_anim_interval) {
        s32 x = robbit_x;
        s32 y = robbit_y;
        s32 offy;
        if (robbit_frame < 2) {
            offy = island2_offy * ONE;
        } else {
            // physics
            robbit_x += robbit_dx;
            robbit_y += robbit_ddy;
            D_8013EEB8 += D_8013EEC0;
            robbit_t += 1;
            offy = sin(D_8013EEB8);
            offy = -(offy * D_8013EEC8);
        }
        y += offy;
        sprite_draw_by_id(5, robbit_frame + 0x2A, 
            x/ONE + robbit_offx,
            y/ONE + robbit_offy,
            screen_brightness,
            ONE);        
        func_800E0EE4();
    } else {
        robbit_state = 9;
        func_800E0F60(D_800EAB24);
    }
}

// finishers:

void func_800E18E0(void)
{
    if (robbit_state != 7) return;
    sprite_draw_by_id(5, robbit_frame + 0x2A, 
            53 + robbit_offx + island1_offx,
            90 + robbit_offy + island1_offy,
            (screen_brightness * 128) >> 7,
            ONE);   
    func_800E0EE4();
    robbit_anim_playing = 0;
}

void func_800E198C(void)
{
    if (robbit_state != 8) return;
    sprite_draw_by_id(5, robbit_frame + 0x2A, 
            147 + robbit_offx + island1_offx,
            65 + robbit_offy + island1_offy,
            (screen_brightness * 128) >> 7,
            ONE);   
    func_800E0EE4();
    robbit_anim_playing = 0;
}

void func_800E1A38(void)
{
    if (robbit_state != 9) return;
    sprite_draw_by_id(5, robbit_frame + 0x2A, 
            249 + robbit_offx + island3_offx,
            89 + robbit_offy + island3_offy,
            (screen_brightness * 128) >> 7,
            ONE);
    func_800E0EE4();
    robbit_anim_playing = 0; 
}


// ship stuff
//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1AE4);    // render
func_800E1AE4()
{
    if (robbit_state != 4 && robbit_state != 7) return;
    if (ship_x < 400) {
        ship_x += 8;
        func_800E6548(6, 0x10, ship_x, ship_y, screen_brightness);
    }
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1B58);    // render
//func_800E1B58() {}

//INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1C68);
void func_800E1C68(void)
{
    robbit_state = 10;
    robbit_anim_playing = 1;
    ship_x = 249;
    ship_y = 32;
}


// exit stuff
INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1CA0);

void func_800E1DDC(void)
{
    robbit_state = 3;
}

void func_800E1DF0(void)
{
    if (robbit_state != 3) return;
    sprite_draw_by_id(5, 0x2A, 249, 89 + island3_offy, screen_brightness, 0x1000);
}

INCLUDE_ASM("asm/select/nonmatchings/A54", func_800E1E48);

