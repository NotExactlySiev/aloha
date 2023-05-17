.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E975C
/* 9F5C 800E975C 000082C8 */  lwc2       $2, 0x0($a0)
/* 9F60 800E9760 040083C8 */  lwc2       $3, 0x4($a0)
/* 9F64 800E9764 0800E003 */  jr         $ra
/* 9F68 800E9768 00000000 */   nop
