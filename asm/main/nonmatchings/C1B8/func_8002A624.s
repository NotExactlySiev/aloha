.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A624
/* 12E24 8002A624 B0000A24 */  addiu      $t2, $zero, 0xB0
/* 12E28 8002A628 08004001 */  jr         $t2
/* 12E2C 8002A62C 07000924 */   addiu     $t1, $zero, 0x7
/* 12E30 8002A630 00000000 */  nop
