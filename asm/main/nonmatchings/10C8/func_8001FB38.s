.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FB38
/* 8338 8001FB38 1F008430 */  andi       $a0, $a0, 0x1F
/* 833C 8001FB3C 00210400 */  sll        $a0, $a0, 4
/* 8340 8001FB40 0580013C */  lui        $at, %hi(D_8005206A)
/* 8344 8001FB44 6A202124 */  addiu      $at, $at, %lo(D_8005206A)
/* 8348 8001FB48 21082400 */  addu       $at, $at, $a0
/* 834C 8001FB4C 00002284 */  lh         $v0, 0x0($at)
/* 8350 8001FB50 0800E003 */  jr         $ra
/* 8354 8001FB54 00000000 */   nop
