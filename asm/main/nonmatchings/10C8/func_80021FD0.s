.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021FD0
/* A7D0 80021FD0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* A7D4 80021FD4 2400BFAF */  sw         $ra, 0x24($sp)
/* A7D8 80021FD8 2000B2AF */  sw         $s2, 0x20($sp)
/* A7DC 80021FDC 1C00B1AF */  sw         $s1, 0x1C($sp)
/* A7E0 80021FE0 1800B0AF */  sw         $s0, 0x18($sp)
/* A7E4 80021FE4 21908000 */  addu       $s2, $a0, $zero
/* A7E8 80021FE8 2180A000 */  addu       $s0, $a1, $zero
/* A7EC 80021FEC 2188C000 */  addu       $s1, $a2, $zero
/* A7F0 80021FF0 8279000C */  jal        func_8001E608
/* A7F4 80021FF4 21200000 */   addu      $a0, $zero, $zero
/* A7F8 80021FF8 0580013C */  lui        $at, %hi(D_80048024)
/* A7FC 80021FFC 248020AC */  sw         $zero, %lo(D_80048024)($at)
/* A800 80022000 B08F000C */  jal        func_80023EC0
/* A804 80022004 21202002 */   addu      $a0, $s1, $zero
/* A808 80022008 3000048E */  lw         $a0, 0x30($s0)
/* A80C 8002200C 2000058E */  lw         $a1, 0x20($s0)
/* A810 80022010 8DA9000C */  jal        func_8002A634
/* A814 80022014 00000000 */   nop
/* A818 80022018 3400048E */  lw         $a0, 0x34($s0)
/* A81C 8002201C BFAD000C */  jal        func_8002B6FC
/* A820 80022020 00000000 */   nop
/* A824 80022024 1C00028E */  lw         $v0, 0x1C($s0)
/* A828 80022028 1000A0AF */  sw         $zero, 0x10($sp)
/* A82C 8002202C 01000434 */  ori        $a0, $zero, 0x1
/* A830 80022030 01000534 */  ori        $a1, $zero, 0x1
/* A834 80022034 FFFF0624 */  addiu      $a2, $zero, -0x1
/* A838 80022038 0580013C */  lui        $at, %hi(D_80048034)
/* A83C 8002203C 348022AC */  sw         $v0, %lo(D_80048034)($at)
/* A840 80022040 EFA9000C */  jal        func_8002A7BC
/* A844 80022044 21380000 */   addu      $a3, $zero, $zero
/* A848 80022048 1800058E */  lw         $a1, 0x18($s0)
/* A84C 8002204C DF87000C */  jal        func_80021F7C
/* A850 80022050 21204002 */   addu      $a0, $s2, $zero
/* A854 80022054 0580013C */  lui        $at, %hi(D_80048014)
/* A858 80022058 148020AC */  sw         $zero, %lo(D_80048014)($at)
/* A85C 8002205C 2400BF8F */  lw         $ra, 0x24($sp)
/* A860 80022060 2000B28F */  lw         $s2, 0x20($sp)
/* A864 80022064 1C00B18F */  lw         $s1, 0x1C($sp)
/* A868 80022068 1800B08F */  lw         $s0, 0x18($sp)
/* A86C 8002206C 0800E003 */  jr         $ra
/* A870 80022070 2800BD27 */   addiu     $sp, $sp, 0x28
