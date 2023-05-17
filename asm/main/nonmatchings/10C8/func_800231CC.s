.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800231CC
/* B9CC 800231CC F8FFBD27 */  addiu      $sp, $sp, -0x8
/* B9D0 800231D0 0000BFAF */  sw         $ra, 0x0($sp)
/* B9D4 800231D4 0400A4AF */  sw         $a0, 0x4($sp)
/* B9D8 800231D8 00000434 */  ori        $a0, $zero, 0x0
/* B9DC 800231DC B18C000C */  jal        func_800232C4
/* B9E0 800231E0 00000000 */   nop
/* B9E4 800231E4 0400A48F */  lw         $a0, 0x4($sp)
/* B9E8 800231E8 0280083C */  lui        $t0, %hi(D_80023370)
/* B9EC 800231EC 70330825 */  addiu      $t0, $t0, %lo(D_80023370)
/* B9F0 800231F0 20000934 */  ori        $t1, $zero, 0x20
/* B9F4 800231F4 0E008004 */  bltz       $a0, .L80023230
/* B9F8 800231F8 00000000 */   nop
/* B9FC 800231FC 22482401 */  sub        $t1, $t1, $a0 # handwritten instruction
/* BA00 80023200 03002005 */  bltz       $t1, .L80023210
/* BA04 80023204 C0480900 */   sll       $t1, $t1, 3
/* BA08 80023208 20402801 */  add        $t0, $t1, $t0 # handwritten instruction
/* BA0C 8002320C 000000AD */  sw         $zero, 0x0($t0)
.L80023210:
/* BA10 80023210 01000434 */  ori        $a0, $zero, 0x1
/* BA14 80023214 B18C000C */  jal        func_800232C4
/* BA18 80023218 00000000 */   nop
/* BA1C 8002321C 0400A48F */  lw         $a0, 0x4($sp)
/* BA20 80023220 0000BF8F */  lw         $ra, 0x0($sp)
/* BA24 80023224 00000000 */  nop
/* BA28 80023228 0800E003 */  jr         $ra
/* BA2C 8002322C 0800BD27 */   addiu     $sp, $sp, 0x8
.L80023230:
/* BA30 80023230 000000AD */  sw         $zero, 0x0($t0)
/* BA34 80023234 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BA38 80023238 FDFF0914 */  bne        $zero, $t1, .L80023230
/* BA3C 8002323C 08000825 */   addiu     $t0, $t0, 0x8
/* BA40 80023240 01000434 */  ori        $a0, $zero, 0x1
/* BA44 80023244 B18C000C */  jal        func_800232C4
/* BA48 80023248 00000000 */   nop
/* BA4C 8002324C 0400A48F */  lw         $a0, 0x4($sp)
/* BA50 80023250 0000BF8F */  lw         $ra, 0x0($sp)
/* BA54 80023254 00000000 */  nop
/* BA58 80023258 0800E003 */  jr         $ra
/* BA5C 8002325C 0800BD27 */   addiu     $sp, $sp, 0x8
