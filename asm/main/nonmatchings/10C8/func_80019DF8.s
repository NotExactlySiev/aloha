.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019DF8
/* 25F8 80019DF8 0180023C */  lui        $v0, (0x80014000 >> 16)
/* 25FC 80019DFC 0800E003 */  jr         $ra
/* 2600 80019E00 00404234 */   ori       $v0, $v0, (0x80014000 & 0xFFFF)
