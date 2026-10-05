#include "../renderer.h"
#include "world1.h"

typedef struct {
    s16 max_y;
    u16 min_y;
    s16 speed;
    s8 unk2;
    s8 unk3;
} BlockSpirit;

// block update
void func_800B661C(Entity *e, Component *c)
{
    (void)c;
    s32 old_y = e->pos_y;
    s32 new_y = old_y + e->vel_y;
    e->angle_y += 64; // rotation of the blades

    if ((e->sub.block.max_y << 12) < new_y) {
        new_y = e->sub.block.max_y << 12;
        e->vel_y *= -1;
    }

    if ((e->sub.block.min_y << 12) > new_y) {
        new_y = e->sub.block.min_y << 12;
        e->vel_y *= -1;
    }

    e->pos_y = new_y;
    e->carry_y = (e->pos_y >> 12) - (old_y >> 12);
}

// block custom
void func_800B66A0(Entity *e, Component *c)
{
    if (c->state == 0) {
        int rc = is_outside_simulation_range(e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12);
        if (rc == 0)
            return; // in range. keep vibin
        c->state = 1;
    }
    // oh no, out of range

    if (c->state == 1) {
        e->spirit->alive = -1;
        entity_destroy(e);
        return;
    }
}

// block render
void func_800B6744(Entity *e, Component *c)
{
    (void)c;
    SVECTOR pos = {
        e->pos_x >> 12,
        (e->pos_y >> 12) - 0xC0,
        e->pos_z >> 12,
    };

    SVECTOR rot = {
        0, 0, 0
    };

    func_800E5E60(&pos, &rot, D_80103164[4].mesh_id + 2);

    pos.vy = e->pos_y >> 12;
    rot.vy = e->angle_y;

    func_800E5E60(&pos, &rot, D_80103164[4].mesh_id + 1);
}

// e_block_ctor
void func_800B6820(Entity *e, Spirit *spirit)
{
    BlockSpirit *s = (BlockSpirit *)spirit->data;
    LinkedList *list = get_list2_head();
    entity_insert_after(list, &e->link);
    e->active = 0;
    e->unk5 = 0;
    e->spirit = spirit;
    e->sub.block.max_y = s->max_y; // spirit also has custom fields
    e->sub.block.min_y = s->min_y;
    e->vel_x = e->vel_y = -ONE * s->speed;
    e->pos_x = ONE * spirit->x;
    e->pos_z = ONE * spirit->z;
    e->pos_y = ONE * s->max_y; // starting height

    e->behavior.disabled = 1;

    e->phyisics.disabled = 0;
    e->phyisics.func = func_800B661C;
    e->phyisics.state = 0;

    e->interaction.disabled = 0;
    e->interaction.func = func_800B66A0;
    e->interaction.state = 0;

    e->render.disabled = 0;
    e->render.func = func_800B6744;
    e->render.state = 0;

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
    e->behavior.disabled = 1;
    e->phyisics.func = func_800B6948;
    e->phyisics.disabled = 0;
    e->phyisics.state = 0;
    e->interaction.func = func_800B69A0;
    e->interaction.disabled = 0;
    e->interaction.state = 0;
    e->render.disabled = 1;
    D_8010287C = -1;
    D_80102884 = -1;
    D_8010288C = 0;
    D_80102894 = 0;
    D_8010289C = 0;
    D_801028A4 = 0;
    func_800CE168(0xb10, 100, 63, &D_8010287C, 1);
    func_800CE168(0xb11, 100, 63, &D_80102884, 1);
}
