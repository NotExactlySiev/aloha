#include "common.h" // TODO: this is from main api, use <>
#include <libspu.h>
#include <libgpu.h>
#include "shared.h" // TODO: this is from main api, use <>

#include "gbuffer.h"
#include "sprite.h"
#include "robbit.h"

#include "gameover.h"

// "render" refers to putting primitives in the OT
// "draw" refers to passing those to the GPU
// should I reverse those?

// TODO: figure out how many different types of GBuffer there are
// (this one, main one in game, debug one in game, and more?)
// TODO: header file
// TODO: naming everything and reorganizing
// TODO: seperate different modules in files

s32 D_800ED354[7] = { 32, 33, 34, 35, 36, 37, 32 };

s32 bounce_y = -0x2400;       // y
s32 bounce_dy = 0x600;         // dy
s32 bounce_anim_counter = 60;            // initial counter
s32 bounce_anim_state = 0;     // bounce animation state

s32 D_800ED380 = 0; // the shut the fuck up counter


// this might be a struct
s32 D_800ED388 = 0;
s32 D_800ED38C = 0;
s32 D_800ED390 = 40;

s32 D_800ED394 = 0;
s32 D_800ED3B4 = 0;
s32 D_800ED3C4 = 0;
s32 screen_brightness = 0;     // color for something (screen fading?)
s32 stage = 0;          // stage of the entire sequence of this file. from fadein to fadeout
s32 selected = 0;       // selected
s32 D_800ED3E4 = 0;
s32 D_800ED3EC = 0;
s32 D_800ED3F4 = 0;


s32 D_800ED340[5] = { 40, 42, 41, 42, -1 };

RECT D_800ED398 = { .w = 0xFF, .h = 0xFF };


// these change with tv standard
s32 D_800ED384 = 1200;
s32 D_800ED424 = 0;


// functions


// screen init?
void func_800EB894(void)
{
    screen_brightness = 4;
    stage = 0;
    D_800ED3EC = 0;
    D_800ED3F4 = 0;
}

// plays some sound effect
void play_effect(s32 arg)
{
    jt.audio_unk0(arg, 0x3e, 100);
}

// controls for when before the thing is fully loaded. update for fadein and shit
// fading_in_update
//INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB8F8);
// controls screen fade and general state
void func_800EB8F8(u32 buttons)
{
    switch (stage) {
    case 0:
        // fading in
        screen_brightness += 4;
        if (buttons != 0 || screen_brightness == 128) {
            screen_brightness = 128;
            stage = 1;
        }
        break;
    case 1:
        // waiting
        break;
    case 2:
        // gonna fade out
        stage = 3;
        break;
    case 3:
        // play anim and fade out
        if (D_800ED3E4 > 0) D_800ED3E4 -= 1;
        else if (screen_brightness > 0) screen_brightness -= 4;
        else stage = 4; // end this file
        break;
    }

    if (D_800ED3EC != 1 && buttons != 0) {
        bigtext_anim_play_drop();
        func_800EBCF0();
        D_800ED3EC = 1;
    }
}



// text.c

void bigtext_anim_play_bounce(void)
{
    D_800ED3B4 = 0;
    bounce_anim_state = 0;
}

// is this even drop??
// this isn't play, it's set to already dropped
void bigtext_anim_play_drop(void)   // TODO: the name isn't changed in the asm function
{
    bounce_y = 0x00005F00;
    bounce_anim_state = 5;
}

void bigtext_render(void)
{
    switch (bounce_anim_state) {
    case 0: // wait
        bounce_anim_counter -= 1;
        if (bounce_anim_counter < 0) bounce_anim_state = 1;
        break;
    case 1:
        bounce_dy += 128;   // half?
        bounce_y += bounce_dy;
        if (bounce_y > 95 << 8) {
            bounce_anim_state = 3;
            bounce_y = 95 << 8;
            robbit_anim_play(0);
            play_effect(0xB00);
            bounce_dy = -8 << 8;
        }
        break;
    case 2: // final drop if NO is selected
        if (D_800ED3F4 == 1) {
            bounce_dy += 0x20;
            bounce_y += bounce_dy;
        }
        if (D_800ED3F4 == -1) bounce_anim_state = 7;
        break;
    case 3: // just like 1
        bounce_dy += 128;   // half?
        bounce_y += bounce_dy;
        if (bounce_y > 95 << 8) {
            bounce_anim_state = 4;
            bounce_y = 95 << 8;
            robbit_anim_play(0);
            play_effect(0xB00);
            bounce_dy = -4 << 8;
        }
        break;
    case 4: // just like 1
        bounce_dy += 128;   // half?
        bounce_y += bounce_dy;
        if (bounce_y > (95 << 8)) {
            bounce_anim_state = 5;
            bounce_y = 95 << 8;
            robbit_anim_play(0);
            play_effect(0xB00);
        }
        break;
    case 5: // start bunny animation
    // TODO: the animation plays wrong, stops on the wrong frame
        D_800ED3EC = 1;
        D_800ED380 += 1;
        if (D_800ED380 > D_800ED384) {
            play_effect(0x5300);
            D_800ED380 = 0;
        }
        break;
    case 6: // selected YES
        bounce_y += -0x800;
        if (bounce_y <= -0x2000) bounce_anim_state = 7;
        break;
    }
    sprite_render(3, 0x18, 124, bounce_y >> 8, screen_brightness, 0);
}

void func_800EBCE0(void)
{
    D_800ED3C4 = 0; // unused var?
}


// menu

void func_800EBEA8(void)
{
    selected = 0;
}

void menu_render(void)
{
    sprite_render(2, 32, 68, 144, screen_brightness, 0);
    sprite_render(2, 33, 68, 160, screen_brightness, selected == 0);
    sprite_render(2, 34, 68, 176, screen_brightness, selected == 1);
}

// TODO: where the fuck is lib pad? :/ I need macros for input
#define BUTTONS_NAVIGATE    0xF000
#define BUTTONS_ACCEPT      0x08A0
#define BUTTON_UP           0x1000
#define BUTTON_DOWN         0x4000

void func_800EBF58(u32 buttons)
{
    // stage 1 is when the menu is shown and we receive input
    if (buttons == 0 || stage != 1) return;

    if (buttons & (BUTTONS_ACCEPT | BUTTONS_NAVIGATE)) D_800ED380 = 0;

    if (buttons & BUTTONS_ACCEPT) {
        play_effect(0x2600);
        stage = 2;
        jt.sound_fade_out(12, 0, 0);
        if (selected == 0) {
            // selected YES
            robbit_anim_play(2);
            bounce_anim_state = 6;
            play_effect(0x4A00);
        } else {
            // selected NO
            D_800ED3F4 = 1;
            bounce_dy = 0; // no change in speed anymore
            bounce_anim_state = 2;
        }
    }

    if ((buttons & BUTTON_UP) && selected == 1) {
        selected = 0;
        play_effect(0x2c00);
    }

    if ((buttons & BUTTON_DOWN) && selected == 0) {
        selected = 1;
        play_effect(0x2c00);
    }
}


void func_800EC098(void)
{
    bigtext_anim_play_bounce();
    func_800EBCE0();
    func_800EB894();
    func_800EBEA8();
    D_800ED3E4 = 0x2D;

    if (jt.get_tv_system() == TV_PAL) {
        D_800ED424 = 9;
        D_800ED384 = 1000;
    } else {
        D_800ED424 = 11;
    }
}

void func_800EC128(void)
{
    D_800ED388 = 0;
    D_800ED38C = 0;
    D_800ED390 = 40;
}

// menu curosr thing render
void menu_cursor_render(void)
{
    s32 tmp;

    D_800ED388 += 1;
    if (D_800ED388 >= D_800ED424) {
        D_800ED38C += 1;
        D_800ED388 = 0;
        if (D_800ED340[D_800ED38C] == -1) {
            D_800ED38C = 0;
        }
        D_800ED390 = D_800ED340[D_800ED38C];
    }

    tmp = selected == 1 ? 0xAB : 0x9B;
    sprite_render(2, D_800ED390, 0x44, tmp, screen_brightness, 0);
}

void update_routine(u32 arg)
{
    func_800EB8F8(arg);
    func_800EBF58(arg);
}

// not sure about this one. might be wrong, but doesn't seem really broken.
// seems to repeat and action for diagonal lines 128 pixels apart in both directions
// I think this does the background scroll
void render_background(void)
{
    int i,j;

    D_800ED394 = (D_800ED394 + 1) & 0x7F;
    for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
            sprite_render(0, 0x30, 
                ((i << 7) - D_800ED394) - 0x40, 
                ((j << 7) + D_800ED394) - 0x40, 
                screen_brightness / 2, 2);
}


void render_routine(void)
{
    bigtext_render();
    menu_render();
    robbit_update_and_render();
    render_background();
    menu_cursor_render();
}

void func_800EC358(void)
{
    GlobalData* global = jt.global_ptr();
    
    global->unk500 = 0;
    global->unk504 = 3;
    global->unk508 = 1;
    global->unk509 = 0;
    global->unk50A = 0;
    global->unk50B = 0;
    
}


int main(void)
{
    u32 buttons;
    int choice;

    // TEST: let's disable all audio shit
    func_800ED268();    // go to weird event handler
    gbuffer_init();    // set up graphics env
    func_800EC098();    // set up some constants
    
    jt.audio_unk2();
    
    input_das_setup();
    GlobalData* global = jt.global_ptr();
    jt.set_global_volume(&(SpuVolume){ 0x7FFF, 0x7FFF });
    jt.audio_unk_volume(0x3000);
    jt.audio_unk3(0);    // mc_set_some_var

    // play some audio thing
    u8 world = global->world;
    if (world > 5) world = 5;
    jt.audio_play_by_id(D_800ED354[world]);
    
    // cycle through both buffers once
    gbuffer_swap();    // clear
    gbuffer_draw();    // draw
    gbuffer_swap();    // clear
    gbuffer_draw();    // draw
    jt.wait_for_vsync();    // needs 0? TODO
    jt.SetDispMask(1);

    robbit_anim_play(1);


    do {
        buttons = input_das_read();  // read input
        gbuffer_swap();            // swap and clear
        update_routine(buttons);     // process input
        render_routine();            // update graphics
        gbuffer_draw();            // render graphics
    } while (stage != 4);
    
    jt.audio_unk2();

    choice = 0;
    
    if (selected == 0) {
        global->world = 0;
        func_800EC358();
        choice = 1;
    }
    jt.execs_set_next(choice);
}

// robbit render squashed
void func_800ECBB4(s16 x, s16 y, s16 w, s16 h, u8 col)
{
    POLY_FT4 *p;
    
    u32 tpage;
    p = gbuffer_current->next;
    setPolyFT4(p);
    setRGB0(p, col, col, col);
    setUV4(p, 0, 0, 48, 0, 0, 24, 48, 24);
    setXY4(p, x, y, x+w, y, x, y+h, x+w, y+h);
    p->tpage = getTPage(1, 0, 256, 256);
    p->clut  = getClut(0, 240);
    addPrim(&gbuffer_current->ot[1], p);
    gbuffer_current->next = p + 1;

    DR_MODE *q = gbuffer_current->next;
    tpage = getTPage(1, 0, 256, 256);
    jt.SetDrawMode(q, 0, 0, tpage, &D_800ED398);
    addPrim(&gbuffer_current->ot[1], q);
    gbuffer_current->next = q + 1;
}