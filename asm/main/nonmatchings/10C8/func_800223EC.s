.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800223EC
/* ABEC 800223EC F8FFBD27 */  addiu      $sp, $sp, -0x8
/* ABF0 800223F0 2C00838C */  lw         $v1, 0x2C($a0)
/* ABF4 800223F4 8000023C */  lui        $v0, (0x800000 >> 16)
/* ABF8 800223F8 0000A2AF */  sw         $v0, 0x0($sp)
/* ABFC 800223FC 1A006014 */  bnez       $v1, .L80022468
/* AC00 80022400 00000000 */   nop
/* AC04 80022404 01000534 */  ori        $a1, $zero, 0x1
.L80022408:
/* AC08 80022408 0000A28F */  lw         $v0, 0x0($sp)
/* AC0C 8002240C 00000000 */  nop
/* AC10 80022410 FFFF4224 */  addiu      $v0, $v0, -0x1
/* AC14 80022414 0000A2AF */  sw         $v0, 0x0($sp)
/* AC18 80022418 0000A28F */  lw         $v0, 0x0($sp)
/* AC1C 8002241C 00000000 */  nop
/* AC20 80022420 0D004014 */  bnez       $v0, .L80022458
/* AC24 80022424 00000000 */   nop
/* AC28 80022428 2000828C */  lw         $v0, 0x20($a0)
/* AC2C 8002242C 2C0085AC */  sw         $a1, 0x2C($a0)
/* AC30 80022430 0100422C */  sltiu      $v0, $v0, 0x1
/* AC34 80022434 200082AC */  sw         $v0, 0x20($a0)
/* AC38 80022438 C0100200 */  sll        $v0, $v0, 3
/* AC3C 8002243C 21108200 */  addu       $v0, $a0, $v0
/* AC40 80022440 10004394 */  lhu        $v1, 0x10($v0)
/* AC44 80022444 00000000 */  nop
/* AC48 80022448 240083A4 */  sh         $v1, 0x24($a0)
/* AC4C 8002244C 12004294 */  lhu        $v0, 0x12($v0)
/* AC50 80022450 00000000 */  nop
/* AC54 80022454 260082A4 */  sh         $v0, 0x26($a0)
.L80022458:
/* AC58 80022458 2C00828C */  lw         $v0, 0x2C($a0)
/* AC5C 8002245C 00000000 */  nop
/* AC60 80022460 E9FF4010 */  beqz       $v0, .L80022408
/* AC64 80022464 00000000 */   nop
.L80022468:
/* AC68 80022468 2C0080AC */  sw         $zero, 0x2C($a0)
/* AC6C 8002246C 0800E003 */  jr         $ra
/* AC70 80022470 0800BD27 */   addiu     $sp, $sp, 0x8
