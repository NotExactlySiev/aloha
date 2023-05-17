.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E98F8
/* A0F8 800E98F8 000093E8 */  swc2       $19, 0x0($a0)
/* A0FC 800E98FC 0800E003 */  jr         $ra
/* A100 800E9900 00000000 */   nop
