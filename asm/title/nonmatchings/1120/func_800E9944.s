.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E9944
/* A144 800E9944 000094E8 */  swc2       $20, 0x0($a0)
/* A148 800E9948 0000B5E8 */  swc2       $21, 0x0($a1)
/* A14C 800E994C 0000D6E8 */  swc2       $22, 0x0($a2)
/* A150 800E9950 0800E003 */  jr         $ra
/* A154 800E9954 00000000 */   nop
