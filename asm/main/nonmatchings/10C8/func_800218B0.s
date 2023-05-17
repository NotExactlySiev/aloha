.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800218B0
/* A0B0 800218B0 0480023C */  lui        $v0, %hi(D_80047E58)
/* A0B4 800218B4 587E428C */  lw         $v0, %lo(D_80047E58)($v0)
/* A0B8 800218B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A0BC 800218BC 03004010 */  beqz       $v0, .L800218CC
/* A0C0 800218C0 1000BFAF */   sw        $ra, 0x10($sp)
/* A0C4 800218C4 09F84000 */  jalr       $v0
/* A0C8 800218C8 00000000 */   nop
.L800218CC:
/* A0CC 800218CC 1000BF8F */  lw         $ra, 0x10($sp)
/* A0D0 800218D0 00000000 */  nop
/* A0D4 800218D4 0800E003 */  jr         $ra
/* A0D8 800218D8 1800BD27 */   addiu     $sp, $sp, 0x18
