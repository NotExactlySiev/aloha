.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A824
/* 13024 8002A824 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 13028 8002A828 1000B0AF */  sw         $s0, 0x10($sp)
/* 1302C 8002A82C 21808000 */  addu       $s0, $a0, $zero
/* 13030 8002A830 01000434 */  ori        $a0, $zero, 0x1
/* 13034 8002A834 1400B1AF */  sw         $s1, 0x14($sp)
/* 13038 8002A838 3000B18F */  lw         $s1, 0x30($sp)
/* 1303C 8002A83C 2128C000 */  addu       $a1, $a2, $zero
/* 13040 8002A840 1800B2AF */  sw         $s2, 0x18($sp)
/* 13044 8002A844 3400B28F */  lw         $s2, 0x34($sp)
/* 13048 8002A848 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1304C 8002A84C 92AA000C */  jal        func_8002AA48
/* 13050 8002A850 2130E000 */   addu      $a2, $a3, $zero
/* 13054 8002A854 0580013C */  lui        $at, %hi(D_800536A4)
/* 13058 8002A858 A43630AC */  sw         $s0, %lo(D_800536A4)($at)
/* 1305C 8002A85C 0580013C */  lui        $at, %hi(D_800536A8)
/* 13060 8002A860 A83620AC */  sw         $zero, %lo(D_800536A8)($at)
/* 13064 8002A864 0580013C */  lui        $at, %hi(D_800536A0)
/* 13068 8002A868 A03620AC */  sw         $zero, %lo(D_800536A0)($at)
/* 1306C 8002A86C 0580013C */  lui        $at, %hi(D_800536C8)
/* 13070 8002A870 C83631AC */  sw         $s1, %lo(D_800536C8)($at)
/* 13074 8002A874 0580013C */  lui        $at, %hi(D_800536CC)
/* 13078 8002A878 CC3632AC */  sw         $s2, %lo(D_800536CC)($at)
/* 1307C 8002A87C 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 13080 8002A880 1800B28F */  lw         $s2, 0x18($sp)
/* 13084 8002A884 1400B18F */  lw         $s1, 0x14($sp)
/* 13088 8002A888 1000B08F */  lw         $s0, 0x10($sp)
/* 1308C 8002A88C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 13090 8002A890 0800E003 */  jr         $ra
/* 13094 8002A894 00000000 */   nop
