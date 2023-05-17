.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002797C
/* 1017C 8002797C 80110500 */  sll        $v0, $a1, 6
/* 10180 80027980 03210400 */  sra        $a0, $a0, 4
/* 10184 80027984 3F008430 */  andi       $a0, $a0, 0x3F
/* 10188 80027988 25104400 */  or         $v0, $v0, $a0
/* 1018C 8002798C 0800E003 */  jr         $ra
/* 10190 80027990 FFFF4230 */   andi      $v0, $v0, 0xFFFF
