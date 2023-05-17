.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8640
/* 8E40 800E8640 98FFBD27 */  addiu      $sp, $sp, -0x68
/* 8E44 800E8644 6400BFAF */  sw         $ra, 0x64($sp)
/* 8E48 800E8648 6000B0AF */  sw         $s0, 0x60($sp)
/* 8E4C 800E864C 21808000 */  addu       $s0, $a0, $zero
/* 8E50 800E8650 0F80013C */  lui        $at, %hi(D_800F4E00)
/* 8E54 800E8654 004E20AC */  sw         $zero, %lo(D_800F4E00)($at)
/* 8E58 800E8658 5800A0A7 */  sh         $zero, 0x58($sp)
/* 8E5C 800E865C 5A00A0A7 */  sh         $zero, 0x5A($sp)
/* 8E60 800E8660 00040234 */  ori        $v0, $zero, 0x400
/* 8E64 800E8664 5C00A2A7 */  sh         $v0, 0x5C($sp)
/* 8E68 800E8668 00020234 */  ori        $v0, $zero, 0x200
/* 8E6C 800E866C 5E00A2A7 */  sh         $v0, 0x5E($sp)
/* 8E70 800E8670 5FA1030C */  jal        func_800E857C
/* 8E74 800E8674 1000A427 */   addiu     $a0, $sp, 0x10
/* 8E78 800E8678 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8E7C 800E867C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8E80 800E8680 00000000 */  nop
/* 8E84 800E8684 3C0C428C */  lw         $v0, 0xC3C($v0)
/* 8E88 800E8688 00000000 */  nop
/* 8E8C 800E868C 09F84000 */  jalr       $v0
/* 8E90 800E8690 00000000 */   nop
/* 8E94 800E8694 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8E98 800E8698 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8E9C 800E869C 00000000 */  nop
/* 8EA0 800E86A0 A404428C */  lw         $v0, 0x4A4($v0)
/* 8EA4 800E86A4 0F80043C */  lui        $a0, %hi(D_800F4E04)
/* 8EA8 800E86A8 044E8424 */  addiu      $a0, $a0, %lo(D_800F4E04)
/* 8EAC 800E86AC 09F84000 */  jalr       $v0
/* 8EB0 800E86B0 00000000 */   nop
/* 8EB4 800E86B4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8EB8 800E86B8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8EBC 800E86BC 00000000 */  nop
/* 8EC0 800E86C0 140C428C */  lw         $v0, 0xC14($v0)
/* 8EC4 800E86C4 00000000 */  nop
/* 8EC8 800E86C8 09F84000 */  jalr       $v0
/* 8ECC 800E86CC 00300434 */   ori       $a0, $zero, 0x3000
/* 8ED0 800E86D0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8ED4 800E86D4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8ED8 800E86D8 21200002 */  addu       $a0, $s0, $zero
/* 8EDC 800E86DC 0005428C */  lw         $v0, 0x500($v0)
/* 8EE0 800E86E0 0F80063C */  lui        $a2, %hi(func_800E8474)
/* 8EE4 800E86E4 7484C624 */  addiu      $a2, $a2, %lo(func_800E8474)
/* 8EE8 800E86E8 09F84000 */  jalr       $v0
/* 8EEC 800E86EC 1000A527 */   addiu     $a1, $sp, 0x10
/* 8EF0 800E86F0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8EF4 800E86F4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8EF8 800E86F8 00000000 */  nop
/* 8EFC 800E86FC 0406428C */  lw         $v0, 0x604($v0)
/* 8F00 800E8700 00000000 */  nop
/* 8F04 800E8704 09F84000 */  jalr       $v0
/* 8F08 800E8708 21200000 */   addu      $a0, $zero, $zero
/* 8F0C 800E870C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8F10 800E8710 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8F14 800E8714 00000000 */  nop
/* 8F18 800E8718 0C06428C */  lw         $v0, 0x60C($v0)
/* 8F1C 800E871C 00000000 */  nop
/* 8F20 800E8720 09F84000 */  jalr       $v0
/* 8F24 800E8724 21200000 */   addu      $a0, $zero, $zero
/* 8F28 800E8728 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8F2C 800E872C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8F30 800E8730 00000000 */  nop
/* 8F34 800E8734 3C0C428C */  lw         $v0, 0xC3C($v0)
/* 8F38 800E8738 00000000 */  nop
/* 8F3C 800E873C 09F84000 */  jalr       $v0
/* 8F40 800E8740 00000000 */   nop
/* 8F44 800E8744 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8F48 800E8748 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8F4C 800E874C 5800A427 */  addiu      $a0, $sp, 0x58
/* 8F50 800E8750 21280000 */  addu       $a1, $zero, $zero
/* 8F54 800E8754 2C06428C */  lw         $v0, 0x62C($v0)
/* 8F58 800E8758 21300000 */  addu       $a2, $zero, $zero
/* 8F5C 800E875C 09F84000 */  jalr       $v0
/* 8F60 800E8760 21380000 */   addu      $a3, $zero, $zero
/* 8F64 800E8764 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8F68 800E8768 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8F6C 800E876C 00000000 */  nop
/* 8F70 800E8770 3006428C */  lw         $v0, 0x630($v0)
/* 8F74 800E8774 00000000 */  nop
/* 8F78 800E8778 09F84000 */  jalr       $v0
/* 8F7C 800E877C 21200000 */   addu      $a0, $zero, $zero
/* 8F80 800E8780 6400BF8F */  lw         $ra, 0x64($sp)
/* 8F84 800E8784 6000B08F */  lw         $s0, 0x60($sp)
/* 8F88 800E8788 0800E003 */  jr         $ra
/* 8F8C 800E878C 6800BD27 */   addiu     $sp, $sp, 0x68
