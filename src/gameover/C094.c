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


// these might be not s32 but paired as structs?
s32* intarrs[3] = {
    { 13, 1, -1, 0 },
    { 0, 4, 1, 4, 2, 4, 3, 4, 8, 10, 9, 10, 10, 10, 11, 10, 12, 10, 13, 10, -1, 18 },
    { 16, 8, 17, 8, -1, 0},
};
s32* seq = 0;
s32 seq_val = 0;
s32 seq_wait = 0;

int D_800ED354[7] = { 32, 33, 34, 35, 36, 37, 32 };
SpuVolume D_800ED370 = { 0x7FFF, 0x7FFF };
s32 D_800ED374 = 0xFFFFDC00;

// this might be a struct
s32 D_800ED388 = 0;
s32 D_800ED38C = 0;
s32 D_800ED390 = 40;

s32 D_800ED394 = 0;
s32 D_800ED3B4 = 0;
s32 D_800ED3BC = 0;
s32 D_800ED3C4 = 0;
s32 D_800ED3CC = 0;
s32 D_800ED3D4 = 0;
s32 D_800ED3DC = 0;     // selected
s32 D_800ED3E4 = 0;
s32 D_800ED3EC = 0;
s32 D_800ED3F4 = 0;
s32 seq_idx = 0;
s32 seq_timer = 0;
jt_t *jtptr = &jmptable;

s32 D_800ED340[5] = { 40, 42, 41, 42, -1 };

// these change with tv standard
s32 D_800ED384 = 1200;
s32 D_800ED424 = 0;

s32 D_800EDE54;               // current buffer id
big_struct  D_800EDE5C[2];    // buffers
//big_struct* D_8012DF74;     // current
unk_struct D_8012DF74;


#define JTFUNC(id)  (*jtptr->list[id])


void func_800EC95C(int, int, s32, s32, s32, s32);

void func_800EB894(void)
{
    D_800ED3CC = 0;
    D_800ED3D4 = 0;
    D_800ED3EC = 0;
    D_800ED3F4 = 0;
}

void func_800EB8C0(s32 arg)
{
    JTFUNC(0x311)(arg, 0x3e, 100);
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB8F8);

void func_800EBA08(void)
{
    D_800ED3B4 = 0x00005F00;
    D_800ED3BC = 0;
}

void func_800EBA20(void)
{
    D_800ED374 = 0x00005F00;
    D_800ED3BC = 0;
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBA40);

void func_800EBCE0(void)
{
    D_800ED3C4 = 0;
}

void func_800EBCF0(void)
{
    func_800EBD10(0);
}

void func_800EBD10(int idx)
{
    seq = intarrs[idx];
    seq_idx = 0;
    seq_timer = 0;
    seq_val = seq[0];
    seq_wait = seq[1];
}

// TODO: make sequence steps into a struct
void func_800EBD5C(void)
{
    s32 temp_v1_2;

    // sequence mode
    if (D_800ED3F4 == 0) {
        // update timer, go to next step if this one is over
        seq_timer += 1;
        if (seq_wait < seq_timer) {
            // increment index
            seq_idx += 2;
            seq_timer = 0;
            // if the sequence is over, roll over to step idx determined by the last value
            if (seq[seq_idx] == -1) {
                seq_idx = seq[seq_idx+1] * 2;
            }
            // and get the new values
            seq_val = seq[seq_idx];
            seq_wait = seq[seq_idx+1];
        }
        func_800EC95C(1, seq_val, 0x78, 0x78, D_800ED3CC, 0);
        return;
    }

    // don't know what this part does
    temp_v1_2 = (s32) D_800ED374 >> 8;
    if (temp_v1_2 > 0x77) {
        D_800ED3F4 = -1;
        return;
    }

    func_800ECBB4(0x60, temp_v1_2 + 0x10, 0x30, 0x77 - temp_v1_2, D_800ED3CC);
}

void func_800EBEA8(void)
{
    D_800ED3DC = 0;
}

void func_800EBEB8(void)
{
    func_800EC95C(2, 0x20, 0x44, 0x90, D_800ED3CC, 0);
    func_800EC95C(2, 0x21, 0x44, 0xA0, D_800ED3CC, D_800ED3DC == 0);
    func_800EC95C(2, 0x22, 0x44, 0xB0, D_800ED3CC, D_800ED3DC == 1);
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBF58);

void func_800EC098(void)
{
    s32 tv_standard;

    func_800EBA08();
    func_800EBCE0();
    func_800EB894();
    func_800EBEA8();
    D_800ED3E4 = 0x2D;

    tv_standard = JTFUNC(7)();
    if (tv_standard == 1) {
        D_800ED424 = 9;
        D_800ED384 = 1000;
    } else {
        D_800ED424 = 11;
    }
}

void func_800EC128(void)
{
    D_800ED388 = 0;
    D_800ED38C = 0;
    D_800ED390 = 40;
}

void func_800EC14C(void)
{
    s32 tmp;

    D_800ED388 += 1;
    if (D_800ED388 >= D_800ED424) {
        D_800ED38C += 1;
        D_800ED388 = 0;
        if (D_800ED340[D_800ED38C] == -1) {
            D_800ED38C = 0;
        }
        D_800ED390 = D_800ED340[D_800ED38C];
    }

    tmp = D_800ED3DC == 1 ? 0xAB : 0x9B;
    func_800EC95C(2, D_800ED390, 0x44, tmp, D_800ED3CC, 0);
}

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

void func_800EC608(void) {}
/* // TODO: the structure of these pointers and structs is weird
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
INCLUDE_ASM("asm/gameover/nonmatchings/C094", misc);