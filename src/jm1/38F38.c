#include "common.h"
#include <libgpu.h>
#include <libetc.h>
#include "gbuffer.h"
#include "mesh.h"
#include "shared.h"

#include "entity.h"

// TODO: this is repeated, put in header
extern s16 sin_lut[4096];
#define sinf(a)     (sin_lut[(a) & 0xFFF])
#define cosf(a)     (sin_lut[((a)+0x400) & 0xFFF])

POLY_FT4 *func_800E9FDC(u32 x, u32 y, u32 id, u32 color, u32 trans, POLY_F4* prims, u32 *ot);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8738);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E87B8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8810);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8824);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8838);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8868);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E88B0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E88C4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E88D4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E88E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E88F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8960);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E89B8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8A40);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8B5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8B98);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8C34);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8C94);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8CB0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8CF8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8D84);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8E0C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E8EBC);

// decompress_lz1 (the c version)
// TODO: can I just replace it with the asm one?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", decompress_lz1_c);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E91F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E929C);

// polar to cart
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9324);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E939C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9540);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E95A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E95D0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9600);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9630);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9670);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9728);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9758);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", DrawSync);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", LoadImage);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E97E8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9818);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9848);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9878);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E98A8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9994);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E99E8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800E9BB8);

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
//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", ui_draw_sprite);
void ui_draw_sprite(u32 x, u32 y, u32 id, u32 color, u32 trans)
{
    GBuffer* gbuf = gbuffer_get_current();
    gbuf->nextfree = 
        func_800E9FDC(x, y, id, color, trans, gbuf->nextfree, gbuf->ot + 563);
}

//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", ui_draw_menu_sprite);
void ui_draw_menu_sprite(u32 x, u32 y, u32 id, u32 color, u32 trans)
{
    GBuffer* gbuf = gbuffer_get_current();
    gbuf->nextfree = 
        func_800E9FDC(x, y, id, color, trans, gbuf->nextfree, gbuf->ot + 564);
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA404);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA414);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA4E0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA59C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA5DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA684);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA79C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA7C4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA7F8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA808);

void func_800EA81C(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA824);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA844);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA854);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA868);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA8C4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EA8EC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EAC3C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EADE0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB038);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB124);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB134);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB16C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EB23C);

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

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBD58);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBD8C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBDD4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBE50);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBE5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBE74);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EBFEC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC00C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC058);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC0A0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC0E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC1DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC2F4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC408);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC450);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC490);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC4A8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC4E4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC4F4);

// enemies on radar
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EC5C8);
//func_800EC5C8() {}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ECD88);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ECDD0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ECDE0);

void func_800ECE00(void) {
}

// render objective text (JETPOD() and EXIT())
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ECE08);
//func_800ECE08() {}

void func_800ED024(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED02C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED1EC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED208);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED26C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED2DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED2F8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED314);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED344);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED3B4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED40C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED41C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED444);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED564);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED59C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED5D4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED60C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED63C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED65C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED66C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED67C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800ED68C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDA14);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EDD54);

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

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF004);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF150);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF160);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800EF170);

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

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F021C);   // not disassembled, not used

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

#define camera_pos ((SVECTOR*)SCRTCHPAD(0x3C8))

// copies the ground texture from the render area to screen
void func_800F1A0C(void)
{
    if (D_80141448.vx <= -0x200) return;
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

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2CBC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2CC4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2CFC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2D0C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2D1C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2D70);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2DEC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F2E50);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F3044);

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

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F42A4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F42C8);


// moving these three handwritten assembly functions to src

// these could be assmebly too? this sets the pointer in ot (saved right below it)
//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F42E0);

// thse set and get the fucky color value in the middle of code
//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F42F4);
//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F4338);

#include <inline_n.h>

// this is the distance from camera calculator thing
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F4354);
// it's probably handwritten assembly? the patterns don't like like inlines

// this function does both rotation and distance calculation. the output vector
// is only valid if the distance is not -1
// this really does look like handwritten assembly
// IT'S NOT UINT
/*
int func_800F4354(SVECTOR *in, VECTOR *out, Mesh *m)
{
    gte_ldv0(in);
    if (m->a == 0) {
        return -1;
    }
    gte_mvmva(1, 0, 0, 3, 0);
    return 0;
}
*/

// sort faces (sets actually)
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F443C);
// TODO: this breaks and I don't know why. maybe shouldn't be C at all?
void _func_800F443C(FaceList *facelist)
{
    /*
    MATRIX *m;

    s32 *dst0 = (s32*) SCRTCHPAD(0x288);
    u16 *dst1 = (u16*) SCRTCHPAD(0x3A8);
    void *verts = *(void**) SCRTCHPAD(0x3A0);

    //__asm__ volatile( "mfc0   %0, $12; nop;" :  :"r"(sr) : "memory");
    
    for (int i = 0; i < facelist->size + 1; i++) {
        EnterCriticalSection();
        u16 *sets = &facelist->data[i];
        u32 vertoff = sets[0];  // stores the offset not the index
        SVECTOR *vert = verts + vertoff;
        // TODO: do we need to disable interrupts?
        // Can I just use critical section?
        gte_ldv0(vert);
        gte_rt_b();
        //__asm__ volatile( "mtc0   %0, $12;" : :"r"(no_intr) : "memory");

        gte_sqr0_b();
        ExitCriticalSection();
        //__asm__ volatile( "mtc0   %0, $12;" : :"r"(sr) : "memory");
        //gte_stflg(0);
        VECTOR projected;
        gte_stlvnl(&projected);

        dst0[i] = ((projected.vx + projected.vy) >> 2) + projected.vz;
        dst1[i] = sets[1];
    }

    // now sorting?
    for (int i = 1; i < facelist->size + 1; i++) {
        s32 tmp0 = dst0[i];
        u16 tmp1 = dst1[i];

        int j;
        for (j = i - 1; j >= 0; j--) {
            if (dst0[j] <= tmp0) break;
            dst0[j+1] = dst0[j];
            dst1[j+1] = dst1[j];
        }

        dst0[j+1] = tmp0;
        dst1[j+1] = tmp1;
    }*/
}

// draw_mesh
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F4548);

void *draw_mesh(int mesh_with_flag, void *prim, u32 *ot_with_flag, u32 *arg3)
{
    //jt.printf("DRAWING %p : %p\n", mesh_with_flag, arg3);
    return func_800F4548(mesh_with_flag, prim, ot_with_flag, arg3);
    //return prim;
}

// ## I think the insanity of rendering code is confined to here

// moving the handwritten assembly stuff to src

//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F47B8);   // not disassembled
// FUCK rendering code
//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F49A0);   // not disassembled, LOOOONG
// smol function. assembly?
//INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6C14);   // disassembled
// weird function with two entry points
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6C48);   // disassembled
// more stupid assembly shit using $t9
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6D78);   // disassembled
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6E18);   // disassembled
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6E5C);   // disassembled

// big function, probably C?
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F6EE0);   // disassembled

// stupid shit using weird registers, but very small
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F710C);   // disassembled
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7130);   // disassembled

// ## Insanity over

// FlushCache
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7154);

// small trivial stuff
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F7194);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F71A4);
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F71B4);

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
    if (D_80141458 >= arg) return 0;
    if (arg >= D_80138620) return 0x1000;

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

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F87BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8C00);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8C20);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8CA4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8CE8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8CF8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8D58);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8DD8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8E10);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8E38);

void func_800F8E70(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8E78);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8EC4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8EF4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8F24);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8F68);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8FE8);

// entity_shot_update
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9034);
/*void _func_800F9034(Entity *this)
{
    //jt.printf("update bullet!\n");
}*/

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F91EC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9284);

// shoot gun
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F94FC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9598);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F95A8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9648);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9674);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9804);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9D5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9EC0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA0BC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA208);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA248);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA278);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA318);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA344);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA644);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA730);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA9CC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FACA4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FAD88);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FAE5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FAFE4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB4C8);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB7B0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB80C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB834);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB920);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB94C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB9D0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FBD50);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC244);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC340);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC40C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC4CC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC510);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC5B0);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC5DC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FCB5C);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FCD20);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FCF30);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD064);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD0A4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD0D4);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD168);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD198);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD328);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD3B0);
