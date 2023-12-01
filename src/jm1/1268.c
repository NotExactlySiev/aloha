#include "common.h"
#include "entity.h"
#include <libgpu.h>

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0A68);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0A78);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0A88);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0AD4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0B24);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0B74);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0BC4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0C14);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0C58);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0C9C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CAC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CBC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B0CCC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1054);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B11B8);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B124C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B12E4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B13BC);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1788);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1B28);

extern s32 D_80103164;
INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1BF4);
// frog render
_func_800B1BF4(Entity* this)
{
    SVECTOR pos;
    SVECTOR rot;
    pos.vx = this->pos_x >> 12;
    pos.vy = this->pos_y >> 12;
    pos.vz = this->pos_z >> 12;
    rot.vy =  this->angle_y;
    rot.vx = -this->angle_x;
    rot.vz =  this->angle_z;
    if (func_800E5DD8(&pos, this->model[1] + D_80103164) > -1) {
        u32 meshid = func_800B1B28(this, 0);
        gprintf("FROG: MESH %X\t%d\t%d\t%d\n", meshid, pos.vx, pos.vy, pos.vz);
        func_800E5E60(&pos, &rot, meshid);
    }
}

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B1D78);

void func_800B1F8C(void) {
}

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

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B661C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B66A0);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6744);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6820);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B6948);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800B69A0);

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

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6558);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C664C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C67F4);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6834);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6A68);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6A7C);

INCLUDE_ASM("asm/jm1/nonmatchings/1268", func_800C6B0C);
