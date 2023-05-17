.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D248
/* 5A48 8001D248 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5A4C 8001D24C 1000BFAF */  sw         $ra, 0x10($sp)
/* 5A50 8001D250 0580013C */  lui        $at, %hi(D_800548EC)
/* 5A54 8001D254 EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
/* 5A58 8001D258 FE000434 */  ori        $a0, $zero, 0xFE
/* 5A5C 8001D25C 21280000 */  addu       $a1, $zero, $zero
/* 5A60 8001D260 086C000C */  jal        func_8001B020
/* 5A64 8001D264 21300000 */   addu      $a2, $zero, $zero
/* 5A68 8001D268 BD70000C */  jal        func_8001C2F4
/* 5A6C 8001D26C 00000000 */   nop
/* 5A70 8001D270 376E000C */  jal        func_8001B8DC
/* 5A74 8001D274 00000000 */   nop
/* 5A78 8001D278 1000BF8F */  lw         $ra, 0x10($sp)
/* 5A7C 8001D27C 00000000 */  nop
/* 5A80 8001D280 0800E003 */  jr         $ra
/* 5A84 8001D284 1800BD27 */   addiu     $sp, $sp, 0x18
