.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1F60
/* 2760 800E1F60 0F80013C */  lui        $at, %hi(D_800F4E78)
/* 2764 800E1F64 784E20AC */  sw         $zero, %lo(D_800F4E78)($at)
/* 2768 800E1F68 F9FF023C */  lui        $v0, (0xFFF97000 >> 16)
/* 276C 800E1F6C 00704234 */  ori        $v0, $v0, (0xFFF97000 & 0xFFFF)
/* 2770 800E1F70 0F80013C */  lui        $at, %hi(D_800F4E80)
/* 2774 800E1F74 804E22AC */  sw         $v0, %lo(D_800F4E80)($at)
/* 2778 800E1F78 00E00234 */  ori        $v0, $zero, 0xE000
/* 277C 800E1F7C 0F80013C */  lui        $at, %hi(D_800F4E88)
/* 2780 800E1F80 884E22AC */  sw         $v0, %lo(D_800F4E88)($at)
/* 2784 800E1F84 0F80013C */  lui        $at, %hi(D_800F4EA8)
/* 2788 800E1F88 A84E20AC */  sw         $zero, %lo(D_800F4EA8)($at)
/* 278C 800E1F8C 0F80013C */  lui        $at, %hi(D_800F4E90)
/* 2790 800E1F90 904E20AC */  sw         $zero, %lo(D_800F4E90)($at)
/* 2794 800E1F94 0F80013C */  lui        $at, %hi(D_800F4E98)
/* 2798 800E1F98 984E20AC */  sw         $zero, %lo(D_800F4E98)($at)
/* 279C 800E1F9C 0F80013C */  lui        $at, %hi(D_800F4EA8)
/* 27A0 800E1FA0 A84E20AC */  sw         $zero, %lo(D_800F4EA8)($at)
/* 27A4 800E1FA4 01000234 */  ori        $v0, $zero, 0x1
/* 27A8 800E1FA8 0F80013C */  lui        $at, %hi(D_800F4EB0)
/* 27AC 800E1FAC B04E22AC */  sw         $v0, %lo(D_800F4EB0)($at)
/* 27B0 800E1FB0 0800E003 */  jr         $ra
/* 27B4 800E1FB4 00000000 */   nop
