.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E9904
/* A104 800E9904 000091E8 */  swc2       $17, 0x0($a0)
/* A108 800E9908 0000B2E8 */  swc2       $18, 0x0($a1)
/* A10C 800E990C 0000D3E8 */  swc2       $19, 0x0($a2)
/* A110 800E9910 0800E003 */  jr         $ra
/* A114 800E9914 00000000 */   nop
