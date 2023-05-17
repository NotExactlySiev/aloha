.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002BC9C
/* 1449C 8002BC9C F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 144A0 8002BCA0 0600A010 */  beqz       $a1, .L8002BCBC
/* 144A4 8002BCA4 FFFFA224 */   addiu     $v0, $a1, -0x1
/* 144A8 8002BCA8 FFFF0324 */  addiu      $v1, $zero, -0x1
.L8002BCAC:
/* 144AC 8002BCAC 000080AC */  sw         $zero, 0x0($a0)
/* 144B0 8002BCB0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 144B4 8002BCB4 FDFF4314 */  bne        $v0, $v1, .L8002BCAC
/* 144B8 8002BCB8 04008424 */   addiu     $a0, $a0, 0x4
.L8002BCBC:
/* 144BC 8002BCBC 0800BD27 */  addiu      $sp, $sp, 0x8
/* 144C0 8002BCC0 0800E003 */  jr         $ra
/* 144C4 8002BCC4 00000000 */   nop
