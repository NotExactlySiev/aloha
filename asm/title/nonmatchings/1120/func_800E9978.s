.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9978
/* A178 800E9978 00E80848 */  mfc2       $t0, $29 # handwritten instruction
/* A17C 800E997C 00000000 */  nop
/* A180 800E9980 1F000931 */  andi       $t1, $t0, 0x1F
/* A184 800E9984 000089AC */  sw         $t1, 0x0($a0)
/* A188 800E9988 E0030931 */  andi       $t1, $t0, 0x3E0
/* A18C 800E998C 42490900 */  srl        $t1, $t1, 5
/* A190 800E9990 040089AC */  sw         $t1, 0x4($a0)
/* A194 800E9994 007C0931 */  andi       $t1, $t0, 0x7C00
/* A198 800E9998 824A0900 */  srl        $t1, $t1, 10
/* A19C 800E999C 080089AC */  sw         $t1, 0x8($a0)
/* A1A0 800E99A0 0800E003 */  jr         $ra
/* A1A4 800E99A4 00000000 */   nop
