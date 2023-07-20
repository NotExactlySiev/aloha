#include "common.h"
#include <libspu.h>
#include <libgpu.h>

// stuff from main executable. TODO move these to a header, all execs need them
#define RANGE(a,b)    char _## a ##_## b [b-a+1]

// maybe this isn't just game config, but all vars shared between files?
typedef struct {
    //char raw[0x500];
    RANGE(0, 0x4FF);
    // game over screen vars
    s32 unk500;
    s32 unk504;
    u8  unk508;
    u8  unk509;
    u8  unk50A;
    u8  unk50B;
    RANGE(0x50C, 2047);    // TODO: figure out how large this whole thing really is
} config_t;

typedef int(*fnp)();
typedef union {
    fnp list[1024];
    // TODO: funcs struct (from the decomp file for main)
} jt_t;

extern jt_t jmptable;


// data from here
typedef struct {
    DISPENV dispenv;
    DRAWENV drawenv;
    u32    ot[4];
    u32*   unk;
    u32    rest[0x8000];
} big_struct;

typedef struct {
    DISPENV *disp;
    DRAWENV *draw;

    u32     _unk[0x1A];  // 0x68 bytes unknown
    u32     ot[4];
} unk_struct;



int D_800ED354[6] = { 32, 33, 34, 35, 36, 37 };
SpuVolume D_800ED370 = { 0x7FFF, 0x7FFF };
s32 D_800ED394;
s32 D_800ED3CC;
s32 D_800ED3D4;    // remove these externs later, they break decomp fsr
s32 D_800ED3DC;
jt_t *jtptr = &jmptable;

s32 D_800EDE54;               // current buffer id
big_struct  D_800EDE5C[2];    // buffers
//big_struct* D_8012DF74;       // current
unk_struct D_8012DF74;


#define JTFUNC(id)  (*jtptr->list[id])


void func_800EC95C(int, int, s32, s32, s32, s32);


INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB894);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB8C0);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB8F8);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBA08);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBA20);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBA40);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBCE0);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBCF0);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBD10);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBD5C);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBEA8);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBEB8);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBF58);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EC098);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EC128);

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EC14C);

//INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EC23C);
void func_800EC23C(s32 arg)
{
    func_800EB8F8();
    func_800EBF58(arg);
}

// not sure about this one. might be wrong, but doesn't seem really broken.
// seems to repeat and action for diagonal lines 128 pixels apart in both directions
void func_800EC268(void)
{
    int i,j;

    D_800ED394 = (D_800ED394 + 1) & 0x7F;
    for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
            func_800EC95C(0, 0x30, 
                ((i << 7) - D_800ED394) - 0x40, 
                ((j << 7) + D_800ED394) - 0x40, 
                D_800ED3CC / 2, 2);
}


void func_800EC318(void)
{
    func_800EBA40();
    func_800EBEB8();
    func_800EBD5C();
    func_800EC268();
    func_800EC14C();
}

// closely matching with 4.1 -O1
void func_800EC358(void)
{
    config_t* conf;
    conf = JTFUNC(0x14)();
    
    conf->unk500 = 0;
    conf->unk508 = 1;
    conf->unk509 = 0;
    conf->unk50A = 0;
    conf->unk50B = 0;
    conf->unk504 = 3;
}


int main(void)
{
    s32 temp_s0;
    s32 var_a0;
    s32 var_v0;
    u8 temp_v0;
    u8* temp_s2;
    int choice;
    
    func_800ED298();
    func_800ED268();
    func_800ECDA8();
    func_800EC098();
    
    JTFUNC(0xC3C)();
    
    func_800ED01C();
    temp_s2 = JTFUNC(0x14)();
    JTFUNC(0x4A4)(&D_800ED370); // set global vol void(SpuVolume*)
    JTFUNC(0xC14)(0x3000);
    JTFUNC(0xCC8)(0);    // mc_set_some_var

    // play some audio thing
    temp_v0 = temp_s2[0x514];
    if (temp_v0 > 5) temp_v0 = 5;
    JTFUNC(0xCC4)(D_800ED354[temp_v0]); // int(int)
    
    func_800EC608();
    func_800EC684();
    func_800EC608();
    func_800EC684();
    JTFUNC(0x604)(0);    // call_wait_frame
    JTFUNC(0x60C)(1);    // call_SetDispMask
    
    func_800EBD10(1);
    
    do {
        temp_s0 = func_800ED09C();
        func_800EC608();
        func_800EC23C(temp_s0);
        func_800EC318();
        func_800EC684();
    } while (D_800ED3D4 != 4);
    
    JTFUNC(0xC3C)();

    choice = 0;
    
    if (D_800ED3DC == 0) {
        temp_s2[0x515] = 0;
        func_800EC358();
        choice = 1;
    }
    JTFUNC(0xC)(choice);
}

/*  TODO: the structure of these pointers and structs is weird
// at 82% or so, but with 3.6 -O2 :/
void func_800EC608(void)
{
    big_struct* current;

    D_800EDE54 = !D_800EDE54;
    current = &D_800EDE5C[D_800EDE54];
    D_8012DF74.disp = &current->dispenv;
    JTFUNC(0x61C)(current->ot, 4);
    D_8012DF74->unk = current->rest;
}

void func_800EC684(void)
{
    JTFUNC(0x102)();
    JTFUNC(0x18C)(0);
    JTFUNC(0x191)(0);
    // put env and draw
    JTFUNC(0x185)(D_8012DF74.disp);
    JTFUNC(0x186)(D_8012DF74.draw);
    JTFUNC(0x189)(D_8012DF74.ot);
}
*/

// This has more functions in it, and I have removed main, that's why it's still here
INCLUDE_ASM("asm/gameover/nonmatchings/C094", main);