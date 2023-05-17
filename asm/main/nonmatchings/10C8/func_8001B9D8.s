.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001B9D8
/* 41D8 8001B9D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 41DC 8001B9DC 1000BFAF */  sw         $ra, 0x10($sp)
/* 41E0 8001B9E0 4174000C */  jal        func_8001D104
/* 41E4 8001B9E4 00000000 */   nop
/* 41E8 8001B9E8 0480033C */  lui        $v1, %hi(D_80047F1C)
/* 41EC 8001B9EC 1C7F638C */  lw         $v1, %lo(D_80047F1C)($v1)
/* 41F0 8001B9F0 03000234 */  ori        $v0, $zero, 0x3
/* 41F4 8001B9F4 03006214 */  bne        $v1, $v0, .L8001BA04
/* 41F8 8001B9F8 00000000 */   nop
/* 41FC 8001B9FC E068000C */  jal        func_8001A380
/* 4200 8001BA00 00000000 */   nop
.L8001BA04:
/* 4204 8001BA04 BD70000C */  jal        func_8001C2F4
/* 4208 8001BA08 00000000 */   nop
/* 420C 8001BA0C FE000434 */  ori        $a0, $zero, 0xFE
/* 4210 8001BA10 01000534 */  ori        $a1, $zero, 0x1
/* 4214 8001BA14 086C000C */  jal        func_8001B020
/* 4218 8001BA18 21300000 */   addu      $a2, $zero, $zero
/* 421C 8001BA1C 0480013C */  lui        $at, %hi(D_80047DE8)
/* 4220 8001BA20 E87D20AC */  sw         $zero, %lo(D_80047DE8)($at)
/* 4224 8001BA24 01000234 */  ori        $v0, $zero, 0x1
/* 4228 8001BA28 0480013C */  lui        $at, %hi(D_80047F24)
/* 422C 8001BA2C 247F22AC */  sw         $v0, %lo(D_80047F24)($at)
/* 4230 8001BA30 0580013C */  lui        $at, %hi(D_800548EC)
/* 4234 8001BA34 EC4822AC */  sw         $v0, %lo(D_800548EC)($at)
/* 4238 8001BA38 0480013C */  lui        $at, %hi(D_80047DE4)
/* 423C 8001BA3C E47D22AC */  sw         $v0, %lo(D_80047DE4)($at)
/* 4240 8001BA40 1000BF8F */  lw         $ra, 0x10($sp)
/* 4244 8001BA44 00000000 */  nop
/* 4248 8001BA48 0800E003 */  jr         $ra
/* 424C 8001BA4C 1800BD27 */   addiu     $sp, $sp, 0x18
