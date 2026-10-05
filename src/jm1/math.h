#pragma once

#include <ints.h>
#include <libgte.h>

void make_sin_lut(void);
u8 func_800CD0BC(void); // rand_rng
u8 func_800CD158(void); // rand_prng (deterministic)
int func_800CD1C4(int y, int x); // atan2
// func_800CD2C4
void func_800CD3BC(int x, int y, int z, int *ay, int *ax); // cart_to_sperical
int func_800CD444(int angle0, int angle1, int num);
void func_800CD4D4(int ay, int ax, int r, int *x, int *y, int *z); // spherical_to_cart

// func_800CD550 // rotate_vector

// For some reason, the animation functions are defined in this module. Maybe
// because they have to do interpolation which is a math function?

typedef struct {
    short length;
    short frame;
} ModelKeyframe;

typedef struct { // Should be called Anim instead?
    short current_time;
    short frame_a;
    const ModelKeyframe *next;
    const ModelKeyframe *const *anims;
    short frame_b;
    short length;
} Model;

void func_800CD684(Model *model, const ModelKeyframe *initial, const ModelKeyframe *const *anims);
void func_800CD6B0(Model *model, const ModelKeyframe *next, const ModelKeyframe *const *anims);
int func_800CD6BC(Model *model);
void func_800CD780(void); // math_init

#define model_set_anim func_800CD684
#define model_set_next_anim func_800CD6B0
#define model_step_anim func_800CD6BC

// GTE Functions
void func_800E87B8(MATRIX *m); // double_matrix
void func_800E8810(void); // clear_translation_vector
void func_800E8824(int x, int y, int z); // set_translation_vector
void func_800E8838(MATRIX *src, MATRIX *dst); // copy_matrix
int func_800E8868(int x, int y, int z); // vector_mag2
void func_800E88B0(int r, int g, int b); // set_background_color
void func_800E88C4(int a, int b); // set_depth_cue
int func_800E88D4(void); // get_depth_cue_a
int func_800E88E4(void); // get_depth_cue_b
//
void func_800E9324(int angle, int r, int *x, int *y); // polar_to_cart

// Fast sin and cos from our own LUT
extern s16 sin_lut[4096];

static inline s16 sinf(int a) { return sin_lut[(a) & 0xFFF]; }

static inline s16 cosf(int a) { return sin_lut[((a) + 0x400) & 0xFFF]; }

static inline int fixed_mul(int a, int b) { return (a * b) / ONE; }

static inline int fixed_div(int a, int b) { return (a * ONE) / b; }

#define random_number func_800CD0BC
#define vector_mag2 func_800E8868
#define polar_to_cart func_800E9324
