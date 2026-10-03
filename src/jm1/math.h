#pragma once

#include <ints.h>
#include <libgte.h>

void make_sin_lut(void);
u8 func_800CD0BC(void); // rand_rng
u8 func_800CD158(void); // rand_prng (deterministic)
int func_800CD1C4(int y, int x); // atan2

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

// Fast sin and cos from our own LUT
extern s16 sin_lut[4096];

static inline s16 sinf(int a) { return sin_lut[(a) & 0xFFF]; }

static inline s16 cosf(int a) { return sin_lut[((a) + 0x400) & 0xFFF]; }

static inline int fixed_mul(int a, int b) { return (a * b) / ONE; }
