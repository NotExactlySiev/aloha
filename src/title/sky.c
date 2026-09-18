#include <libetc.h>
#include <libgte.h>
#include <shared.h>

extern VECTOR D_800F05E0;
extern int D_800F4CC4;

#ifdef VERSION_WORLD
static int D_800F4DE4 = 0x1000;
#else
static int D_800F4DE4 = 1;
#endif

#ifdef VERSION_WORLD
static int D_800F4DE8 = 0x1000;
static int D_800F4DEC = 0x10000;
static SVECTOR D_800F4DF0 = { 0 };
#endif

static int D_800F4DF8 = 0; // sky_anim_t

#ifdef VERSION_WORLD
static int D_800F4DFC = 0; // matrix is widescreen
#endif

// Draw sky polygons. Why is the actual drawing function in a different module?
void func_800E6E80(int cols, int rows, int step, uint u0, uint v0);

// Calculate polygons. Assembly
void func_800E83BC(u32 XZ, u32 WL, int Y, int step);

// calculate_matrix
// US: 800E7FEC
// JP: 800E764C
static void func_800E7FEC(SVECTOR *vec, VECTOR *t)
{
    MATRIX *mat = SCRTCHPAD(0);
    RotMatrix(vec, mat);

#ifdef VERSION_WORLD
    if (jt.get_widescreen()) {
        ScaleMatrix(mat, &(VECTOR) { 0x1400, 0x1555, 0x1000 });
    } else
#endif
    {
        ScaleMatrix(mat, &(VECTOR) { 0x1400, 0x1000, 0x1000 });
    }
    SetRotMatrix(mat);
    TransMatrix(mat, t);
    SetTransMatrix(mat);
}

// sky_init
// US: 800E8084
// JP: 800E76A0
void func_800E8084(void)
{
    InitGeom();
    SetGeomScreen(0x80);
    SetGeomOffset(0xA0, 0x78);
    SetFogFar(0x1A00, 0x80);

#ifdef VERSION_WORLD
    func_800E7FEC(&D_800F4DF0, &D_800F05E0);
    if (jt.get_video_mode() == MODE_PAL) {
        D_800F4DE4 = 0x1333;
        D_800F4DE8 = 0x1333;
        D_800F4DEC = 0x13330;
    }
#else
    func_800E7FEC(&(SVECTOR) { 0 }, &(VECTOR) { 0 });
#endif
}

// US: 800E8124
// JP: 800E7704
static void func_800E8124(int height, int b, int c)
{
    // TODO: combine into an inline. have it deal with the invariants
    func_800E83BC(0xE0000E00, 0x20001E00, height, 0x800);
    func_800E6E80(8, 2, 0x800, b, c + 0x60);

    func_800E83BC(0xF0000600, 0x10000E00, height, 0x200);
    func_800E6E80(16, 4, 0x200, b, c + 0x40);

    func_800E83BC(0xFA000400, 0x06000600, height, 0x80);
    func_800E6E80(24, 4, 0x80, b + 0x20, c + 0x20);

    func_800E83BC(0xFC000200, 0x04000400, height, 0x80);
    func_800E6E80(16, 4, 0x80, b + 0x40, c);
}

// US: 800E8238
// JP: 800E7818
void func_800E8238(void)
{
#ifdef VERSION_WORLD
    if (D_800F4DE4 < D_800F4DEC) {
        D_800F4DE4 += D_800F4DE8;
    }
#else
    if (D_800F4DE4 < 16) {
        D_800F4DE4 += 1;
    }
#endif
}

// US: 800E8278
// JP: 800E7840
void func_800E8278(void)
{
#ifdef VERSION_WORLD
    if (D_800F4DE8 < D_800F4DE4) {
        D_800F4DE4 -= D_800F4DE8;
    }
#else
    if (1 < D_800F4DE4) {
        D_800F4DE4 -= 1;
    }
#endif
}

// US: 800E82A8
// JP: 800E7868
void func_800E82A8(void)
{
#ifdef VERSION_WORLD
    // Should the matrix be updated?
    if (jt.get_widescreen() != D_800F4DFC) {
        D_800F4DFC = jt.get_widescreen();
        func_800E7FEC(&D_800F4DF0, &D_800F05E0);
    }

    D_800F4DF8 += (D_800F4DE4 * D_800F4CC4) >> 12;
#else
    D_800F4DF8 += D_800F4DE4 * D_800F4CC4;
#endif

    D_800F4DF8 %= 512;

    func_800E8124(-512, 0, D_800F4DF8 / 2 + 64);
    func_800E8124(512, 0, D_800F4DF8 / 2);
}
