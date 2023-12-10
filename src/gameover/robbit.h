#ifndef _ROBBIT_H
#define _ROBBIT_H

#include "common.h" // TODO: this is from main api, use <>

typedef struct {
    s32 frame;
    s32 wait;   // also loop start
} Keyframe;    // Keyframe

void func_800EBCF0(void);   // set to
void robbit_anim_play(int idx);
void robbit_update_and_render(void);

#endif  // _ROBBIT_H