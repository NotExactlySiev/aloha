.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E14CC
/* 1CCC 800E14CC 1A80033C */  lui        $v1, %hi(D_801A0FA8)
/* 1CD0 800E14D0 A80F638C */  lw         $v1, %lo(D_801A0FA8)($v1)
/* 1CD4 800E14D4 01000234 */  ori        $v0, $zero, 0x1
/* 1CD8 800E14D8 0C006214 */  bne        $v1, $v0, .L800E150C
/* 1CDC 800E14DC 00000000 */   nop
/* 1CE0 800E14E0 1A80023C */  lui        $v0, %hi(D_801A0F98)
/* 1CE4 800E14E4 980F428C */  lw         $v0, %lo(D_801A0F98)($v0)
/* 1CE8 800E14E8 00000000 */  nop
/* 1CEC 800E14EC 05004018 */  blez       $v0, .L800E1504
/* 1CF0 800E14F0 FFFF4224 */   addiu     $v0, $v0, -0x1
/* 1CF4 800E14F4 1A80013C */  lui        $at, %hi(D_801A0F98)
/* 1CF8 800E14F8 980F22AC */  sw         $v0, %lo(D_801A0F98)($at)
/* 1CFC 800E14FC 43850308 */  j          .L800E150C
/* 1D00 800E1500 00000000 */   nop
.L800E1504:
/* 1D04 800E1504 1A80013C */  lui        $at, %hi(D_801A0FA8)
/* 1D08 800E1508 A80F20AC */  sw         $zero, %lo(D_801A0FA8)($at)
.L800E150C:
/* 1D0C 800E150C 0800E003 */  jr         $ra
/* 1D10 800E1510 00000000 */   nop
