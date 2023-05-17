.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1E98
/* 2698 800E1E98 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 269C 800E1E9C D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 26A0 800E1EA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 26A4 800E1EA4 1000BFAF */  sw         $ra, 0x10($sp)
/* 26A8 800E1EA8 E6006290 */  lbu        $v0, 0xE6($v1)
/* 26AC 800E1EAC 00260434 */  ori        $a0, $zero, 0x2600
/* 26B0 800E1EB0 0100422C */  sltiu      $v0, $v0, 0x1
/* 26B4 800E1EB4 E60062A0 */  sb         $v0, 0xE6($v1)
/* 26B8 800E1EB8 D582030C */  jal        func_800E0B54
/* 26BC 800E1EBC 00000000 */   nop
/* 26C0 800E1EC0 1000BF8F */  lw         $ra, 0x10($sp)
/* 26C4 800E1EC4 00000000 */  nop
/* 26C8 800E1EC8 0800E003 */  jr         $ra
/* 26CC 800E1ECC 1800BD27 */   addiu     $sp, $sp, 0x18
