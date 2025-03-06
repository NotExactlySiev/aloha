.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sfx_set_prog_attr
/* 797C 8001F17C 0500A004 */  bltz       $a1, .L8001F194
/* 7980 8001F180 0300A228 */   slti      $v0, $a1, 0x3
/* 7984 8001F184 05004014 */  bnez       $v0, .L8001F19C
/* 7988 8001F188 021E0400 */   srl       $v1, $a0, 24
/* 798C 8001F18C 677C0008 */  j          .L8001F19C
/* 7990 8001F190 02000534 */   ori       $a1, $zero, 0x2
.L8001F194:
/* 7994 8001F194 21280000 */  addu       $a1, $zero, $zero
/* 7998 8001F198 021E0400 */  srl        $v1, $a0, 24
.L8001F19C:
/* 799C 8001F19C 02120400 */  srl        $v0, $a0, 8
/* 79A0 8001F1A0 7F004430 */  andi       $a0, $v0, 0x7F
/* 79A4 8001F1A4 0400622C */  sltiu      $v0, $v1, 0x4
/* 79A8 8001F1A8 13004010 */  beqz       $v0, .L8001F1F8
/* 79AC 8001F1AC C0100300 */   sll       $v0, $v1, 3
/* 79B0 8001F1B0 23104300 */  subu       $v0, $v0, $v1
/* 79B4 8001F1B4 C0100200 */  sll        $v0, $v0, 3
/* 79B8 8001F1B8 0580033C */  lui        $v1, %hi(loaded_vabs)
/* 79BC 8001F1BC 801D6324 */  addiu      $v1, $v1, %lo(loaded_vabs)
/* 79C0 8001F1C0 21184300 */  addu       $v1, $v0, $v1
/* 79C4 8001F1C4 36006290 */  lbu        $v0, 0x36($v1)
/* 79C8 8001F1C8 00000000 */  nop
/* 79CC 8001F1CC 0A004010 */  beqz       $v0, .L8001F1F8
/* 79D0 8001F1D0 00000000 */   nop
/* 79D4 8001F1D4 30006284 */  lh         $v0, 0x30($v1)
/* 79D8 8001F1D8 00000000 */  nop
/* 79DC 8001F1DC 2B108200 */  sltu       $v0, $a0, $v0
/* 79E0 8001F1E0 05004010 */  beqz       $v0, .L8001F1F8
/* 79E4 8001F1E4 00110400 */   sll       $v0, $a0, 4
/* 79E8 8001F1E8 2000638C */  lw         $v1, 0x20($v1)
/* 79EC 8001F1EC 00000000 */  nop
/* 79F0 8001F1F0 21104300 */  addu       $v0, $v0, $v1
/* 79F4 8001F1F4 060045A4 */  sh         $a1, 0x6($v0)
.L8001F1F8:
/* 79F8 8001F1F8 0800E003 */  jr         $ra
/* 79FC 8001F1FC 00000000 */   nop
