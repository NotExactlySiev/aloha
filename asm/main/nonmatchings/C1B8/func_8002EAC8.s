.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002EAC8
/* 172C8 8002EAC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 172CC 8002EACC 1000BFAF */  sw         $ra, 0x10($sp)
/* 172D0 8002EAD0 0580013C */  lui        $at, %hi(D_80054714)
/* 172D4 8002EAD4 144720AC */  sw         $zero, %lo(D_80054714)($at)
/* 172D8 8002EAD8 0580013C */  lui        $at, %hi(D_80054700)
/* 172DC 8002EADC 004720AC */  sw         $zero, %lo(D_80054700)($at)
/* 172E0 8002EAE0 5EC2000C */  jal        func_80030978
/* 172E4 8002EAE4 21200000 */   addu      $a0, $zero, $zero
/* 172E8 8002EAE8 01000234 */  ori        $v0, $zero, 0x1
/* 172EC 8002EAEC 1000BF8F */  lw         $ra, 0x10($sp)
/* 172F0 8002EAF0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 172F4 8002EAF4 0800E003 */  jr         $ra
/* 172F8 8002EAF8 00000000 */   nop
