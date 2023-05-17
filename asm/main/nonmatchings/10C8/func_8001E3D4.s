.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E3D4
/* 6BD4 8001E3D4 02120400 */  srl        $v0, $a0, 8
/* 6BD8 8001E3D8 FF004530 */  andi       $a1, $v0, 0xFF
/* 6BDC 8001E3DC FF008330 */  andi       $v1, $a0, 0xFF
/* 6BE0 8001E3E0 9F00622C */  sltiu      $v0, $v1, 0x9F
/* 6BE4 8001E3E4 03004010 */  beqz       $v0, .L8001E3F4
/* 6BE8 8001E3E8 40100500 */   sll       $v0, $a1, 1
/* 6BEC 8001E3EC FE780008 */  j          .L8001E3F8
/* 6BF0 8001E3F0 1FFF4524 */   addiu     $a1, $v0, -0xE1
.L8001E3F4:
/* 6BF4 8001E3F4 20FF4524 */  addiu      $a1, $v0, -0xE0
.L8001E3F8:
/* 6BF8 8001E3F8 7F00622C */  sltiu      $v0, $v1, 0x7F
/* 6BFC 8001E3FC 03004010 */  beqz       $v0, .L8001E40C
/* 6C00 8001E400 00000000 */   nop
/* 6C04 8001E404 09790008 */  j          .L8001E424
/* 6C08 8001E408 E1FF6324 */   addiu     $v1, $v1, -0x1F
.L8001E40C:
/* 6C0C 8001E40C 9F00622C */  sltiu      $v0, $v1, 0x9F
/* 6C10 8001E410 03004010 */  beqz       $v0, .L8001E420
/* 6C14 8001E414 00000000 */   nop
/* 6C18 8001E418 09790008 */  j          .L8001E424
/* 6C1C 8001E41C E0FF6324 */   addiu     $v1, $v1, -0x20
.L8001E420:
/* 6C20 8001E420 82FF6324 */  addiu      $v1, $v1, -0x7E
.L8001E424:
/* 6C24 8001E424 00120500 */  sll        $v0, $a1, 8
/* 6C28 8001E428 00FF4230 */  andi       $v0, $v0, 0xFF00
/* 6C2C 8001E42C FF006330 */  andi       $v1, $v1, 0xFF
/* 6C30 8001E430 0800E003 */  jr         $ra
/* 6C34 8001E434 25104300 */   or        $v0, $v0, $v1
