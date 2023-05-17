.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019F4C
/* 274C 80019F4C 0480023C */  lui        $v0, %hi(D_80047DF0)
/* 2750 80019F50 F07D428C */  lw         $v0, %lo(D_80047DF0)($v0)
/* 2754 80019F54 01000334 */  ori        $v1, $zero, 0x1
/* 2758 80019F58 15004310 */  beq        $v0, $v1, .L80019FB0
/* 275C 80019F5C 02000534 */   ori       $a1, $zero, 0x2
/* 2760 80019F60 0480013C */  lui        $at, %hi(D_80047DF0)
/* 2764 80019F64 F07D23AC */  sw         $v1, %lo(D_80047DF0)($at)
/* 2768 80019F68 09008510 */  beq        $a0, $a1, .L80019F90
/* 276C 80019F6C 03008228 */   slti      $v0, $a0, 0x3
/* 2770 80019F70 0D004014 */  bnez       $v0, .L80019FA8
/* 2774 80019F74 03000234 */   ori       $v0, $zero, 0x3
/* 2778 80019F78 0B008210 */  beq        $a0, $v0, .L80019FA8
/* 277C 80019F7C 05000234 */   ori       $v0, $zero, 0x5
/* 2780 80019F80 07008210 */  beq        $a0, $v0, .L80019FA0
/* 2784 80019F84 00000000 */   nop
/* 2788 80019F88 EA670008 */  j          .L80019FA8
/* 278C 80019F8C 00000000 */   nop
.L80019F90:
/* 2790 80019F90 0480013C */  lui        $at, %hi(D_80047DD8)
/* 2794 80019F94 D87D23AC */  sw         $v1, %lo(D_80047DD8)($at)
/* 2798 80019F98 EA670008 */  j          .L80019FA8
/* 279C 80019F9C 00000000 */   nop
.L80019FA0:
/* 27A0 80019FA0 0480013C */  lui        $at, %hi(D_80047DD8)
/* 27A4 80019FA4 D87D25AC */  sw         $a1, %lo(D_80047DD8)($at)
.L80019FA8:
/* 27A8 80019FA8 0480013C */  lui        $at, %hi(D_80047DF0)
/* 27AC 80019FAC F07D20AC */  sw         $zero, %lo(D_80047DF0)($at)
.L80019FB0:
/* 27B0 80019FB0 0800E003 */  jr         $ra
/* 27B4 80019FB4 00000000 */   nop
