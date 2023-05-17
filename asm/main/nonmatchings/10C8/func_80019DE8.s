.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019DE8
/* 25E8 80019DE8 0480023C */  lui        $v0, %hi(D_80047D5C)
/* 25EC 80019DEC 5C7D428C */  lw         $v0, %lo(D_80047D5C)($v0)
/* 25F0 80019DF0 0800E003 */  jr         $ra
/* 25F4 80019DF4 00000000 */   nop
