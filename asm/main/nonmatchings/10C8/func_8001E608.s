.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E608
/* 6E08 8001E608 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6E0C 8001E60C 0B008014 */  bnez       $a0, .L8001E63C
/* 6E10 8001E610 1000BFAF */   sw        $ra, 0x10($sp)
/* 6E14 8001E614 0480023C */  lui        $v0, %hi(D_80047E0C)
/* 6E18 8001E618 0C7E428C */  lw         $v0, %lo(D_80047E0C)($v0)
/* 6E1C 8001E61C 00000000 */  nop
/* 6E20 8001E620 05004014 */  bnez       $v0, .L8001E638
/* 6E24 8001E624 01000234 */   ori       $v0, $zero, 0x1
/* 6E28 8001E628 0480013C */  lui        $at, %hi(D_80047E0C)
/* 6E2C 8001E62C 0C7E22AC */  sw         $v0, %lo(D_80047E0C)($at)
/* 6E30 8001E630 8F790008 */  j          .L8001E63C
/* 6E34 8001E634 00000000 */   nop
.L8001E638:
/* 6E38 8001E638 21200000 */  addu       $a0, $zero, $zero
.L8001E63C:
/* 6E3C 8001E63C 4E8F000C */  jal        func_80023D38
/* 6E40 8001E640 00000000 */   nop
/* 6E44 8001E644 1000BF8F */  lw         $ra, 0x10($sp)
/* 6E48 8001E648 00000000 */  nop
/* 6E4C 8001E64C 0800E003 */  jr         $ra
/* 6E50 8001E650 1800BD27 */   addiu     $sp, $sp, 0x18
