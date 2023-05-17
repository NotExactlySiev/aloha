.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E82A8
/* 8AA8 800E82A8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8AAC 800E82AC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8AB0 800E82B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8AB4 800E82B4 1000BFAF */  sw         $ra, 0x10($sp)
/* 8AB8 800E82B8 2400428C */  lw         $v0, 0x24($v0)
/* 8ABC 800E82BC 00000000 */  nop
/* 8AC0 800E82C0 09F84000 */  jalr       $v0
/* 8AC4 800E82C4 00000000 */   nop
/* 8AC8 800E82C8 0F80033C */  lui        $v1, %hi(D_800F4DFC)
/* 8ACC 800E82CC FC4D638C */  lw         $v1, %lo(D_800F4DFC)($v1)
/* 8AD0 800E82D0 00000000 */  nop
/* 8AD4 800E82D4 10004310 */  beq        $v0, $v1, .L800E8318
/* 8AD8 800E82D8 00000000 */   nop
/* 8ADC 800E82DC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8AE0 800E82E0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8AE4 800E82E4 00000000 */  nop
/* 8AE8 800E82E8 2400428C */  lw         $v0, 0x24($v0)
/* 8AEC 800E82EC 00000000 */  nop
/* 8AF0 800E82F0 09F84000 */  jalr       $v0
/* 8AF4 800E82F4 00000000 */   nop
/* 8AF8 800E82F8 0F80013C */  lui        $at, %hi(D_800F4DFC)
/* 8AFC 800E82FC FC4D22AC */  sw         $v0, %lo(D_800F4DFC)($at)
/* 8B00 800E8300 0F80043C */  lui        $a0, %hi(D_800F4DF0)
/* 8B04 800E8304 F04D8424 */  addiu      $a0, $a0, %lo(D_800F4DF0)
/* 8B08 800E8308 0F80053C */  lui        $a1, %hi(D_800F05E0)
/* 8B0C 800E830C E005A524 */  addiu      $a1, $a1, %lo(D_800F05E0)
/* 8B10 800E8310 FB9F030C */  jal        func_800E7FEC
/* 8B14 800E8314 00000000 */   nop
.L800E8318:
/* 8B18 800E8318 0F80033C */  lui        $v1, %hi(D_800F4DE4)
/* 8B1C 800E831C E44D638C */  lw         $v1, %lo(D_800F4DE4)($v1)
/* 8B20 800E8320 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 8B24 800E8324 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 8B28 800E8328 00000000 */  nop
/* 8B2C 800E832C 18006200 */  mult       $v1, $v0
/* 8B30 800E8330 12100000 */  mflo       $v0
/* 8B34 800E8334 00000000 */  nop
/* 8B38 800E8338 0F80033C */  lui        $v1, %hi(D_800F4DF8)
/* 8B3C 800E833C F84D638C */  lw         $v1, %lo(D_800F4DF8)($v1)
/* 8B40 800E8340 02130200 */  srl        $v0, $v0, 12
/* 8B44 800E8344 21104300 */  addu       $v0, $v0, $v1
/* 8B48 800E8348 0F80013C */  lui        $at, %hi(D_800F4DF8)
/* 8B4C 800E834C F84D22AC */  sw         $v0, %lo(D_800F4DF8)($at)
/* 8B50 800E8350 02004104 */  bgez       $v0, .L800E835C
/* 8B54 800E8354 21304000 */   addu      $a2, $v0, $zero
/* 8B58 800E8358 FF014624 */  addiu      $a2, $v0, 0x1FF
.L800E835C:
/* 8B5C 800E835C 43320600 */  sra        $a2, $a2, 9
/* 8B60 800E8360 40320600 */  sll        $a2, $a2, 9
/* 8B64 800E8364 23304600 */  subu       $a2, $v0, $a2
/* 8B68 800E8368 0F80013C */  lui        $at, %hi(D_800F4DF8)
/* 8B6C 800E836C F84D26AC */  sw         $a2, %lo(D_800F4DF8)($at)
/* 8B70 800E8370 00FE0424 */  addiu      $a0, $zero, -0x200
/* 8B74 800E8374 21280000 */  addu       $a1, $zero, $zero
/* 8B78 800E8378 C2170600 */  srl        $v0, $a2, 31
/* 8B7C 800E837C 2130C200 */  addu       $a2, $a2, $v0
/* 8B80 800E8380 43300600 */  sra        $a2, $a2, 1
/* 8B84 800E8384 49A0030C */  jal        func_800E8124
/* 8B88 800E8388 4000C624 */   addiu     $a2, $a2, 0x40
/* 8B8C 800E838C 0F80063C */  lui        $a2, %hi(D_800F4DF8)
/* 8B90 800E8390 F84DC68C */  lw         $a2, %lo(D_800F4DF8)($a2)
/* 8B94 800E8394 00020434 */  ori        $a0, $zero, 0x200
/* 8B98 800E8398 40000534 */  ori        $a1, $zero, 0x40
/* 8B9C 800E839C C2170600 */  srl        $v0, $a2, 31
/* 8BA0 800E83A0 2130C200 */  addu       $a2, $a2, $v0
/* 8BA4 800E83A4 49A0030C */  jal        func_800E8124
/* 8BA8 800E83A8 43300600 */   sra       $a2, $a2, 1
/* 8BAC 800E83AC 1000BF8F */  lw         $ra, 0x10($sp)
/* 8BB0 800E83B0 00000000 */  nop
/* 8BB4 800E83B4 0800E003 */  jr         $ra
/* 8BB8 800E83B8 1800BD27 */   addiu     $sp, $sp, 0x18
