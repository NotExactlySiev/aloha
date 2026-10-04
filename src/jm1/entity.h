#pragma once

#include <common.h>

// This one shouldn't be here.
typedef struct Laser Laser;

typedef struct LinkedList LinkedList;
typedef struct Entity Entity;
typedef struct Component Component;
typedef struct Spirit Spirit;
typedef struct ModelKeyframe ModelKeyframe;
typedef struct Model Model;

// spirits are what come into existence in the form
// of entities. when an entity is destroyed and later respawned,
// it might be a different entity but it's the same spirit
struct Spirit {
    s8 alive; // is spawned and inhabitting an entity
    u8 type; // what kind of entity is it? TODO: enum for this
    s16 x, y, z; // initial spawn location
    s16 unk4; // frame
    u16 unk0;
    s16 unk1;
    s8 unk2;
    s8 unk3;
}; // TODO: high bit of type is a flag. should it be a bitfield?

struct Component {
    u16 state;
    u16 disabled;
    u16 unk0; // wait counter in the vm
    u16 unk1;
    void *unk2;
    void (*func)(Entity *, Component *); // this probably has a specific type
};

struct LinkedList {
    LinkedList *next;
    LinkedList *prev;
};

struct ModelKeyframe {
    short length;
    short frame;
};

struct Model { // Should be called Anim instead?
    short current_time;
    short frame_a;
    void *next;
    ModelKeyframe **anims;
    short frame_b;
    short length;
};

enum {
    DISPLAY_VISIBLE = 0x0001,
    DISPLAY_BLINK = 0x8000,
};

struct Entity {
    /* 00 */ Entity *next;
    /* 04 */ Entity *prev;
    /* 08 */ Component comp0; // bytecode vm. behavior and ai
    /* 18 */ Component comp1; // physics
    /* 28 */ Component render_comp;
    /* 38 */ Component comp3; // interaction
    /* 48 */ Model model;
    /* 58 */ u16 unk0; // id
    /* 5A */ u8 unk1;
    /* 5B */ u8 unk2;
    /* 5C */ s16 health; // should be signed
    /* 5E */ u16 unk3;
    /* 60 */ u32 unk4; // score value
    /* 64 */ s32 unk5; // flags. 0x8000 is BLINK. 0x0001 is VISIBLE. has to be signed for the kiwi entity. and the other ones?
    /* 68 */ int pos_x;
    /* 6C */ int pos_y;
    /* 70 */ int pos_z;
    /* 74 */ int vel_x;
    /* 78 */ int vel_y;
    /* 7C */ int vel_z;
    /* 80 */ int acc_x;
    /* 84 */ int acc_y;
    /* 88 */ int acc_z;
    /* 8C */ int angle_y;
    /* 90 */ int angle_x;
    /* 94 */ int angle_z;
    /* 98 */ int dangle_y;
    /* 9C */ int dangle_x;
    /* A0 */ int dangle_z;
    /* A4 */ int ddangle_y;
    /* A8 */ int ddangle_x;
    /* AC */ int ddangle_z;
    /* B0 */ int speed; // forward speed
    /* B4 */ void *colptr; // col thingy ptr
    /* B8 */ u32 unk13; // \ col thingy
    /* BC */ u32 unk14; // |
    /* C0 */ u32 unk15; // |
    /* C4 */ u32 unk16; // |
    /* C8 */ u32 unk17; // /
    /* CC */ u32 carry_x;
    /* D0 */ u32 carry_y;
    /* D4 */ u32 carry_z;
    /* D8 */ u32 unk21; // carry_angle_y?
    /* DC */ s32 max_y; // ground_y
    /* E0 */ s32 unk22; // ceiling_y
    /* E4 */ s8 uh0; // Collision on XY plane
    /* E5 */ s8 uh1; // Collision on YZ plane
    /* E6 */ s8 uh2; // Collision on ZX plane
    /* E7 */ s8 on_air; // RENAME: on_ground
    /* E8 */ s8 unk25;
    /* E9 */ s8 unk26;
    /* EA */ s16 unk27; // id of the entity we will land on. LAND in debug info
    /* EC */ s32 range_z; // I think this is the collision box
    /* F0 */ s32 range_x;
    /* F4 */ s32 range_y;
    /* F8 */ Spirit *spirit;

    union {
        struct {
            s16 max_y;
            s16 min_y;
        } block;

        struct {
            /* 00 */ s16 a;
            /* 01 */ s16 b;
            /* 02 */ s16 unk1; // what to drop on death
            /* 03 */ s16 action; // current action
            /* 04 */ s16 unk3;
            /* 05 */ s16 unk4; // angle to spawner
            /* 06 */ s16 unk5;
            /* 07 */ s16 unk6; // some angle
            /* 08 */ s16 unk7;
            /* 09 */ s16 unk8; // some other angle
            /* 0A */ s16 unk9;
            /* 0B */ s16 unk10;
        } kiwi;

        // s16 unk[32];
        u8 unk[48];

        struct {
            s16 unk0;
            s16 unk1;
        } coin;

        struct {
            s16 unk0;
            s16 unk1;
        } twister;

        struct {
            u8 unk0[16];
            Laser *laser;
        } roman_laser;
    } sub;

    struct {
        s16 loop;
        u16 *pc;
        u16 **labels;
    } vm;

    u8 unused[4];
};

_Static_assert(sizeof(Entity) == 0x13C);

typedef struct {
    int mesh_id; // mesh_id
    int unk1; // mesh_palette
    int unk2; // texture_palette
    int unk3; // texture_id
} MeshMetadata;

Entity *func_800DBBE4();

Entity *entity_create(void);
void entity_destroy(Entity *e);
