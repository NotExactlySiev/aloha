.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026CFC
/* F4FC 80026CFC 80100400 */  sll        $v0, $a0, 2
/* F500 80026D00 0580013C */  lui        $at, %hi(D_800522F8)
/* F504 80026D04 F8222124 */  addiu      $at, $at, %lo(D_800522F8)
/* F508 80026D08 21082200 */  addu       $at, $at, $v0
/* F50C 80026D0C 0000228C */  lw         $v0, 0x0($at)
/* F510 80026D10 00260400 */  sll        $a0, $a0, 24
/* F514 80026D14 0800E003 */  jr         $ra
/* F518 80026D18 25108200 */   or        $v0, $a0, $v0
