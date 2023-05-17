.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EA2E0
/* AAE0 800EA2E0 00008984 */  lh         $t1, 0x0($a0)
/* AAE4 800EA2E4 2110A000 */  addu       $v0, $a1, $zero
/* AAE8 800EA2E8 0000A9A4 */  sh         $t1, 0x0($a1)
/* AAEC 800EA2EC 06008A84 */  lh         $t2, 0x6($a0)
/* AAF0 800EA2F0 0C008984 */  lh         $t1, 0xC($a0)
/* AAF4 800EA2F4 0200AAA4 */  sh         $t2, 0x2($a1)
/* AAF8 800EA2F8 02008B84 */  lh         $t3, 0x2($a0)
/* AAFC 800EA2FC 0400A9A4 */  sh         $t1, 0x4($a1)
/* AB00 800EA300 08008A84 */  lh         $t2, 0x8($a0)
/* AB04 800EA304 0600ABA4 */  sh         $t3, 0x6($a1)
/* AB08 800EA308 0E008984 */  lh         $t1, 0xE($a0)
/* AB0C 800EA30C 0800AAA4 */  sh         $t2, 0x8($a1)
/* AB10 800EA310 04008B84 */  lh         $t3, 0x4($a0)
/* AB14 800EA314 0A00A9A4 */  sh         $t1, 0xA($a1)
/* AB18 800EA318 0A008A84 */  lh         $t2, 0xA($a0)
/* AB1C 800EA31C 0C00ABA4 */  sh         $t3, 0xC($a1)
/* AB20 800EA320 10008984 */  lh         $t1, 0x10($a0)
/* AB24 800EA324 0E00AAA4 */  sh         $t2, 0xE($a1)
/* AB28 800EA328 0800E003 */  jr         $ra
/* AB2C 800EA32C 1000A9A4 */   sh        $t1, 0x10($a1)
