.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022B00
/* B300 80022B00 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B304 80022B04 0D008014 */  bnez       $a0, .L80022B3C
/* B308 80022B08 1000BFAF */   sw        $ra, 0x10($sp)
/* B30C 80022B0C 0480023C */  lui        $v0, %hi(D_80047E64)
/* B310 80022B10 647E428C */  lw         $v0, %lo(D_80047E64)($v0)
/* B314 80022B14 00000000 */  nop
/* B318 80022B18 0A004014 */  bnez       $v0, .L80022B44
/* B31C 80022B1C 00000000 */   nop
/* B320 80022B20 F492000C */  jal        func_80024BD0
/* B324 80022B24 21200000 */   addu      $a0, $zero, $zero
/* B328 80022B28 01000234 */  ori        $v0, $zero, 0x1
/* B32C 80022B2C 0480013C */  lui        $at, %hi(D_80047E64)
/* B330 80022B30 647E22AC */  sw         $v0, %lo(D_80047E64)($at)
/* B334 80022B34 D18A0008 */  j          .L80022B44
/* B338 80022B38 00000000 */   nop
.L80022B3C:
/* B33C 80022B3C F492000C */  jal        func_80024BD0
/* B340 80022B40 00000000 */   nop
.L80022B44:
/* B344 80022B44 1000BF8F */  lw         $ra, 0x10($sp)
/* B348 80022B48 00000000 */  nop
/* B34C 80022B4C 0800E003 */  jr         $ra
/* B350 80022B50 1800BD27 */   addiu     $sp, $sp, 0x18
