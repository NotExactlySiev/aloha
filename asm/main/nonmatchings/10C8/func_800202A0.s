.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800202A0
/* 8AA0 800202A0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 8AA4 800202A4 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 8AA8 800202A8 1800B2AF */  sw         $s2, 0x18($sp)
/* 8AAC 800202AC 1400B1AF */  sw         $s1, 0x14($sp)
/* 8AB0 800202B0 1000B0AF */  sw         $s0, 0x10($sp)
/* 8AB4 800202B4 21888000 */  addu       $s1, $a0, $zero
/* 8AB8 800202B8 2190A000 */  addu       $s2, $a1, $zero
/* 8ABC 800202BC 7F00C624 */  addiu      $a2, $a2, 0x7F
/* 8AC0 800202C0 C2310600 */  srl        $a2, $a2, 7
/* 8AC4 800202C4 C0810600 */  sll        $s0, $a2, 7
/* 8AC8 800202C8 21202002 */  addu       $a0, $s1, $zero
.L800202CC:
/* 8ACC 800202CC 21284002 */  addu       $a1, $s2, $zero
/* 8AD0 800202D0 7E8E000C */  jal        func_800239F8
/* 8AD4 800202D4 21300002 */   addu      $a2, $s0, $zero
/* 8AD8 800202D8 FCFF4014 */  bnez       $v0, .L800202CC
/* 8ADC 800202DC 21202002 */   addu      $a0, $s1, $zero
/* 8AE0 800202E0 21100002 */  addu       $v0, $s0, $zero
/* 8AE4 800202E4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 8AE8 800202E8 1800B28F */  lw         $s2, 0x18($sp)
/* 8AEC 800202EC 1400B18F */  lw         $s1, 0x14($sp)
/* 8AF0 800202F0 1000B08F */  lw         $s0, 0x10($sp)
/* 8AF4 800202F4 0800E003 */  jr         $ra
/* 8AF8 800202F8 2000BD27 */   addiu     $sp, $sp, 0x20
