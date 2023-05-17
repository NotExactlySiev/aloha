.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002E42C
/* 16C2C 8002E42C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 16C30 8002E430 0480033C */  lui        $v1, %hi(D_80047D04)
/* 16C34 8002E434 047D638C */  lw         $v1, %lo(D_80047D04)($v1)
/* 16C38 8002E438 01000234 */  ori        $v0, $zero, 0x1
/* 16C3C 8002E43C 13006214 */  bne        $v1, $v0, .L8002E48C
/* 16C40 8002E440 1000BFAF */   sw        $ra, 0x10($sp)
/* 16C44 8002E444 0480013C */  lui        $at, %hi(D_80047D04)
/* 16C48 8002E448 047D20AC */  sw         $zero, %lo(D_80047D04)($at)
/* 16C4C 8002E44C 728E000C */  jal        func_800239C8
/* 16C50 8002E450 00000000 */   nop
/* 16C54 8002E454 0480043C */  lui        $a0, %hi(D_800478DC)
/* 16C58 8002E458 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 16C5C 8002E45C B2BA000C */  jal        func_8002EAC8
/* 16C60 8002E460 00000000 */   nop
/* 16C64 8002E464 0480043C */  lui        $a0, %hi(D_800478F4)
/* 16C68 8002E468 F478848C */  lw         $a0, %lo(D_800478F4)($a0)
/* 16C6C 8002E46C 6A8E000C */  jal        k_CloseEvent
/* 16C70 8002E470 00000000 */   nop
/* 16C74 8002E474 0480043C */  lui        $a0, %hi(D_800478F4)
/* 16C78 8002E478 F478848C */  lw         $a0, %lo(D_800478F4)($a0)
/* 16C7C 8002E47C 27B9000C */  jal        func_8002E49C
/* 16C80 8002E480 00000000 */   nop
/* 16C84 8002E484 068F000C */  jal        func_80023C18
/* 16C88 8002E488 00000000 */   nop
.L8002E48C:
/* 16C8C 8002E48C 1000BF8F */  lw         $ra, 0x10($sp)
/* 16C90 8002E490 1800BD27 */  addiu      $sp, $sp, 0x18
/* 16C94 8002E494 0800E003 */  jr         $ra
/* 16C98 8002E498 00000000 */   nop
