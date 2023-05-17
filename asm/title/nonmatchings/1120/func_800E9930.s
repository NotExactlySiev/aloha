.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E9930
/* A130 800E9930 00008CE8 */  swc2       $12, 0x0($a0)
/* A134 800E9934 0000ADE8 */  swc2       $13, 0x0($a1)
/* A138 800E9938 0000CEE8 */  swc2       $14, 0x0($a2)
/* A13C 800E993C 0800E003 */  jr         $ra
/* A140 800E9940 00000000 */   nop
