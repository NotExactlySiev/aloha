.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C05C
/* 1485C 8002C05C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14860 8002C060 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 14864 8002C064 1400BFAF */  sw         $ra, 0x14($sp)
/* 14868 8002C068 1000B0AF */  sw         $s0, 0x10($sp)
/* 1486C 8002C06C 0580013C */  lui        $at, %hi(D_80054758)
/* 14870 8002C070 584724AC */  sw         $a0, %lo(D_80054758)($at)
/* 14874 8002C074 0580013C */  lui        $at, %hi(D_800546D0)
/* 14878 8002C078 D04622AC */  sw         $v0, %lo(D_800546D0)($at)
/* 1487C 8002C07C C8AD000C */  jal        func_8002B720
/* 14880 8002C080 00000000 */   nop
/* 14884 8002C084 0020043C */  lui        $a0, (0x20000001 >> 16)
/* 14888 8002C088 0580053C */  lui        $a1, %hi(D_800546D0)
/* 1488C 8002C08C D046A524 */  addiu      $a1, $a1, %lo(D_800546D0)
/* 14890 8002C090 4BB0000C */  jal        func_8002C12C
/* 14894 8002C094 01008434 */   ori       $a0, $a0, (0x20000001 & 0xFFFF)
/* 14898 8002C098 21200000 */  addu       $a0, $zero, $zero
/* 1489C 8002C09C EA8E000C */  jal        func_80023BA8
/* 148A0 8002C0A0 21804000 */   addu      $s0, $v0, $zero
/* 148A4 8002C0A4 21100002 */  addu       $v0, $s0, $zero
/* 148A8 8002C0A8 1400BF8F */  lw         $ra, 0x14($sp)
/* 148AC 8002C0AC 1000B08F */  lw         $s0, 0x10($sp)
/* 148B0 8002C0B0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 148B4 8002C0B4 0800E003 */  jr         $ra
/* 148B8 8002C0B8 00000000 */   nop
