.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800315B4
/* 19DB4 800315B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19DB8 800315B8 1000B0AF */  sw         $s0, 0x10($sp)
/* 19DBC 800315BC 2180A000 */  addu       $s0, $a1, $zero
/* 19DC0 800315C0 0700023C */  lui        $v0, (0x7F000 >> 16)
/* 19DC4 800315C4 00F04234 */  ori        $v0, $v0, (0x7F000 & 0xFFFF)
/* 19DC8 800315C8 2B105000 */  sltu       $v0, $v0, $s0
/* 19DCC 800315CC 03004010 */  beqz       $v0, .L800315DC
/* 19DD0 800315D0 1400BFAF */   sw        $ra, 0x14($sp)
/* 19DD4 800315D4 0700103C */  lui        $s0, (0x7F000 >> 16)
/* 19DD8 800315D8 00F01036 */  ori        $s0, $s0, (0x7F000 & 0xFFFF)
.L800315DC:
/* 19DDC 800315DC CABA000C */  jal        func_8002EB28
/* 19DE0 800315E0 21280002 */   addu      $a1, $s0, $zero
/* 19DE4 800315E4 0580023C */  lui        $v0, %hi(D_80054714)
/* 19DE8 800315E8 1447428C */  lw         $v0, %lo(D_80054714)($v0)
/* 19DEC 800315EC 00000000 */  nop
/* 19DF0 800315F0 03004014 */  bnez       $v0, .L80031600
/* 19DF4 800315F4 21100002 */   addu      $v0, $s0, $zero
/* 19DF8 800315F8 0580013C */  lui        $at, %hi(D_80054704)
/* 19DFC 800315FC 044720AC */  sw         $zero, %lo(D_80054704)($at)
.L80031600:
/* 19E00 80031600 1400BF8F */  lw         $ra, 0x14($sp)
/* 19E04 80031604 1000B08F */  lw         $s0, 0x10($sp)
/* 19E08 80031608 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19E0C 8003160C 0800E003 */  jr         $ra
/* 19E10 80031610 00000000 */   nop
