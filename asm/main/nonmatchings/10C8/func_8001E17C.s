.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E17C
/* 697C 8001E17C A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 6980 8001E180 5000BFAF */  sw         $ra, 0x50($sp)
/* 6984 8001E184 0480033C */  lui        $v1, %hi(D_80047E08)
/* 6988 8001E188 087E638C */  lw         $v1, %lo(D_80047E08)($v1)
/* 698C 8001E18C 01000234 */  ori        $v0, $zero, 0x1
/* 6990 8001E190 20006214 */  bne        $v1, $v0, .L8001E214
/* 6994 8001E194 1000A727 */   addiu     $a3, $sp, 0x10
/* 6998 8001E198 21308000 */  addu       $a2, $a0, $zero
/* 699C 8001E19C 4000C824 */  addiu      $t0, $a2, 0x40
.L8001E1A0:
/* 69A0 8001E1A0 0000C28C */  lw         $v0, 0x0($a2)
/* 69A4 8001E1A4 0400C38C */  lw         $v1, 0x4($a2)
/* 69A8 8001E1A8 0800C48C */  lw         $a0, 0x8($a2)
/* 69AC 8001E1AC 0C00C58C */  lw         $a1, 0xC($a2)
/* 69B0 8001E1B0 0000E2AC */  sw         $v0, 0x0($a3)
/* 69B4 8001E1B4 0400E3AC */  sw         $v1, 0x4($a3)
/* 69B8 8001E1B8 0800E4AC */  sw         $a0, 0x8($a3)
/* 69BC 8001E1BC 0C00E5AC */  sw         $a1, 0xC($a3)
/* 69C0 8001E1C0 1000C624 */  addiu      $a2, $a2, 0x10
/* 69C4 8001E1C4 F6FFC814 */  bne        $a2, $t0, .L8001E1A0
/* 69C8 8001E1C8 1000E724 */   addiu     $a3, $a3, 0x10
/* 69CC 8001E1CC 1000A427 */  addiu      $a0, $sp, 0x10
/* 69D0 8001E1D0 1800A287 */  lh         $v0, 0x18($sp)
/* 69D4 8001E1D4 1A00A387 */  lh         $v1, 0x1A($sp)
/* 69D8 8001E1D8 02004104 */  bgez       $v0, .L8001E1E4
/* 69DC 8001E1DC 00000000 */   nop
/* 69E0 8001E1E0 23100200 */  negu       $v0, $v0
.L8001E1E4:
/* 69E4 8001E1E4 02006104 */  bgez       $v1, .L8001E1F0
/* 69E8 8001E1E8 00000000 */   nop
/* 69EC 8001E1EC 23180300 */  negu       $v1, $v1
.L8001E1F0:
/* 69F0 8001E1F0 21104300 */  addu       $v0, $v0, $v1
/* 69F4 8001E1F4 C21F0200 */  srl        $v1, $v0, 31
/* 69F8 8001E1F8 21104300 */  addu       $v0, $v0, $v1
/* 69FC 8001E1FC 42100200 */  srl        $v0, $v0, 1
/* 6A00 8001E200 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 6A04 8001E204 AFC5000C */  jal        func_800316BC
/* 6A08 8001E208 1800A2A7 */   sh        $v0, 0x18($sp)
/* 6A0C 8001E20C 87780008 */  j          .L8001E21C
/* 6A10 8001E210 00000000 */   nop
.L8001E214:
/* 6A14 8001E214 AFC5000C */  jal        func_800316BC
/* 6A18 8001E218 00000000 */   nop
.L8001E21C:
/* 6A1C 8001E21C 5000BF8F */  lw         $ra, 0x50($sp)
/* 6A20 8001E220 00000000 */  nop
/* 6A24 8001E224 0800E003 */  jr         $ra
/* 6A28 8001E228 5800BD27 */   addiu     $sp, $sp, 0x58
