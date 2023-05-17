.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031074
/* 19874 80031074 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19878 80031078 1000BFAF */  sw         $ra, 0x10($sp)
/* 1987C 8003107C 21280000 */  addu       $a1, $zero, $zero
/* 19880 80031080 17000634 */  ori        $a2, $zero, 0x17
/* 19884 80031084 34B1000C */  jal        func_8002C4D0
/* 19888 80031088 01000734 */   ori       $a3, $zero, 0x1
/* 1988C 8003108C 1000BF8F */  lw         $ra, 0x10($sp)
/* 19890 80031090 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19894 80031094 0800E003 */  jr         $ra
/* 19898 80031098 00000000 */   nop
