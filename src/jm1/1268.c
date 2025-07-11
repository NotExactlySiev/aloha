#include "common.h"
#include "entity.h"
#include <libgpu.h>

// this file contains mostly world specific code, which are linked with the
// other units that contain general code shared between all worlds.

// from other modules
void func_800E5E60(SVECTOR *pos, SVECTOR *angle, u32 id);   // render model
void func_800E5B88(s16, s16, s16);  // does this do anything?

// this module
s32 func_800E5DD8(SVECTOR *v, u32 meshid);                  // camera transform

// map stuff
extern int D_801026B8;
extern int D_801026BC;

typedef struct {
    int unk0;
    int unk1;
    int unk2;
    int unk3;
} MeshMetadata;

typedef struct {
    char *unk0;     // mesh clut name
    char *unk1;     // texture clut name
    char *unk2;     // vo2 name
    void *unk3;
    void *unk4;
    void *unk5;
    void *unk6;
    void *unk7;
    void *unk8;
    void *unk9;
    char *unk10;    // xs3 name
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
    void *unk2;
    void *unk3;
} EntityTemplate;

MeshMetadata D_80103164[8];    // only frog, but should be an array
extern MeshMetadata D_8010353C;

void func_800B1F8C(void);
void func_800B1D78(Entity *this, Spirit *params);

void func_800B31E8(void);
void func_800B2FF0(Entity *this, Spirit *params);

void func_800B4D20(void);
void func_800B4B14(Entity *this, Spirit *params);

void func_800B6614(void);
void func_800B6430(Entity *this, Spirit *params);

void func_800B6C40(void);
void func_800B6820(Entity *this, Spirit *params);

void func_800B7D54(void);
void func_800B7B58(Entity *this, Spirit *params);

void func_800C5DD8(void);
void func_800C5CD0(Entity *this, Spirit *params);

void func_800C6124(void);
void func_800C602C(Entity *this, Spirit *params);

void func_800C6538(void);
void func_800C643C(Entity *this, Spirit *params);


void func_800B9280(void);
void func_800B9068(Entity *this, Spirit *params);

void func_800BBFD8(void);
void func_800BBD9C(Entity *this, Spirit *params);


void func_800C5044(void);
void func_800C4DE8(Entity *this, Spirit *params);

EntityResources D_800FE7AC = {
    .unk0 = "frog_obj.clt",
    .unk1 = "frog_tp0.clt",
    .unk2 = "frog_obj.vo2",
    .unk10 = "frog_tp0.xs3",
};

EntityResources D_800FEAE8 = {
    .unk0 = "kiui_obj.clt",
    .unk2 = "kiui_obj.vo2",
};

extern u16 D_800FECE8[];

EntityResources D_800FECF8 = {
    .unk0 = "tmbo_obj.clt",
    .unk2 = "tmbo_obj.vo2",
    .unk24 = &D_800FECE8,
};

extern u16 D_800FEF68[];

EntityResources D_800FEF78 = {
    .unk0 = "hipo_obj.clt",
    .unk1 = "hipo_tp0.clt",
    .unk2 = "hipo_obj.vo2",
    .unk10 = "hipo_tp0.xs3",
    .unk24 = &D_800FEF68,
};

EntityResources D_800FF034 = {
    .unk0 = "blck_obj.clt",
    .unk1 = "blck_tp0.clt",
    .unk2 = "blck_obj.vo2",
    .unk10 = "blck_tp0.xs3",
};

EntityResources D_800FF28C = {
    .unk0 = "goki_obj.clt",
    .unk2 = "goki_obj.vo2",
};

EntityResources D_800FF474 = {
    .unk0 = "hari_obj.clt",
    .unk2 = "hari_obj.vo2",
};
 
extern u16 D_800FF9FC[];

EntityResources D_800FFA0C = {
    .unk0 = "kumo_obj.clt",
    .unk2 = "kumo_obj.vo2",
    .unk24 = &D_800FF9FC,
};

EntityResources D_801002C8 = {
    .unk0 = "drgn_obj.clt",
    .unk1 = "drgn_tp0.clt",
    .unk2 = "drgn_obj.vo2",
    .unk10 = "drgn_tp0.xs3",
};

EntityTemplate D_800FF2F8 = {
    &D_80103164[5],
    &D_800FF28C,
    func_800B7D54,
    func_800B7B58,
};

extern EntityTemplate D_800FFCEC;
extern EntityTemplate D_80100544;
extern EntityTemplate D_800FFC50;
extern EntityTemplate D_800FFD3C;
extern EntityTemplate D_8010048C;

EntityTemplate *(*D_800FD454[3])[] = {
    &(EntityTemplate*[]){
        //&D_800FE818,
        &(EntityTemplate){
            &D_80103164[0],
            &D_800FE7AC,
            func_800B1F8C,
            func_800B1D78,
        },

        //&D_800FEB54,
        &(EntityTemplate){
            &D_80103164[1],
            &D_800FEAE8,
            func_800B31E8,
            func_800B2FF0,
        },

        //&D_800FED64,
        //glabel D_800FED64
        &(EntityTemplate){
            &D_80103164[2],
            &D_800FECF8,
            func_800B4D20,
            func_800B4B14,
        },

        //&D_800FEFE4,
        &(EntityTemplate){
            &D_80103164[3],
            &D_800FEF78,
            func_800B6614,
            func_800B6430,
        },

        //&D_800FF0A0,
        &(EntityTemplate){
            &D_80103164[4],
            &D_800FF034,
            func_800B6C40,
            func_800B6820,
        },

        &D_800FF2F8,    // shared

        // the pattern doesn't continue after this
        &D_800FFCEC,
        &D_80100544,

        //&D_80100554,
        &(EntityTemplate){
            .unk2 = func_800C5DD8,
            .unk3 = func_800C5CD0,
        },

        //&D_80100564,
        &(EntityTemplate){
            .unk2 = func_800C6124,
            .unk3 = func_800C602C,
        },

        //&D_80100574,
        &(EntityTemplate){
            .unk2 = func_800C6538,
            .unk3 = func_800C643C,
        },

        (void *) -1
    },

    &(EntityTemplate*[]){
        //&D_800FF4E0,
        &(EntityTemplate){
            &D_80103164[6],
            &D_800FF474,
            func_800B9280,
            func_800B9068,
        },

        &D_800FF2F8,    // shared

        //&D_800FFA78,
        &(EntityTemplate){
            &D_80103164[7],
            &D_800FFA0C,
            func_800BBFD8,
            func_800BBD9C,
        },
        
        &D_800FFC50,
        &D_800FFD3C,
        &D_8010048C,
        (void *) -1
    },

    &(EntityTemplate*[]){
        //&D_80100334,
        &(EntityTemplate){
            &D_8010353C,
            &D_801002C8,
            func_800C5044,
            func_800C4DE8,
        },
        (void *) -1
    },
};


int func_800B0A68(void)
{
    return D_801026B8;
}

int func_800B0A78(void)
{
    return D_801026BC;
}

void func_800B0A88(int val)
{
    D_801026B8 = val % 18;
    D_801026BC = val / 18;
}

EntityTemplate *(*func_800B0AD4(int index))[]
{
    return D_800FD454[index % 3];
}

const char *D_800FD48C[3] = {
    "sou_ene.ear",
    "kaz_ene.ear",
    "bos1_ene.ear",
};

const char *func_800B0B24(int index)
{
    return D_800FD48C[index];
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0B74);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0BC4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0C14);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0C58);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0C9C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CAC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CBC);

// entity functions

// frog stuff

// frog basic
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CCC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1054);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B11B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B124C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B12E4);

// frog process
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B13BC);

// frog custom
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1788);

// get frame
u32 func_800B1B28(Entity *e, s32 val);
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1B28);

//extern s32 D_80103164;
//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1BF4);
// frog render (TODO: shadow)
void func_800B1BF4(Entity* this)
{
    SVECTOR *cam = SCRTCHPAD(0x3CA);
    SVECTOR pos;
    SVECTOR rot;
    pos.vx = this->pos_x >> 12;
    pos.vy = this->pos_y >> 12;
    pos.vz = this->pos_z >> 12;
    rot.vy =  this->angle_y;
    rot.vx = -this->angle_x;
    rot.vz =  this->angle_z;
    if (func_800E5DD8(&pos, this->model[1] + D_80103164[0].unk0) > -1) {
        u32 meshid = func_800B1B28(this, 0);
        if (this->unk5 != 0) {
            meshid |= 0x8000;   // damage blinkW
        }
        func_800E5E60(&pos, &rot, meshid);
    }
    // and the shadow
    pos.vy = this->max_y + 2;
    if (cam->vy < pos.vy &&
        func_800E5DD8(&pos, this->model[1] + D_80103164[0].unk0) > -1) {
        u32 meshid = func_800B1B28(this, 0);
        func_800E5B88(0, 0, 0);
        func_800E5E60(&pos, &rot, meshid | 0x4000);
        func_800E5B88(0, 0, 0);

    }

    if (this->unk5 != 0) this->unk5 = -1;
}

// contrusction
void _func_800B1D78(Entity *this, Spirit *params);
INCLUDE_ASM("asm/jm1/nonmatchings/1268", _func_800B1D78);
void func_800B1D78(Entity *this, Spirit *params)
{
    //LinkedList *list = get_list0_head();
    
    _func_800B1D78(this, params);
}

// destructor
void func_800B1F8C(void) {
}

// kiwi stuff
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1F94);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2354);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B24B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B254C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B25E4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2A0C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2DA0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2E6C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B2FF0);

void func_800B31E8(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B31F0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3294);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3344);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B341C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B34D4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3640);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B390C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3CB0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3DD0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3F2C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4088);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4114);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B42D4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4638);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B498C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4B14);

void func_800B4D20(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4D28);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5080);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5138);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5304);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B53F0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B558C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5888);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5914);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5A34);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5ACC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5E80);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B61E0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B62AC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6430);

void func_800B6614(void) {
}

// block update
void func_800B661C(Entity *this)
{
    s32 old_y = this->pos_y;
    s32 new_y = old_y + this->vel_y;
    this->angle_y += 64;    // rotation of the blades

    if ((this->sub.block.max_y << 12) < new_y) {
        new_y = this->sub.block.max_y << 12;
        this->vel_y *= -1;
    }

    if ((this->sub.block.min_y << 12) > new_y) {
        new_y = this->sub.block.min_y << 12;
        this->vel_y *= -1;
    }

    this->pos_y = new_y;
    this->carry_y = (this->pos_y >> 12) - (old_y >> 12);
}

// block custom
void func_800B66A0(Entity *this, Component *comp)
{
    if (comp->state == 0) {
        int rc = func_800DAB0C(this->pos_x >> 12, this->pos_y >> 12, this->pos_z >> 12);
        if (rc == 0) return;    // in range. keep vibin
        comp->state = 1;
    }
    // oh no, out of range

    if (comp->state == 1) {
        this->spirit->alive = -1;
        entity_destroy(this);
        return;
    }    
}

extern s32 D_801031A4;

// block render
void func_800B6744(Entity* this)
{
    SVECTOR pos = {
        this->pos_x >> 12,
        (this->pos_y >> 12) - 0xC0,
        this->pos_z >> 12,
    };

    SVECTOR rot = {
        0, 0, 0
    };

    func_800E5E60(&pos, &rot, D_801031A4 + 2);

    pos.vy = this->pos_y >> 12;
    rot.vy = this->angle_y;

    func_800E5E60(&pos, &rot, D_801031A4 + 1);
}

// entity_block_ctor
void func_800B6820(Entity *e, Spirit *spirit)
{
    LinkedList *list = get_list2_head();
    entity_insert_after(list, e);
    e->unk2 = 0;
    e->unk5 = 0;
    e->spirit = spirit;
    e->sub.block.max_y = spirit->unk4;  // spirit also has custom fields
    e->sub.block.min_y = spirit->unk0;
    e->vel_x = e->vel_y = -ONE*spirit->unk1;
    e->pos_x = ONE*spirit->x;
    e->pos_z = ONE*spirit->z;
    e->pos_y = ONE*spirit->unk4;    // starting height

    e->comp0.disabled = 1;

    e->comp1.disabled = 0;
    e->comp1.func = func_800B661C;
    e->comp1.state = 0;

    e->comp3.disabled = 0;
    e->comp3.func = func_800B66A0;
    e->comp3.state = 0;

    e->render_comp.disabled = 0;
    e->render_comp.func = func_800B6744;
    e->render_comp.state = 0;

    e->angle_x = e->angle_y = e->angle_z = 0;
    e->angle_x = 0x90;
    e->carry_x = e->carry_y = e->carry_z = 0;
    
    e->range_z = 0x100;
    e->range_x = 0x100;
    e->range_y = 0x180;

    e->on_air = 0;
    e->uh0 = e->uh1 = e->uh2 = 0;
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6948);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B69A0);

// block_dtor. but these aren't dtors actually.
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6C40);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6D28);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7060);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B71C4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7258);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B72F0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7574);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7908);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B79D4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7B58);

void func_800B7D54(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7D5C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B8120);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B82B4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B8348);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B83E0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B8484);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B8710);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B8B4C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B8EE4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9068);

void func_800B9280(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9288);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B92B4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B93A0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B93A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B94A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B955C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B96A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B973C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9978);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9B64);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9D1C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9DC0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9E70);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B9F48);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA000);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA16C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA224);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA3A4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA4A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA624);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BA9D0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BAB1C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BAE94);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BB190);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BB240);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BB300);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BB5D4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BB768);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBB4C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBC18);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBD9C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBFD8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC004);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC0A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC158);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC204);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC290);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC3F0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC834);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCA08);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCB94);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCD08);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCEB4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD158);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD4BC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD588);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD710);

void func_800BD924(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD92C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD9E8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDA84);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDB08);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDB84);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDD08);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDD44);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDDC8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDECC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDF80);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE030);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE08C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE288);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE2A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE2C8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE304);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE340);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE3FC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE48C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE7AC);

void func_800BE8F8(void) {
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE900);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE92C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE9CC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BE9D4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BECD4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BEDC0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF110);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF3F8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF58C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF664);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF768);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF790);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF870);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BF944);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BFA08);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BFB28);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BFBA8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BFC44);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BFCF4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BFE6C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C0350);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C03DC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C093C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C0C20);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C1290);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C1664);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C177C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C19F4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C1BE8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C204C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C222C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C22B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C253C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C286C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C2960);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C2A2C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C2C20);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C300C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C321C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C32E0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C33AC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3524);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3798);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3B7C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3C88);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3E90);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3F28);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C4000);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C40A4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C44A8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C4B8C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C4C58);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C4DE8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5044);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5074);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5188);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5240);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C52B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5368);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C557C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C55B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C55D8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C55F8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5628);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5718);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C57D0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5848);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C58D4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5A98);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5AD4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5AF4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5B14);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5B44);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5C34);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5CD0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5DD8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5DF8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5EC0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C602C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6124);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6144);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C620C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C643C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6538);

// unused:
//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6558);

//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C664C);

//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C67F4);

//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6834);

//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6A68);

//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6A7C);

//INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6B0C);
