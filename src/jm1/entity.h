
#ifndef _ENTITY_H
#define _ENTITY_H

#include <common.h>

typedef struct LinkedList LinkedList;
typedef struct Entity Entity;
typedef struct Component Component;
typedef struct Spirit Spirit;

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
    u16 unk0;
    u16 unk1;
    void *unk2;
    void (*func)(Entity *, Component *); // this probably has a specific type
};

struct LinkedList {
    LinkedList *next;
    LinkedList *prev;
};

struct Entity {
    /* 00 */ Entity *next;
    /* 04 */ Entity *prev;
    /* 08 */ Component comp0;
    /* 18 */ Component comp1;
    /* 28 */ Component render_comp;
    /* 38 */ Component comp3;
    /* 48 */ u16 model[8]; // model_t
    /* 58 */ u16 unk0; // id
    /* 5A */ u8 unk1;
    /* 5B */ u8 unk2;
    /* 5C */ u16 health;
    /* 5E */ u16 unk3;
    /* 60 */ u32 unk4;
    /* 64 */ u32 unk5;
    /* 68 */ int pos_x;
    /* 6C */ int pos_y;
    /* 70 */ int pos_z;
    /* 74 */ int vel_x;
    /* 78 */ int vel_y;
    /* 7C */ int vel_z;
    /* 80 */ int unk6; // acc_x (ddx)
    /* 84 */ int unk7; // acc_y
    /* 88 */ int unk8; // acc_z
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
    /* D8 */ u32 unk21;
    /* DC */ s32 max_y; // ground_y
    /* E0 */ s32 unk22; // ceiling_y
    /* E4 */ s8 uh0;
    /* E5 */ s8 uh1;
    /* E6 */ s8 uh2;
    /* E7 */ s8 on_air;
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

        s16 unk[32];
    } sub;
};

#endif
