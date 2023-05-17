.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F610
/* 7E10 8001F610 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7E14 8001F614 1800BFAF */  sw         $ra, 0x18($sp)
/* 7E18 8001F618 1000A0AF */  sw         $zero, 0x10($sp)
/* 7E1C 8001F61C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7E20 8001F620 1400A2AF */  sw         $v0, 0x14($sp)
/* 7E24 8001F624 002C0500 */  sll        $a1, $a1, 16
/* 7E28 8001F628 032C0500 */  sra        $a1, $a1, 16
/* 7E2C 8001F62C 00340600 */  sll        $a2, $a2, 16
/* 7E30 8001F630 03340600 */  sra        $a2, $a2, 16
/* 7E34 8001F634 937D000C */  jal        func_8001F64C
/* 7E38 8001F638 3C000734 */   ori       $a3, $zero, 0x3C
/* 7E3C 8001F63C 1800BF8F */  lw         $ra, 0x18($sp)
/* 7E40 8001F640 00000000 */  nop
/* 7E44 8001F644 0800E003 */  jr         $ra
/* 7E48 8001F648 2000BD27 */   addiu     $sp, $sp, 0x20
