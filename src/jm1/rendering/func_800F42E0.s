.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800F42E0
/* 44AE0 800F42E0 0F80013C */  lui        $at, %hi(D_800F42F0)
/* 44AE4 800F42E4 F04224AC */  sw         $a0, %lo(D_800F42F0)($at)
/* 44AE8 800F42E8 0800E003 */  jr         $ra
/* 44AEC 800F42EC 00000000 */   nop
# pointer in ot. what does it do? critical point in buffer?
# referenced by:
#   draw_mesh (read once)
#   FUCK (read twice, once in clipping)
#   this function right here ^
glabel D_800F42F0
/* 44AF0 800F42F0 00000000 */  .word    0x00000000
