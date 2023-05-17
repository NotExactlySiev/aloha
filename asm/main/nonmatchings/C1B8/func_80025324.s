.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025324
/* DB24 80025324 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DB28 80025328 1000B0AF */  sw         $s0, 0x10($sp)
/* DB2C 8002532C 21808000 */  addu       $s0, $a0, $zero
/* DB30 80025330 1400B1AF */  sw         $s1, 0x14($sp)
/* DB34 80025334 2188A000 */  addu       $s1, $a1, $zero
/* DB38 80025338 0280043C */  lui        $a0, %hi(D_80018330)
/* DB3C 8002533C 30838424 */  addiu      $a0, $a0, %lo(D_80018330)
/* DB40 80025340 1800BFAF */  sw         $ra, 0x18($sp)
/* DB44 80025344 4594000C */  jal        func_80025114
/* DB48 80025348 21280002 */   addu      $a1, $s0, $zero
/* DB4C 8002534C 21280002 */  addu       $a1, $s0, $zero
/* DB50 80025350 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DB54 80025354 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DB58 80025358 08000634 */  ori        $a2, $zero, 0x8
/* DB5C 8002535C 1C00448C */  lw         $a0, 0x1C($v0)
/* DB60 80025360 0800428C */  lw         $v0, 0x8($v0)
/* DB64 80025364 00000000 */  nop
/* DB68 80025368 09F84000 */  jalr       $v0
/* DB6C 8002536C 21382002 */   addu      $a3, $s1, $zero
/* DB70 80025370 1800BF8F */  lw         $ra, 0x18($sp)
/* DB74 80025374 1400B18F */  lw         $s1, 0x14($sp)
/* DB78 80025378 1000B08F */  lw         $s0, 0x10($sp)
/* DB7C 8002537C 2000BD27 */  addiu      $sp, $sp, 0x20
/* DB80 80025380 0800E003 */  jr         $ra
/* DB84 80025384 00000000 */   nop
