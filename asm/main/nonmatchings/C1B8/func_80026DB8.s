.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026DB8
/* F5B8 80026DB8 0010023C */  lui        $v0, (0x10000000 >> 16)
/* F5BC 80026DBC 0480033C */  lui        $v1, %hi(D_80046EF8)
/* F5C0 80026DC0 F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* F5C4 80026DC4 25208200 */  or         $a0, $a0, $v0
/* F5C8 80026DC8 000064AC */  sw         $a0, 0x0($v1)
/* F5CC 80026DCC 0480023C */  lui        $v0, %hi(D_80046EF4)
/* F5D0 80026DD0 F46E428C */  lw         $v0, %lo(D_80046EF4)($v0)
/* F5D4 80026DD4 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* F5D8 80026DD8 0000428C */  lw         $v0, 0x0($v0)
/* F5DC 80026DDC FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* F5E0 80026DE0 0800E003 */  jr         $ra
/* F5E4 80026DE4 24104300 */   and       $v0, $v0, $v1
