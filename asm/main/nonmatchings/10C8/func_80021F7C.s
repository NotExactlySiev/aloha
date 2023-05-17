.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021F7C
/* A77C 80021F7C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A780 80021F80 1800BFAF */  sw         $ra, 0x18($sp)
/* A784 80021F84 1400B1AF */  sw         $s1, 0x14($sp)
/* A788 80021F88 1000B0AF */  sw         $s0, 0x10($sp)
/* A78C 80021F8C 21808000 */  addu       $s0, $a0, $zero
/* A790 80021F90 2188A000 */  addu       $s1, $a1, $zero
/* A794 80021F94 15000434 */  ori        $a0, $zero, 0x15
.L80021F98:
/* A798 80021F98 21280002 */  addu       $a1, $s0, $zero
/* A79C 80021F9C C5A0000C */  jal        func_80028314
/* A7A0 80021FA0 21300000 */   addu      $a2, $zero, $zero
/* A7A4 80021FA4 FCFF4010 */  beqz       $v0, .L80021F98
/* A7A8 80021FA8 15000434 */   ori       $a0, $zero, 0x15
.L80021FAC:
/* A7AC 80021FAC FDA1000C */  jal        func_800287F4
/* A7B0 80021FB0 00012436 */   ori       $a0, $s1, 0x100
/* A7B4 80021FB4 FDFF4010 */  beqz       $v0, .L80021FAC
/* A7B8 80021FB8 00000000 */   nop
/* A7BC 80021FBC 1800BF8F */  lw         $ra, 0x18($sp)
/* A7C0 80021FC0 1400B18F */  lw         $s1, 0x14($sp)
/* A7C4 80021FC4 1000B08F */  lw         $s0, 0x10($sp)
/* A7C8 80021FC8 0800E003 */  jr         $ra
/* A7CC 80021FCC 2000BD27 */   addiu     $sp, $sp, 0x20
