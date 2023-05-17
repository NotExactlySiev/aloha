.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80018A8C
/* 128C 80018A8C 05008010 */  beqz       $a0, .L80018AA4
/* 1290 80018A90 01000234 */   ori       $v0, $zero, 0x1
/* 1294 80018A94 0480013C */  lui        $at, %hi(D_80047D4C)
/* 1298 80018A98 4C7D22AC */  sw         $v0, %lo(D_80047D4C)($at)
/* 129C 80018A9C AB620008 */  j          .L80018AAC
/* 12A0 80018AA0 00000000 */   nop
.L80018AA4:
/* 12A4 80018AA4 0480013C */  lui        $at, %hi(D_80047D4C)
/* 12A8 80018AA8 4C7D20AC */  sw         $zero, %lo(D_80047D4C)($at)
.L80018AAC:
/* 12AC 80018AAC 0800E003 */  jr         $ra
/* 12B0 80018AB0 00000000 */   nop
