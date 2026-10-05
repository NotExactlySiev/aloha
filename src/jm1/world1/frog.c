#include "world1.h"
#include <libgte.h>

// frog basic
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CCC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1054);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B11B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B124C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B12E4);

// frog process
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B13BC);

// frog custom
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1788);

// get frame
u32 func_800B1B28(Entity *e, s32 val);
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1B28);

// extern s32 D_80103164;
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1BF4);
//  e_frog_render (TODO: shadow)
void func_800B1BF4(Entity *this)
{
    SVECTOR *cam = SCRTCHPAD(0x3CA);
    SVECTOR pos;
    SVECTOR rot;
    pos.vx = this->pos_x >> 12;
    pos.vy = this->pos_y >> 12;
    pos.vz = this->pos_z >> 12;
    rot.vy = this->angle_y;
    rot.vx = -this->angle_x;
    rot.vz = this->angle_z;
    if (func_800E5DD8(&pos, this->model.frame_a + D_80103164[0].mesh_id) > -1) {
        u32 meshid = func_800B1B28(this, 0);
        if (this->unk5 != 0) {
            meshid |= 0x8000; // damage blinkW
        }
        func_800E5E60(&pos, &rot, meshid);
    }
    // and the shadow
    pos.vy = this->max_y + 2;
    if (cam->vy < pos.vy && func_800E5DD8(&pos, this->model.frame_a + D_80103164[0].mesh_id) > -1) {
        u32 meshid = func_800B1B28(this, 0);
        func_800E5B88(0, 0, 0);
        func_800E5E60(&pos, &rot, meshid | 0x4000);
        func_800E5B88(0, 0, 0);
    }

    if (this->unk5 != 0)
        this->unk5 = -1;
}

// e_frog_ctor
void _func_800B1D78(Entity *this, Spirit *params);
INCLUDE_ASM("asm/jm1/nonmatchings/1268", _func_800B1D78);

void func_800B1D78(Entity *this, Spirit *params)
{
    // LinkedList *list = get_list0_head();

    _func_800B1D78(this, params);
}

// e_frog_class_ctor
void func_800B1F8C(void)
{
}
