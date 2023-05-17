.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024DA0
/* D5A0 80024DA0 0480023C */  lui        $v0, %hi(D_80046EE0)
/* D5A4 80024DA4 E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* D5A8 80024DA8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D5AC 80024DAC 1400B1AF */  sw         $s1, 0x14($sp)
/* D5B0 80024DB0 0480113C */  lui        $s1, %hi(D_80046EE8)
/* D5B4 80024DB4 E86E318E */  lw         $s1, %lo(D_80046EE8)($s1)
/* D5B8 80024DB8 1000B0AF */  sw         $s0, 0x10($sp)
/* D5BC 80024DBC 21808000 */  addu       $s0, $a0, $zero
/* D5C0 80024DC0 02004228 */  slti       $v0, $v0, 0x2
/* D5C4 80024DC4 08004014 */  bnez       $v0, .L80024DE8
/* D5C8 80024DC8 1800BFAF */   sw        $ra, 0x18($sp)
/* D5CC 80024DCC 0280043C */  lui        $a0, %hi(D_80018254)
/* D5D0 80024DD0 54828424 */  addiu      $a0, $a0, %lo(D_80018254)
/* D5D4 80024DD4 0480023C */  lui        $v0, %hi(D_80046EDC)
/* D5D8 80024DD8 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* D5DC 80024DDC 00000000 */  nop
/* D5E0 80024DE0 09F84000 */  jalr       $v0
/* D5E4 80024DE4 21280002 */   addu      $a1, $s0, $zero
.L80024DE8:
/* D5E8 80024DE8 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D5EC 80024DEC D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D5F0 80024DF0 00000000 */  nop
/* D5F4 80024DF4 2800428C */  lw         $v0, 0x28($v0)
/* D5F8 80024DF8 0480013C */  lui        $at, %hi(D_80046EE8)
/* D5FC 80024DFC E86E30AC */  sw         $s0, %lo(D_80046EE8)($at)
/* D600 80024E00 09F84000 */  jalr       $v0
/* D604 80024E04 08000434 */   ori       $a0, $zero, 0x8
/* D608 80024E08 0480033C */  lui        $v1, %hi(D_80046EE8)
/* D60C 80024E0C E86E638C */  lw         $v1, %lo(D_80046EE8)($v1)
/* D610 80024E10 00000000 */  nop
/* D614 80024E14 04006010 */  beqz       $v1, .L80024E28
/* D618 80024E18 21204000 */   addu      $a0, $v0, $zero
/* D61C 80024E1C 0008023C */  lui        $v0, (0x8000080 >> 16)
/* D620 80024E20 8B930008 */  j          .L80024E2C
/* D624 80024E24 80004234 */   ori       $v0, $v0, (0x8000080 & 0xFFFF)
.L80024E28:
/* D628 80024E28 0008023C */  lui        $v0, (0x8000000 >> 16)
.L80024E2C:
/* D62C 80024E2C 25208200 */  or         $a0, $a0, $v0
/* D630 80024E30 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D634 80024E34 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D638 80024E38 00000000 */  nop
/* D63C 80024E3C 1000428C */  lw         $v0, 0x10($v0)
/* D640 80024E40 00000000 */  nop
/* D644 80024E44 09F84000 */  jalr       $v0
/* D648 80024E48 00000000 */   nop
/* D64C 80024E4C 0480033C */  lui        $v1, %hi(D_80046EE4)
/* D650 80024E50 E46E638C */  lw         $v1, %lo(D_80046EE4)($v1)
/* D654 80024E54 02000234 */  ori        $v0, $zero, 0x2
/* D658 80024E58 0F006214 */  bne        $v1, $v0, .L80024E98
/* D65C 80024E5C 21102002 */   addu      $v0, $s1, $zero
/* D660 80024E60 0020043C */  lui        $a0, (0x20000504 >> 16)
/* D664 80024E64 0480023C */  lui        $v0, %hi(D_80046EE8)
/* D668 80024E68 E86E428C */  lw         $v0, %lo(D_80046EE8)($v0)
/* D66C 80024E6C 0480033C */  lui        $v1, %hi(D_80046ED8)
/* D670 80024E70 D86E638C */  lw         $v1, %lo(D_80046ED8)($v1)
/* D674 80024E74 03004010 */  beqz       $v0, .L80024E84
/* D678 80024E78 04058434 */   ori       $a0, $a0, (0x20000504 & 0xFFFF)
/* D67C 80024E7C 0020043C */  lui        $a0, (0x20000501 >> 16)
/* D680 80024E80 01058434 */  ori        $a0, $a0, (0x20000501 & 0xFFFF)
.L80024E84:
/* D684 80024E84 1000628C */  lw         $v0, 0x10($v1)
/* D688 80024E88 00000000 */  nop
/* D68C 80024E8C 09F84000 */  jalr       $v0
/* D690 80024E90 00000000 */   nop
/* D694 80024E94 21102002 */  addu       $v0, $s1, $zero
.L80024E98:
/* D698 80024E98 1800BF8F */  lw         $ra, 0x18($sp)
/* D69C 80024E9C 1400B18F */  lw         $s1, 0x14($sp)
/* D6A0 80024EA0 1000B08F */  lw         $s0, 0x10($sp)
/* D6A4 80024EA4 2000BD27 */  addiu      $sp, $sp, 0x20
/* D6A8 80024EA8 0800E003 */  jr         $ra
/* D6AC 80024EAC 00000000 */   nop
