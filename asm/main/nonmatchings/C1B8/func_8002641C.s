.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002641C
/* EC1C 8002641C 0480023C */  lui        $v0, %hi(D_80046EF8)
/* EC20 80026420 F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* EC24 80026424 00000000 */  nop
/* EC28 80026428 0000428C */  lw         $v0, 0x0($v0)
/* EC2C 8002642C 0800E003 */  jr         $ra
/* EC30 80026430 00000000 */   nop
