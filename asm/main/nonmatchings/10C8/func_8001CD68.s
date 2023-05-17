.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CD68
/* 5568 8001CD68 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 556C 8001CD6C 1000BFAF */  sw         $ra, 0x10($sp)
/* 5570 8001CD70 08000434 */  ori        $a0, $zero, 0x8
/* 5574 8001CD74 21280000 */  addu       $a1, $zero, $zero
/* 5578 8001CD78 086C000C */  jal        func_8001B020
/* 557C 8001CD7C 21300000 */   addu      $a2, $zero, $zero
/* 5580 8001CD80 1000BF8F */  lw         $ra, 0x10($sp)
/* 5584 8001CD84 00000000 */  nop
/* 5588 8001CD88 0800E003 */  jr         $ra
/* 558C 8001CD8C 1800BD27 */   addiu     $sp, $sp, 0x18
