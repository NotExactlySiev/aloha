#include "world1.h"
#include <libgte.h>

// FIXME: The frog deals no damage to the player.

#define SFX_RIBBIT_VOLUME 100

enum {
    SFX_FROG_RIBBIT = 0x0010,
};

// AI Bytecode

extern s16 D_800FE5BC[]; // frog_bytecode
extern s16 *D_800FE710[28]; // frog_bytecode_labels

enum {
    FROG_PERSONALITY_0 = 0,
    FROG_PERSONALITY_1 = 1,
    FROG_PERSONALITY_2 = 2,
};

/* US:800FE760 JP: */
s16 *frog_personalities[3] = {
    [FROG_PERSONALITY_0] = &D_800FE5BC[0],
    [FROG_PERSONALITY_1] = &D_800FE5BC[62],
    [FROG_PERSONALITY_2] = &D_800FE5BC[136],
};

// Animations

extern const ModelKeyframe D_800FE54C[20];
extern const ModelKeyframe *const D_800FE59C[8];

// e_frog_behavior
void func_800B0CCC(Entity *e, Component *c)
{
    int state = c->state;
    while (1) {
        switch (state) {
        case 0:
            c->state = 0;
            [[fallthrough]];
        case 1: // Read Operand
            state = *e->vm.pc++;
            break;

        case 2: // Wait
            c->state = 3;
            c->unk0 = *e->vm.pc++;
            [[fallthrough]];
        case 3:
            if (c->unk0-- > 0) {
                return;
            }
            state = 0;
            break;

        case 4: // Loop
            state = (e->vm.loop-- > 0) ? 5 : 7;
            break;

        case 5: // Take Branch
            state = 1;
            e->vm.pc = e->vm.labels[*e->vm.pc];
            break;

        case 6: // Pick Random Branch
            state = *e->vm.pc++ > random_number() ? 5 : 7;
            break;

        case 7: // Skip Branch
            state = 1;
            e->vm.pc++;
            break;

        case 8: // Set Loop Counter
            state = 1;
            e->vm.loop = *e->vm.pc++;
            break;

        case 9: { // Set Loop Counter Randomly
            int val = random_number();
            int window = *e->vm.pc++;
            int start = *e->vm.pc++;
            e->vm.loop = (val % window) + start;
            state = 1;
        } break;

        case 10: // Frog: Set Speed
            e->forward_speed = *e->vm.pc++;
            state = 1;
            break;

        case 11: // Frog: Set Action
            e->sub.frog.action = *e->vm.pc++;
            state = 1;
            break;

        case 12: { // Frog: Set Destination
            s16 arg = *e->vm.pc++;
            if (arg) {
                e->sub.frog.destination_counter = (random_number() >> 2) + 0x20;
                e->sub.frog.destination_force = random_number() << 4;
            } else {
                e->sub.kiwi.destination_counter = 0;
            }
            state = 1;
        } break;

        case 13: { // Frog: Compare Action
            s16 word = *e->vm.pc++;
            if (word < 0) {
                state = e->sub.frog.action != ~word ? 5 : 7;
            } else {
                state = e->sub.frog.action == word ? 5 : 7;
            }
        } break;

        case 14: { // Frog: Distance Less Than Or Equal
            Entity *player = get_player();
            int distance = SquareRoot0(vector_mag2(
                (player->pos_x - e->pos_x) >> 12,
                (player->range_y - e->range_y) / 2 - ((player->pos_y - e->pos_y) >> 12),
                (player->pos_z - e->pos_z) >> 12
            ));
            state = distance <= *e->vm.pc++ ? 5 : 7;
        } break;

        case 15: { // Frog: Ribbit
            sfx_play(
                SFX_FROG_RIBBIT,
                sound_calculate_volume(SFX_RIBBIT_VOLUME, e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12),
                sound_calculate_pan(e->pos_z >> 12, e->pos_x >> 12)
            );
            state = 1;
        } break;

        default:
            return;
        }
    }
}

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
void func_800B1BF4(Entity *e, Component *c)
{
    (void)c;
    SVECTOR *cam = SCRTCHPAD(0x3CA);
    SVECTOR pos;
    SVECTOR rot;
    pos.vx = e->pos_x >> 12;
    pos.vy = e->pos_y >> 12;
    pos.vz = e->pos_z >> 12;
    rot.vy = e->angle_y;
    rot.vx = -e->angle_x;
    rot.vz = e->angle_z;
    if (func_800E5DD8(&pos, e->model.frame_a + D_80103164[0].mesh_id) > -1) {
        u32 meshid = func_800B1B28(e, 0);
        if (e->unk5 != 0) {
            meshid |= 0x8000; // damage blinkW
        }
        func_800E5E60(&pos, &rot, meshid);
    }
    // and the shadow
    pos.vy = e->max_y + 2;
    if (cam->vy < pos.vy && func_800E5DD8(&pos, e->model.frame_a + D_80103164[0].mesh_id) > -1) {
        u32 meshid = func_800B1B28(e, 0);
        func_800E5B88(0, 0, 0);
        func_800E5E60(&pos, &rot, meshid | 0x4000);
        func_800E5B88(0, 0, 0);
    }

    if (e->unk5 != 0)
        e->unk5 = -1;
}

typedef struct {
    s16 health;
    u16 points;
    s16 unk4;
    s8 unk6;
    u8 personality;
} FrogSpirit;

void func_800B0CCC(Entity *e, Component *c); // e_frog_behavior
void func_800B13BC(Entity *e, Component *c); // e_frog_physics
void func_800B1788(Entity *e, Component *c); // e_frog_interaction
void func_800B1BF4(Entity *e, Component *c); // e_frog_render

// e_frog_ctor
// US: 800B1D78
void func_800B1D78(Entity *e, Spirit *spirit)
{
    FrogSpirit *s = (FrogSpirit *)spirit->data;
    entity_insert_after(get_list0_head(), &e->link);
    e->active = 1;
    e->unk5 = 0;
    entity_clear_damage(e->id);
    entity_set_damage_mask(e->id, 0);
    e->spirit = spirit;
    e->health = s->health;
    e->points = s->points;
    e->pos_x = ONE * spirit->x;
    e->pos_y = ONE * spirit->y;
    e->pos_z = ONE * spirit->z;

    e->behavior.func = func_800B0CCC;
    e->behavior.disabled = 0;
    e->behavior.state = 0;

    e->phyisics.func = func_800B13BC;
    e->phyisics.disabled = 0;
    e->phyisics.state = 0;

    e->interaction.func = func_800B1788;
    e->interaction.disabled = 0;
    e->interaction.state = 0;

    e->render.func = func_800B1BF4;
    e->render.disabled = 0;
    e->render.state = 0;

    Entity *player = get_player();

    e->angle_y = func_800CD1C4(
        (player->pos_z - e->pos_z) >> 12,
        (player->pos_x - e->pos_x) >> 12
    );
    e->angle_z = 0;
    e->angle_x = 0;
    e->vel_z = 0;
    e->vel_y = 0;
    e->vel_x = 0;
    e->acc_z = 0;
    e->acc_x = 0;
    e->acc_y = ENEMY_GRAVITY;
    e->forward_acceleration = 0;
    e->forward_speed = 0;
    e->unk21 = 0;
    e->range_z = 0xcc;
    e->range_x = 0xcc;
    e->range_y = 0x90;
    e->on_air = 0;
    e->uh2 = 0;
    e->uh1 = 0;
    e->uh0 = 0;

    e->sub.frog.unk0 = 0;
    e->sub.frog.unk1 = 0;
    e->sub.frog.unk2 = e->health;
    e->sub.frog.unk4 = s->unk4;
    e->sub.frog.unk6 = s->unk6;
    prepare_entity_collision(e);
    e->unk26 = 1;
    model_set_anim(&e->model, D_800FE59C[0], D_800FE59C);
    e->sub.frog.action = 0;
    e->sub.frog.destination_counter = 0;
    e->sub.frog.destination_force = 0;
    e->sub.frog.unkE = 0;
    e->sub.frog.unk10 = -1;
    e->sub.frog.unk12 = 0;
    e->sub.frog.unk14 = 0;
    e->sub.frog.unk16 = 0;
    e->vm.loop = 0;
    e->vm.labels = D_800FE710;
    e->vm.pc = frog_personalities[s->personality];
}

// e_frog_class_ctor
void func_800B1F8C(void)
{
}
