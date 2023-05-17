.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002AA48
/* 13248 8002AA48 0580013C */  lui        $at, %hi(D_800536BC)
/* 1324C 8002AA4C BC3624AC */  sw         $a0, %lo(D_800536BC)($at)
/* 13250 8002AA50 0580013C */  lui        $at, %hi(D_800536C0)
/* 13254 8002AA54 C03625AC */  sw         $a1, %lo(D_800536C0)($at)
/* 13258 8002AA58 0580013C */  lui        $at, %hi(D_800536C4)
/* 1325C 8002AA5C C43626AC */  sw         $a2, %lo(D_800536C4)($at)
/* 13260 8002AA60 0800E003 */  jr         $ra
/* 13264 8002AA64 00000000 */   nop
