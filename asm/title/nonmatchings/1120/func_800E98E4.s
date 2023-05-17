.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E98E4
/* A0E4 800E98E4 000089E8 */  swc2       $9, 0x0($a0)
/* A0E8 800E98E8 0000AAE8 */  swc2       $10, 0x0($a1)
/* A0EC 800E98EC 0000CBE8 */  swc2       $11, 0x0($a2)
/* A0F0 800E98F0 0800E003 */  jr         $ra
/* A0F4 800E98F4 00000000 */   nop
