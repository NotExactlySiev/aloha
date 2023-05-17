.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C298
/* 14A98 8002C298 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 14A9C 8002C29C 0600A010 */  beqz       $a1, .L8002C2B8
/* 14AA0 8002C2A0 FFFFA224 */   addiu     $v0, $a1, -0x1
/* 14AA4 8002C2A4 FFFF0324 */  addiu      $v1, $zero, -0x1
.L8002C2A8:
/* 14AA8 8002C2A8 000080AC */  sw         $zero, 0x0($a0)
/* 14AAC 8002C2AC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 14AB0 8002C2B0 FDFF4314 */  bne        $v0, $v1, .L8002C2A8
/* 14AB4 8002C2B4 04008424 */   addiu     $a0, $a0, 0x4
.L8002C2B8:
/* 14AB8 8002C2B8 0800BD27 */  addiu      $sp, $sp, 0x8
/* 14ABC 8002C2BC 0800E003 */  jr         $ra
/* 14AC0 8002C2C0 00000000 */   nop
