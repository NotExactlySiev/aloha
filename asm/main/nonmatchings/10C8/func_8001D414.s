.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D414
/* 5C14 8001D414 21180000 */  addu       $v1, $zero, $zero
.L8001D418:
/* 5C18 8001D418 0580013C */  lui        $at, %hi(D_80048090)
/* 5C1C 8001D41C 90802124 */  addiu      $at, $at, %lo(D_80048090)
/* 5C20 8001D420 21082300 */  addu       $at, $at, $v1
/* 5C24 8001D424 000020AC */  sw         $zero, 0x0($at)
/* 5C28 8001D428 08086324 */  addiu      $v1, $v1, 0x808
/* 5C2C 8001D42C 50506228 */  slti       $v0, $v1, 0x5050
/* 5C30 8001D430 F9FF4014 */  bnez       $v0, .L8001D418
/* 5C34 8001D434 00000000 */   nop
/* 5C38 8001D438 0800E003 */  jr         $ra
/* 5C3C 8001D43C 00000000 */   nop
