#include "common.h"
#include "entity.h"
#include "gbuffer.h"
#include "libapi.h"
#include "math.h"
#include "mesh.h"
#include "pad.h"
#include "shared.h"
#include <libetc.h>
#include <libgpu.h>

POLY_FT4 *func_800E9FDC(u32 x, u32 y, u32 id, u32 color, u32 trans, POLY_F4 *prims, u32 *ot);

// The functions here look very similar to GTE functions. But as far as I can
// tell they're not from libgte. I can't actually find them there.

// Moving the GTE functions from here to gte.s

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8738);

// Moved to gte.s

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E88F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8960);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E89B8);

// two functions in this one
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8A40);

// empty_ot
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8B5C);

// a bunch of math gte functions
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8B98);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8C34);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8C94);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8CB0);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8CF8);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8D84);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8E0C);
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8EBC);

// decompress_lz1 (the c version)
// TODO: can I just replace it with the asm one?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", decompress_lz1_c);

// map_image
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E91F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E929C);

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9324);

// math thing
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E939C);

// end of GTE assembly functions

// General imported engine functions:

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9540);
int func_800E9540(void)
{
    switch (jt.get_region()) {
    case REGION_JAPAN:
    case REGION_DEBUG:
        return jt.get_widescreen();

    default:
        return 0;
    }
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E95A0);
int func_800E95A0(void)
{
    return jt.get_video_mode();
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E95D0);
DISPENV *func_800E95D0(DISPENV *env)
{
    return jt.PutDispEnv(env);
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9600);
u32 func_800E9600(int id)
{
    return jt.PadRead(id);
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9630);

// read
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9670);

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9728);
void func_800E9728(void)
{
    jt.wait_for_vsync();
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9758);
void func_800E9758(int mask)
{
    jt.SetDispMask(mask);
}

// WHYYYYYYY
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", my_DrawSync);
int my_DrawSync(int mode)
{
    return jt.DrawSync(mode);
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", my_LoadImage);
int my_LoadImage(RECT *r, u_long *data)
{
    return jt.LoadImage(r, data);
}

// call_ClearImage
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E97E8);

// call_DrawOTag
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9818);

// task_add
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9848);

// task_remove
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9878);

// reset_and_clear_gpu
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E98A8);

// kill graphics
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9994);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E99E8);

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9BB8);
u8 func_800E9BB8(u8 *arr)
{
    for (int i = 1; i < 64; i++) {
        if ((arr[i] & 0xf0) != (arr[0] & 0xf0)) {
            return 0x80;
        }
    }
    return arr[0] >> 4;
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9BFC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9EF0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9FDC);

/*POLY_FT4* func_800E9FDC(u32 x, u32 y, u32 id, u32 color, u32 trans, POLY_F4* prims, u32 arg)
{
    // let's just send some random shit
    POLY_FT4* p = prims;
    setPolyF4(p);
    //p->clut = (250*64) | (16);
    p->x0 = x;
    p->y0 = y;
    p->x1 = x+8;
    p->y1 = y;
    p->x2 = x;
    p->y2 = y+8;
    p->x3 = x+8;
    p->y3 = y+8;
    p->r0 = 255;
    p->g0 = 0;
    p->b0 = 0;
    return p+1;
}*/

// draw ui sprites
// this one draws behind the next one (so behind menu)
// US: 800EA2F4
void ui_draw_sprite(u32 x, u32 y, u32 id, u32 color, u32 trans)
{
    GBuffer *gbuf = gbuffer_get_current();
    gbuf->nextfree = func_800E9FDC(x, y, id, color, trans, gbuf->nextfree, gbuf->ot + 563);
}

// US: 800EA37C
void ui_draw_menu_sprite(u32 x, u32 y, u32 id, u32 color, u32 trans)
{
    GBuffer *gbuf = gbuffer_get_current();
    gbuf->nextfree = func_800E9FDC(x, y, id, color, trans, gbuf->nextfree, gbuf->ot + 564);
}

// US: 800EA404
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA404);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA414);

// end of sprite code

// Unused?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA4E0);

// Unused?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA59C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA5DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA684);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA79C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA7C4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA7F8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA808);

// Some sound effect functions
void func_800EA81C(void)
{
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA824);
void func_800EA824(void)
{
    func_800EA81C();
}

int D_80102E84 = 0;
int D_80102E8C = 0;

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA844);
void func_800EA844(void)
{
    D_80102E84 = 0;
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA854);
void func_800EA854(void)
{
    D_80102E84 = 1;
}

// sfx_play_normal
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA868);
void func_800EA868(u32 id)
{
    if (D_80102E84)
        return;

    int vol = 120;
    if (id == 0x4c00) {
        id = 0x4c00;
        vol = 140;
    }

    func_800CE168(id, vol, 0x3f, 0, 0);
    D_80102E8C = 40;
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA8C4);
void func_800EA8C4(void)
{
    D_80102E84 = 0;
    func_800EA81C();
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA8EC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EAC3C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EADE0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB038);

int D_80102E9C = 0; // score

// get_score
int func_800EB124(void)
{
    return D_80102E9C;
}

// set_score
void func_800EB134(int v)
{
    CLAMP(0, 9999999, v);
    D_80102E9C = v;
}

void func_800DB8B8(int);
int func_800DB838(int);
int func_800E3BF8(void);

// give_points
void func_800EB16C(int amount)
{
    func_800DB8B8(amount);

    int a = func_800DB838(D_80102E9C);
    D_80102E9C += amount;
    CLAMP(0, 9999999, D_80102E9C);
    int b = func_800DB838(D_80102E9C);

    if ((b - a > 0) && !func_800E3BF8()) {
        func_800ED344(b - a);
        func_800CE304(0x1E00, 110, 0x3f);
        func_800ED59C();
        func_800EE26C(0, 4);
    }
}

// draw score?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB23C);

// level timer functions
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB354);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB390);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB3A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB3DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB3EC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB450);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB5DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB84C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBC94);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBCA8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBCB8);

// Unused things
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBD58);
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBD8C);
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBDD4);
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBE50);

// Health functions
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBE5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBE74);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBFEC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC00C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC058);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC0A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC0E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC1DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC2F4);

// radar.c

// radar_add_dot
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC408);

// These ones start blinking when you're running out of time.
// radar_add_objective
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC450);

// radar_clear
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC490);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC4A8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC4E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC4F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC5C8);

void _func_800EC5C8(void)
{
    MATRIX *m = SCRTCHPAD(0);

    Entity *player = func_800DBBE4();
    int angle = player->angle_y;
    *m = (MATRIX) {
        .m = {
            { cosf(angle), -sinf(angle), 0 },
            { sinf(angle), cosf(angle), 0 },
            { 0, 0, 0 },
        },
    };
    func_800E8738(m, &(SVECTOR) { 21, 24 });
    func_800E8810();
    SetRotMatrix(m);
    GBuffer *gbuf = gbuffer_get_current();

    //
    //
    // POLY_F4 *p = gbuf->nextfree;

    // SVECTOR *v0 = SCRTCHPAD(0);
    // VECTOR *v1 = SCRTCHPAD(8);
    // *v0 = (SVECTOR){ 0, 0xF00, 0 };
    // RotTrans(v0, v1, v0);
    // setPolyF4(p);
    // setRGB0(p, 0, 0xD0, 0xD0);
    // setXYWH(p, v1->vx + 213, v1->vy + 45, 3, 3);

    // addPrim(&gbuf->ot[12], p);  // FAKE NUMBER!

    SVECTOR *v0 = SCRTCHPAD(0);
    SVECTOR *v1 = SCRTCHPAD(8);

    *v0 = (SVECTOR) { 0, 0xf00, 0 };
    RotTrans(v0, v1, v0);

    LINE_F2 *p1 = gbuf->nextfree;
    setLineF2(p1);
    setSemiTrans(p1, 1);
    setRGB0(p1, 0, 255, 255);
    setXY2(p1, v1->vx + 214, 46 - v1->vz, 214 - v1->vx, v1->vz + 45);
    addPrim(&gbuf->ot[563], p1);

    LINE_F2 *p2 = p1 + 1;
    setLineF2(p2);
    setSemiTrans(p2, 1);
    setRGB0(p2, 0, 255, 255);
    setXY2(p2, 100, 100, 50, 100);
    addPrim(&gbuf->ot[563], p2);

    gbuf->nextfree = p2 + 1;
}

// end of radar.c

// objective.c
// This module renders the text that appears on the screen to show you the
// direction of each objective. Probably shouldn't be called objective.c as we
// already have another array that stores level objectives and managed them. It
// is located at 801029D4.

typedef struct {
    short x, y, z;
    short id; // Sprite to use
} Objective;

Objective D_8012F568[8]; // bss
int D_80102EE4 = 0;

// objective_add
void objective_add(short x, short y, short z, short id)
{
    if (D_80102EE4 >= 8)
        return;
    D_8012F568[D_80102EE4++] = (Objective) { x, y, z, id };
}

// objective_clear
void func_800ECDD0(void)
{
    D_80102EE4 = 0;
}

// objective_init
void func_800ECDE0(void)
{
    func_800ECDD0();
}

void func_800ECE00(void) { }

// render objective text (JETPOD() and EXIT())
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ECE08);

void func_800ED024(void) { }

// end of objective.c

// inventory.c

// This enum should come from weapons.h
typedef enum {
    SPECIAL_CHERRY_BOMB = 0,
    SPECIAL_TWISTERS = 1,
    SPECIAL_ROMAN_CANDLE = 2,
    SPECIAL_ROCKETS = 3,
} SpecialWeapon;

#define INVENTORY_SIZE 3

int D_80102EEC = 0;

// Inventory
extern SpecialWeapon D_8012F5A8[INVENTORY_SIZE + 1];

// inventory_render
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED02C);

// Duplicated
SpecialWeapon func_800ED1EC(int index)
{
    return D_8012F5A8[index];
}

void func_800ED208(void)
{
    for (int i = 0; i < D_80102EEC; i++) {
        D_8012F5A8[i] = D_8012F5A8[i + 1];
    }

    if (D_80102EEC > 0) {
        D_80102EEC -= 1;
    }
}

// Grab special weapon.
void func_800ED26C(SpecialWeapon id)
{
    // Shift the special weapons around for testing purposes.
    id = (id + SPECIAL_ROMAN_CANDLE) % 3;

    if (D_80102EEC > 2) {
        func_800ED208();
    }
    D_8012F5A8[D_80102EEC++] = id;
    func_800DB928(D_8012F5A8);
}

// inventory_set
void func_800ED2DC(int index, SpecialWeapon weapon)
{
    D_8012F5A8[index] = weapon;
}

// inventory_get
SpecialWeapon func_800ED2F8(int index)
{
    return D_8012F5A8[index];
}

// inventory_init
void func_800ED314(void)
{
    D_80102EEC = 0;
    for (int i = INVENTORY_SIZE; i >= 0; i--) {
        D_8012F5A8[i] = -1;
    }
}

// health.c ?

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED344);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED3B4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED40C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED41C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED444);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED564);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED59C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED5D4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED60C);

// timestop.c

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED63C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED65C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED66C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED67C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED68C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDA14);

// time_stop_init
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDD54);

// seizure.c

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDDAC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDDBC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDDEC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDFE8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE01C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE06C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE26C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE494);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE4B0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE50C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE51C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE70C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE780);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EE854);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EED7C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EEDB4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EEF50);

// render hud
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF004);

void _func_800EF004(void)
{
    // func_800EE06C();  // level start text
    if (func_800DBC24())
        return;
    // func_800D4928();    // boss fight
    // func_800D4AC4();    // bonus mode counter
    // func_800EADE0();
    //
    // func_800ED444();
    // func_800ED02C();
    // func_800EC2F4();
    // func_800EBCB8();
    func_800EC5C8();
    GBuffer *gbuf = gbuffer_get_current();
    //
    //
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF150);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF160);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF170);

// sky.c

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF340);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF370);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF498);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF51C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF820);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF9A8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFC14);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFC70);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFD24);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFD34);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFD5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFD80);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFDA4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFDC8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFDEC);

extern u32 D_80102F84;
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EFEC4);
// render_sky
/*void func_800EFEC4(void)
{
    if (D_80102F84 == 0) return;

    GBuffer* gbuf = gbuffer_get_current();

    return;
}*/

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F0074);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F00D0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F0134);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F020C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F021C); // not disassembled, not used

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F023C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F0268);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F02AC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F02BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F06BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F0AC0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F10B8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F11E8);

// ground rendering functions
extern SVECTOR D_8010285C;
extern int D_80102864;
extern SVECTOR D_80141448;

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1330);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F16B8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1800);

#define camera_pos ((SVECTOR *)SCRTCHPAD(0x3C8))

// copies the ground texture from the render area to screen
void func_800F1A0C(void)
{
    if (D_80141448.vx <= -0x200)
        return;
    GBuffer *g = gbuffer_get_current();
    // TODO: have camera pos defined somewhere else correctly
    g->nextfree = func_800F1800(&D_8010285C, D_80102864, g->nextfree, &g->ot[camera_pos->vy > 0 ? 558 : 43]);
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1AAC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1ABC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1AE4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1AF4);

// something else not ground
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1BC0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1C7C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1E38);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1E90);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1F8C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F1FFC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2064);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F20A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F20B0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2154);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F24A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F26E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2760);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F27C8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2810);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2820);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F28A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F28FC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F296C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F29CC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2A08);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2A18);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2A94);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2ABC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2C10);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2C30);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2C50);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2C6C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2C94);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2CAC);

// demo.c

int func_800B0A68(void);
int func_800B0B74(int);

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2CBC);
int func_800F2CBC(int a, int *b, int c)
{
    (void)a;
    (void)b;
    return c;
}

/* US:80102FEC JP: */ int D_80102FEC = 0; // demo_number
/* US:80102FF4 JP: */ int D_80102FF4 = 0;
/* US:80102FFC JP: */ int D_80102FFC = 0;
/* US:80103000 JP: */ int D_80103000;
/* US:80103004 JP: */ int D_80103004;
/* US:8010300C JP: */ int *D_8010300C;
/* US:80103014 JP: */ int D_80103014;

void func_800F2CC4(int id)
{
    switch (id) {
    case 1:
        D_80102FEC = 1;
        return;

    case 2:
        *D_8010300C = 0;
        D_80102FEC = 2;
        return;

    default:
        D_80102FEC = 0;
        return;
    }
}

int func_800F2CFC(void)
{
    return D_80102FEC;
}

int func_800F2D0C(void)
{
    return D_80102FF4;
}

void func_800F2D1C(void)
{
    if (*D_8010300C == 0)
        return;

    func_800F2CBC(func_800B0B74(func_800B0A68()), D_8010300C, 0x4004);
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2D70);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2DEC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2E50);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3044);

// input.c

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3104);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3154);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3198);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F31C4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F323C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F32BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3320);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3330);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3340);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3350);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3360);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3370);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3384);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F33A8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F33C8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3408);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3434);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3454);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3488);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F34BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3668);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3730);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3A58);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3BE0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3CD8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3D94);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3DC0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3FD8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F4088);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F421C);

// The assembly code starts here.

// The three possible "get face flags" functions. They return the flags in $t5.
void D_800F686C(void);
void D_800F6878(void);
void D_800F68A4(void);
void func_800F443C(MeshSets *sets_data);
void *draw_mesh(u32 mesh_with_flags, void *prim, u32 ot_with_flags, u32 *arg3);

// ## I think the insanity of rendering code is confined to here

// moving the handwritten assembly stuff to src

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F47B8);   // not disassembled
// FUCK rendering code
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F49A0);   // not disassembled, LOOOONG
// smol function. assembly?
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6C14);   // disassembled
// weird function with two entry points
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6C48); // disassembled
// more stupid assembly shit using $t9
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6D78); // disassembled
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6E18); // disassembled
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6E5C); // disassembled

// big function, probably C?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6EE0); // disassembled

// stupid shit using weird registers, but very small
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F710C); // disassembled
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7130); // disassembled

// ## Insanity over

// FlushCache
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7154);

// small trivial stuff
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7194);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F71A4);

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F71B4);
int func_800F71B4(void)
{
    return 33;
}

// level loading function
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F71BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F73D4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F744C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7504);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7644);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F76C4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F77F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F791C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F80D0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F80E0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8214);

extern s32 D_80138620;
extern s32 D_80141458;

int func_800F8228(int arg)
{
    // this is weird... perhaps the formula should be rephrased
    if (D_80141458 >= arg)
        return 0;
    if (arg >= D_80138620)
        return 0x1000;

    int range = D_80141458 - D_80138620;
    int amt = ((D_80141458 - arg) << 0xC) / range;

    return amt * D_80138620 / arg;
}

void func_800F82E8(VECTOR *v, s32 angle)
{
    int val_x;
    int val_y;

    val_x = (v->vx * sinf(angle) + v->vy * cosf(angle)) >> 0xC;
    val_y = (v->vx * cosf(angle) - v->vy * sinf(angle)) >> 0xC;
    v->vx = (val_y << 7) / (val_x ?: 1) + 0x80;
    v->vy = func_800F8228(val_x);
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F83E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8694);

extern int D_8010308C; // ground exists
extern int D_8010309C;
extern SVECTOR D_80141448; // camera rotation

// render_ground_texture
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F87BC);

void _func_800F87BC(void)
{
    DRAWENV drawenv;
    GBuffer *gbuf = gbuffer_get_current();
    jt.SetDefDrawEnv(&drawenv, gbuf->draw.clip.x, gbuf->draw.clip.y, gbuf->draw.clip.w, gbuf->draw.clip.h);
    drawenv.ofs[0] = gbuf->draw.ofs[0] + func_800E16BC() - 4;
    drawenv.ofs[1] = gbuf->draw.ofs[1] + func_800E16CC() - 20;
    DR_ENV *penv = gbuf->nextfree;
    gbuf->nextfree = penv + 1;
    jt.SetDrawEnv(penv, &drawenv);
    addPrim(&gbuf->ot[43], penv);
    if (!D_8010308C || !D_8010309C || camera_pos->vy > 0 || D_80141448.vy <= -512) {
        return;
    }

    //
    //
    //
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8C00);

u32 D_8010286C = Pad1sqr; // mapping_shoot
u32 D_80102870 = Pad1crc; // mapping_special
u32 D_80102874 = Pad1tri; // mapping_strafe

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8C20);
void func_800F8C20(int shoot_square, int swap_special)
{
    // Use the default settings if we're about to play a demo.
    if (func_800F2CFC() != 0) {
        shoot_square = 0;
        swap_special = 0;
    }

    D_8010286C = shoot_square ? Pad1x : Pad1sqr;
    D_80102870 = swap_special ? Pad1tri : Pad1crc;
    D_80102874 = swap_special ? Pad1crc : Pad1tri;
}
