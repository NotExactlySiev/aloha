.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A978
/* 3178 8001A978 0480023C */  lui        $v0, %hi(D_80047ED4)
/* 317C 8001A97C D47E428C */  lw         $v0, %lo(D_80047ED4)($v0)
/* 3180 8001A980 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3184 8001A984 3A004014 */  bnez       $v0, .L8001AA70
/* 3188 8001A988 1000BFAF */   sw        $ra, 0x10($sp)
/* 318C 8001A98C 0480033C */  lui        $v1, %hi(D_80047DB8)
/* 3190 8001A990 B87D638C */  lw         $v1, %lo(D_80047DB8)($v1)
/* 3194 8001A994 01000234 */  ori        $v0, $zero, 0x1
/* 3198 8001A998 35006214 */  bne        $v1, $v0, .L8001AA70
/* 319C 8001A99C 00000000 */   nop
/* 31A0 8001A9A0 0480033C */  lui        $v1, %hi(D_80047DD4)
/* 31A4 8001A9A4 D47D638C */  lw         $v1, %lo(D_80047DD4)($v1)
/* 31A8 8001A9A8 0480023C */  lui        $v0, %hi(D_80047DCC)
/* 31AC 8001A9AC CC7D428C */  lw         $v0, %lo(D_80047DCC)($v0)
/* 31B0 8001A9B0 00000000 */  nop
/* 31B4 8001A9B4 2A104300 */  slt        $v0, $v0, $v1
/* 31B8 8001A9B8 11004010 */  beqz       $v0, .L8001AA00
/* 31BC 8001A9BC 00000000 */   nop
/* 31C0 8001A9C0 0480053C */  lui        $a1, %hi(D_80047DD4)
/* 31C4 8001A9C4 D47DA58C */  lw         $a1, %lo(D_80047DD4)($a1)
/* 31C8 8001A9C8 0480043C */  lui        $a0, %hi(D_80047E9C)
/* 31CC 8001A9CC 9C7E8424 */  addiu      $a0, $a0, %lo(D_80047E9C)
/* 31D0 8001A9D0 286A000C */  jal        func_8001A8A0
/* 31D4 8001A9D4 00000000 */   nop
/* 31D8 8001A9D8 0480023C */  lui        $v0, %hi(D_80047DD4)
/* 31DC 8001A9DC D47D428C */  lw         $v0, %lo(D_80047DD4)($v0)
/* 31E0 8001A9E0 0480033C */  lui        $v1, %hi(D_80047DC8)
/* 31E4 8001A9E4 C87D638C */  lw         $v1, %lo(D_80047DC8)($v1)
/* 31E8 8001A9E8 00000000 */  nop
/* 31EC 8001A9EC 23104300 */  subu       $v0, $v0, $v1
/* 31F0 8001A9F0 0480013C */  lui        $at, %hi(D_80047DD4)
/* 31F4 8001A9F4 D47D22AC */  sw         $v0, %lo(D_80047DD4)($at)
/* 31F8 8001A9F8 9C6A0008 */  j          .L8001AA70
/* 31FC 8001A9FC 00000000 */   nop
.L8001AA00:
/* 3200 8001AA00 0480043C */  lui        $a0, %hi(D_80047EFC)
/* 3204 8001AA04 FC7E848C */  lw         $a0, %lo(D_80047EFC)($a0)
/* 3208 8001AA08 988C000C */  jal        func_80023260
/* 320C 8001AA0C 00000000 */   nop
/* 3210 8001AA10 0480023C */  lui        $v0, %hi(D_80047DCC)
/* 3214 8001AA14 CC7D428C */  lw         $v0, %lo(D_80047DCC)($v0)
/* 3218 8001AA18 0480033C */  lui        $v1, %hi(D_80047F0C)
/* 321C 8001AA1C 0C7F638C */  lw         $v1, %lo(D_80047F0C)($v1)
/* 3220 8001AA20 0480013C */  lui        $at, %hi(D_80047DD4)
/* 3224 8001AA24 D47D22AC */  sw         $v0, %lo(D_80047DD4)($at)
/* 3228 8001AA28 0480013C */  lui        $at, %hi(D_80047DB8)
/* 322C 8001AA2C B87D20AC */  sw         $zero, %lo(D_80047DB8)($at)
/* 3230 8001AA30 0480013C */  lui        $at, %hi(D_80047DB4)
/* 3234 8001AA34 B47D20AC */  sw         $zero, %lo(D_80047DB4)($at)
/* 3238 8001AA38 0480013C */  lui        $at, %hi(D_80047DBC)
/* 323C 8001AA3C BC7D20AC */  sw         $zero, %lo(D_80047DBC)($at)
/* 3240 8001AA40 03006010 */  beqz       $v1, .L8001AA50
/* 3244 8001AA44 00000000 */   nop
/* 3248 8001AA48 09F86000 */  jalr       $v1
/* 324C 8001AA4C 00000000 */   nop
.L8001AA50:
/* 3250 8001AA50 0480013C */  lui        $at, %hi(D_80047F0C)
/* 3254 8001AA54 0C7F20AC */  sw         $zero, %lo(D_80047F0C)($at)
/* 3258 8001AA58 0480053C */  lui        $a1, %hi(D_80047DD4)
/* 325C 8001AA5C D47DA58C */  lw         $a1, %lo(D_80047DD4)($a1)
/* 3260 8001AA60 0480043C */  lui        $a0, %hi(D_80047E9C)
/* 3264 8001AA64 9C7E8424 */  addiu      $a0, $a0, %lo(D_80047E9C)
/* 3268 8001AA68 286A000C */  jal        func_8001A8A0
/* 326C 8001AA6C 00000000 */   nop
.L8001AA70:
/* 3270 8001AA70 1000BF8F */  lw         $ra, 0x10($sp)
/* 3274 8001AA74 00000000 */  nop
/* 3278 8001AA78 0800E003 */  jr         $ra
/* 327C 8001AA7C 1800BD27 */   addiu     $sp, $sp, 0x18
