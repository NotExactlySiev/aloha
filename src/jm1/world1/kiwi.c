//
//
//                       _____________
//                  ____/             \____
//               __/                       \__
//            __/                             \__
//           ###            ####                 \
//          #####          ######                 \
//         / ###            ####                   \
//        /      /-------/                          \
//       /       |....../                            \
//       |      /....../                             |
//       |     /....../                              |
//       |     |...../                               |
//       |    /...../                                |
//       \   /...../                                 |
//        \  |..../                                 /
//         \/..../                               __/
//         /..../                             __/
//         |.../\___                       __/
//        /.../     \___                __/
//       /.../         |\______________/ ||
//       |../          ||                ||
//       |./           ||                ||
//      /./            ||                ||
//     |./             ||                ||
//     //              ||//              ||//
//                     ||/               ||/
//                     //                //
//                    //                //
//                   //                //
//                  //                //
//
//      [The PlayStation can produce mind-boggling effects.]

#include "../entity.h"
#include "../math.h"
#include "common.h"
#include <libgte.h>

extern MeshMetadata D_80103164[8];
int func_800E6684(int *frames, int *factors, int n);

// e_kiwi_comp0
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1F94);

// static
void func_800B2354(Entity *e)
{
    Entity *player = func_800DBBE4();

    int val;
    if (e->sub.kiwi.unk3) {
        int spawner_distance = SquareRoot0(func_800E8868(
            e->spirit->x - (e->pos_x >> 12),
            0,
            e->spirit->z - (e->pos_z >> 12)
        ));
        if (spawner_distance > 0x600) {
            e->sub.kiwi.unk4 = func_800CD1C4(
                e->spirit->z - (e->pos_z >> 12),
                e->spirit->x - (e->pos_x >> 12)
            );
        }
        val = e->sub.kiwi.unk4;
        e->sub.kiwi.unk3 -= 1;
    } else {
        val = func_800CD1C4(
            (player->pos_z - e->pos_z) >> 12,
            (player->pos_x - e->pos_x) >> 12
        );
    }

    if (!e->sub.kiwi.unk7) {
        // If you hit a wall, turn to a random direction?
        if (e->uh0 != 0 || e->uh1 != 0) {
            e->sub.kiwi.unk7 = 0x40;
            e->sub.kiwi.unk8 = func_800CD0BC() * 8 - 0x400;
        }
    }

    if (e->sub.kiwi.unk7) {
        val += e->sub.kiwi.unk8;
        e->sub.kiwi.unk7 -= 1;
    }

    int angle0 = e->angle_y;
    e->angle_y = func_800CD444(angle0, val, 0x20);
    e->unk21 = e->angle_y - angle0;
}

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B24B8);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B254C);

// e_kiwi_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B25E4);

// e_kiwi_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2A0C);

static int func_800B2DA0(Entity *e, int arg)
{
    int frame_b = e->model.frame_b;
    if (frame_b == e->model.frame_a) {
        return frame_b + D_80103164[1].mesh_id + arg;
    }

    int frames[2] = {
        e->model.frame_b + D_80103164[1].mesh_id + arg,
        e->model.frame_a + D_80103164[1].mesh_id + arg,
    };

    int fac = fixed_div(e->model.current_time + 1, e->model.length);
    int factors[2] = {
        fac,
        ONE - fac,
    };

    return func_800E6684(frames, factors, 2);
}

// e_kiwi_render
void func_800B2E6C(Entity *e, Component *c)
{
    func_800EC408(e->pos_z >> 12, e->pos_x >> 12, 0);

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
    if (func_800E5DD8(&pos_int, e->model.frame_a + D_80103164[1].mesh_id) > -1) {
        id = func_800B2DA0(e, 0);
        if (e->unk5) {
            id |= 0x8000;
        }
        func_800E5E60(&pos_int, &angle, id);
    }

    // Shadow
    pos_int.vy = e->max_y + 2;

    SVECTOR *camera_pos = SCRTCHPAD(0x3C8);
    if (camera_pos->vy < pos_int.vy) {
        if (func_800E5DD8(&pos_int, e->model.frame_a + D_80103164[1].mesh_id) > -1) {
            if (id < 0) {
                id = func_800B2DA0(e, 0);
            }
            func_800E5B88(0, 0, 0);
            func_800E5E60(&pos_int, &angle, id | 0x4000);
            func_800E5B88(0, 0, 0);
        }
    }

    if (e->unk5) {
        e->unk5 = -1;
    }
}

// e_kiwi_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2FF0);

// e_kiwi_class_ctor
void func_800B31E8(void)
{
}
