#include "math.h"
#include "include_asm.h"

int D_801028F4 = 0; // rng
int D_801028FC = 0; // prng

// seed arrs

// seed
u8 D_8010154C[64] = {
    0x9a, 0xf9, 0x93, 0xdd, 0xf8, 0xfe, 0x85, 0x4b,
    0xe2, 0xa5, 0x92, 0xc9, 0x4c, 0x22, 0x51, 0x61,
    0xfa, 0x4e, 0x37, 0x23, 0x91, 0x7c, 0x0e, 0x57,
    0xa8, 0x2b, 0x2a, 0x98, 0x49, 0x60, 0x7d, 0x3f,
    0xb7, 0xbc, 0x0b, 0x63, 0xd0, 0xaf, 0xad, 0x9d,
    0x53, 0x0a, 0x4a, 0x4f, 0x05, 0x6d, 0x0f, 0x09,
    0x70, 0xc8, 0x52, 0x5a, 0x74, 0xa2, 0x6e, 0xff,
    0x08, 0xe5, 0xc3, 0x75, 0xcd, 0xbb, 0xb0, 0xf4
};

// buttons
u8 D_8010158C[16] = {
    0x00, 0x08, 0x02, 0x00, 0x04, 0x07, 0x01, 0x04,
    0x06, 0x09, 0x03, 0x06, 0x00, 0x08, 0x02, 0x00
};

// working arrs
u8 D_80106D28[64];
u8 D_80106D68[64];

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD010);
void func_800CD010(void)
{
    D_801028F4 = 0;
    D_801028FC = 0;
    for (int i = 0; i < 64; i++) {
        D_80106D28[i] = D_8010154C[i];
        D_80106D68[i] = D_8010154C[i];
    }
}

#ifdef PSYQ47_FIXES
// The new version of PsyQ has a broken rsin!!! It returns non-sense numbers
// for a certain range of angles. What.
// Here's the original one from the game decompiled.
extern short rsin_tbl[1024];

static int sin_1(uint angle)
{
    if (angle < 0x400)
        return rsin_tbl[angle];
    else if (angle >= 0x400 && angle < 0x800)
        return rsin_tbl[0x7ff - angle];
    else if (angle >= 0x800 && angle < 0xc00)
        return -rsin_tbl[angle - 0x800];
    else if (angle >= 0xc00 && angle < 0x1000)
        return -rsin_tbl[0xfff - angle];
    else
        return 0;
}

int rsin(int angle)
{
    if (angle < 0) {
        return -sin_1(-angle & 0xfff); // Probably incorrect

    } else {
        return sin_1(angle & 0xfff);
    }
}
#endif

/* US:8013F448 JP: */ s16 sin_lut[4096];

// US: 800CD070
void make_sin_lut(void)
{
    for (int i = 0; i < 4096; i++) {
        // For some reason rsin is giving incorrect results for a certain range.
        // Perhaps something is overwriting its LUT? So we're using csin for now
        // until I figure that out.
        sin_lut[i] = rsin(i);
    }
}

// more rand stuff
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD0BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD158);

// atan2
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD1C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD2C4);

// cart_to_sperical
void func_800CD3BC(int x, int y, int z, int *ay, int *ax)
{
    *ay = func_800CD1C4(z, x);
    int hyp = SquareRoot0(func_800E8868(z, x, 0));
    *ax = func_800CD1C4(hyp, y);
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD444);

// spherical_to_cart
void func_800CD4D4(int ay, int ax, int r, int *x, int *y, int *z)
{
    func_800E9324(ax, r, z, y);
    *y = -*y;
    func_800E9324(ay, *z >> 12, z, x);
}

// rotate_vector
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD550);

// end of math.c

// model anim stuff

// model_set_anim
void func_800CD684(Model *model, const ModelKeyframe *initial, const ModelKeyframe *const *anims)
{
    model->current_time = initial->length;
    model->length = initial->length;
    model->next = initial + 1;
    model->anims = anims;
    model->frame_a = initial->frame;
    model->frame_b = initial->frame;
}

// model_set_next_anim
void func_800CD6B0(Model *model, const ModelKeyframe *next, const ModelKeyframe *const *anims)
{
    model->next = next;
    model->anims = anims;
}

// model_step_anim
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD6BC);

// math_init?
// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD780);
void func_800CD780(void)
{
    func_800CD010();
}

// libgte functions
// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD7A0); // RotMatrixC

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD920); // csincos

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDA40); // csin_1

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDAE0); // ccos

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDBA4); // csin

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDCD0); // cln_1

// // INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDD68); // cln

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDDD4); // csqrt_1

// // INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDF28); // csqrt

// INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDFC4); // catan
