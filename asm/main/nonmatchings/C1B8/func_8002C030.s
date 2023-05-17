.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C030
/* 14830 8002C030 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 14834 8002C034 0600A010 */  beqz       $a1, .L8002C050
/* 14838 8002C038 FFFFA224 */   addiu     $v0, $a1, -0x1
/* 1483C 8002C03C FFFF0324 */  addiu      $v1, $zero, -0x1
.L8002C040:
/* 14840 8002C040 000080AC */  sw         $zero, 0x0($a0)
/* 14844 8002C044 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 14848 8002C048 FDFF4314 */  bne        $v0, $v1, .L8002C040
/* 1484C 8002C04C 04008424 */   addiu     $a0, $a0, 0x4
.L8002C050:
/* 14850 8002C050 0800BD27 */  addiu      $sp, $sp, 0x8
/* 14854 8002C054 0800E003 */  jr         $ra
/* 14858 8002C058 00000000 */   nop
