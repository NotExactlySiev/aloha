.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800F6C14
/* 47414 800F6C14 F4FF3927 */  addiu      $t9, $t9, -0xC
/* 47418 800F6C18 23103103 */  subu       $v0, $t9, $s1
/* 4741C 800F6C1C 06004004 */  bltz       $v0, .L800F6C38
/* 47420 800F6C20 00000000 */   nop
/* 47424 800F6C24 0800288F */  lw         $t0, 0x8($t9)
/* 47428 800F6C28 FCFF298F */  lw         $t1, -0x4($t9)
/* 4742C 800F6C2C 00000000 */  nop
/* 47430 800F6C30 03000911 */  beq        $t0, $t1, .L800F6C40
/* 47434 800F6C34 00000000 */   nop
.L800F6C38:
/* 47438 800F6C38 0800E003 */  jr         $ra
/* 4743C 800F6C3C 0C003927 */   addiu     $t9, $t9, 0xC
.L800F6C40:
/* 47440 800F6C40 0800E003 */  jr         $ra
/* 47444 800F6C44 00000000 */   nop
