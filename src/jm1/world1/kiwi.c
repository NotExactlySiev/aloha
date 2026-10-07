//----------------------------------------------------------------------------//
//                                                                            //
//                               _____________                                //
//                          ____/             \____                           //
//                       __/                       \__                        //
//                    __/                             \__                     //
//                   ###            ####                 \                    //
//                  #####          ######                 \                   //
//                 / ###            ####                   \                  //
//                /      /-------/                          \                 //
//               /       |....../                            \                //
//               |      /....../                             |                //
//               |     /....../                              |                //
//               |     |...../                               |                //
//               |    /...../                                |                //
//               \   /...../                                 |                //
//                \  |..../                                 /                 //
//                 \/..../                               __/                  //
//                 /..../                             __/                     //
//                 |.../\___                       __/                        //
//                /.../     \___                __/                           //
//               /.../         |\______________/ ||                           //
//               |../          ||                ||                           //
//               |./           ||                ||                           //
//              /./            ||                ||                           //
//             |./             ||                ||                           //
//             //              ||//              ||//                         //
//                             ||/               ||/                          //
//                             //                //                           //
//                            //                //                            //
//                           //                //                             //
//                          //                //                              //
//                                                                            //
//           [ The PlayStation can produce mind-boggling effects. ]           //
//                                                                            //
//----------------------------------------------------------------------------//

#include "world1.h"
#include <libgte.h>

typedef struct {
    s16 health;
    u16 points;
    s16 unk;
    s8 drop_kind;
    u8 personality;
} KiwiSpirit;

#define SFX_STEP_INTERVAL 12
#define SFX_STEP_VOLUME 50
#define SFX_DAMAGE_INTERVAL 48
#define SFX_DAMAGE_VOLUME 100

#define KIWI_SHADOW_OFFSET 2
#define KIWI_MAX_FALL_SPEED (20 * ONE)

enum {
    SFX_KIWI_STEP = 0x0310,
    SFX_KIWI_DAMAGE = 0x0410,
};

enum {
    KIWI_ACTION_RUN = 1,
    KIWI_ACTION_HOP = 3,
    KIWI_ACTION_STEP = 4,
};

// AI Bytecode

extern s16 kiwi_bytecode[];
extern s16 *kiwi_bytecode_labels[28];

enum {
    KIWI_PERSONALITY_RUNNER,
    KIWI_PERSONALITY_WALKER,
};

s16 *kiwi_personalities[2] = {
    [KIWI_PERSONALITY_RUNNER] = &kiwi_bytecode[0],
    [KIWI_PERSONALITY_WALKER] = &kiwi_bytecode[110],
};

// Animations

const ModelKeyframe keyframes[20] = {
    // clang-format off
    { 6, 0 }, { -1, 0 },
    { 6, 1 }, { 6, 0 }, { 6, 2 }, { 6, 0 }, { -1, 1 },
    { 4, 0 }, { 4, 3 },
    { 4, 3 }, { -1, 3 },
    { 7, 3 },
    { 7, 3 }, { -1, 5 },
    { 6, 0 }, { -1, 0 },
    { 7, 0 }, { 7, 3 }, { 7, 0 }, { -1, 0 },
    // clang-format on
};

static const ModelKeyframe *const animations[] = {
    &keyframes[0],
    &keyframes[2],
    &keyframes[7],
    &keyframes[9],
    &keyframes[11],
    &keyframes[12],
    &keyframes[14],
    &keyframes[16],
};

void e_kiwi_behavior(Entity *e, Component *c)
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

        case 10: // Kiwi: Set Speed
            e->forward_speed = *e->vm.pc++;
            state = 1;
            break;

        case 11: // Kiwi: Set Action
            e->sub.kiwi.action = *e->vm.pc++;
            state = 1;
            break;

        case 12: { // Kiwi: Set Destination
            s16 arg = *e->vm.pc++;
            if (arg) {
                e->sub.kiwi.destination_counter = (random_number() >> 2) + 0x20;
                e->sub.kiwi.destination_force = random_number() << 4;
            } else {
                e->sub.kiwi.destination_counter = 0;
            }
            state = 1;
        } break;

        case 13: { // Kiwi: Compare Action
            s16 word = *e->vm.pc++;
            if (word < 0) {
                state = e->sub.kiwi.action != ~word ? 5 : 7;
            } else {
                state = e->sub.kiwi.action == word ? 5 : 7;
            }
        } break;

        case 14: { // Kiwi: Distance Less Than Or Equal
            Entity *player = get_player();
            int distance = SquareRoot0(vector_mag2(
                (player->pos_x - e->pos_x) >> 12,
                (player->range_y - e->range_y) / 2 - ((player->pos_y - e->pos_y) >> 12),
                (player->pos_z - e->pos_z) >> 12
            ));
            state = distance <= *e->vm.pc++ ? 5 : 7;
        } break;

        case 15: { // Distance Greater Than
            Entity *player = get_player();
            int distance = SquareRoot0(vector_mag2(
                (player->pos_x - e->pos_x) >> 12,
                (player->range_y - e->range_y) / 2 - ((player->pos_y - e->pos_y) >> 12),
                (player->pos_z - e->pos_z) >> 12
            ));
            state = distance > *e->vm.pc++ ? 5 : 7;
        } break;

        default:
            return;
        }
    }
}

static void do_turning(Entity *e)
{
    Entity *player = get_player();

    int val;
    // Go towards your home while it's counting down. Once hit zero, go towards
    // the player.
    if (e->sub.kiwi.destination_counter-- > 0) {
        int spawner_distance = SquareRoot0(vector_mag2(
            e->spirit->x - (e->pos_x >> 12),
            0,
            e->spirit->z - (e->pos_z >> 12)
        ));
        if (spawner_distance > 0x600) {
            e->sub.kiwi.destination_force = func_800CD1C4(
                e->spirit->z - (e->pos_z >> 12),
                e->spirit->x - (e->pos_x >> 12)
            );
        }
        val = e->sub.kiwi.destination_force;
    } else {
        val = func_800CD1C4(
            (player->pos_z - e->pos_z) >> 12,
            (player->pos_x - e->pos_x) >> 12
        );
    }

    if (e->sub.kiwi.turning_counter == 0) {
        // If you hit a wall, turn by a random amount.
        if (e->xy_col != 0 || e->yz_col != 0) {
            e->sub.kiwi.turning_counter = 0x40;
            e->sub.kiwi.turning_amount = random_number() * 8 - 0x400;
        }
    }

    if (e->sub.kiwi.turning_counter > 0) {
        val += e->sub.kiwi.turning_amount;
        e->sub.kiwi.turning_counter -= 1;
    }

    int angle0 = e->angle_y;
    e->angle_y = func_800CD444(angle0, val, 0x20);
    e->unk21 = e->angle_y - angle0;
}

static void apply_rotation(Entity *e)
{
    e->carry_z = 0;
    e->carry_y = 0;
    e->carry_x = 0;
    e->angle_x = 0;
    if (e->sub.kiwi.damage_pushback > 0) {
        int angle = e->sub.kiwi.damage_direction;
        e->angle_x = -0xc0;
        if (angle > -1) {
            int dz, dx;
            polar_to_cart(angle, e->sub.kiwi.damage_pushback / 2, &dz, &dx);
            e->vel_z += dz;
            e->vel_x += dx;
        }
        e->sub.kiwi.damage_pushback /= 2;
    }
}

static void apply_movement(Entity *e)
{
    func_800D95E8(e, &e->vel_z, &e->vel_x);
    func_800D9A00(e, &e->vel_z, &e->vel_x, &e->vel_y);
    func_800D96B0(e, e->vel_z, e->vel_x, e->vel_y);
    func_800D973C(e);
    func_800D7C70(e);
    func_800D8514(e);
    if (e->xz_col) {
        e->vel_y = 0;
    }
}

void e_kiwi_physics(Entity *e, Component *c)
{
    e->vel_x = 0;
    e->vel_z = 0;
    int state = c->state;
    while (1) {
        switch (state) {
        case 0:
            model_set_anim(&e->model, animations[0], animations);
            // Clearing this field signals to the bytecode that the action is
            // done.
            e->sub.kiwi.action = 0;
            c->state = 1;
            [[fallthrough]];
        case 1:
            switch (e->sub.kiwi.action) {
            case KIWI_ACTION_RUN:
                state = 2;
                break;
            case KIWI_ACTION_HOP:
                state = 8;
                break;
            case KIWI_ACTION_STEP:
                state = 10;
                break;
            default:
                goto check_and_goto4;
            }
            break;

        check_and_goto4:
            if (e->on_ground) {
                goto out;
            } else {
                state = 4;
                break;
            }
            break;

        case 2: // Running
            model_set_anim(&e->model, animations[1], animations);
            e->sub.kiwi.action = 1;
            e->sub.kiwi.step_sfx_counter = 0;
            c->counter = (random_number() >> 4) + 32; // [32, 47]
            c->state = 3;
            [[fallthrough]];
        case 3:
            if (c->counter-- <= 0) {
                state = 0;
                break;
            }

            do_turning(e);
            polar_to_cart(e->angle_y, e->forward_speed, &e->vel_z, &e->vel_x);
            if (e->sub.kiwi.step_sfx_counter++ % SFX_STEP_INTERVAL == 0) {
                sfx_play(
                    SFX_KIWI_STEP,
                    sound_calculate_volume(SFX_STEP_VOLUME, e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12),
                    sound_calculate_pan(e->pos_z >> 12, e->pos_x >> 12)
                );
            }
            goto check_and_goto4;

        // Landing sequence
        case 4:
            model_set_anim(&e->model, animations[4], animations);
            e->sub.kiwi.action = 2;
            c->state = 5;
            [[fallthrough]];
        case 5:
            do_turning(e);
            polar_to_cart(e->angle_y, e->forward_speed, &e->vel_z, &e->vel_x);
            if (!e->on_ground) {
                goto out;
            }
            state = 6;
            break;

        case 6:
            model_set_anim(&e->model, animations[6], animations);
            sfx_play(
                SFX_KIWI_STEP,
                sound_calculate_volume(SFX_STEP_VOLUME, e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12),
                sound_calculate_pan(e->pos_z >> 12, e->pos_x >> 12)
            );
            c->counter = (random_number() >> 6) + 4; // [4, 7]
            c->state = 7;
            [[fallthrough]];
        case 7:
            if ((c->counter-- << 16) <= 0) {
                state = 0;
                break;
            }
            goto check_and_goto4;

        case 8:
            model_set_anim(&e->model, animations[7], animations);
            e->sub.kiwi.action = 3;
            c->counter = 21;
            c->state = 9;
            [[fallthrough]];
        case 9:
            if (c->counter-- <= 0) {
                state = 0;
                break;
            }
            do_turning(e);
            goto check_and_goto4;

        case 10:
            model_set_anim(&e->model, animations[2], animations);
            e->sub.kiwi.action = 4;
            c->counter = 4;
            c->state = 11;
            [[fallthrough]];
        case 11:
            if (c->counter-- > 0) {
                goto out;
            }
            e->vel_y = -ONE * ((random_number() >> 6) + 4);
            c->state = 12;
            [[fallthrough]];
        case 12:
            do_turning(e);
            polar_to_cart(e->angle_y, e->forward_speed, &e->vel_z, &e->vel_x);
            e->on_ground = 0;
            if (e->vel_y > 0) {
                state = 4;
                break;
            }
            [[fallthrough]];
        default:
            goto out;
        }
    }

out:
    model_step_anim(&e->model);
    e->vel_y += e->acc_y;
    e->vel_y += e->acc_y;
    if (e->vel_y > KIWI_MAX_FALL_SPEED) {
        e->vel_y = KIWI_MAX_FALL_SPEED;
    }
    apply_rotation(e);
    apply_movement(e);
    return;
}

void e_kiwi_interaction(Entity *e, Component *c)
{
    int state = c->state;
    while (1) {
        switch (state) {
        case 0:
            if (--e->sub.kiwi.damage_sfx_counter < 0) {
                e->sub.kiwi.damage_sfx_counter = 0;
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

                e->sub.kiwi.damage_direction = entity_get_damage_direction(e->id);
                if (e->sub.kiwi.damage_pushback == 0) {
                    e->sub.kiwi.damage_pushback = 0x30;
                    if (e->on_ground) {
                        e->vel_y = -8 * ONE;
                    }
                }

                if (e->sub.kiwi.damage_sfx_counter == 0) {
                    e->sub.kiwi.damage_sfx_counter = SFX_DAMAGE_INTERVAL;
                    sfx_play(
                        SFX_KIWI_DAMAGE,
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
                e->model.frame_a + D_80103164[E_KIWI].mesh_id
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
            func_800D1CBC(e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12, e->ground_y, e->sub.kiwi.drop_kind);
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
            c->counter = e->sub.kiwi.a;
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

static int calculate_frame_mesh(Entity *e, int arg)
{
    int frame_b = e->model.frame_b;
    if (frame_b == e->model.frame_a) {
        return frame_b + D_80103164[E_KIWI].mesh_id + arg;
    }

    int frames[2] = {
        e->model.frame_b + D_80103164[E_KIWI].mesh_id + arg,
        e->model.frame_a + D_80103164[E_KIWI].mesh_id + arg,
    };

    int fac = fixed_div(e->model.current_time + 1, e->model.length);
    int factors[2] = {
        fac,
        ONE - fac,
    };

    return func_800E6684(frames, factors, 2);
}

// US: 800B2E6C
void e_kiwi_render(Entity *e, Component *c)
{
    radar_add_dot(e->pos_z >> 12, e->pos_x >> 12, 0);

    SVECTOR pos_int = {
        .vx = e->pos_x >> 12,
        .vy = e->pos_y >> 12,
        .vz = e->pos_z >> 12,
    };

    SVECTOR angle = {
        .vx = -e->angle_x,
        .vy = e->angle_y,
        .vz = e->angle_z,
    };

    int id = -1;
    if (camera_frustum_cull(&pos_int, e->model.frame_a + D_80103164[E_KIWI].mesh_id) > -1) {
        id = calculate_frame_mesh(e, 0);
        if (e->unk5) {
            id |= 0x8000;
        }
        draw_model(&pos_int, &angle, id);
    }

    // Shadow
    pos_int.vy = e->ground_y + KIWI_SHADOW_OFFSET;

    SVECTOR *camera_pos = SCRTCHPAD(0x3C8);
    if (camera_pos->vy < pos_int.vy) {
        if (camera_frustum_cull(&pos_int, e->model.frame_a + D_80103164[E_KIWI].mesh_id) > -1) {
            if (id < 0) {
                id = calculate_frame_mesh(e, 0);
            }
            func_800E5B88(0, 0, 0);
            draw_model(&pos_int, &angle, id | 0x4000);
            func_800E5B88(0, 0, 0);
        }
    }

    if (e->unk5) {
        e->unk5 = -1;
    }
}

// US: 800B2FF0
void e_kiwi_ctor(Entity *e, Spirit *spirit)
{
    KiwiSpirit *kiwi_spirit = (KiwiSpirit *)spirit->data;
    entity_insert_after(get_list0_head(), &e->link);
    e->active = 1;
    e->unk5 = 0;
    entity_clear_damage(e->id);
    entity_set_damage_mask(e->id, 0);
    e->spirit = spirit;
    e->health = kiwi_spirit->health;
    e->points = kiwi_spirit->points;
    e->pos_x = ONE * spirit->x;
    e->pos_y = ONE * spirit->y;
    e->pos_z = ONE * spirit->z;

    e->behavior.func = e_kiwi_behavior;
    e->behavior.disabled = 0;
    e->behavior.state = 0;

    e->phyisics.func = e_kiwi_physics;
    e->phyisics.disabled = 0;
    e->phyisics.state = 0;

    e->interaction.func = e_kiwi_interaction;
    e->interaction.disabled = 0;
    e->interaction.state = 0;

    e->render.func = e_kiwi_render;
    e->render.disabled = 0;
    e->render.state = 0;

    Entity *player = get_player();
    (void)player;

    e->angle_y = random_number();
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
    e->range_z = 0x84;
    e->range_x = 0x84;
    e->range_y = 0xc0;
    e->on_ground = 0;
    e->xz_col = 0;
    e->yz_col = 0;
    e->xy_col = 0;
    e->sub.kiwi.a = 0;
    e->sub.kiwi.b = kiwi_spirit->unk;
    e->sub.kiwi.drop_kind = kiwi_spirit->drop_kind;
    prepare_entity_collision(e);
    e->unk26 = 1;
    model_set_anim(&e->model, animations[0], animations);
    e->sub.kiwi.action = 0;
    e->sub.kiwi.destination_counter = 0;
    e->sub.kiwi.destination_force = 0;
    e->sub.kiwi.damage_pushback = 0;
    e->sub.kiwi.damage_direction = -1;
    e->sub.kiwi.turning_counter = 0;
    e->sub.kiwi.turning_amount = 0;
    e->sub.kiwi.step_sfx_counter = 0;
    e->sub.kiwi.damage_sfx_counter = 0;
    e->vm.loop = 0;
    e->vm.labels = kiwi_bytecode_labels;
    e->vm.pc = kiwi_personalities[kiwi_spirit->personality];
}

void e_kiwi_class_ctor(void)
{
}
