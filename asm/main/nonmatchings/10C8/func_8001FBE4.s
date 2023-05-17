.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FBE4
/* 83E4 8001FBE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 83E8 8001FBE8 1000BFAF */  sw         $ra, 0x10($sp)
/* 83EC 8001FBEC 0480033C */  lui        $v1, %hi(D_80047E14)
/* 83F0 8001FBF0 147E638C */  lw         $v1, %lo(D_80047E14)($v1)
/* 83F4 8001FBF4 01000234 */  ori        $v0, $zero, 0x1
/* 83F8 8001FBF8 0A006214 */  bne        $v1, $v0, .L8001FC24
/* 83FC 8001FBFC 00000000 */   nop
/* 8400 8001FC00 0480023C */  lui        $v0, %hi(D_80047E10)
/* 8404 8001FC04 107E428C */  lw         $v0, %lo(D_80047E10)($v0)
/* 8408 8001FC08 00000000 */  nop
/* 840C 8001FC0C 05004314 */  bne        $v0, $v1, .L8001FC24
/* 8410 8001FC10 00000000 */   nop
/* 8414 8001FC14 61C4000C */  jal        func_80031184
/* 8418 8001FC18 01000434 */   ori       $a0, $zero, 0x1
/* 841C 8001FC1C 0480013C */  lui        $at, %hi(D_80047E14)
/* 8420 8001FC20 147E20AC */  sw         $zero, %lo(D_80047E14)($at)
.L8001FC24:
/* 8424 8001FC24 1000BF8F */  lw         $ra, 0x10($sp)
/* 8428 8001FC28 00000000 */  nop
/* 842C 8001FC2C 0800E003 */  jr         $ra
/* 8430 8001FC30 1800BD27 */   addiu     $sp, $sp, 0x18
