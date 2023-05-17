.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E09EC
/* 11EC 800E09EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 11F0 800E09F0 1000BFAF */  sw         $ra, 0x10($sp)
/* 11F4 800E09F4 0696030C */  jal        func_800E5818
/* 11F8 800E09F8 00000000 */   nop
/* 11FC 800E09FC 0F80023C */  lui        $v0, %hi(D_800F4CC8)
/* 1200 800E0A00 C84C428C */  lw         $v0, %lo(D_800F4CC8)($v0)
/* 1204 800E0A04 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 1208 800E0A08 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 120C 800E0A0C 0100422C */  sltiu      $v0, $v0, 0x1
/* 1210 800E0A10 0F80013C */  lui        $at, %hi(D_800F4CC8)
/* 1214 800E0A14 C84C22AC */  sw         $v0, %lo(D_800F4CC8)($at)
/* 1218 800E0A18 C0200200 */  sll        $a0, $v0, 3
/* 121C 800E0A1C 21208200 */  addu       $a0, $a0, $v0
/* 1220 800E0A20 80200400 */  sll        $a0, $a0, 2
/* 1224 800E0A24 21208200 */  addu       $a0, $a0, $v0
/* 1228 800E0A28 80200400 */  sll        $a0, $a0, 2
/* 122C 800E0A2C 0F80023C */  lui        $v0, %hi(D_800F4F28)
/* 1230 800E0A30 284F4224 */  addiu      $v0, $v0, %lo(D_800F4F28)
/* 1234 800E0A34 21208200 */  addu       $a0, $a0, $v0
/* 1238 800E0A38 1C06628C */  lw         $v0, 0x61C($v1)
/* 123C 800E0A3C 01000534 */  ori        $a1, $zero, 0x1
/* 1240 800E0A40 0F80013C */  lui        $at, %hi(D_800F4E10)
/* 1244 800E0A44 104E24AC */  sw         $a0, %lo(D_800F4E10)($at)
/* 1248 800E0A48 09F84000 */  jalr       $v0
/* 124C 800E0A4C 70008424 */   addiu     $a0, $a0, 0x70
/* 1250 800E0A50 1000BF8F */  lw         $ra, 0x10($sp)
/* 1254 800E0A54 00000000 */  nop
/* 1258 800E0A58 0800E003 */  jr         $ra
/* 125C 800E0A5C 1800BD27 */   addiu     $sp, $sp, 0x18
