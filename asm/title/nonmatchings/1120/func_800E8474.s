.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8474
/* 8C74 800E8474 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8C78 800E8478 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8C7C 800E847C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8C80 800E8480 1000BFAF */  sw         $ra, 0x10($sp)
/* 8C84 800E8484 C003428C */  lw         $v0, 0x3C0($v0)
/* 8C88 800E8488 00000000 */  nop
/* 8C8C 800E848C 09F84000 */  jalr       $v0
/* 8C90 800E8490 21200000 */   addu      $a0, $zero, $zero
/* 8C94 800E8494 A0084230 */  andi       $v0, $v0, 0x8A0
/* 8C98 800E8498 0A004010 */  beqz       $v0, .L800E84C4
/* 8C9C 800E849C 00000000 */   nop
/* 8CA0 800E84A0 0F80023C */  lui        $v0, %hi(D_800F4E00)
/* 8CA4 800E84A4 004E428C */  lw         $v0, %lo(D_800F4E00)($v0)
/* 8CA8 800E84A8 00000000 */  nop
/* 8CAC 800E84AC 05004014 */  bnez       $v0, .L800E84C4
/* 8CB0 800E84B0 01000234 */   ori       $v0, $zero, 0x1
/* 8CB4 800E84B4 0F80013C */  lui        $at, %hi(D_800F4E00)
/* 8CB8 800E84B8 004E22AC */  sw         $v0, %lo(D_800F4E00)($at)
/* 8CBC 800E84BC 5BA10308 */  j          .L800E856C
/* 8CC0 800E84C0 21100000 */   addu      $v0, $zero, $zero
.L800E84C4:
/* 8CC4 800E84C4 0F80033C */  lui        $v1, %hi(D_800F4E00)
/* 8CC8 800E84C8 004E638C */  lw         $v1, %lo(D_800F4E00)($v1)
/* 8CCC 800E84CC 01000234 */  ori        $v0, $zero, 0x1
/* 8CD0 800E84D0 16006214 */  bne        $v1, $v0, .L800E852C
/* 8CD4 800E84D4 00000000 */   nop
/* 8CD8 800E84D8 D582030C */  jal        func_800E0B54
/* 8CDC 800E84DC 00260434 */   ori       $a0, $zero, 0x2600
/* 8CE0 800E84E0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8CE4 800E84E4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8CE8 800E84E8 07000434 */  ori        $a0, $zero, 0x7
/* 8CEC 800E84EC 9C04428C */  lw         $v0, 0x49C($v0)
/* 8CF0 800E84F0 21280000 */  addu       $a1, $zero, $zero
/* 8CF4 800E84F4 09F84000 */  jalr       $v0
/* 8CF8 800E84F8 21300000 */   addu      $a2, $zero, $zero
/* 8CFC 800E84FC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8D00 800E8500 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8D04 800E8504 00000000 */  nop
/* 8D08 800E8508 0C04428C */  lw         $v0, 0x40C($v0)
/* 8D0C 800E850C 00000000 */  nop
/* 8D10 800E8510 09F84000 */  jalr       $v0
/* 8D14 800E8514 00000000 */   nop
/* 8D18 800E8518 02000234 */  ori        $v0, $zero, 0x2
/* 8D1C 800E851C 0F80013C */  lui        $at, %hi(D_800F4E00)
/* 8D20 800E8520 004E22AC */  sw         $v0, %lo(D_800F4E00)($at)
/* 8D24 800E8524 5BA10308 */  j          .L800E856C
/* 8D28 800E8528 21100000 */   addu      $v0, $zero, $zero
.L800E852C:
/* 8D2C 800E852C 02000234 */  ori        $v0, $zero, 0x2
/* 8D30 800E8530 0E006214 */  bne        $v1, $v0, .L800E856C
/* 8D34 800E8534 00000000 */   nop
/* 8D38 800E8538 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8D3C 800E853C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8D40 800E8540 00000000 */  nop
/* 8D44 800E8544 300C428C */  lw         $v0, 0xC30($v0)
/* 8D48 800E8548 00000000 */  nop
/* 8D4C 800E854C 09F84000 */  jalr       $v0
/* 8D50 800E8550 00000000 */   nop
/* 8D54 800E8554 02004230 */  andi       $v0, $v0, 0x2
/* 8D58 800E8558 04004014 */  bnez       $v0, .L800E856C
/* 8D5C 800E855C 00000000 */   nop
/* 8D60 800E8560 0F80013C */  lui        $at, %hi(D_800F4E00)
/* 8D64 800E8564 004E20AC */  sw         $zero, %lo(D_800F4E00)($at)
/* 8D68 800E8568 01000234 */  ori        $v0, $zero, 0x1
.L800E856C:
/* 8D6C 800E856C 1000BF8F */  lw         $ra, 0x10($sp)
/* 8D70 800E8570 00000000 */  nop
/* 8D74 800E8574 0800E003 */  jr         $ra
/* 8D78 800E8578 1800BD27 */   addiu     $sp, $sp, 0x18
