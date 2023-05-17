.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026CC4
/* F4C4 80026CC4 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* F4C8 80026CC8 0480023C */  lui        $v0, %hi(D_80046EF8)
/* F4CC 80026CCC F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* F4D0 80026CD0 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* F4D4 80026CD4 000044AC */  sw         $a0, 0x0($v0)
/* F4D8 80026CD8 02160400 */  srl        $v0, $a0, 24
/* F4DC 80026CDC 80100200 */  sll        $v0, $v0, 2
/* F4E0 80026CE0 24208300 */  and        $a0, $a0, $v1
/* F4E4 80026CE4 0580013C */  lui        $at, %hi(D_800522F8)
/* F4E8 80026CE8 F8222124 */  addiu      $at, $at, %lo(D_800522F8)
/* F4EC 80026CEC 21082200 */  addu       $at, $at, $v0
/* F4F0 80026CF0 000024AC */  sw         $a0, 0x0($at)
/* F4F4 80026CF4 0800E003 */  jr         $ra
/* F4F8 80026CF8 00000000 */   nop
