#include "common.h"

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023D38);   // DecDCTReset

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023D70);   // DecDCTBufSize

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023D7C);   // DecDCTvlc

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023DC0);   // DecDCTin

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E3C);   // DecDCTout

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E5C);   // DecDCTinSync

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E7C);   // DecDCToutSync

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023E9C);   // DecDCTinCallback

INCLUDE_ASM("asm/main/nonmatchings/libpress", func_80023EC0);   // DecDCToutCallback

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
