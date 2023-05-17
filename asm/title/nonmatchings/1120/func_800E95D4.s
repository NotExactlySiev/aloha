.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E95D4
/* 9DD4 800E95D4 0F800E3C */  lui        $t6, %hi(D_800F05FC)
/* 9DD8 800E95D8 FC05CE8D */  lw         $t6, %lo(D_800F05FC)($t6)
/* 9DDC 800E95DC 00000000 */  nop
/* 9DE0 800E95E0 0A00C01D */  bgtz       $t6, .L800E960C
/* 9DE4 800E95E4 0F80013C */   lui       $at, %hi(D_800F05F0)
/* 9DE8 800E95E8 F0053FAC */  sw         $ra, %lo(D_800F05F0)($at)
/* 9DEC 800E95EC 0F80043C */  lui        $a0, %hi(D_800F08B1)
/* 9DF0 800E95F0 1BA2030C */  jal        func_800E886C
/* 9DF4 800E95F4 B1088424 */   addiu     $a0, $a0, %lo(D_800F08B1)
/* 9DF8 800E95F8 0F801F3C */  lui        $ra, %hi(D_800F05F0)
/* 9DFC 800E95FC F005FF8F */  lw         $ra, %lo(D_800F05F0)($ra)
/* 9E00 800E9600 00000000 */  nop
/* 9E04 800E9604 0800E003 */  jr         $ra
/* 9E08 800E9608 00000000 */   nop
.L800E960C:
/* 9E0C 800E960C E0FFCE21 */  addi       $t6, $t6, -0x20 # handwritten instruction
/* 9E10 800E9610 0F80013C */  lui        $at, %hi(D_800F05FC)
/* 9E14 800E9614 FC052EAC */  sw         $t6, %lo(D_800F05FC)($at)
/* 9E18 800E9618 0F800F3C */  lui        $t7, %hi(D_800F0600)
/* 9E1C 800E961C 2178EE01 */  addu       $t7, $t7, $t6
/* 9E20 800E9620 0006EF25 */  addiu      $t7, $t7, %lo(D_800F0600)
/* 9E24 800E9624 0000E88D */  lw         $t0, 0x0($t7)
/* 9E28 800E9628 0400E98D */  lw         $t1, 0x4($t7)
/* 9E2C 800E962C 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* 9E30 800E9630 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* 9E34 800E9634 0800E88D */  lw         $t0, 0x8($t7)
/* 9E38 800E9638 0C00E98D */  lw         $t1, 0xC($t7)
/* 9E3C 800E963C 0010C848 */  ctc2       $t0, $2 # handwritten instruction
/* 9E40 800E9640 0018C948 */  ctc2       $t1, $3 # handwritten instruction
/* 9E44 800E9644 1000E88D */  lw         $t0, 0x10($t7)
/* 9E48 800E9648 00000000 */  nop
/* 9E4C 800E964C 0020C848 */  ctc2       $t0, $4 # handwritten instruction
/* 9E50 800E9650 00000000 */  nop
/* 9E54 800E9654 1400E88D */  lw         $t0, 0x14($t7)
/* 9E58 800E9658 1800E98D */  lw         $t1, 0x18($t7)
/* 9E5C 800E965C 1C00EA8D */  lw         $t2, 0x1C($t7)
/* 9E60 800E9660 0028C848 */  ctc2       $t0, $5 # handwritten instruction
/* 9E64 800E9664 0030C948 */  ctc2       $t1, $6 # handwritten instruction
/* 9E68 800E9668 0038CA48 */  ctc2       $t2, $7 # handwritten instruction
/* 9E6C 800E966C 0800E003 */  jr         $ra
/* 9E70 800E9670 00000000 */   nop
