
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
    s8  alive;      // is spawned and inhabitting an entity
    u8  type;       // what kind of entity is it? TODO: enum for this
    s16 x, y, z;    // initial spawn location
    //u8  unk[8];
    s16 unk4;   // frame
    u16 unk0;
    s16 unk1;
    s8  unk2;
    s8  unk3;
}; // TODO: high bit of type is a flag. should it be a bitfield?

struct Component {
    u16 state;
    u16 disabled;
    u16 unk0;
    u16 unk1;
    void *unk2;
    void (*func)(Entity*, Component*); // this probably has a specific type
};

struct LinkedList {
    LinkedList* next;
    LinkedList* prev;
};

struct Entity {
    Entity* next;
    Entity* prev;
    Component comp0;
    Component comp1;
    Component render_comp;
    Component comp3;
    u16 model[8]; // model_t
    u16 unk0;
    u8 unk1;
    u8 unk2;
    u16 health;
    u16 unk3;
    u32 unk4;
    u32 unk5;
    s32 pos_x;
    s32 pos_y;
    s32 pos_z;
    s32 vel_x;
    s32 vel_y;
    s32 vel_z;
    u32 unk6;
    u32 unk7;
    u32 unk8;
    s32 angle_y;
    s32 angle_x;
    s32 angle_z;
    s32 dangle_y;
    s32 dangle_x;
    s32 dangle_z;   // 0xA0
    u32 unk9;
    u32 unk10;
    u32 unk11;
    u32 unk12;
    void *colptr;   // col thingy ptr
    u32 unk13;  // \ col thingy
    u32 unk14;  // |
    u32 unk15;  // |
    u32 unk16;  // |
    u32 unk17;  // /
    u32 carry_x;
    u32 carry_y;
    u32 carry_z;
    u32 unk21;
    s32 max_y;      // ground_y // 0xDC // TODO: bad name 
    s32 unk22;      // ceiling_y
    s8  uh0;
    s8  uh1;
    s8  uh2;
    s8  on_air;
    s8  unk25;
    s8  unk26;
    s16 unk27;      // land event
    s32 range_z;    // I think this is the collision box
    s32 range_x;
    s32 range_y;
    Spirit *spirit; // wait, this isn't params. what is this? how does this work?
    union {
        struct {
            s16 max_y;
            s16 min_y;
        } block;
        s16 unk[32];
    } sub;
};

#endif
