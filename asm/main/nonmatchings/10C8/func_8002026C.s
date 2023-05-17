.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002026C
/* 8A6C 8002026C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8A70 80020270 1400BFAF */  sw         $ra, 0x14($sp)
/* 8A74 80020274 1000B0AF */  sw         $s0, 0x10($sp)
/* 8A78 80020278 7F00D024 */  addiu      $s0, $a2, 0x7F
/* 8A7C 8002027C C2811000 */  srl        $s0, $s0, 7
/* 8A80 80020280 C0811000 */  sll        $s0, $s0, 7
/* 8A84 80020284 7E8E000C */  jal        func_800239F8
/* 8A88 80020288 21300002 */   addu      $a2, $s0, $zero
/* 8A8C 8002028C 21184000 */  addu       $v1, $v0, $zero
/* 8A90 80020290 1400BF8F */  lw         $ra, 0x14($sp)
/* 8A94 80020294 1000B08F */  lw         $s0, 0x10($sp)
/* 8A98 80020298 0800E003 */  jr         $ra
/* 8A9C 8002029C 1800BD27 */   addiu     $sp, $sp, 0x18
