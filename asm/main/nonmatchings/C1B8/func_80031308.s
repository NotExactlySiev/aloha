.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031308
/* 19B08 80031308 01000234 */  ori        $v0, $zero, 0x1
/* 19B0C 8003130C 05008214 */  bne        $a0, $v0, .L80031324
/* 19B10 80031310 00000000 */   nop
/* 19B14 80031314 0580013C */  lui        $at, %hi(D_80054704)
/* 19B18 80031318 044720AC */  sw         $zero, %lo(D_80054704)($at)
/* 19B1C 8003131C CBC40008 */  j          .L8003132C
/* 19B20 80031320 00000000 */   nop
.L80031324:
/* 19B24 80031324 0580013C */  lui        $at, %hi(D_80054704)
/* 19B28 80031328 044722AC */  sw         $v0, %lo(D_80054704)($at)
.L8003132C:
/* 19B2C 8003132C 0800E003 */  jr         $ra
/* 19B30 80031330 00000000 */   nop
