
#include "common.h" // TODO: this is from main api, use <>
#include <libspu.h>
#include <libgpu.h>
#include "shared.h" // TODO: this is from main api, use <>

#include "gameover.h"
#include "sprite.h"

#include "robbit.h"

// maybe macros for these?
static const Keyframe *robbit_anims[3] = {
    (Keyframe[]) {  // Static
        { 13,  1 },
        { -1,  0 },
    },

    (Keyframe[]) {  // Start
        {  0,  4 },
        {  1,  4 },
        {  2,  4 },
        {  3,  4 },
        {  8, 10 },
        {  9, 10 },
        { 10, 10 },
        { 11, 10 },
        { 12, 10 },
        { 13, 10 },
        { -1, 18 },
    },

    (Keyframe[]) {  // Dance
        { 16, 8 },
        { 17, 8 },
        { -1, 0 },
    },
};


const
static Keyframe   *robbit_anim_keyframes = NULL;
static s32         robbit_frame = 0;
static s32         robbit_anim_wait = 0;
static s32         robbit_anim_idx = 0;
static s32         robbit_anim_timer = 0;


// robbit_anim_??? init?
// used by the asm one
void func_800EBCF0(void)
{
    robbit_anim_play(0);
}

void robbit_anim_play(int idx)
{
    robbit_anim_keyframes = robbit_anims[idx];
    robbit_anim_idx = 0;
    robbit_anim_timer = 0;
    robbit_frame = robbit_anim_keyframes[0].frame;
    robbit_anim_wait = robbit_anim_keyframes[0].wait;
}

void robbit_update_and_render(void)
{
    s32 temp_v1_2;

    // sequence mode
    if (D_800ED3F4 == 0) {
        // update timer, go to next step if this one is over
        robbit_anim_timer += 1;
        if (robbit_anim_wait < robbit_anim_timer) {
            // increment index
            robbit_anim_idx += 1;
            robbit_anim_timer = 0;
            // if the sequence is over, roll over to step idx determined by the last value
            if (robbit_anim_keyframes[robbit_anim_idx].frame == -1) {
                robbit_anim_idx = robbit_anim_keyframes[robbit_anim_idx].wait;
            }
            // and get the new values
            robbit_frame = robbit_anim_keyframes[robbit_anim_idx].frame;
            robbit_anim_wait = robbit_anim_keyframes[robbit_anim_idx].wait;
        }

        // whether the values have changed or not, call the function
        sprite_render(1, robbit_frame, 0x78, 0x78, screen_brightness, 0);
        return;
    }

    // text_y
    temp_v1_2 = bounce_y >> 8;
    if (temp_v1_2 < 0x78) {
        // squash animation
        func_800ECBB4(0x60, temp_v1_2 + 0x10, 0x30, 0x77 - temp_v1_2, screen_brightness);
    } else {
        // no more bunny
        D_800ED3F4 = -1;
    }    
}