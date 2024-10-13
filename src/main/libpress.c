#include "common.h"

/*int func_80023D38() { return 0; }
int func_80023D70() { return 0; }
int func_80023D7C() { return 0; }
int func_80023DC0() { return 0; }
int func_80023E3C() { return 0; }
int func_80023E5C() { return 0; }
int func_80023E7C() { return 0; }
int func_80023E9C() { return 0; }
int func_80023EC0() { return 0; }*/
#include <libpress.h>

#define LOG     printf("called %s\n", __func__)

void my_DecDCTReset(int mode) { LOG; DecDCTReset(mode); }
int my_DecDCTvlc(u_long *bs, u_long *buf) { 
    LOG; printf("calling vlc now!\n");
    return 0;
    return DecDCTvlc(bs, buf);
}
//void my_DecDCTin(u_long *buf, int mode) { LOG; DecDCTin(buf, mode); }
//void my_DecDCTout(u_long *buf, int size) { LOG; DecDCTout(buf, size); }
//int my_DecDCTinSync() { LOG; return 0; }
//int my_DecDCToutSync() { LOG; return 0; }
//int my_DecDCTinCallback() { LOG; return 0; }
int my_DecDCToutCallback(void (*func)()) { LOG; return DecDCToutCallback(func); }

// FIXME: fix this shit
//void my_DecDCTReset(int mode) { LOG; }
//int my_DecDCTvlc(u_long *bs, u_long *buf) { LOG; return 0; }
void my_DecDCTin(u_long *buf, int mode) { LOG; }
void my_DecDCTout(u_long *buf, int size) { LOG; }
int my_DecDCTinSync() { LOG; return 0; }
int my_DecDCToutSync() { LOG; return 0; }
int my_DecDCTinCallback() { LOG; return 0; }
//int my_DecDCToutCallback(void (*func)()) { LOG; }

/*
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023D38);   // my_DecDCTReset
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023D70);   // DecDCTBufSize
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023D7C);   // my_DecDCTvlc
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023DC0);   // my_DecDCTin
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E3C);   // my_DecDCTout
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E5C);   // my_DecDCTinSync
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E7C);   // my_DecDCToutSync
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E9C);   // my_DecDCTinCallback
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023EC0);   // my_DecDCToutCallback

//
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023EE4);   // MDEC_reset

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023FEC);   // MDEC_in

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80024080);   // MDEC_out

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80024110);   // MDEC_in_sync

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_800241A8);   // MDEC_out_sync

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80024240);   // timeout

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80024374);   // exit + MDEC_vlc

// or maybe with top MDEC_vlc are in one file idk i have to check the libs
INCLUDE_ASM("asm/main/nonmatchings/libpress", func_800245D4);   // MDEC_vlc2

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_800249BC);   // ivlc_dct_dc_size
*/