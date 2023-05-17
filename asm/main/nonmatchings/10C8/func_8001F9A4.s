.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F9A4
/* 81A4 8001F9A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 81A8 8001F9A8 1000BFAF */  sw         $ra, 0x10($sp)
/* 81AC 8001F9AC 21108000 */  addu       $v0, $a0, $zero
/* 81B0 8001F9B0 00240200 */  sll        $a0, $v0, 16
/* 81B4 8001F9B4 03240400 */  sra        $a0, $a0, 16
/* 81B8 8001F9B8 1F004230 */  andi       $v0, $v0, 0x1F
/* 81BC 8001F9BC 00110200 */  sll        $v0, $v0, 4
/* 81C0 8001F9C0 00340500 */  sll        $a2, $a1, 16
/* 81C4 8001F9C4 0580013C */  lui        $at, %hi(D_8005206A)
/* 81C8 8001F9C8 6A202124 */  addiu      $at, $at, %lo(D_8005206A)
/* 81CC 8001F9CC 21082200 */  addu       $at, $at, $v0
/* 81D0 8001F9D0 00002584 */  lh         $a1, 0x0($at)
/* 81D4 8001F9D4 7B7E000C */  jal        func_8001F9EC
/* 81D8 8001F9D8 03340600 */   sra       $a2, $a2, 16
/* 81DC 8001F9DC 1000BF8F */  lw         $ra, 0x10($sp)
/* 81E0 8001F9E0 00000000 */  nop
/* 81E4 8001F9E4 0800E003 */  jr         $ra
/* 81E8 8001F9E8 1800BD27 */   addiu     $sp, $sp, 0x18
