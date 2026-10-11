#include "world1.h"
#include <common.h>
#include <libgpu.h>
#include <libgte.h>
// this file contains mostly world specific code, which are linked with the
// other units that contain general code shared between all worlds.

// map stuff
extern int D_801026B8;
extern int D_801026BC;

MeshMetadata D_80103164[8]; // level 1 mesh metadata
MeshMetadata D_8010350C[3]; // level 2 mesh metadata
MeshMetadata D_8010353C[1]; // level 3 mesh metadata
MeshMetadata D_801048CC[2];

void func_800B1D78(Entity *this, Spirit *params);
void func_800B1F8C(void);

void e_kiwi_ctor(Entity *this, Spirit *params);
void e_kiwi_class_ctor(void);

void func_800B4B14(Entity *this, Spirit *params);
void func_800B4D20(void);

void func_800B6430(Entity *this, Spirit *params);
void func_800B6614(void);

void func_800B6820(Entity *this, Spirit *params);
void func_800B6C40(void);

void func_800B7B58(Entity *this, Spirit *params);
void func_800B7D54(void);

void func_800B9068(Entity *this, Spirit *params);
void func_800B9280(void);

void func_800BBD9C(Entity *this, Spirit *params);
void func_800BBFD8(void);

void func_800BD710(Entity *this, Spirit *params);
void func_800BD924(void);

void func_800BDD44(void);

void func_800BE7AC(Entity *this, Spirit *params);
void func_800BE8F8(void);

void func_800C4DE8(Entity *this, Spirit *params);
void func_800C5044(void);

void func_800C5368(Entity *this, Spirit *params);
void func_800C55F8(void);

void func_800C58D4(Entity *this, Spirit *params);
void func_800C5B14(void);

void func_800C5CD0(Entity *this, Spirit *params);
void func_800C5DD8(void);

void func_800C602C(Entity *this, Spirit *params);
void func_800C6124(void);

void func_800C643C(Entity *this, Spirit *params);
void func_800C6538(void);

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

EntityClass D_800FF2F8 = {
    &D_80103164[5],
    &D_800FF28C,
    func_800B7D54,
    func_800B7B58,
};

EntityClass D_800FFC50 = (EntityClass) {
    .unk0 = &D_8010350C[0],

    // 800FFBE4
    .unk1 = &(EntityResources) {
        .unk0 = "mosu_obj.clt",
        .unk1 = "mosu_tp0.clt",
        .unk2 = "mosu_obj.vo2",
        .unk10 = "mosu_tp0.xs3",
    },
    .class_ctor = func_800BD924,
    .ctor = func_800BD710,
};

EntityClass D_800FFCEC = {
    .unk0 = &D_8010350C[1],

    // 800FFC80
    .unk1 = &(EntityResources) {
        .unk0 = "baln_obj.clt",
        .unk2 = "baln_obj.vo2",
    },
    .class_ctor = func_800BDD44,
};

// e_jyou
EntityClass D_80100544 = {
    .unk0 = &D_801048CC[1],
    .unk1 = &(EntityResources) {
        .unk0 = "jyou_obj.clt",
        .unk2 = "jyou_obj.vo2",
    },
    .class_ctor = func_800C5B14,
    .ctor = func_800C58D4,
};

EntityClass *(*D_800FD454[3])[] = {
    &(EntityClass *[]) {
        //&D_800FE818,
        &(EntityClass) {
            &D_80103164[0],
            &D_800FE7AC,
            func_800B1F8C,
            func_800B1D78,
        },

        //&D_800FEB54,
        &(EntityClass) {
            &D_80103164[1],
            &D_800FEAE8,
            e_kiwi_class_ctor,
            e_kiwi_ctor,
        },

        //&D_800FED64,
        &(EntityClass) {
            &D_80103164[2],
            &D_800FECF8,
            func_800B4D20,
            func_800B4B14,
        },

        //&D_800FEFE4,
        &(EntityClass) {
            &D_80103164[3],
            &D_800FEF78,
            func_800B6614,
            func_800B6430,
        },

        //&D_800FF0A0,
        &(EntityClass) {
            &D_80103164[4],
            &D_800FF034,
            func_800B6C40,
            func_800B6820,
        },

        &D_800FF2F8, // shared

        // the pattern doesn't continue after this
        &D_800FFCEC,
        &D_80100544,

        //&D_80100554,
        &(EntityClass) {
            .class_ctor = func_800C5DD8,
            .ctor = func_800C5CD0,
        },

        //&D_80100564,
        &(EntityClass) {
            .class_ctor = func_800C6124,
            .ctor = func_800C602C,
        },

        //&D_80100574,
        &(EntityClass) {
            .class_ctor = func_800C6538,
            .ctor = func_800C643C,
        },

        (void *)-1 },

    &(EntityClass *[]) {
        //&D_800FF4E0,
        &(EntityClass) {
            &D_80103164[6],
            &D_800FF474,
            func_800B9280,
            func_800B9068,
        },

        &D_800FF2F8, // shared

        //&D_800FFA78,
        &(EntityClass) {
            &D_80103164[7],
            &D_800FFA0C,
            func_800BBFD8,
            func_800BBD9C,
        },

        &D_800FFC50,

        // 800FFD3C
        &(EntityClass) {
            .class_ctor = func_800BE8F8,
            .ctor = func_800BE7AC,
        },

        // 8010048C
        &(EntityClass) {
            .unk0 = &D_801048CC[0],
            .unk1 = &(EntityResources) {
                .unk0 = "yuge_obj.clt",
                .unk2 = "yuge_obj.vo2",
            },
            .class_ctor = func_800C55F8,
            .ctor = func_800C5368,
        },

        (void *)-1 },

    &(EntityClass *[]) { //&D_80100334,
                         &(EntityClass) {
                             &D_8010353C[0],
                             &D_801002C8,
                             func_800C5044,
                             func_800C4DE8,
                         },
                         (void *)-1 },
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

EntityClass *(*func_800B0AD4(int index)) [] {
    return D_800FD454[index % 3];
}

const char *D_800FD48C[3]
    = {
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

// frog.c (moved)

// kiwi.c (moved)

// dragonfly.c

// e_dragonfly_sth_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B31F0);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3294);

// e_dragonfly_sth_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3344);

// e_dragonfly_sth_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B341C);

// e_dragonfly_sth_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B34D4);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3640);

// e_dragonfly_comp0
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B390C);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3CB0);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3DD0);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B3F2C);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4088);

// e_dragonfly_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4114);

// e_dragonfly_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B42D4);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4638);

// e_dragonfly_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B498C);

// e_dragonfly_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4B14);

// e_dragonfly_class_ctor
void func_800B4D20(void)
{
}

// hippo.c

// hippo missile
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B4D28);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5080);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5138);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5304);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B53F0);

// e_hippo_comp0
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B558C);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5888);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5914);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5A34);

// e_hippo_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5ACC);

// e_hippo_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B5E80);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B61E0);

// e_hippo_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B62AC);

// e_hippo_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6430);

// e_hippo_class_ctor
void func_800B6614(void)
{
}

// block.c (moved)

// beetle.c

// e_beetle_comp0
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6D28);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7060);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B71C4);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7258);

// e_beetle_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B72F0);

// e_beetle_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7574);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7908);

// e_beetle_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B79D4);

// e_beetle_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B7B58);

// e_beetle_class_ctor
void func_800B7D54(void)
{
}

// hari.c

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

void func_800B9280(void)
{
}

// kumo.c

// static
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

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBB4C);

// e_kumo_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBC18);

// e_kumo_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBD9C);

// e_kumo_class_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BBFD8);

// mosu.c

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC004);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC0A8);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC158);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC204);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC290);

// e_mosu_comp0
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC3F0);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BC834);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCA08);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCB94);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCD08);

// e_mosu_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BCEB4);

// e_mosu_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD158);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD4BC);

// e_mosu_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD588);

// e_mosu_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD710);

// e_mosu_class_ctor
void func_800BD924(void)
{
}

// zeplin.c

// e_zeplin_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD92C);

// e_zeplin_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BD9E8);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDA84);

// e_zeplin_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDB08);

// spawn_zeplin
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDB84);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800BDD08);

// e_baloon_class_ctor
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

void func_800BE8F8(void)
{
}

// boss1.c

extern s16 D_801001F0[]; // bytecode

enum {
    SFX_BOSS1_WINGS = 0x1810,
};

enum {
    BOSS1_ACTION_JUMP_AND_TURN = 2,
    BOSS1_ACTION_FLY = 4,
};

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

// e_boss_subentity2_physics
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C1290);

// e_boss_subentity2_interaction
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C1664);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C177C);

// e_boss_subentity2_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C19F4);

// e_boss_subentity2_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C1BE8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C204C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C222C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C22B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C253C);

// e_boss_subentity1_interaction
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C286C);

// calculate_frame_mesh
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C2960);

// e_boss_subentity1_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C2A2C);

// e_boss_subentity1_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C2C20);

// e_boss_subentity0_physics
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C300C);

// e_boss_subentity0_interaction
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C321C);

// calculate_frame_mesh
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C32E0);

// e_boss_subentity0_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C33AC);

// e_boss_subentity0_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3524);

// e_boss1_comp0
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3798);
void func_800C3798(Entity *e, Component *c)
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

        case 6: { // Pick Random Branch
            int r = (random_number() + 1) * (random_number() + 1);
            state = *e->vm.pc++ > r ? 5 : 7;
        } break;

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

        case 10: // Boss1: Set Speed
            e->forward_speed = *e->vm.pc++;
            state = 1;
            break;

        case 11: // Boss1: Set Action
            e->sub.boss1.action = *e->vm.pc++;
            printf("ACTION: %d\n", e->sub.boss1.action);
            state = 1;
            break;

        case 12: { // Boss1: Set Destination
            s16 arg = *e->vm.pc++;
            if (arg) {
                e->sub.boss1.destination_counter = (random_number() >> 2) + 0x40;
                e->sub.boss1.destination_force = random_number() << 4;
            } else {
                e->sub.boss1.destination_counter = 0;
            }
            state = 1;
        } break;

        case 13: { // Boss1: Compare Action
            s16 word = *e->vm.pc++;
            if (word < 0) {
                state = e->sub.boss1.action != ~word ? 5 : 7;
            } else {
                state = e->sub.boss1.action == word ? 5 : 7;
            }
        } break;

        case 14: { // Boss1: Distance Less Than Or Equal
            Entity *player = get_player();
            int distance = SquareRoot0(vector_mag2(
                (player->pos_x - e->pos_x) >> 12,
                (player->range_y - e->range_y) / 2 - ((player->pos_y - e->pos_y) >> 12),
                (player->pos_z - e->pos_z) >> 12
            ));
            state = distance <= *e->vm.pc++ ? 5 : 7;
        } break;

        case 15: { // Boss1: Check player's position
            Entity *player = get_player();
            int distance = SquareRoot0(vector_mag2(
                player->pos_x >> 12,
                0,
                player->pos_z >> 12
            ));
            state = distance <= *e->vm.pc++ ? 5 : 7;
        } break;

        case 16: { // Boss1: Compare angle to player
            Entity *player = get_player();
            int angle = catan2(
                (player->pos_z - e->pos_z) >> 12,
                (player->pos_x - e->pos_x) >> 12
            );

            int rotated = func_800CD444(e->angle_y, angle, *e->vm.pc++);
            state = angle != rotated ? 5 : 7;
        } break;

        default:
            return;
        }
    }
}

// static
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3B7C);
// This runs while the boss is flying.
void func_800C3B7C(Entity *e)
{
    Entity *player = get_player();

    int target;
    if (e->sub.boss1.action == 4) {
        e->sub.boss1.destination_counter += 1;
        if (random_number() < 8) {
            e->sub.boss1.destination_force = catan2((player->pos_z - e->pos_z) >> 12, (player->pos_x - e->pos_x) >> 12)
                + random_number() * 4
                - 0x200;
        }
    }

    if (e->sub.boss1.destination_counter == 0) {
        target = catan2((player->pos_z - e->pos_z) >> 12, (player->pos_x - e->pos_x) >> 12);
    } else {
        e->sub.boss1.destination_counter -= 1;
        target = e->sub.boss1.destination_force;
    }

    int angle0 = e->angle_y;
    e->angle_y = func_800CD444(angle0, target, 12);
    e->unk21 = e->angle_y - angle0;
}

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3C88);

// static
// apply_movement
void func_800C3E90(Entity *e)
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

// static
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C3F28);
// Probably working? Kinda hard to test.
int func_800C3F28(Entity *e)
{
    // Only deal this damage when going down.
    if (e->vel_y <= 0) {
        return 0;
    }

    Entity *player = get_player();
    int dx = player->pos_x - e->pos_x;
    dx = dx < 0 ? -dx : dx;
    int dz = player->pos_z - e->pos_z;
    dz = dz < 0 ? -dz : dz;

    if (dx >> 12 >= e->range_x) {
        return 0;
    }

    if (dz >> 12 >= e->range_z) {
        return 0;
    }

    int dy = (player->pos_y - e->pos_y) >> 12;
    if (dy <= player->range_y && dy > 0) {
        func_800D05F0(0, 16, -1, 50);
        return -1;
    }

    return 0;
}

// static
void func_800C4000(Entity *e)
{
    // Coutner runs while the boss is in the air.
    if (--e->sub.boss1.unk22 < 0) {
        e->sub.boss1.unk22 = 0;
    }

    if (e->sub.boss1.unk22 == 0) {
        func_800CE304(
            SFX_BOSS1_WINGS,
            func_800CEC30(110, e->pos_x >> 12, e->pos_y >> 12, e->pos_z >> 12),
            func_800CEB6C(e->pos_z >> 12, e->pos_x >> 12)
        );
        e->sub.boss1.unk22 = 32;
    }
}

// e_boss1_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C40A4);

// e_boss1_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C44A8);

// static
// calculate_frame_mesh
int func_800C4B8C(Entity *e, int arg)
{
    int frame_b = e->model.frame_b;
    if (frame_b == e->model.frame_a) {
        return frame_b + D_8010353C[0].mesh_id + arg;
    }

    int frames[2] = {
        e->model.frame_b + D_8010353C[0].mesh_id + arg,
        e->model.frame_a + D_8010353C[0].mesh_id + arg,
    };

    int fac = fixed_div(e->model.current_time + 1, e->model.length);
    int factors[2] = {
        fac,
        ONE - fac,
    };

    return func_800E6684(frames, factors, 2);
}

// e_boss1_render
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C4C58);
void func_800C4C58(Entity *e, Component *c)
{
    (void)c;

    func_800EC408(e->pos_z, e->pos_x, 0);
    int id = -1;
    func_800D4880(e->health, e->sub.boss1.max_health);

    SVECTOR pos = {
        .vx = e->pos_x >> 12,
        .vy = e->pos_y >> 12,
        .vz = e->pos_z >> 12,
    };

    SVECTOR rot = {
        .vy = e->angle_y,
        .vx = -e->angle_x,
        .vz = e->angle_z,
    };

    if (camera_frustum_cull(&pos, D_8010353C[0].mesh_id + e->model.frame_a) > -1) {
        id = func_800C4B8C(e, 0);
        if (e->unk5 > 0) {
            id |= 0x8000;
        }
        draw_model(&pos, &rot, id);
    }

    SVECTOR *cam = SCRTCHPAD(0x3CA);
    pos.vy = e->ground_y + 2;
    if (cam->vy < pos.vy && camera_frustum_cull(&pos, D_8010353C[0].mesh_id + e->model.frame_a) > -1) {
        if (id < 0) {
            id = func_800C4B8C(e, 0);
        }

        func_800E5B88(0, 0, 0);
        draw_model(&pos, &rot, id | MODEL_BLACK_SHADOW);
        func_800E5B88(0, 0, 0);
    }

    if (e->unk5) {
        e->unk5 = -1;
    }
}

// e_boss1_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C4DE8);

// e_boss1_class_ctor
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5044);
void func_800C5044(void)
{
    func_800D484C(); // init_boss_ui
    func_800BF768(); // init_boss1
    func_800BE900(); // init_fire_array
}

// yuge.c

// e_yuge_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5074);

// e_yuge_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5188);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5240);

// e_yuge_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C52B8);

// e_yuge_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5368);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C557C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C55B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C55D8);

// e_yuge_class_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C55F8);

// jyou.c

// e_jyou_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5628);

// e_jyou_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5718);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C57D0);

// e_jyou_render
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5848);

// e_jyou_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C58D4);

// static unused
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5A98);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5AD4);

// static unused
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5AF4);

// e_jyou_class_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5B14);

// e_unk8_comp1
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5B44);

// e_unk8_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5C34);

// e_unk8_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5CD0);

// e_unk8_class_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5DD8);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5DF8);

// e_unk9_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C5EC0);

// e_unk9_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C602C);

// e_unk9_class_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6124);

// static
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6144);

// e_unkA_comp3
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C620C);

// e_unkA_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C643C);

// e_unkA_class_ctor
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6538);

// unused:
// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6558);

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C664C);

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C67F4);

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6834);

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6A68);

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6A7C);

// INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6B0C);
