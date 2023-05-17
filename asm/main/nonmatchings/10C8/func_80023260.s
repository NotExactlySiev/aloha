.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80023260
/* BA60 80023260 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* BA64 80023264 0000BFAF */  sw         $ra, 0x0($sp)
/* BA68 80023268 0400A4AF */  sw         $a0, 0x4($sp)
/* BA6C 8002326C 00000434 */  ori        $a0, $zero, 0x0
/* BA70 80023270 B18C000C */  jal        func_800232C4
/* BA74 80023274 00000000 */   nop
/* BA78 80023278 0400A48F */  lw         $a0, 0x4($sp)
/* BA7C 8002327C 0280083C */  lui        $t0, %hi(D_80023470)
/* BA80 80023280 70340825 */  addiu      $t0, $t0, %lo(D_80023470)
/* BA84 80023284 08000934 */  ori        $t1, $zero, 0x8
/* BA88 80023288 06008004 */  bltz       $a0, .L800232A4
/* BA8C 8002328C 00000000 */   nop
/* BA90 80023290 22482401 */  sub        $t1, $t1, $a0 # handwritten instruction
/* BA94 80023294 03002005 */  bltz       $t1, .L800232A4
/* BA98 80023298 C0480900 */   sll       $t1, $t1, 3
/* BA9C 8002329C 20402801 */  add        $t0, $t1, $t0 # handwritten instruction
/* BAA0 800232A0 000000AD */  sw         $zero, 0x0($t0)
.L800232A4:
/* BAA4 800232A4 01000434 */  ori        $a0, $zero, 0x1
/* BAA8 800232A8 B18C000C */  jal        func_800232C4
/* BAAC 800232AC 00000000 */   nop
/* BAB0 800232B0 0400A48F */  lw         $a0, 0x4($sp)
/* BAB4 800232B4 0000BF8F */  lw         $ra, 0x0($sp)
/* BAB8 800232B8 00000000 */  nop
/* BABC 800232BC 0800E003 */  jr         $ra
/* BAC0 800232C0 0800BD27 */   addiu     $sp, $sp, 0x8
