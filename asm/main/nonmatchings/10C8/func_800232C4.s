.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800232C4
/* BAC4 800232C4 0280013C */  lui        $at, %hi(D_800234B4)
/* BAC8 800232C8 B4342124 */  addiu      $at, $at, %lo(D_800234B4)
/* BACC 800232CC 0800E003 */  jr         $ra
/* BAD0 800232D0 000024AC */   sw        $a0, 0x0($at)
