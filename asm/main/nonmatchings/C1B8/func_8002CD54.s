.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_8002CD54
/* 15554 8002CD54 21408000 */  addu       $t0, $a0, $zero
/* 15558 8002CD58 2148A000 */  addu       $t1, $a1, $zero
/* 1555C 8002CD5C 21380000 */  addu       $a3, $zero, $zero
/* 15560 8002CD60 21180000 */  addu       $v1, $zero, $zero
/* 15564 8002CD64 FFFFC530 */  andi       $a1, $a2, 0xFFFF
.L8002CD68:
/* 15568 8002CD68 07106500 */  srav       $v0, $a1, $v1
/* 1556C 8002CD6C 01004230 */  andi       $v0, $v0, 0x1
/* 15570 8002CD70 02004010 */  beqz       $v0, .L8002CD7C
/* 15574 8002CD74 00000000 */   nop
/* 15578 8002CD78 21386000 */  addu       $a3, $v1, $zero
.L8002CD7C:
/* 1557C 8002CD7C 01006324 */  addiu      $v1, $v1, 0x1
/* 15580 8002CD80 10006228 */  slti       $v0, $v1, 0x10
/* 15584 8002CD84 F8FF4014 */  bnez       $v0, .L8002CD68
/* 15588 8002CD88 01000234 */   ori       $v0, $zero, 0x1
/* 1558C 8002CD8C 0100E524 */  addiu      $a1, $a3, 0x1
/* 15590 8002CD90 0428A200 */  sllv       $a1, $v0, $a1
/* 15594 8002CD94 0410E200 */  sllv       $v0, $v0, $a3
/* 15598 8002CD98 2328A200 */  subu       $a1, $a1, $v0
/* 1559C 8002CD9C FFFFC430 */  andi       $a0, $a2, 0xFFFF
/* 155A0 8002CDA0 23208200 */  subu       $a0, $a0, $v0
/* 155A4 8002CDA4 40300400 */  sll        $a2, $a0, 1
/* 155A8 8002CDA8 2130C400 */  addu       $a2, $a2, $a0
/* 155AC 8002CDAC 80300600 */  sll        $a2, $a2, 2
/* 155B0 8002CDB0 1A00C500 */  div        $zero, $a2, $a1
/* 155B4 8002CDB4 0200A014 */  bnez       $a1, .L8002CDC0
/* 155B8 8002CDB8 00000000 */   nop
/* 155BC 8002CDBC 0D000700 */  break      7
.L8002CDC0:
/* 155C0 8002CDC0 FFFF0124 */  addiu      $at, $zero, -0x1
/* 155C4 8002CDC4 0400A114 */  bne        $a1, $at, .L8002CDD8
/* 155C8 8002CDC8 0080013C */   lui       $at, (0x80000000 >> 16)
/* 155CC 8002CDCC 0200C114 */  bne        $a2, $at, .L8002CDD8
/* 155D0 8002CDD0 00000000 */   nop
/* 155D4 8002CDD4 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L8002CDD8:
/* 155D8 8002CDD8 12300000 */  mflo       $a2
/* 155DC 8002CDDC 00000000 */  nop
/* 155E0 8002CDE0 1800A600 */  mult       $a1, $a2
/* 155E4 8002CDE4 12180000 */  mflo       $v1
/* 155E8 8002CDE8 AA2A023C */  lui        $v0, (0x2AAAAAAB >> 16)
/* 155EC 8002CDEC ABAA4234 */  ori        $v0, $v0, (0x2AAAAAAB & 0xFFFF)
/* 155F0 8002CDF0 18006200 */  mult       $v1, $v0
/* 155F4 8002CDF4 C31F0300 */  sra        $v1, $v1, 31
/* 155F8 8002CDF8 10100000 */  mfhi       $v0
/* 155FC 8002CDFC 43100200 */  sra        $v0, $v0, 1
/* 15600 8002CE00 23104300 */  subu       $v0, $v0, $v1
/* 15604 8002CE04 23208200 */  subu       $a0, $a0, $v0
/* 15608 8002CE08 40180400 */  sll        $v1, $a0, 1
/* 1560C 8002CE0C 21186400 */  addu       $v1, $v1, $a0
/* 15610 8002CE10 401A0300 */  sll        $v1, $v1, 9
/* 15614 8002CE14 1A006500 */  div        $zero, $v1, $a1
/* 15618 8002CE18 0200A014 */  bnez       $a1, .L8002CE24
/* 1561C 8002CE1C 00000000 */   nop
/* 15620 8002CE20 0D000700 */  break      7
.L8002CE24:
/* 15624 8002CE24 FFFF0124 */  addiu      $at, $zero, -0x1
/* 15628 8002CE28 0400A114 */  bne        $a1, $at, .L8002CE3C
/* 1562C 8002CE2C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 15630 8002CE30 02006114 */  bne        $v1, $at, .L8002CE3C
/* 15634 8002CE34 00000000 */   nop
/* 15638 8002CE38 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L8002CE3C:
/* 1563C 8002CE3C 12180000 */  mflo       $v1
/* 15640 8002CE40 FFFF0531 */  andi       $a1, $t0, 0xFFFF
/* 15644 8002CE44 F4FFE424 */  addiu      $a0, $a3, -0xC
/* 15648 8002CE48 40100400 */  sll        $v0, $a0, 1
/* 1564C 8002CE4C 21104400 */  addu       $v0, $v0, $a0
/* 15650 8002CE50 80100200 */  sll        $v0, $v0, 2
/* 15654 8002CE54 2128A200 */  addu       $a1, $a1, $v0
/* 15658 8002CE58 2128A600 */  addu       $a1, $a1, $a2
/* 1565C 8002CE5C FFFF2231 */  andi       $v0, $t1, 0xFFFF
/* 15660 8002CE60 21184300 */  addu       $v1, $v0, $v1
/* 15664 8002CE64 02006104 */  bgez       $v1, .L8002CE70
/* 15668 8002CE68 21106000 */   addu      $v0, $v1, $zero
/* 1566C 8002CE6C 7F006224 */  addiu      $v0, $v1, 0x7F
.L8002CE70:
/* 15670 8002CE70 C3210200 */  sra        $a0, $v0, 7
/* 15674 8002CE74 C0110400 */  sll        $v0, $a0, 7
/* 15678 8002CE78 23206200 */  subu       $a0, $v1, $v0
/* 1567C 8002CE7C 80006228 */  slti       $v0, $v1, 0x80
/* 15680 8002CE80 01004238 */  xori       $v0, $v0, 0x1
/* 15684 8002CE84 2128A200 */  addu       $a1, $a1, $v0
/* 15688 8002CE88 0500A004 */  bltz       $a1, .L8002CEA0
/* 1568C 8002CE8C 8000A228 */   slti      $v0, $a1, 0x80
/* 15690 8002CE90 03004010 */  beqz       $v0, .L8002CEA0
/* 15694 8002CE94 00120500 */   sll       $v0, $a1, 8
/* 15698 8002CE98 A9B30008 */  j          .L8002CEA4
/* 1569C 8002CE9C 25104400 */   or        $v0, $v0, $a0
.L8002CEA0:
/* 156A0 8002CEA0 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8002CEA4:
/* 156A4 8002CEA4 0800E003 */  jr         $ra
/* 156A8 8002CEA8 00000000 */   nop
