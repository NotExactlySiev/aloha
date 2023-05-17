.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F95C
/* 815C 8001F95C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8160 8001F960 1000BFAF */  sw         $ra, 0x10($sp)
/* 8164 8001F964 21108000 */  addu       $v0, $a0, $zero
/* 8168 8001F968 00240200 */  sll        $a0, $v0, 16
/* 816C 8001F96C 03240400 */  sra        $a0, $a0, 16
/* 8170 8001F970 1F004230 */  andi       $v0, $v0, 0x1F
/* 8174 8001F974 00110200 */  sll        $v0, $v0, 4
/* 8178 8001F978 002C0500 */  sll        $a1, $a1, 16
/* 817C 8001F97C 0580013C */  lui        $at, %hi(D_80052068)
/* 8180 8001F980 68202124 */  addiu      $at, $at, %lo(D_80052068)
/* 8184 8001F984 21082200 */  addu       $at, $at, $v0
/* 8188 8001F988 00002684 */  lh         $a2, 0x0($at)
/* 818C 8001F98C 7B7E000C */  jal        func_8001F9EC
/* 8190 8001F990 032C0500 */   sra       $a1, $a1, 16
/* 8194 8001F994 1000BF8F */  lw         $ra, 0x10($sp)
/* 8198 8001F998 00000000 */  nop
/* 819C 8001F99C 0800E003 */  jr         $ra
/* 81A0 8001F9A0 1800BD27 */   addiu     $sp, $sp, 0x18
