.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A934
/* 3134 8001A934 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3138 8001A938 1400BFAF */  sw         $ra, 0x14($sp)
/* 313C 8001A93C 1000B0AF */  sw         $s0, 0x10($sp)
/* 3140 8001A940 21808000 */  addu       $s0, $a0, $zero
/* 3144 8001A944 286A000C */  jal        func_8001A8A0
/* 3148 8001A948 00040534 */   ori       $a1, $zero, 0x400
/* 314C 8001A94C 0300028A */  lwl        $v0, 0x3($s0)
/* 3150 8001A950 0000029A */  lwr        $v0, 0x0($s0)
/* 3154 8001A954 00000000 */  nop
/* 3158 8001A958 0480013C */  lui        $at, %hi(D_80047E9F)
/* 315C 8001A95C 9F7E22A8 */  swl        $v0, %lo(D_80047E9F)($at)
/* 3160 8001A960 0480013C */  lui        $at, %hi(D_80047E9C)
/* 3164 8001A964 9C7E22B8 */  swr        $v0, %lo(D_80047E9C)($at)
/* 3168 8001A968 1400BF8F */  lw         $ra, 0x14($sp)
/* 316C 8001A96C 1000B08F */  lw         $s0, 0x10($sp)
/* 3170 8001A970 0800E003 */  jr         $ra
/* 3174 8001A974 1800BD27 */   addiu     $sp, $sp, 0x18
