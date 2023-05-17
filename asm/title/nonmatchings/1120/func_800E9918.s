.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E9918
/* A118 800E9918 000090E8 */  swc2       $16, 0x0($a0)
/* A11C 800E991C 0000B1E8 */  swc2       $17, 0x0($a1)
/* A120 800E9920 0000D2E8 */  swc2       $18, 0x0($a2)
/* A124 800E9924 0000F3E8 */  swc2       $19, 0x0($a3)
/* A128 800E9928 0800E003 */  jr         $ra
/* A12C 800E992C 00000000 */   nop
