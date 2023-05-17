.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020DE8
/* 95E8 80020DE8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 95EC 80020DEC 1800BFAF */  sw         $ra, 0x18($sp)
/* 95F0 80020DF0 1400B1AF */  sw         $s1, 0x14($sp)
/* 95F4 80020DF4 1000B0AF */  sw         $s0, 0x10($sp)
/* 95F8 80020DF8 0480113C */  lui        $s1, %hi(D_80047E20)
/* 95FC 80020DFC 207E318E */  lw         $s1, %lo(D_80047E20)($s1)
/* 9600 80020E00 E770000C */  jal        func_8001C39C
/* 9604 80020E04 21808000 */   addu      $s0, $a0, $zero
/* 9608 80020E08 DE77000C */  jal        func_8001DF78
/* 960C 80020E0C 21200002 */   addu      $a0, $s0, $zero
/* 9610 80020E10 0480013C */  lui        $at, %hi(D_80047E20)
/* 9614 80020E14 207E30AC */  sw         $s0, %lo(D_80047E20)($at)
/* 9618 80020E18 21102002 */  addu       $v0, $s1, $zero
/* 961C 80020E1C 1800BF8F */  lw         $ra, 0x18($sp)
/* 9620 80020E20 1400B18F */  lw         $s1, 0x14($sp)
/* 9624 80020E24 1000B08F */  lw         $s0, 0x10($sp)
/* 9628 80020E28 0800E003 */  jr         $ra
/* 962C 80020E2C 2000BD27 */   addiu     $sp, $sp, 0x20
