.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002E49C
/* 16C9C 8002E49C B0000A24 */  addiu      $t2, $zero, 0xB0
/* 16CA0 8002E4A0 08004001 */  jr         $t2
/* 16CA4 8002E4A4 0D000924 */   addiu     $t1, $zero, 0xD
/* 16CA8 8002E4A8 00000000 */  nop
/* 16CAC 8002E4AC 0480033C */  lui        $v1, %hi(D_80047D08)
/* 16CB0 8002E4B0 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 16CB4 8002E4B4 00000000 */  nop
/* 16CB8 8002E4B8 AA016494 */  lhu        $a0, 0x1AA($v1)
/* 16CBC 8002E4BC F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 16CC0 8002E4C0 CF7F8230 */  andi       $v0, $a0, 0x7FCF
/* 16CC4 8002E4C4 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* 16CC8 8002E4C8 0D000234 */  ori        $v0, $zero, 0xD
/* 16CCC 8002E4CC 0400A2AF */  sw         $v0, 0x4($sp)
/* 16CD0 8002E4D0 0000A0AF */  sw         $zero, 0x0($sp)
/* 16CD4 8002E4D4 41B90008 */  j          .L8002E504
/* 16CD8 8002E4D8 00000000 */   nop
.L8002E4DC:
/* 16CDC 8002E4DC 0400A38F */  lw         $v1, 0x4($sp)
/* 16CE0 8002E4E0 00000000 */  nop
/* 16CE4 8002E4E4 40100300 */  sll        $v0, $v1, 1
/* 16CE8 8002E4E8 21104300 */  addu       $v0, $v0, $v1
/* 16CEC 8002E4EC 0400A2AF */  sw         $v0, 0x4($sp)
/* 16CF0 8002E4F0 0000A28F */  lw         $v0, 0x0($sp)
/* 16CF4 8002E4F4 00000000 */  nop
/* 16CF8 8002E4F8 01004224 */  addiu      $v0, $v0, 0x1
/* 16CFC 8002E4FC 0000A2AF */  sw         $v0, 0x0($sp)
/* 16D00 8002E500 0000A28F */  lw         $v0, 0x0($sp)
.L8002E504:
/* 16D04 8002E504 00000000 */  nop
/* 16D08 8002E508 0000A28F */  lw         $v0, 0x0($sp)
/* 16D0C 8002E50C 00000000 */  nop
/* 16D10 8002E510 F0004228 */  slti       $v0, $v0, 0xF0
/* 16D14 8002E514 F1FF4014 */  bnez       $v0, .L8002E4DC
/* 16D18 8002E518 00000000 */   nop
/* 16D1C 8002E51C 0480023C */  lui        $v0, %hi(D_80047D08)
/* 16D20 8002E520 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 16D24 8002E524 CFFF8430 */  andi       $a0, $a0, 0xFFCF
/* 16D28 8002E528 AA0144A4 */  sh         $a0, 0x1AA($v0)
/* 16D2C 8002E52C 21100000 */  addu       $v0, $zero, $zero
/* 16D30 8002E530 0800BD27 */  addiu      $sp, $sp, 0x8
/* 16D34 8002E534 0800E003 */  jr         $ra
/* 16D38 8002E538 00000000 */   nop
