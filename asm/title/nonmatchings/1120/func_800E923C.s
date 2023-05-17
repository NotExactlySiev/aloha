.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E923C
/* 9A3C 800E923C 0000888C */  lw         $t0, 0x0($a0)
/* 9A40 800E9240 0000AB8C */  lw         $t3, 0x0($a1)
/* 9A44 800E9244 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9A48 800E9248 004C0900 */  sll        $t1, $t1, 16
/* 9A4C 800E924C 034C0900 */  sra        $t1, $t1, 16
/* 9A50 800E9250 19002B01 */  multu      $t1, $t3
/* 9A54 800E9254 0400AC8C */  lw         $t4, 0x4($a1)
/* 9A58 800E9258 03540800 */  sra        $t2, $t0, 16
/* 9A5C 800E925C 0800AD8C */  lw         $t5, 0x8($a1)
/* 9A60 800E9260 0400888C */  lw         $t0, 0x4($a0)
/* 9A64 800E9264 21108000 */  addu       $v0, $a0, $zero
/* 9A68 800E9268 12480000 */  mflo       $t1
/* 9A6C 800E926C 034B0900 */  sra        $t1, $t1, 12
/* 9A70 800E9270 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9A74 800E9274 19004C01 */  multu      $t2, $t4
/* 9A78 800E9278 12500000 */  mflo       $t2
/* 9A7C 800E927C 03530A00 */  sra        $t2, $t2, 12
/* 9A80 800E9280 00540A00 */  sll        $t2, $t2, 16
/* 9A84 800E9284 25482A01 */  or         $t1, $t1, $t2
/* 9A88 800E9288 000089AC */  sw         $t1, 0x0($a0)
/* 9A8C 800E928C FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9A90 800E9290 004C0900 */  sll        $t1, $t1, 16
/* 9A94 800E9294 034C0900 */  sra        $t1, $t1, 16
/* 9A98 800E9298 19002D01 */  multu      $t1, $t5
/* 9A9C 800E929C 03540800 */  sra        $t2, $t0, 16
/* 9AA0 800E92A0 0800888C */  lw         $t0, 0x8($a0)
/* 9AA4 800E92A4 12480000 */  mflo       $t1
/* 9AA8 800E92A8 034B0900 */  sra        $t1, $t1, 12
/* 9AAC 800E92AC FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9AB0 800E92B0 19004B01 */  multu      $t2, $t3
/* 9AB4 800E92B4 12500000 */  mflo       $t2
/* 9AB8 800E92B8 03530A00 */  sra        $t2, $t2, 12
/* 9ABC 800E92BC 00540A00 */  sll        $t2, $t2, 16
/* 9AC0 800E92C0 25482A01 */  or         $t1, $t1, $t2
/* 9AC4 800E92C4 040089AC */  sw         $t1, 0x4($a0)
/* 9AC8 800E92C8 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9ACC 800E92CC 004C0900 */  sll        $t1, $t1, 16
/* 9AD0 800E92D0 034C0900 */  sra        $t1, $t1, 16
/* 9AD4 800E92D4 19002C01 */  multu      $t1, $t4
/* 9AD8 800E92D8 03540800 */  sra        $t2, $t0, 16
/* 9ADC 800E92DC 0C00888C */  lw         $t0, 0xC($a0)
/* 9AE0 800E92E0 12480000 */  mflo       $t1
/* 9AE4 800E92E4 034B0900 */  sra        $t1, $t1, 12
/* 9AE8 800E92E8 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9AEC 800E92EC 19004D01 */  multu      $t2, $t5
/* 9AF0 800E92F0 12500000 */  mflo       $t2
/* 9AF4 800E92F4 03530A00 */  sra        $t2, $t2, 12
/* 9AF8 800E92F8 00540A00 */  sll        $t2, $t2, 16
/* 9AFC 800E92FC 25482A01 */  or         $t1, $t1, $t2
/* 9B00 800E9300 080089AC */  sw         $t1, 0x8($a0)
/* 9B04 800E9304 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9B08 800E9308 004C0900 */  sll        $t1, $t1, 16
/* 9B0C 800E930C 034C0900 */  sra        $t1, $t1, 16
/* 9B10 800E9310 19002B01 */  multu      $t1, $t3
/* 9B14 800E9314 03540800 */  sra        $t2, $t0, 16
/* 9B18 800E9318 1000888C */  lw         $t0, 0x10($a0)
/* 9B1C 800E931C 12480000 */  mflo       $t1
/* 9B20 800E9320 034B0900 */  sra        $t1, $t1, 12
/* 9B24 800E9324 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9B28 800E9328 19004C01 */  multu      $t2, $t4
/* 9B2C 800E932C 12500000 */  mflo       $t2
/* 9B30 800E9330 03530A00 */  sra        $t2, $t2, 12
/* 9B34 800E9334 00540A00 */  sll        $t2, $t2, 16
/* 9B38 800E9338 25482A01 */  or         $t1, $t1, $t2
/* 9B3C 800E933C 0C0089AC */  sw         $t1, 0xC($a0)
/* 9B40 800E9340 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9B44 800E9344 004C0900 */  sll        $t1, $t1, 16
/* 9B48 800E9348 034C0900 */  sra        $t1, $t1, 16
/* 9B4C 800E934C 19002D01 */  multu      $t1, $t5
/* 9B50 800E9350 12480000 */  mflo       $t1
/* 9B54 800E9354 034B0900 */  sra        $t1, $t1, 12
/* 9B58 800E9358 0800E003 */  jr         $ra
/* 9B5C 800E935C 100089AC */   sw        $t1, 0x10($a0)
