.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C564
/* 4D64 8001C564 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 4D68 8001C568 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 4D6C 8001C56C 2800B0AF */  sw         $s0, 0x28($sp)
/* 4D70 8001C570 DF69000C */  jal        func_8001A77C
/* 4D74 8001C574 21808000 */   addu      $s0, $a0, $zero
/* 4D78 8001C578 536E000C */  jal        func_8001B94C
/* 4D7C 8001C57C 00000000 */   nop
/* 4D80 8001C580 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 4D84 8001C584 03004314 */  bne        $v0, $v1, .L8001C594
/* 4D88 8001C588 1000A427 */   addiu     $a0, $sp, 0x10
/* 4D8C 8001C58C 6B710008 */  j          .L8001C5AC
/* 4D90 8001C590 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001C594:
/* 4D94 8001C594 0671000C */  jal        func_8001C418
/* 4D98 8001C598 21280002 */   addu      $a1, $s0, $zero
/* 4D9C 8001C59C 21184000 */  addu       $v1, $v0, $zero
/* 4DA0 8001C5A0 02006010 */  beqz       $v1, .L8001C5AC
/* 4DA4 8001C5A4 FEFF0224 */   addiu     $v0, $zero, -0x2
/* 4DA8 8001C5A8 1400A28F */  lw         $v0, 0x14($sp)
.L8001C5AC:
/* 4DAC 8001C5AC 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 4DB0 8001C5B0 2800B08F */  lw         $s0, 0x28($sp)
/* 4DB4 8001C5B4 0800E003 */  jr         $ra
/* 4DB8 8001C5B8 3000BD27 */   addiu     $sp, $sp, 0x30
