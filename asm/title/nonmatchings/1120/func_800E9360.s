.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E9360
/* 9B60 800E9360 0000888C */  lw         $t0, 0x0($a0)
/* 9B64 800E9364 0000AB8C */  lw         $t3, 0x0($a1)
/* 9B68 800E9368 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9B6C 800E936C 004C0900 */  sll        $t1, $t1, 16
/* 9B70 800E9370 034C0900 */  sra        $t1, $t1, 16
/* 9B74 800E9374 19002B01 */  multu      $t1, $t3
/* 9B78 800E9378 03540800 */  sra        $t2, $t0, 16
/* 9B7C 800E937C 0400AC8C */  lw         $t4, 0x4($a1)
/* 9B80 800E9380 0800AD8C */  lw         $t5, 0x8($a1)
/* 9B84 800E9384 0400888C */  lw         $t0, 0x4($a0)
/* 9B88 800E9388 21108000 */  addu       $v0, $a0, $zero
/* 9B8C 800E938C 12480000 */  mflo       $t1
/* 9B90 800E9390 034B0900 */  sra        $t1, $t1, 12
/* 9B94 800E9394 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9B98 800E9398 19004B01 */  multu      $t2, $t3
/* 9B9C 800E939C 12500000 */  mflo       $t2
/* 9BA0 800E93A0 03530A00 */  sra        $t2, $t2, 12
/* 9BA4 800E93A4 00540A00 */  sll        $t2, $t2, 16
/* 9BA8 800E93A8 25482A01 */  or         $t1, $t1, $t2
/* 9BAC 800E93AC 000089AC */  sw         $t1, 0x0($a0)
/* 9BB0 800E93B0 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9BB4 800E93B4 004C0900 */  sll        $t1, $t1, 16
/* 9BB8 800E93B8 034C0900 */  sra        $t1, $t1, 16
/* 9BBC 800E93BC 19002B01 */  multu      $t1, $t3
/* 9BC0 800E93C0 03540800 */  sra        $t2, $t0, 16
/* 9BC4 800E93C4 0800888C */  lw         $t0, 0x8($a0)
/* 9BC8 800E93C8 12480000 */  mflo       $t1
/* 9BCC 800E93CC 034B0900 */  sra        $t1, $t1, 12
/* 9BD0 800E93D0 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9BD4 800E93D4 19004C01 */  multu      $t2, $t4
/* 9BD8 800E93D8 12500000 */  mflo       $t2
/* 9BDC 800E93DC 03530A00 */  sra        $t2, $t2, 12
/* 9BE0 800E93E0 00540A00 */  sll        $t2, $t2, 16
/* 9BE4 800E93E4 25482A01 */  or         $t1, $t1, $t2
/* 9BE8 800E93E8 040089AC */  sw         $t1, 0x4($a0)
/* 9BEC 800E93EC FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9BF0 800E93F0 004C0900 */  sll        $t1, $t1, 16
/* 9BF4 800E93F4 034C0900 */  sra        $t1, $t1, 16
/* 9BF8 800E93F8 19002C01 */  multu      $t1, $t4
/* 9BFC 800E93FC 03540800 */  sra        $t2, $t0, 16
/* 9C00 800E9400 0C00888C */  lw         $t0, 0xC($a0)
/* 9C04 800E9404 12480000 */  mflo       $t1
/* 9C08 800E9408 034B0900 */  sra        $t1, $t1, 12
/* 9C0C 800E940C FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9C10 800E9410 19004C01 */  multu      $t2, $t4
/* 9C14 800E9414 12500000 */  mflo       $t2
/* 9C18 800E9418 03530A00 */  sra        $t2, $t2, 12
/* 9C1C 800E941C 00540A00 */  sll        $t2, $t2, 16
/* 9C20 800E9420 25482A01 */  or         $t1, $t1, $t2
/* 9C24 800E9424 080089AC */  sw         $t1, 0x8($a0)
/* 9C28 800E9428 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9C2C 800E942C 004C0900 */  sll        $t1, $t1, 16
/* 9C30 800E9430 034C0900 */  sra        $t1, $t1, 16
/* 9C34 800E9434 19002D01 */  multu      $t1, $t5
/* 9C38 800E9438 03540800 */  sra        $t2, $t0, 16
/* 9C3C 800E943C 1000888C */  lw         $t0, 0x10($a0)
/* 9C40 800E9440 12480000 */  mflo       $t1
/* 9C44 800E9444 034B0900 */  sra        $t1, $t1, 12
/* 9C48 800E9448 FFFF2931 */  andi       $t1, $t1, 0xFFFF
/* 9C4C 800E944C 19004D01 */  multu      $t2, $t5
/* 9C50 800E9450 12500000 */  mflo       $t2
/* 9C54 800E9454 03530A00 */  sra        $t2, $t2, 12
/* 9C58 800E9458 00540A00 */  sll        $t2, $t2, 16
/* 9C5C 800E945C 25482A01 */  or         $t1, $t1, $t2
/* 9C60 800E9460 0C0089AC */  sw         $t1, 0xC($a0)
/* 9C64 800E9464 FFFF0931 */  andi       $t1, $t0, 0xFFFF
/* 9C68 800E9468 004C0900 */  sll        $t1, $t1, 16
/* 9C6C 800E946C 034C0900 */  sra        $t1, $t1, 16
/* 9C70 800E9470 19002D01 */  multu      $t1, $t5
/* 9C74 800E9474 12480000 */  mflo       $t1
/* 9C78 800E9478 034B0900 */  sra        $t1, $t1, 12
/* 9C7C 800E947C 0800E003 */  jr         $ra
/* 9C80 800E9480 100089AC */   sw        $t1, 0x10($a0)
