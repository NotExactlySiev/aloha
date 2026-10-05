#pragma once

#include "math.h"
#include <common.h>

// This one shouldn't be here.
typedef struct Laser Laser;

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
    u16 unk0; // wait counter in the vm
    u16 unk1;
    void *unk2;
    void (*func)(Entity *, Component *); // this probably has a specific type
};

struct LinkedList {
    LinkedList *next;
    LinkedList *prev;
};

enum {
    DISPLAY_VISIBLE = 0x0001,
    DISPLAY_BLINK = 0x8000,
};

struct Entity {
    /* 00 */ LinkedList link;
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

typedef struct {
    char *unk0; // mesh clut name
    char *unk1; // texture clut name
    char *unk2; // vo2 name
    void *unk3;
    void *unk4;
    void *unk5;
    void *unk6;
    void *unk7;
    void *unk8;
    void *unk9;
    char *unk10; // xs3 name
    void *unk11;
    void *unk12;
    void *unk13;
    void *unk14;
    void *unk15;
    void *unk16;
    void *unk17;
    void *unk18;
    void *unk19;
    void *unk20;
    void *unk21;
    void *unk22;
    void *unk23;
    void *unk24;
    void *unk25;
    void *unk26;
} EntityResources;

typedef struct {
    MeshMetadata *unk0;
    EntityResources *unk1;
    void (*class_ctor)(void); // class constructor (called once when level is loaded)
    void (*ctor)(Entity *, Spirit *); // object constructor (called when this entity is instantiated)
} EntityClass;

LinkedList *get_list1_head(void);
LinkedList *get_list1_tail(void);
LinkedList *get_list2_head(void);
LinkedList *get_list2_tail(void);
LinkedList *get_list0_head(void); // 800D0478
LinkedList *get_list0_tail(void);
void entity_insert_before(LinkedList *list, LinkedList *node);
void entity_insert_after(LinkedList *list, LinkedList *node); // 800D04B0
void entity_detach_from_list(LinkedList *node);
Entity *entity_create(void); // 800D04E8
void entity_destroy(Entity *e);
void func_800D058C(void);
// func_800D05F0
int func_800D0764(int id);
// func_800D0784
int func_800D07A4(int id);
void func_800D07C4(int id);
void func_800D0808(int id, u8 val);
// func_800D0824
void func_800D0840(EntityClass **classes);
// ? func_800D08E8
// func_800D09EC
void func_800D0AA4(Entity *e, Spirit *spirit);
// func_800D0B98
// func_800D0C08
// func_800D0C28
void func_800D0C5C(void);
//
//
// func_800D11E4
// func_800D13EC
//
//
void func_800D1484(int v);
int func_800D1494(void);
//
//

// Probably don't belong here:
Entity *func_800DBBE4();
