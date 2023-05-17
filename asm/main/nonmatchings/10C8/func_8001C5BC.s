.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C5BC
/* 4DBC 8001C5BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4DC0 8001C5C0 1400BFAF */  sw         $ra, 0x14($sp)
/* 4DC4 8001C5C4 1000B0AF */  sw         $s0, 0x10($sp)
/* 4DC8 8001C5C8 DF69000C */  jal        func_8001A77C
/* 4DCC 8001C5CC 21808000 */   addu      $s0, $a0, $zero
/* 4DD0 8001C5D0 15000434 */  ori        $a0, $zero, 0x15
/* 4DD4 8001C5D4 21280002 */  addu       $a1, $s0, $zero
/* 4DD8 8001C5D8 086C000C */  jal        func_8001B020
/* 4DDC 8001C5DC 21300000 */   addu      $a2, $zero, $zero
/* 4DE0 8001C5E0 21100000 */  addu       $v0, $zero, $zero
/* 4DE4 8001C5E4 1400BF8F */  lw         $ra, 0x14($sp)
/* 4DE8 8001C5E8 1000B08F */  lw         $s0, 0x10($sp)
/* 4DEC 8001C5EC 0800E003 */  jr         $ra
/* 4DF0 8001C5F0 1800BD27 */   addiu     $sp, $sp, 0x18
