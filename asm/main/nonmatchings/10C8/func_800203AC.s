.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800203AC
/* 8BAC 800203AC 58FFBD27 */  addiu      $sp, $sp, -0xA8
/* 8BB0 800203B0 A000BFAF */  sw         $ra, 0xA0($sp)
/* 8BB4 800203B4 9C00B3AF */  sw         $s3, 0x9C($sp)
/* 8BB8 800203B8 9800B2AF */  sw         $s2, 0x98($sp)
/* 8BBC 800203BC 9400B1AF */  sw         $s1, 0x94($sp)
/* 8BC0 800203C0 9000B0AF */  sw         $s0, 0x90($sp)
/* 8BC4 800203C4 21888000 */  addu       $s1, $a0, $zero
/* 8BC8 800203C8 2190A000 */  addu       $s2, $a1, $zero
/* 8BCC 800203CC 2198C000 */  addu       $s3, $a2, $zero
/* 8BD0 800203D0 7F006226 */  addiu      $v0, $s3, 0x7F
/* 8BD4 800203D4 C2110200 */  srl        $v0, $v0, 7
/* 8BD8 800203D8 C0810200 */  sll        $s0, $v0, 7
/* 8BDC 800203DC 21202002 */  addu       $a0, $s1, $zero
.L800203E0:
/* 8BE0 800203E0 21284002 */  addu       $a1, $s2, $zero
/* 8BE4 800203E4 FE8E000C */  jal        func_80023BF8
/* 8BE8 800203E8 21300002 */   addu      $a2, $s0, $zero
/* 8BEC 800203EC FCFF4014 */  bnez       $v0, .L800203E0
/* 8BF0 800203F0 21202002 */   addu      $a0, $s1, $zero
/* 8BF4 800203F4 21106002 */  addu       $v0, $s3, $zero
/* 8BF8 800203F8 A000BF8F */  lw         $ra, 0xA0($sp)
/* 8BFC 800203FC 9C00B38F */  lw         $s3, 0x9C($sp)
/* 8C00 80020400 9800B28F */  lw         $s2, 0x98($sp)
/* 8C04 80020404 9400B18F */  lw         $s1, 0x94($sp)
/* 8C08 80020408 9000B08F */  lw         $s0, 0x90($sp)
/* 8C0C 8002040C 0800E003 */  jr         $ra
/* 8C10 80020410 A800BD27 */   addiu     $sp, $sp, 0xA8
