
#ifndef _ENTITY_H
#define _ENTITY_H

#include <common.h>

typedef struct LinkedList LinkedList;
typedef struct Entity Entity;
typedef struct Component Component;

struct Component {
    u16 param;
    u16 disabled;
    u32 unk0;
    u32 unk1;
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
    s32 dangle_z;
};


#endif