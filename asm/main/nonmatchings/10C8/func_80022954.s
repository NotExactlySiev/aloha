.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022954
/* B154 80022954 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B158 80022958 2000BFAF */  sw         $ra, 0x20($sp)
/* B15C 8002295C 1C00B1AF */  sw         $s1, 0x1C($sp)
/* B160 80022960 1800B0AF */  sw         $s0, 0x18($sp)
/* B164 80022964 21808000 */  addu       $s0, $a0, $zero
/* B168 80022968 3800A28F */  lw         $v0, 0x38($sp)
/* B16C 8002296C 00000000 */  nop
/* B170 80022970 6AA0000C */  jal        func_800281A8
/* B174 80022974 1000A2AF */   sw        $v0, 0x10($sp)
/* B178 80022978 120000A2 */  sb         $zero, 0x12($s0)
/* B17C 8002297C 7566000C */  jal        func_800199D4
/* B180 80022980 21884000 */   addu      $s1, $v0, $zero
/* B184 80022984 01000334 */  ori        $v1, $zero, 0x1
/* B188 80022988 04004314 */  bne        $v0, $v1, .L8002299C
/* B18C 8002298C 21102002 */   addu      $v0, $s1, $zero
/* B190 80022990 01000234 */  ori        $v0, $zero, 0x1
/* B194 80022994 120002A2 */  sb         $v0, 0x12($s0)
/* B198 80022998 21102002 */  addu       $v0, $s1, $zero
.L8002299C:
/* B19C 8002299C 2000BF8F */  lw         $ra, 0x20($sp)
/* B1A0 800229A0 1C00B18F */  lw         $s1, 0x1C($sp)
/* B1A4 800229A4 1800B08F */  lw         $s0, 0x18($sp)
/* B1A8 800229A8 0800E003 */  jr         $ra
/* B1AC 800229AC 2800BD27 */   addiu     $sp, $sp, 0x28
