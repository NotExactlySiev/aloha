.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002BD7C
/* 1457C 8002BD7C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14580 8002BD80 0480043C */  lui        $a0, %hi(D_800473BC)
/* 14584 8002BD84 BC738424 */  addiu      $a0, $a0, %lo(D_800473BC)
/* 14588 8002BD88 1000BFAF */  sw         $ra, 0x10($sp)
/* 1458C 8002BD8C 000080A4 */  sh         $zero, 0x0($a0)
/* 14590 8002BD90 0CB0000C */  jal        func_8002C030
/* 14594 8002BD94 09000534 */   ori       $a1, $zero, 0x9
/* 14598 8002BD98 03000434 */  ori        $a0, $zero, 0x3
/* 1459C 8002BD9C 0480023C */  lui        $v0, %hi(D_800473E0)
/* 145A0 8002BDA0 E073428C */  lw         $v0, %lo(D_800473E0)($v0)
/* 145A4 8002BDA4 21280000 */  addu       $a1, $zero, $zero
/* 145A8 8002BDA8 000040AC */  sw         $zero, 0x0($v0)
/* 145AC 8002BDAC D4AD000C */  jal        func_8002B750
/* 145B0 8002BDB0 00000000 */   nop
/* 145B4 8002BDB4 1000BF8F */  lw         $ra, 0x10($sp)
/* 145B8 8002BDB8 1800BD27 */  addiu      $sp, $sp, 0x18
/* 145BC 8002BDBC 0800E003 */  jr         $ra
/* 145C0 8002BDC0 00000000 */   nop
