
// input.c
#include "common.h" // TODO: this is from main api, use <>
#include "shared.h"

// ### DAS INPUT FUNCTIONS
static s32 initial_delay = 0;
static s32 repeat_delay = 0;
static s32 face_wait = 0;
static s32 nav_wait = 0;
static s32 face_timer = 0;
static s32 nav_timer = 0;

static u32 face_prev = 0;
static u32 nav_prev = 0;

static s32 das_state = -1;

// set up DAS times based on framerate
void input_das_setup(void)
{
    if (jt.get_tv_system() == TV_PAL) {
        initial_delay = 8;
        repeat_delay = 3;
    } else {
        initial_delay = 12;
        repeat_delay = 5;
    }
    face_wait = initial_delay;
    nav_wait = initial_delay;
}

u32 input_das_read(void)
{
    u32 raw;
    u32 face_raw;
    u32 nav_raw;

    u32 face;
    u32 nav;

    raw = jt.PadRead();
    face_raw = raw & 0xF000;
    nav_raw  = raw & 0x08E0;
    face = 0;
    nav = 0;

    // state -1, no button is pressed
    if ((face_raw | nav_raw) == 0) das_state = -1;

    // positive edge, trigger input and start initial delay timer
    if (das_state == -1) {
        if (face_raw) {
            face_timer = 0;
            face_wait = initial_delay;
            face = face_raw;
            das_state = 0;
        }
        if (nav_raw) {
            nav_timer = 0;
            nav_wait = initial_delay;
            das_state = 1;
        }
    }

    // now we can decide if input should be triggered
    //   I changed the syntax a bit, I feel like this is more readable
    //   even if not as pretty
    // trigger if enough time has passed, and switch to the shorter interval
    if (das_state == 0) {
        if ((face_raw & face_prev) && (++face_timer > face_wait)) {
            face = face_raw;
            face_timer = 0;
            face_wait = repeat_delay;
        }
    } else
    if (das_state == 1) {
        if ((nav_raw & nav_prev) && (++nav_timer > nav_wait)) {
            nav = nav_raw;
            nav_timer = 0;
            nav_wait = repeat_delay;
        }
    }

    face_prev = face_raw;
    nav_prev = nav_raw;

    return face | nav;
}
