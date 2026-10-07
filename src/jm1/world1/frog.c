#include "world1.h"
#include <libgte.h>

// FIXME: The frog deals no damage to the player.

#define SFX_RIBBIT_VOLUME 100
#define SFX_DAMAGE_INTERVAL 48
#define SFX_DAMAGE_VOLUME 100

enum {
    SFX_FROG_RIBBIT = 0x0010,
    SFX_FROG_DAMAGE = 0x0810,
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
            c->counter = *e->vm.pc++;
            [[fallthrough]];
        case 3:
            if (c->counter-- > 0) {
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
                e->sub.frog.destination_counter = 0;
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

// check_collision_with_player
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B12E4);
int func_800B12E4(Entity *e)
{
    // Only if we're falling down.
    if (e->vel_y <= 0) {
        return 0;
    }

    Entity *player = get_player();
    int dist_x = player->pos_x - e->pos_x;
    if (dist_x < 0)
        dist_x = -dist_x;

    int dist_z = player->pos_z - e->pos_z;
    if (dist_z < 0)
        dist_z = -dist_z;

    if ((dist_x >> 12) >= e->range_x)
        return 0;

    if ((dist_z >> 12) >= e->range_z)
        return 0;

    int dy = (player->pos_y - e->pos_y) >> 12;
    if (dy <= player->range_y && dy > 0) {
        func_800D05F0(0, 16, -1, e->sub.frog.damage);
        return -1;
    }

    return 0;
}

// e_frog_physics
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B13BC);

// e_frog_interaction
void func_800B1788(Entity *e, Component *c)
{
    int state = c->state;
    while (1) {
        switch (state) {
        case 0:
            if (--e->sub.frog.damage_sfx_counter < 0) {
                e->sub.frog.damage_sfx_counter = 0;
            }

            if (e->unk5 < 0) {
                e->unk5 = 0;
            }

            if (is_outside_simulation_range(e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12)) {
                state = 3;
                break;
            }

            int damage = entity_get_damage(e->id);
            if (damage > 0) {
                e->health -= damage;
                if (e->unk5 == 0) {
                    e->unk5 = 1; // Blink?
                }

                e->sub.frog.damage_direction = entity_get_damage_direction(e->id);
                if (e->sub.frog.damage_pushback == 0) {
                    e->sub.frog.damage_pushback = 0x30;
                    if (e->on_ground) {
                        e->vel_y = -8 * ONE;
                    }
                }

                if (e->sub.frog.damage_sfx_counter == 0) {
                    e->sub.frog.damage_sfx_counter = SFX_DAMAGE_INTERVAL;
                    sfx_play(
                        SFX_FROG_DAMAGE,
                        sound_calculate_volume(SFX_DAMAGE_VOLUME, e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12),
                        sound_calculate_pan(e->pos_z >> 12, e->pos_x >> 12)
                    );
                }
            }
            entity_clear_damage(e->id);
            if (e->health > 0) {
                func_800D8788(e->id | 0x100, 0);
                return;
            }
            state = 1;
            break;

        case 1:
            give_points(e->points);
            e->spirit->type &= 0x7f;
            func_800CFFB0(
                &(SVECTOR) {
                    .vx = e->pos_x >> 12,
                    .vy = e->pos_y >> 12,
                    .vz = e->pos_z >> 12,
                },
                &(SVECTOR) {
                    .vx = -e->angle_x,
                    .vy = e->angle_y,
                    .vz = 0,
                },
                e->model.frame_a + D_80103164[E_FROG].mesh_id
            );
            sfx_play(
                SFX_ENEMY_DEATH,
                sound_calculate_volume(SFX_DEATH_VOLUME, e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12),
                sound_calculate_pan(e->pos_z >> 12, e->pos_x >> 12)
            );
            e->active = 0;
            e->behavior.disabled = 1;
            e->phyisics.disabled = 1;
            e->render.disabled = 1;
            c->counter = 8;
            state = 2;
            c->state = state;
            break;

        case 2:
            if (c->counter-- > 0) {
                return;
            }
            func_800D1CBC(e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12, e->ground_y, e->sub.frog.drop_kind);
            state = 3;
            break;

        case 3:
            e->active = 0;
            e->behavior.disabled = 1;
            e->phyisics.disabled = 1;
            e->render.disabled = 1;
            e->pos_x = e->spirit->x << 12;
            e->pos_y = e->spirit->y << 12;
            e->pos_z = e->spirit->z << 12;
            c->counter = e->sub.frog.unk0;
            state = 4;
            c->state = state;
            break;

            // Dead. Stay around as a zombie to prevent respawning, until the
            // player has left the area.
        case 4:
            if (!is_outside_simulation_range(e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12)) {
                return;
            }
            state = 6;
            break;

        case 6:
            e->spirit->alive = -1;
            entity_destroy(e);
            return;

        default:
            return;
        }
    }
}

// calculate_frame_mesh
static int func_800B1B28(Entity *e, int arg)
{
    int frame_b = e->model.frame_b;
    if (frame_b == e->model.frame_a) {
        return frame_b + D_80103164[E_FROG].mesh_id + arg;
    }

    int frames[2] = {
        e->model.frame_b + D_80103164[E_FROG].mesh_id + arg,
        e->model.frame_a + D_80103164[E_FROG].mesh_id + arg,
    };

    int fac = fixed_div(e->model.current_time + 1, e->model.length);
    int factors[2] = {
        fac,
        ONE - fac,
    };

    return func_800E6684(frames, factors, 2);
}

// e_frog_render
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
    if (func_800E5DD8(&pos, e->model.frame_a + D_80103164[E_FROG].mesh_id) > -1) {
        u32 meshid = func_800B1B28(e, 0);
        if (e->unk5 != 0) {
            meshid |= 0x8000; // damage blinkW
        }
        func_800E5E60(&pos, &rot, meshid);
    }
    // and the shadow
    pos.vy = e->ground_y + 2;
    if (cam->vy < pos.vy && func_800E5DD8(&pos, e->model.frame_a + D_80103164[E_FROG].mesh_id) > -1) {
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
    s16 damage;
    s8 drop_kind;
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
    e->on_ground = 0;
    e->xz_col = 0;
    e->yz_col = 0;
    e->xy_col = 0;

    e->sub.frog.unk0 = 0;
    e->sub.frog.unk2 = e->health;
    e->sub.frog.damage = s->damage;
    e->sub.frog.drop_kind = s->drop_kind;
    prepare_entity_collision(e);
    e->unk26 = 1;
    model_set_anim(&e->model, D_800FE59C[0], D_800FE59C);
    e->sub.frog.action = 0;
    e->sub.frog.destination_counter = 0;
    e->sub.frog.destination_force = 0;
    e->sub.frog.damage_pushback = 0;
    e->sub.frog.damage_direction = -1;
    e->sub.frog.unk12 = 0;
    e->sub.frog.unk14 = 0;
    e->sub.frog.damage_sfx_counter = 0;
    e->vm.loop = 0;
    e->vm.labels = D_800FE710;
    e->vm.pc = frog_personalities[s->personality];
}

// e_frog_class_ctor
void func_800B1F8C(void)
{
}
