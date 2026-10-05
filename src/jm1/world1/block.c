#include "../renderer.h"
#include "world1.h"

// block update
void func_800B661C(Entity *this)
{
    s32 old_y = this->pos_y;
    s32 new_y = old_y + this->vel_y;
    this->angle_y += 64; // rotation of the blades

    if ((this->sub.block.max_y << 12) < new_y) {
        new_y = this->sub.block.max_y << 12;
        this->vel_y *= -1;
    }

    if ((this->sub.block.min_y << 12) > new_y) {
        new_y = this->sub.block.min_y << 12;
        this->vel_y *= -1;
    }

    this->pos_y = new_y;
    this->carry_y = (this->pos_y >> 12) - (old_y >> 12);
}

// block custom
void func_800B66A0(Entity *this, Component *comp)
{
    if (comp->state == 0) {
        int rc = is_outside_simulation_range(this->pos_x >> 12, this->pos_y >> 12, this->pos_z >> 12);
        if (rc == 0)
            return; // in range. keep vibin
        comp->state = 1;
    }
    // oh no, out of range

    if (comp->state == 1) {
        this->spirit->alive = -1;
        entity_destroy(this);
        return;
    }
}

// block render
void func_800B6744(Entity *this)
{
    SVECTOR pos = {
        this->pos_x >> 12,
        (this->pos_y >> 12) - 0xC0,
        this->pos_z >> 12,
    };

    SVECTOR rot = {
        0, 0, 0
    };

    func_800E5E60(&pos, &rot, D_80103164[4].mesh_id + 2);

    pos.vy = this->pos_y >> 12;
    rot.vy = this->angle_y;

    func_800E5E60(&pos, &rot, D_80103164[4].mesh_id + 1);
}

// e_block_ctor
void func_800B6820(Entity *e, Spirit *spirit)
{
    LinkedList *list = get_list2_head();
    entity_insert_after(list, &e->link);
    e->unk2 = 0;
    e->unk5 = 0;
    e->spirit = spirit;
    e->sub.block.max_y = spirit->unk4; // spirit also has custom fields
    e->sub.block.min_y = spirit->unk0;
    e->vel_x = e->vel_y = -ONE * spirit->unk1;
    e->pos_x = ONE * spirit->x;
    e->pos_z = ONE * spirit->z;
    e->pos_y = ONE * spirit->unk4; // starting height

    e->comp0.disabled = 1;

    e->comp1.disabled = 0;
    e->comp1.func = func_800B661C;
    e->comp1.state = 0;

    e->comp3.disabled = 0;
    e->comp3.func = func_800B66A0;
    e->comp3.state = 0;

    e->render_comp.disabled = 0;
    e->render_comp.func = func_800B6744;
    e->render_comp.state = 0;

    e->angle_x = e->angle_y = e->angle_z = 0;
    e->angle_x = 0x90;
    e->carry_x = e->carry_y = e->carry_z = 0;

    e->range_z = 0x100;
    e->range_x = 0x100;
    e->range_y = 0x180;

    e->on_air = 0;
    e->uh0 = e->uh1 = e->uh2 = 0;
}

int D_8010287C = 0; // handle
int D_80102884 = 0; // handle
int D_8010288C = 0;
int D_80102894 = 0;
int D_8010289C = 0;
int D_801028A4 = 0;

// Sound maker entity functions

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6948);
void func_800B6948(Entity *e, Component *comp)
{
    D_8010288C += 4;
    D_80102894 += 3;
    D_8010289C += 7;
    D_801028A4 += 5;
}

// Adjust the volume of the wind sound based on the time variables and player y.
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B69A0);
void func_800B69A0(Entity *e, Component *comp);

// e_block_class_ctor
void func_800B6C40(void)
{
    if (func_800E3B98())
        return;

    // Create an invisible entity that makes a wind sound when you're up in the
    // air.
    Entity *e = entity_create();
    entity_insert_after(get_list2_head(), e);
    e->comp0.disabled = 1;
    e->comp1.func = func_800B6948;
    e->comp1.disabled = 0;
    e->comp1.state = 0;
    e->comp3.func = func_800B69A0;
    e->comp3.disabled = 0;
    e->comp3.state = 0;
    e->render_comp.disabled = 1;
    D_8010287C = -1;
    D_80102884 = -1;
    D_8010288C = 0;
    D_80102894 = 0;
    D_8010289C = 0;
    D_801028A4 = 0;
    func_800CE168(0xb10, 100, 63, &D_8010287C, 1);
    func_800CE168(0xb11, 100, 63, &D_80102884, 1);
}
