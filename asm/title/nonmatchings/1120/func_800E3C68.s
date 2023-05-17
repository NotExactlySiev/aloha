.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3C68
/* 4468 800E3C68 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 446C 800E3C6C D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 4470 800E3C70 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4474 800E3C74 1000BFAF */  sw         $ra, 0x10($sp)
/* 4478 800E3C78 128F030C */  jal        func_800E3C48
/* 447C 800E3C7C 00010534 */   ori       $a1, $zero, 0x100
/* 4480 800E3C80 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 4484 800E3C84 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 4488 800E3C88 00010534 */  ori        $a1, $zero, 0x100
/* 448C 800E3C8C 128F030C */  jal        func_800E3C48
/* 4490 800E3C90 00018424 */   addiu     $a0, $a0, 0x100
/* 4494 800E3C94 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 4498 800E3C98 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 449C 800E3C9C 00010534 */  ori        $a1, $zero, 0x100
/* 44A0 800E3CA0 128F030C */  jal        func_800E3C48
/* 44A4 800E3CA4 00028424 */   addiu     $a0, $a0, 0x200
/* 44A8 800E3CA8 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 44AC 800E3CAC D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 44B0 800E3CB0 00010534 */  ori        $a1, $zero, 0x100
/* 44B4 800E3CB4 128F030C */  jal        func_800E3C48
/* 44B8 800E3CB8 00038424 */   addiu     $a0, $a0, 0x300
/* 44BC 800E3CBC 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 44C0 800E3CC0 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 44C4 800E3CC4 00010534 */  ori        $a1, $zero, 0x100
/* 44C8 800E3CC8 128F030C */  jal        func_800E3C48
/* 44CC 800E3CCC 00048424 */   addiu     $a0, $a0, 0x400
/* 44D0 800E3CD0 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 44D4 800E3CD4 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 44D8 800E3CD8 03000534 */  ori        $a1, $zero, 0x3
/* 44DC 800E3CDC 128F030C */  jal        func_800E3C48
/* 44E0 800E3CE0 0F058424 */   addiu     $a0, $a0, 0x50F
/* 44E4 800E3CE4 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 44E8 800E3CE8 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 44EC 800E3CEC 00000000 */  nop
/* 44F0 800E3CF0 140540A0 */  sb         $zero, 0x514($v0)
/* 44F4 800E3CF4 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 44F8 800E3CF8 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 44FC 800E3CFC 00000000 */  nop
/* 4500 800E3D00 E20440A0 */  sb         $zero, 0x4E2($v0)
/* 4504 800E3D04 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 4508 800E3D08 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 450C 800E3D0C 00000000 */  nop
/* 4510 800E3D10 14056290 */  lbu        $v0, 0x514($v1)
/* 4514 800E3D14 00000000 */  nop
/* 4518 800E3D18 E40062A0 */  sb         $v0, 0xE4($v1)
/* 451C 800E3D1C 1A80053C */  lui        $a1, %hi(D_801A0FD8)
/* 4520 800E3D20 D80FA58C */  lw         $a1, %lo(D_801A0FD8)($a1)
/* 4524 800E3D24 0E80043C */  lui        $a0, %hi(D_800E0904)
/* 4528 800E3D28 04098424 */  addiu      $a0, $a0, %lo(D_800E0904)
/* 452C 800E3D2C 5E9F030C */  jal        func_800E7D78
/* 4530 800E3D30 EB04A524 */   addiu     $a1, $a1, 0x4EB
/* 4534 800E3D34 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 4538 800E3D38 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 453C 800E3D3C 4585030C */  jal        func_800E1514
/* 4540 800E3D40 00048424 */   addiu     $a0, $a0, 0x400
/* 4544 800E3D44 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 4548 800E3D48 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 454C 800E3D4C 00000000 */  nop
/* 4550 800E3D50 FC0462AC */  sw         $v0, 0x4FC($v1)
/* 4554 800E3D54 21306000 */  addu       $a2, $v1, $zero
/* 4558 800E3D58 0004C724 */  addiu      $a3, $a2, 0x400
/* 455C 800E3D5C 0005C824 */  addiu      $t0, $a2, 0x500
.L800E3D60:
/* 4560 800E3D60 0000E28C */  lw         $v0, 0x0($a3)
/* 4564 800E3D64 0400E38C */  lw         $v1, 0x4($a3)
/* 4568 800E3D68 0800E48C */  lw         $a0, 0x8($a3)
/* 456C 800E3D6C 0C00E58C */  lw         $a1, 0xC($a3)
/* 4570 800E3D70 0000C2AC */  sw         $v0, 0x0($a2)
/* 4574 800E3D74 0400C3AC */  sw         $v1, 0x4($a2)
/* 4578 800E3D78 0800C4AC */  sw         $a0, 0x8($a2)
/* 457C 800E3D7C 0C00C5AC */  sw         $a1, 0xC($a2)
/* 4580 800E3D80 1000E724 */  addiu      $a3, $a3, 0x10
/* 4584 800E3D84 F6FFE814 */  bne        $a3, $t0, .L800E3D60
/* 4588 800E3D88 1000C624 */   addiu     $a2, $a2, 0x10
/* 458C 800E3D8C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4590 800E3D90 00000000 */  nop
/* 4594 800E3D94 0800E003 */  jr         $ra
/* 4598 800E3D98 1800BD27 */   addiu     $sp, $sp, 0x18
