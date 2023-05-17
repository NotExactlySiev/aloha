.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80023060
/* B860 80023060 0D008018 */  blez       $a0, .L80023098
/* B864 80023064 01000734 */   ori       $a3, $zero, 0x1
/* B868 80023068 01000834 */  ori        $t0, $zero, 0x1
.L8002306C:
/* B86C 8002306C 0000A390 */  lbu        $v1, 0x0($a1)
/* B870 80023070 0000C290 */  lbu        $v0, 0x0($a2)
/* B874 80023074 00000000 */  nop
/* B878 80023078 02006210 */  beq        $v1, $v0, .L80023084
/* B87C 8002307C 0100A524 */   addiu     $a1, $a1, 0x1
/* B880 80023080 21380000 */  addu       $a3, $zero, $zero
.L80023084:
/* B884 80023084 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B888 80023088 03008018 */  blez       $a0, .L80023098
/* B88C 8002308C 0100C624 */   addiu     $a2, $a2, 0x1
/* B890 80023090 F6FFE810 */  beq        $a3, $t0, .L8002306C
/* B894 80023094 00000000 */   nop
.L80023098:
/* B898 80023098 0800E003 */  jr         $ra
/* B89C 8002309C 2110E000 */   addu      $v0, $a3, $zero
