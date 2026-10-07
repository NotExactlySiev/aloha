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
    u8 data[8]; // entity specific data
}; // TODO: high bit of type is a flag. should it be a bitfield?

struct Component {
    u16 state;
    u16 disabled;
    u16 counter; // wait counter in the vm
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
    /* 08 */ Component behavior;
    /* 18 */ Component phyisics;
    /* 28 */ Component render;
    /* 38 */ Component interaction;
    /* 48 */ Model model;
    /* 58 */ u16 id; // id
    /* 5A */ u8 unk1; // exists?
    /* 5B */ u8 active;
    /* 5C */ s16 health; // should be signed
    /* 5E */ u16 unk3;
    /* 60 */ u32 points; // score value
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
    /* AC */ int forward_speed;
    /* B0 */ int forward_acceleration;
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
    /* DC */ s32 ground_y;
    /* E0 */ s32 ceiling_y;

    // These three signify if we're running into an axis aligned plane. 2 means
    // running into level geometry. 4 means running into an entity.
    /* E4 */ s8 xy_col; // Collision on XY plane
    /* E5 */ s8 yz_col; // Collision on YZ plane
    /* E6 */ s8 xz_col; // Collision on ZX plane
    /* E7 */ s8 on_ground;
    /* E8 */ s8 unk25;
    /* E9 */ s8 unk26;
    /* EA */ s16 unk27; // id of the entity we will land on. LAND in debug info
    /* EC */ s32 range_z; // I think this is the collision box
    /* F0 */ s32 range_x;
    /* F4 */ s32 range_y;
    /* F8 */ Spirit *spirit;

    union {
        u8 unk[48];

        struct {
            s16 max_y;
            s16 min_y;
        } block;

        struct {
            s16 a;
            s16 b;
            s16 drop_kind;
            s16 action;
            u16 destination_counter;
            s16 destination_force;
            s16 damage_pushback;
            s16 damage_direction;
            u16 turning_counter;
            s16 turning_amount;
            s16 step_sfx_counter;
            s16 damage_sfx_counter;
        } kiwi;

        struct {
            /* 00 */ s16 unk0;
            /* 02 */ s16 unk2;
            /* 04 */ s16 damage;
            /* 06 */ s16 drop_kind;
            /* 08 */ s16 action;
            /* 0A */ s16 destination_counter;
            /* 0C */ s16 destination_force;
            /* 0E */ s16 damage_pushback;
            /* 10 */ s16 damage_direction;
            /* 12 */ s16 unk12;
            /* 14 */ s16 unk14;
            /* 16 */ s16 damage_sfx_counter;
        } frog;

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
        s16 *pc;
        s16 **labels;
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
void func_800D05F0(int id, u32 flags, short direction, int amount);
int func_800D0764(int id);
u32 func_800D0784(int id);
int func_800D07A4(int id);
void func_800D07C4(int id);
void func_800D0808(int id, u8 val);
u8 func_800D0824(int id);
void func_800D0840(EntityClass **classes);
// ? func_800D08E8
// func_800D09EC
void func_800D0AA4(Entity *e, Spirit *spirit);
// func_800D0B98
void func_800D0C08(int x, int y, int z); // set_simulation_pos
void func_800D0C28(int x, int y, int z);
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

#define entity_deal_damage func_800D05F0
#define entity_get_damage func_800D0764
#define entity_get_damage_flags func_800D0784
#define entity_get_damage_direction func_800D07A4
#define entity_clear_damage func_800D07C4
#define entity_set_damage_mask func_800D0808
#define entity_get_damage_mask func_800D0824

// Probably don't belong here:
Entity *func_800DBBE4();

#define get_player func_800DBBE4
