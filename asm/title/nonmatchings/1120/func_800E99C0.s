.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E99C0
/* A1C0 800E99C0 00C04848 */  cfc2       $t0, $24 # handwritten instruction
/* A1C4 800E99C4 00C84948 */  cfc2       $t1, $25 # handwritten instruction
/* A1C8 800E99C8 03440800 */  sra        $t0, $t0, 16
/* A1CC 800E99CC 034C0900 */  sra        $t1, $t1, 16
/* A1D0 800E99D0 000088AC */  sw         $t0, 0x0($a0)
/* A1D4 800E99D4 0000A9AC */  sw         $t1, 0x0($a1)
/* A1D8 800E99D8 0800E003 */  jr         $ra
/* A1DC 800E99DC 00000000 */   nop
