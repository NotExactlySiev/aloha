.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025C60
/* E460 80025C60 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E464 80025C64 1000B0AF */  sw         $s0, 0x10($sp)
/* E468 80025C68 21808000 */  addu       $s0, $a0, $zero
/* E46C 80025C6C 02000234 */  ori        $v0, $zero, 0x2
/* E470 80025C70 2120A000 */  addu       $a0, $a1, $zero
/* E474 80025C74 1400BFAF */  sw         $ra, 0x14($sp)
/* E478 80025C78 B098000C */  jal        func_800262C0
/* E47C 80025C7C 030002A2 */   sb        $v0, 0x3($s0)
/* E480 80025C80 040002AE */  sw         $v0, 0x4($s0)
/* E484 80025C84 080000AE */  sw         $zero, 0x8($s0)
/* E488 80025C88 1400BF8F */  lw         $ra, 0x14($sp)
/* E48C 80025C8C 1000B08F */  lw         $s0, 0x10($sp)
/* E490 80025C90 1800BD27 */  addiu      $sp, $sp, 0x18
/* E494 80025C94 0800E003 */  jr         $ra
/* E498 80025C98 00000000 */   nop
