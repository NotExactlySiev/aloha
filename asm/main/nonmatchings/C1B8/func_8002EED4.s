.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002EED4
/* 176D4 8002EED4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 176D8 8002EED8 1000B0AF */  sw         $s0, 0x10($sp)
/* 176DC 8002EEDC 1400BFAF */  sw         $ra, 0x14($sp)
/* 176E0 8002EEE0 A2BC000C */  jal        func_8002F288
/* 176E4 8002EEE4 2180A000 */   addu      $s0, $a1, $zero
/* 176E8 8002EEE8 21100002 */  addu       $v0, $s0, $zero
/* 176EC 8002EEEC 1400BF8F */  lw         $ra, 0x14($sp)
/* 176F0 8002EEF0 1000B08F */  lw         $s0, 0x10($sp)
/* 176F4 8002EEF4 1800BD27 */  addiu      $sp, $sp, 0x18
/* 176F8 8002EEF8 0800E003 */  jr         $ra
/* 176FC 8002EEFC 00000000 */   nop
