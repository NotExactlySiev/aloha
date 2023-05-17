.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A954
/* 13154 8002A954 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 13158 8002A958 0B00A010 */  beqz       $a1, .L8002A988
/* 1315C 8002A95C 21300000 */   addu      $a2, $zero, $zero
.L8002A960:
/* 13160 8002A960 2110C400 */  addu       $v0, $a2, $a0
/* 13164 8002A964 0100C624 */  addiu      $a2, $a2, 0x1
/* 13168 8002A968 0580033C */  lui        $v1, %hi(D_80054754)
/* 1316C 8002A96C 5447638C */  lw         $v1, %lo(D_80054754)($v1)
/* 13170 8002A970 40110200 */  sll        $v0, $v0, 5
/* 13174 8002A974 21104300 */  addu       $v0, $v0, $v1
/* 13178 8002A978 000040AC */  sw         $zero, 0x0($v0)
/* 1317C 8002A97C 2B10C500 */  sltu       $v0, $a2, $a1
/* 13180 8002A980 F7FF4014 */  bnez       $v0, .L8002A960
/* 13184 8002A984 00000000 */   nop
.L8002A988:
/* 13188 8002A988 0800BD27 */  addiu      $sp, $sp, 0x8
/* 1318C 8002A98C 0800E003 */  jr         $ra
/* 13190 8002A990 00000000 */   nop
