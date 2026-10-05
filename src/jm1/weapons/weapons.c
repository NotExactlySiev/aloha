#include "../entity.h"
#include "../physics.h"
#include "common.h"

/* US:801030C4 JP: */ int D_801030C4;
/* US:801030CC JP: */ int D_801030CC; // normal_remaining_shot
/* US:801030D4 JP: */ short D_801030D4; // normal_active
/* US:801030DC JP: */ short D_801030DC; // normal_cooldown
/* US:801030E4 JP: */ short D_801030E4; // normal_unk0
/* US:801030EC JP: */ short D_801030EC; // normal_unk1
/* US:801030F4 JP: */ short D_801030F4; // normal_unk2
/* US:801030FC JP: */ u32 D_801030FC; // input_
/* US:80103104 JP: */ u32 D_80103104; // input_
/* US:8010310C JP: */ int D_8010310C; // input_
/* US:80103114 JP: */ int D_80103114; // input_
/* US:8010311C JP: */ int D_8010311C; // special_rockets_unk0
/* US:80103124 JP: */ int D_80103124; // special_rockets_shot_count
/* US:8010312C JP: */ int D_8010312C; // special_cherry_bomb_shot_count
/* US:80103134 JP: */ int D_80103134; // special_roman_candle_shot_count
/* US:8010313C JP: */ int D_8010313C; // special_roman_candle_
/* US:80103144 JP: */ int D_80103144; // special_roman_candle_
/* US:8010314C JP: */ int D_8010314C; // special_roman_candle_
/* US:80103154 JP: */ int D_80103154; // special_twisters_
/* US:8010315C JP: */ int D_8010315C; // special_twisters_shot_count

/* US:80131688 JP: */ Entity D_80131688[48];
// Shared entity used by the current active weapon.
/* US:801351C8 JP: */ Entity D_801351C8;

void func_800F8CA4(void)
{
    for (int i = 0; i < 48; i++) {
        D_80131688[i].unk1 = 0;
        D_80131688[i].unk0 = 0;
    }
    D_801030CC = 48;
}

void func_800F8CE8(int v)
{
    D_801030C4 = v;
}

// static new_weapon_entity
Entity *func_800F8CF8(void)
{
    for (int i = 0; i < 48; i++) {
        if (D_80131688[i].unk1 == 0) {
            D_801030CC -= 1;
            return &D_80131688[i];
        }
    }
    return NULL;
}

// Run all of a certain component for an array of entities.
// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8D58);

void func_800F8D58(Entity *arr, Component *comp);

// Run comp1 for all weapon entities.
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8DD8);
void func_800F8DD8(void)
{
    func_800D8720(0x80);
    func_800F8D58(D_80131688, &D_80131688[0].comp1);
    func_800D8720(0);
}

// Run comp2 (render) for all weapon entities.
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8E10);
void func_800F8E10(void)
{
    func_800D8720(0x80);
    func_800F8D58(D_80131688, &D_80131688[0].render_comp);
    func_800D8720(0);
}

// Run comp3 for all weapon entities. Unused.
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8E38);
void func_800F8E38(void)
{
    func_800D8720(0x80);
    func_800F8D58(D_80131688, &D_80131688[0].comp3);
    func_800D8720(0);
}

void func_800F8E70(Entity *e, Component *c)
{
    (void)e;
    (void)c;
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8E78);
void func_800F8E78(void)
{
    D_801030D4 = 0;
    D_801030E4 = 0;
    D_801030DC = 0;
    D_801030F4 = -1;
    D_801030EC = -1;
    D_801351C8.comp1.func = func_800F8E70;
    D_801351C8.render_comp.func = func_800F8E70;
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8EC4);
void func_800F8EC4(void)
{
    D_801351C8.comp1.func(&D_801351C8, &D_801351C8.comp1);
}

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8EF4);
void func_800F8EF4(void)
{
    D_801351C8.render_comp.func(&D_801351C8, &D_801351C8.render_comp);
}

// Three utility functinos used by multiple weapons.
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8F24);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8F68);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F8FE8);

// e_bullet_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9034);

// e_bullet_render
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F91EC);

// e_bullet_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9284);

// shoot gun
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F94FC);

INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9598);

// rockets.c

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F95A8);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9648);

// static math thing
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9674);

// e_rocket_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9804);

// e_rocket_render
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9D5C);

// e_rocket_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800F9EC0);

// e_rockets_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA0BC);

// e_rockets_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA208);

// special_rockets_reset
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA248);

// cherry_bomb.c

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA278);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA318);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA344);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA644);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA730);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FA9CC);

// e_cherry_bomb_render_normal
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FACA4);

// e_cherry_bomb_render_exploding
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FAD88);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FAE5C);

// e_cherry_bomb_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FAFE4);

// e_cherry_bomb_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB4C8);

// special_cherry_bomb_handle
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB7B0);

// special_cherry_bomb_reset
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB80C);

// roman_candle.c

#define LASERS_COUNT 2
#define LASERS_MAX_LEN 128

typedef struct {
    s16 y, x;
} LaserPoint;

struct Laser {
    int active;
    int index;
    int length;
    LaserPoint angles[LASERS_MAX_LEN];
};

extern Laser D_801367F8[LASERS_COUNT];

// static thingy_arr_sth
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB834);

// static thingy_arr_clear
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB920);
void func_800FB920(void)
{
    for (int i = 0; i < LASERS_COUNT; i++) {
        D_801367F8[i].active = 0;
    }
}

// static something
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB94C);

// e_roman_candle_laser_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FB9D0);

// e_roman_candle_laser_render
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FBD50);

// e_roman_candle_laser_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC244);

// e_roman_candle_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC340);

// e_roman_candle_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC40C);

// special_roman_candle_reset
// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC4CC);
void func_800FC4CC(void)
{
    D_80103134 = 0;
    D_8010313C = 0;
    D_80103144 = -1;
    D_8010314C = 0;
    func_800FB920();
}

// twisters.c

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC510);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC5B0);

// e_twister_bullet_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FC5DC);

// e_twister_bullet_render
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FCB5C);

// e_twister_bullet_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FCD20);

// e_twister_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FCF30);

void func_800FCF30(Entity *, Component *);

// e_twister_ctor
// This is the object that spawns the twister bullets over a period.
void func_800FD064(Entity *e)
{
    D_801030D4 = -1;
    e->comp1.func = func_800FCF30;
    e->comp1.disabled = 0;
    e->comp1.state = 0;
    e->render_comp.func = func_800F8E70;
    e->render_comp.disabled = 0;
    e->render_comp.state = 0;
    e->sub.twister.unk0 = 0;
    e->sub.twister.unk1 = 0;
}

// special_twister_reset
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD0A4);

// weapon.c

// static update_normal
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD0D4);

// INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD168);
// Is any special weapons currently active?
// special_is_active
int func_800FD168(void)
{
    return D_80103124 + D_8010312C + D_80103134 + D_8010315C;
}

void func_800FA208(Entity *e);
void func_800FB7B0(Entity *e);
void func_800FC40C(Entity *e);

// Handler functions for special weapons.
void (*D_801026A8[4])(Entity *) = {
    func_800FB7B0,
    func_800FD064,
    func_800FC40C,
    func_800FA208,
};

// static update_special
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD198);

// weapons_update
INCLUDE_ASM("asm/jm1/nonmatchings/38F38", func_800FD328);

// weapons_init / weapons_reset
void func_800FD3B0(void)
{
    func_800F8CA4();
    func_800F8E78();
    func_800F9598();
    func_800FA248();
    func_800FB80C();
    func_800FC4CC();
    func_800FD0A4();
}
