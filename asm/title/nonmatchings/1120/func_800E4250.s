.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E4250
/* 4A50 800E4250 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 4A54 800E4254 3800BFAF */  sw         $ra, 0x38($sp)
/* 4A58 800E4258 3400B5AF */  sw         $s5, 0x34($sp)
/* 4A5C 800E425C 3000B4AF */  sw         $s4, 0x30($sp)
/* 4A60 800E4260 2C00B3AF */  sw         $s3, 0x2C($sp)
/* 4A64 800E4264 2800B2AF */  sw         $s2, 0x28($sp)
/* 4A68 800E4268 2400B1AF */  sw         $s1, 0x24($sp)
/* 4A6C 800E426C F59F030C */  jal        func_800E7FD4
/* 4A70 800E4270 2000B0AF */   sw        $s0, 0x20($sp)
/* 4A74 800E4274 0F80013C */  lui        $at, %hi(D_800F4E68)
/* 4A78 800E4278 684E20AC */  sw         $zero, %lo(D_800F4E68)($at)
/* 4A7C 800E427C E99F030C */  jal        func_800E7FA4
/* 4A80 800E4280 00000000 */   nop
/* 4A84 800E4284 F7A1030C */  jal        func_800E87DC
/* 4A88 800E4288 00000000 */   nop
/* 4A8C 800E428C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4A90 800E4290 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4A94 800E4294 00000000 */  nop
/* 4A98 800E4298 040C428C */  lw         $v0, 0xC04($v0)
/* 4A9C 800E429C 00000000 */  nop
/* 4AA0 800E42A0 09F84000 */  jalr       $v0
/* 4AA4 800E42A4 01000434 */   ori       $a0, $zero, 0x1
/* 4AA8 800E42A8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4AAC 800E42AC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4AB0 800E42B0 00000000 */  nop
/* 4AB4 800E42B4 0406428C */  lw         $v0, 0x604($v0)
/* 4AB8 800E42B8 00000000 */  nop
/* 4ABC 800E42BC 09F84000 */  jalr       $v0
/* 4AC0 800E42C0 21200000 */   addu      $a0, $zero, $zero
/* 4AC4 800E42C4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4AC8 800E42C8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4ACC 800E42CC 00000000 */  nop
/* 4AD0 800E42D0 0006428C */  lw         $v0, 0x600($v0)
/* 4AD4 800E42D4 00000000 */  nop
/* 4AD8 800E42D8 09F84000 */  jalr       $v0
/* 4ADC 800E42DC 21200000 */   addu      $a0, $zero, $zero
/* 4AE0 800E42E0 21A0030C */  jal        func_800E8084
/* 4AE4 800E42E4 00000000 */   nop
/* 4AE8 800E42E8 B59D030C */  jal        func_800E76D4
/* 4AEC 800E42EC 00000000 */   nop
/* 4AF0 800E42F0 3D9C030C */  jal        func_800E70F4
/* 4AF4 800E42F4 00000000 */   nop
/* 4AF8 800E42F8 0B9D030C */  jal        func_800E742C
/* 4AFC 800E42FC 00000000 */   nop
/* 4B00 800E4300 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4B04 800E4304 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4B08 800E4308 00000000 */  nop
/* 4B0C 800E430C 1400428C */  lw         $v0, 0x14($v0)
/* 4B10 800E4310 00000000 */  nop
/* 4B14 800E4314 09F84000 */  jalr       $v0
/* 4B18 800E4318 00000000 */   nop
/* 4B1C 800E431C 1A80013C */  lui        $at, %hi(D_801A0FD8)
/* 4B20 800E4320 D80F22AC */  sw         $v0, %lo(D_801A0FD8)($at)
/* 4B24 800E4324 0E054290 */  lbu        $v0, 0x50E($v0)
/* 4B28 800E4328 00000000 */  nop
/* 4B2C 800E432C 16004014 */  bnez       $v0, .L800E4388
/* 4B30 800E4330 00000000 */   nop
/* 4B34 800E4334 0E80043C */  lui        $a0, %hi(D_800E038C)
/* 4B38 800E4338 8C038424 */  addiu      $a0, $a0, %lo(D_800E038C)
/* 4B3C 800E433C 90A1030C */  jal        func_800E8640
/* 4B40 800E4340 E5010534 */   ori       $a1, $zero, 0x1E5
/* 4B44 800E4344 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 4B48 800E4348 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 4B4C 800E434C 01001034 */  ori        $s0, $zero, 0x1
/* 4B50 800E4350 180550A0 */  sb         $s0, 0x518($v0)
/* 4B54 800E4354 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 4B58 800E4358 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 4B5C 800E435C 00000000 */  nop
/* 4B60 800E4360 0E054290 */  lbu        $v0, 0x50E($v0)
/* 4B64 800E4364 00000000 */  nop
/* 4B68 800E4368 07004014 */  bnez       $v0, .L800E4388
/* 4B6C 800E436C 00000000 */   nop
/* 4B70 800E4370 1A8F030C */  jal        func_800E3C68
/* 4B74 800E4374 00000000 */   nop
/* 4B78 800E4378 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 4B7C 800E437C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 4B80 800E4380 00000000 */  nop
/* 4B84 800E4384 0E0550A0 */  sb         $s0, 0x50E($v0)
.L800E4388:
/* 4B88 800E4388 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 4B8C 800E438C D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 4B90 800E4390 00000000 */  nop
/* 4B94 800E4394 E2006290 */  lbu        $v0, 0xE2($v1)
/* 4B98 800E4398 00000000 */  nop
/* 4B9C 800E439C 09004010 */  beqz       $v0, .L800E43C4
/* 4BA0 800E43A0 FF001434 */   ori       $s4, $zero, 0xFF
/* 4BA4 800E43A4 E4006290 */  lbu        $v0, 0xE4($v1)
/* 4BA8 800E43A8 00000000 */  nop
/* 4BAC 800E43AC 05004014 */  bnez       $v0, .L800E43C4
/* 4BB0 800E43B0 01000234 */   ori       $v0, $zero, 0x1
/* 4BB4 800E43B4 E40062A0 */  sb         $v0, 0xE4($v1)
/* 4BB8 800E43B8 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 4BBC 800E43BC D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 4BC0 800E43C0 FF001434 */  ori        $s4, $zero, 0xFF
.L800E43C4:
/* 4BC4 800E43C4 E4006290 */  lbu        $v0, 0xE4($v1)
/* 4BC8 800E43C8 01001534 */  ori        $s5, $zero, 0x1
/* 4BCC 800E43CC 21900000 */  addu       $s2, $zero, $zero
/* 4BD0 800E43D0 2786030C */  jal        func_800E189C
/* 4BD4 800E43D4 140562A0 */   sb        $v0, 0x514($v1)
/* 4BD8 800E43D8 F0001034 */  ori        $s0, $zero, 0xF0
/* 4BDC 800E43DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 4BE0 800E43E0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4BE4 800E43E4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4BE8 800E43E8 0F80043C */  lui        $a0, %hi(D_800F4F28)
/* 4BEC 800E43EC 284F8424 */  addiu      $a0, $a0, %lo(D_800F4F28)
/* 4BF0 800E43F0 21280000 */  addu       $a1, $zero, $zero
/* 4BF4 800E43F4 3806428C */  lw         $v0, 0x638($v0)
/* 4BF8 800E43F8 21300000 */  addu       $a2, $zero, $zero
/* 4BFC 800E43FC 09F84000 */  jalr       $v0
/* 4C00 800E4400 40010734 */   ori       $a3, $zero, 0x140
/* 4C04 800E4404 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C08 800E4408 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4C0C 800E440C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4C10 800E4410 0F80043C */  lui        $a0, %hi(D_800F4FBC)
/* 4C14 800E4414 BC4F8424 */  addiu      $a0, $a0, %lo(D_800F4FBC)
/* 4C18 800E4418 21280000 */  addu       $a1, $zero, $zero
/* 4C1C 800E441C 3806428C */  lw         $v0, 0x638($v0)
/* 4C20 800E4420 00010634 */  ori        $a2, $zero, 0x100
/* 4C24 800E4424 09F84000 */  jalr       $v0
/* 4C28 800E4428 40010734 */   ori       $a3, $zero, 0x140
/* 4C2C 800E442C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C30 800E4430 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4C34 800E4434 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4C38 800E4438 0F80043C */  lui        $a0, %hi(D_800F4F3C)
/* 4C3C 800E443C 3C4F8424 */  addiu      $a0, $a0, %lo(D_800F4F3C)
/* 4C40 800E4440 21280000 */  addu       $a1, $zero, $zero
/* 4C44 800E4444 3C06428C */  lw         $v0, 0x63C($v0)
/* 4C48 800E4448 00010634 */  ori        $a2, $zero, 0x100
/* 4C4C 800E444C 09F84000 */  jalr       $v0
/* 4C50 800E4450 40010734 */   ori       $a3, $zero, 0x140
/* 4C54 800E4454 1000B0AF */  sw         $s0, 0x10($sp)
/* 4C58 800E4458 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4C5C 800E445C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4C60 800E4460 0F80043C */  lui        $a0, %hi(D_800F4FD0)
/* 4C64 800E4464 D04F8424 */  addiu      $a0, $a0, %lo(D_800F4FD0)
/* 4C68 800E4468 21280000 */  addu       $a1, $zero, $zero
/* 4C6C 800E446C 3C06428C */  lw         $v0, 0x63C($v0)
/* 4C70 800E4470 21300000 */  addu       $a2, $zero, $zero
/* 4C74 800E4474 09F84000 */  jalr       $v0
/* 4C78 800E4478 40010734 */   ori       $a3, $zero, 0x140
/* 4C7C 800E447C 0F80043C */  lui        $a0, %hi(D_800F4F30)
/* 4C80 800E4480 304F8424 */  addiu      $a0, $a0, %lo(D_800F4F30)
/* 4C84 800E4484 04000334 */  ori        $v1, $zero, 0x4
/* 4C88 800E4488 000083A4 */  sh         $v1, 0x0($a0)
/* 4C8C 800E448C 0C000234 */  ori        $v0, $zero, 0xC
/* 4C90 800E4490 0F80013C */  lui        $at, %hi(D_800F4F32)
/* 4C94 800E4494 324F22A4 */  sh         $v0, %lo(D_800F4F32)($at)
/* 4C98 800E4498 0F80013C */  lui        $at, %hi(D_800F4FC4)
/* 4C9C 800E449C C44F23A4 */  sh         $v1, %lo(D_800F4FC4)($at)
/* 4CA0 800E44A0 0F80013C */  lui        $at, %hi(D_800F4FC6)
/* 4CA4 800E44A4 C64F22A4 */  sh         $v0, %lo(D_800F4FC6)($at)
/* 4CA8 800E44A8 F8000334 */  ori        $v1, $zero, 0xF8
/* 4CAC 800E44AC 0F80013C */  lui        $at, %hi(D_800F4F34)
/* 4CB0 800E44B0 344F23A4 */  sh         $v1, %lo(D_800F4F34)($at)
/* 4CB4 800E44B4 D8000234 */  ori        $v0, $zero, 0xD8
/* 4CB8 800E44B8 0F80013C */  lui        $at, %hi(D_800F4F36)
/* 4CBC 800E44BC 364F22A4 */  sh         $v0, %lo(D_800F4F36)($at)
/* 4CC0 800E44C0 0F80013C */  lui        $at, %hi(D_800F4FC8)
/* 4CC4 800E44C4 C84F23A4 */  sh         $v1, %lo(D_800F4FC8)($at)
/* 4CC8 800E44C8 0F80013C */  lui        $at, %hi(D_800F4FCA)
/* 4CCC 800E44CC CA4F22A4 */  sh         $v0, %lo(D_800F4FCA)($at)
/* 4CD0 800E44D0 0A009024 */  addiu      $s0, $a0, 0xA
/* 4CD4 800E44D4 02009124 */  addiu      $s1, $a0, 0x2
/* 4CD8 800E44D8 32019324 */  addiu      $s3, $a0, 0x132
.L800E44DC:
/* 4CDC 800E44DC 0F80013C */  lui        $at, %hi(D_800F4F54)
/* 4CE0 800E44E0 544F2124 */  addiu      $at, $at, %lo(D_800F4F54)
/* 4CE4 800E44E4 21083200 */  addu       $at, $at, $s2
/* 4CE8 800E44E8 000020A0 */  sb         $zero, 0x0($at)
/* 4CEC 800E44EC 0F80023C */  lui        $v0, %hi(D_800F4F3C)
/* 4CF0 800E44F0 3C4F4224 */  addiu      $v0, $v0, %lo(D_800F4F3C)
/* 4CF4 800E44F4 21104202 */  addu       $v0, $s2, $v0
/* 4CF8 800E44F8 190054A0 */  sb         $s4, 0x19($v0)
/* 4CFC 800E44FC 1A0054A0 */  sb         $s4, 0x1A($v0)
/* 4D00 800E4500 1B0054A0 */  sb         $s4, 0x1B($v0)
/* 4D04 800E4504 000000A2 */  sb         $zero, 0x0($s0)
/* 4D08 800E4508 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4D0C 800E450C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4D10 800E4510 00000000 */  nop
/* 4D14 800E4514 1C00428C */  lw         $v0, 0x1C($v0)
/* 4D18 800E4518 00000000 */  nop
/* 4D1C 800E451C 09F84000 */  jalr       $v0
/* 4D20 800E4520 00000000 */   nop
/* 4D24 800E4524 06005514 */  bne        $v0, $s5, .L800E4540
/* 4D28 800E4528 94005226 */   addiu     $s2, $s2, 0x94
/* 4D2C 800E452C 00002296 */  lhu        $v0, 0x0($s1)
/* 4D30 800E4530 00000000 */  nop
/* 4D34 800E4534 18004224 */  addiu      $v0, $v0, 0x18
/* 4D38 800E4538 000022A6 */  sh         $v0, 0x0($s1)
/* 4D3C 800E453C 000015A2 */  sb         $s5, 0x0($s0)
.L800E4540:
/* 4D40 800E4540 94001026 */  addiu      $s0, $s0, 0x94
/* 4D44 800E4544 2A101302 */  slt        $v0, $s0, $s3
/* 4D48 800E4548 E4FF4014 */  bnez       $v0, .L800E44DC
/* 4D4C 800E454C 94003126 */   addiu     $s1, $s1, 0x94
.L800E4550:
/* 4D50 800E4550 A98F030C */  jal        func_800E3EA4
/* 4D54 800E4554 21880000 */   addu      $s1, $zero, $zero
/* 4D58 800E4558 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4D5C 800E455C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4D60 800E4560 00000000 */  nop
/* 4D64 800E4564 C80C428C */  lw         $v0, 0xCC8($v0)
/* 4D68 800E4568 00000000 */  nop
/* 4D6C 800E456C 09F84000 */  jalr       $v0
/* 4D70 800E4570 21200000 */   addu      $a0, $zero, $zero
/* 4D74 800E4574 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4D78 800E4578 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4D7C 800E457C 00000000 */  nop
/* 4D80 800E4580 C40C428C */  lw         $v0, 0xCC4($v0)
/* 4D84 800E4584 00000000 */  nop
/* 4D88 800E4588 09F84000 */  jalr       $v0
/* 4D8C 800E458C 01000434 */   ori       $a0, $zero, 0x1
/* 4D90 800E4590 0F80013C */  lui        $at, %hi(D_800F4E50)
/* 4D94 800E4594 504E20AC */  sw         $zero, %lo(D_800F4E50)($at)
/* 4D98 800E4598 01000234 */  ori        $v0, $zero, 0x1
/* 4D9C 800E459C 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 4DA0 800E45A0 404E22AC */  sw         $v0, %lo(D_800F4E40)($at)
/* 4DA4 800E45A4 0F80013C */  lui        $at, %hi(D_800F4E20)
/* 4DA8 800E45A8 204E20AC */  sw         $zero, %lo(D_800F4E20)($at)
/* 4DAC 800E45AC 0F80013C */  lui        $at, %hi(D_800F4E28)
/* 4DB0 800E45B0 284E20AC */  sw         $zero, %lo(D_800F4E28)($at)
.L800E45B4:
/* 4DB4 800E45B4 7B82030C */  jal        func_800E09EC
/* 4DB8 800E45B8 00000000 */   nop
/* 4DBC 800E45BC 9395030C */  jal        func_800E564C
/* 4DC0 800E45C0 00000000 */   nop
/* 4DC4 800E45C4 1D83030C */  jal        func_800E0C74
/* 4DC8 800E45C8 00000000 */   nop
/* 4DCC 800E45CC 3385030C */  jal        func_800E14CC
/* 4DD0 800E45D0 00000000 */   nop
/* 4DD4 800E45D4 0F80023C */  lui        $v0, %hi(D_800F4E50)
/* 4DD8 800E45D8 504E428C */  lw         $v0, %lo(D_800F4E50)($v0)
/* 4DDC 800E45DC 00000000 */  nop
/* 4DE0 800E45E0 23004014 */  bnez       $v0, .L800E4670
/* 4DE4 800E45E4 00000000 */   nop
/* 4DE8 800E45E8 0F80023C */  lui        $v0, %hi(D_800F4CEC)
/* 4DEC 800E45EC EC4C428C */  lw         $v0, %lo(D_800F4CEC)($v0)
/* 4DF0 800E45F0 00000000 */  nop
/* 4DF4 800E45F4 1E004014 */  bnez       $v0, .L800E4670
/* 4DF8 800E45F8 00000000 */   nop
/* 4DFC 800E45FC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4E00 800E4600 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4E04 800E4604 00000000 */  nop
/* 4E08 800E4608 300C428C */  lw         $v0, 0xC30($v0)
/* 4E0C 800E460C 00000000 */  nop
/* 4E10 800E4610 09F84000 */  jalr       $v0
/* 4E14 800E4614 00000000 */   nop
/* 4E18 800E4618 08004230 */  andi       $v0, $v0, 0x8
/* 4E1C 800E461C 14004014 */  bnez       $v0, .L800E4670
/* 4E20 800E4620 00000000 */   nop
/* 4E24 800E4624 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4E28 800E4628 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4E2C 800E462C 00000000 */  nop
/* 4E30 800E4630 C80C428C */  lw         $v0, 0xCC8($v0)
/* 4E34 800E4634 00000000 */  nop
/* 4E38 800E4638 09F84000 */  jalr       $v0
/* 4E3C 800E463C 01000434 */   ori       $a0, $zero, 0x1
/* 4E40 800E4640 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4E44 800E4644 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4E48 800E4648 00000000 */  nop
/* 4E4C 800E464C C40C428C */  lw         $v0, 0xCC4($v0)
/* 4E50 800E4650 00000000 */  nop
/* 4E54 800E4654 09F84000 */  jalr       $v0
/* 4E58 800E4658 F3000434 */   ori       $a0, $zero, 0xF3
/* 4E5C 800E465C 01000234 */  ori        $v0, $zero, 0x1
/* 4E60 800E4660 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 4E64 800E4664 404E22AC */  sw         $v0, %lo(D_800F4E40)($at)
/* 4E68 800E4668 0F80013C */  lui        $at, %hi(D_800F4E50)
/* 4E6C 800E466C 504E22AC */  sw         $v0, %lo(D_800F4E50)($at)
.L800E4670:
/* 4E70 800E4670 0F80023C */  lui        $v0, %hi(D_800F4E40)
/* 4E74 800E4674 404E428C */  lw         $v0, %lo(D_800F4E40)($v0)
/* 4E78 800E4678 00000000 */  nop
/* 4E7C 800E467C 1E004014 */  bnez       $v0, .L800E46F8
/* 4E80 800E4680 00000000 */   nop
/* 4E84 800E4684 0F80023C */  lui        $v0, %hi(D_800F4E20)
/* 4E88 800E4688 204E428C */  lw         $v0, %lo(D_800F4E20)($v0)
/* 4E8C 800E468C 00000000 */  nop
/* 4E90 800E4690 19004014 */  bnez       $v0, .L800E46F8
/* 4E94 800E4694 00000000 */   nop
/* 4E98 800E4698 0F80023C */  lui        $v0, %hi(D_800F4CEC)
/* 4E9C 800E469C EC4C428C */  lw         $v0, %lo(D_800F4CEC)($v0)
/* 4EA0 800E46A0 00000000 */  nop
/* 4EA4 800E46A4 14004014 */  bnez       $v0, .L800E46F8
/* 4EA8 800E46A8 00000000 */   nop
/* 4EAC 800E46AC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4EB0 800E46B0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4EB4 800E46B4 00000000 */  nop
/* 4EB8 800E46B8 C80C428C */  lw         $v0, 0xCC8($v0)
/* 4EBC 800E46BC 00000000 */  nop
/* 4EC0 800E46C0 09F84000 */  jalr       $v0
/* 4EC4 800E46C4 01000434 */   ori       $a0, $zero, 0x1
/* 4EC8 800E46C8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4ECC 800E46CC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4ED0 800E46D0 00000000 */  nop
/* 4ED4 800E46D4 C40C428C */  lw         $v0, 0xCC4($v0)
/* 4ED8 800E46D8 00000000 */  nop
/* 4EDC 800E46DC 09F84000 */  jalr       $v0
/* 4EE0 800E46E0 F3000434 */   ori       $a0, $zero, 0xF3
/* 4EE4 800E46E4 01000234 */  ori        $v0, $zero, 0x1
/* 4EE8 800E46E8 0F80013C */  lui        $at, %hi(D_800F4E50)
/* 4EEC 800E46EC 504E22AC */  sw         $v0, %lo(D_800F4E50)($at)
/* 4EF0 800E46F0 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 4EF4 800E46F4 404E22AC */  sw         $v0, %lo(D_800F4E40)($at)
.L800E46F8:
/* 4EF8 800E46F8 2A9D030C */  jal        func_800E74A8
/* 4EFC 800E46FC 21200000 */   addu      $a0, $zero, $zero
/* 4F00 800E4700 21804000 */  addu       $s0, $v0, $zero
/* 4F04 800E4704 08000012 */  beqz       $s0, .L800E4728
/* 4F08 800E4708 08000234 */   ori       $v0, $zero, 0x8
/* 4F0C 800E470C 0F80013C */  lui        $at, %hi(D_800F4E70)
/* 4F10 800E4710 704E20AC */  sw         $zero, %lo(D_800F4E70)($at)
/* 4F14 800E4714 0F80013C */  lui        $at, %hi(D_800F4E38)
/* 4F18 800E4718 384E22AC */  sw         $v0, %lo(D_800F4E38)($at)
/* 4F1C 800E471C 21880000 */  addu       $s1, $zero, $zero
/* 4F20 800E4720 1A80013C */  lui        $at, %hi(D_801A0FA8)
/* 4F24 800E4724 A80F20AC */  sw         $zero, %lo(D_801A0FA8)($at)
.L800E4728:
/* 4F28 800E4728 0F80033C */  lui        $v1, %hi(D_800F4E38)
/* 4F2C 800E472C 384E638C */  lw         $v1, %lo(D_800F4E38)($v1)
/* 4F30 800E4730 00000000 */  nop
/* 4F34 800E4734 08006228 */  slti       $v0, $v1, 0x8
/* 4F38 800E4738 05004010 */  beqz       $v0, .L800E4750
/* 4F3C 800E473C 01006224 */   addiu     $v0, $v1, 0x1
/* 4F40 800E4740 0F80013C */  lui        $at, %hi(D_800F4E38)
/* 4F44 800E4744 384E22AC */  sw         $v0, %lo(D_800F4E38)($at)
/* 4F48 800E4748 1E9D030C */  jal        func_800E7478
/* 4F4C 800E474C 00000000 */   nop
.L800E4750:
/* 4F50 800E4750 0F80023C */  lui        $v0, %hi(D_800F4E08)
/* 4F54 800E4754 084E428C */  lw         $v0, %lo(D_800F4E08)($v0)
/* 4F58 800E4758 00000000 */  nop
/* 4F5C 800E475C 2A105100 */  slt        $v0, $v0, $s1
/* 4F60 800E4760 72004010 */  beqz       $v0, .L800E492C
/* 4F64 800E4764 00000000 */   nop
/* 4F68 800E4768 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 4F6C 800E476C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 4F70 800E4770 00000000 */  nop
/* 4F74 800E4774 18054290 */  lbu        $v0, 0x518($v0)
/* 4F78 800E4778 00000000 */  nop
/* 4F7C 800E477C 37004014 */  bnez       $v0, .L800E485C
/* 4F80 800E4780 13004224 */   addiu     $v0, $v0, 0x13
/* 4F84 800E4784 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4F88 800E4788 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4F8C 800E478C 0C000434 */  ori        $a0, $zero, 0xC
/* 4F90 800E4790 9C04428C */  lw         $v0, 0x49C($v0)
/* 4F94 800E4794 21280000 */  addu       $a1, $zero, $zero
/* 4F98 800E4798 09F84000 */  jalr       $v0
/* 4F9C 800E479C 21300000 */   addu      $a2, $zero, $zero
/* 4FA0 800E47A0 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 4FA4 800E47A4 F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 4FA8 800E47A8 00000000 */  nop
/* 4FAC 800E47AC 1D006004 */  bltz       $v1, .L800E4824
/* 4FB0 800E47B0 00000000 */   nop
.L800E47B4:
/* 4FB4 800E47B4 0F80043C */  lui        $a0, %hi(D_800F4CC4)
/* 4FB8 800E47B8 C44C848C */  lw         $a0, %lo(D_800F4CC4)($a0)
/* 4FBC 800E47BC 0F80053C */  lui        $a1, %hi(D_800F4E30)
/* 4FC0 800E47C0 304EA58C */  lw         $a1, %lo(D_800F4E30)($a1)
/* 4FC4 800E47C4 C0100400 */  sll        $v0, $a0, 3
/* 4FC8 800E47C8 23106200 */  subu       $v0, $v1, $v0
/* 4FCC 800E47CC 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 4FD0 800E47D0 F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 4FD4 800E47D4 0001A228 */  slti       $v0, $a1, 0x100
/* 4FD8 800E47D8 0B004010 */  beqz       $v0, .L800E4808
/* 4FDC 800E47DC 00000000 */   nop
/* 4FE0 800E47E0 0F80023C */  lui        $v0, %hi(D_800F4E18)
/* 4FE4 800E47E4 184E428C */  lw         $v0, %lo(D_800F4E18)($v0)
/* 4FE8 800E47E8 00000000 */  nop
/* 4FEC 800E47EC 18004400 */  mult       $v0, $a0
/* 4FF0 800E47F0 12100000 */  mflo       $v0
/* 4FF4 800E47F4 00000000 */  nop
/* 4FF8 800E47F8 00000000 */  nop
/* 4FFC 800E47FC 21104500 */  addu       $v0, $v0, $a1
/* 5000 800E4800 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 5004 800E4804 304E22AC */  sw         $v0, %lo(D_800F4E30)($at)
.L800E4808:
/* 5008 800E4808 5093030C */  jal        func_800E4D40
/* 500C 800E480C 00000000 */   nop
/* 5010 800E4810 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 5014 800E4814 F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 5018 800E4818 00000000 */  nop
/* 501C 800E481C E5FF6104 */  bgez       $v1, .L800E47B4
/* 5020 800E4820 00000000 */   nop
.L800E4824:
/* 5024 800E4824 0E80043C */  lui        $a0, %hi(D_800E038C)
/* 5028 800E4828 8C038424 */  addiu      $a0, $a0, %lo(D_800E038C)
/* 502C 800E482C 90A1030C */  jal        func_800E8640
/* 5030 800E4830 E5010534 */   ori       $a1, $zero, 0x1E5
/* 5034 800E4834 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 5038 800E4838 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 503C 800E483C 08000234 */  ori        $v0, $zero, 0x8
/* 5040 800E4840 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 5044 800E4844 F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 5048 800E4848 18056290 */  lbu        $v0, 0x518($v1)
/* 504C 800E484C 00000000 */  nop
/* 5050 800E4850 01004224 */  addiu      $v0, $v0, 0x1
/* 5054 800E4854 54910308 */  j          .L800E4550
/* 5058 800E4858 180562A0 */   sb        $v0, 0x518($v1)
.L800E485C:
/* 505C 800E485C 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 5060 800E4860 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 5064 800E4864 0F80013C */  lui        $at, %hi(D_800F4CEC)
/* 5068 800E4868 EC4C22AC */  sw         $v0, %lo(D_800F4CEC)($at)
/* 506C 800E486C 0C000434 */  ori        $a0, $zero, 0xC
/* 5070 800E4870 9C04628C */  lw         $v0, 0x49C($v1)
/* 5074 800E4874 21280000 */  addu       $a1, $zero, $zero
/* 5078 800E4878 09F84000 */  jalr       $v0
/* 507C 800E487C 21300000 */   addu      $a2, $zero, $zero
/* 5080 800E4880 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 5084 800E4884 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 5088 800E4888 00000000 */  nop
/* 508C 800E488C 18056290 */  lbu        $v0, 0x518($v1)
/* 5090 800E4890 00000000 */  nop
/* 5094 800E4894 80100200 */  sll        $v0, $v0, 2
/* 5098 800E4898 0F80013C */  lui        $at, %hi(D_800EB97C)
/* 509C 800E489C 7CB92124 */  addiu      $at, $at, %lo(D_800EB97C)
/* 50A0 800E48A0 21082200 */  addu       $at, $at, $v0
/* 50A4 800E48A4 00002290 */  lbu        $v0, 0x0($at)
/* 50A8 800E48A8 00000000 */  nop
/* 50AC 800E48AC 140562A0 */  sb         $v0, 0x514($v1)
/* 50B0 800E48B0 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 50B4 800E48B4 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 50B8 800E48B8 00000000 */  nop
/* 50BC 800E48BC 18056290 */  lbu        $v0, 0x518($v1)
/* 50C0 800E48C0 00000000 */  nop
/* 50C4 800E48C4 80100200 */  sll        $v0, $v0, 2
/* 50C8 800E48C8 0F80013C */  lui        $at, %hi(D_800EB98C)
/* 50CC 800E48CC 8CB92124 */  addiu      $at, $at, %lo(D_800EB98C)
/* 50D0 800E48D0 21082200 */  addu       $at, $at, $v0
/* 50D4 800E48D4 00002290 */  lbu        $v0, 0x0($at)
/* 50D8 800E48D8 00000000 */  nop
/* 50DC 800E48DC 150562A0 */  sb         $v0, 0x515($v1)
/* 50E0 800E48E0 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 50E4 800E48E4 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 50E8 800E48E8 00000000 */  nop
/* 50EC 800E48EC 18056290 */  lbu        $v0, 0x518($v1)
/* 50F0 800E48F0 00000000 */  nop
/* 50F4 800E48F4 01004224 */  addiu      $v0, $v0, 0x1
/* 50F8 800E48F8 180562A0 */  sb         $v0, 0x518($v1)
/* 50FC 800E48FC 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 5100 800E4900 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 5104 800E4904 00000000 */  nop
/* 5108 800E4908 18056290 */  lbu        $v0, 0x518($v1)
/* 510C 800E490C 00000000 */  nop
/* 5110 800E4910 03004230 */  andi       $v0, $v0, 0x3
/* 5114 800E4914 180562A0 */  sb         $v0, 0x518($v1)
/* 5118 800E4918 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 511C 800E491C D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 5120 800E4920 21880000 */  addu       $s1, $zero, $zero
/* 5124 800E4924 03000234 */  ori        $v0, $zero, 0x3
/* 5128 800E4928 160562A0 */  sb         $v0, 0x516($v1)
.L800E492C:
/* 512C 800E492C 0F80043C */  lui        $a0, %hi(D_800F4E30)
/* 5130 800E4930 304E848C */  lw         $a0, %lo(D_800F4E30)($a0)
/* 5134 800E4934 00000000 */  nop
/* 5138 800E4938 12008018 */  blez       $a0, .L800E4984
/* 513C 800E493C 00000000 */   nop
/* 5140 800E4940 0F80023C */  lui        $v0, %hi(D_800F4CEC)
/* 5144 800E4944 EC4C428C */  lw         $v0, %lo(D_800F4CEC)($v0)
/* 5148 800E4948 00000000 */  nop
/* 514C 800E494C 0D004014 */  bnez       $v0, .L800E4984
/* 5150 800E4950 00000000 */   nop
/* 5154 800E4954 0F80033C */  lui        $v1, %hi(D_800F4E18)
/* 5158 800E4958 184E638C */  lw         $v1, %lo(D_800F4E18)($v1)
/* 515C 800E495C 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 5160 800E4960 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 5164 800E4964 00000000 */  nop
/* 5168 800E4968 18006200 */  mult       $v1, $v0
/* 516C 800E496C 12100000 */  mflo       $v0
/* 5170 800E4970 00000000 */  nop
/* 5174 800E4974 00000000 */  nop
/* 5178 800E4978 23108200 */  subu       $v0, $a0, $v0
/* 517C 800E497C 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 5180 800E4980 304E22AC */  sw         $v0, %lo(D_800F4E30)($at)
.L800E4984:
/* 5184 800E4984 0F80023C */  lui        $v0, %hi(D_800F4E30)
/* 5188 800E4988 304E428C */  lw         $v0, %lo(D_800F4E30)($v0)
/* 518C 800E498C 00000000 */  nop
/* 5190 800E4990 03004104 */  bgez       $v0, .L800E49A0
/* 5194 800E4994 00000000 */   nop
/* 5198 800E4998 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 519C 800E499C 304E20AC */  sw         $zero, %lo(D_800F4E30)($at)
.L800E49A0:
/* 51A0 800E49A0 0F80043C */  lui        $a0, %hi(D_800F4CF4)
/* 51A4 800E49A4 F44C848C */  lw         $a0, %lo(D_800F4CF4)($a0)
/* 51A8 800E49A8 00000000 */  nop
/* 51AC 800E49AC 81008228 */  slti       $v0, $a0, 0x81
/* 51B0 800E49B0 18004010 */  beqz       $v0, .L800E4A14
/* 51B4 800E49B4 00000000 */   nop
/* 51B8 800E49B8 0F80023C */  lui        $v0, %hi(D_800F4CEC)
/* 51BC 800E49BC EC4C428C */  lw         $v0, %lo(D_800F4CEC)($v0)
/* 51C0 800E49C0 00000000 */  nop
/* 51C4 800E49C4 26004014 */  bnez       $v0, .L800E4A60
/* 51C8 800E49C8 00000000 */   nop
/* 51CC 800E49CC 9699030C */  jal        func_800E6658
/* 51D0 800E49D0 00000000 */   nop
/* 51D4 800E49D4 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 51D8 800E49D8 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 51DC 800E49DC 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 51E0 800E49E0 F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 51E4 800E49E4 C0100200 */  sll        $v0, $v0, 3
/* 51E8 800E49E8 21104300 */  addu       $v0, $v0, $v1
/* 51EC 800E49EC 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 51F0 800E49F0 F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 51F4 800E49F4 07000012 */  beqz       $s0, .L800E4A14
/* 51F8 800E49F8 80000234 */   ori       $v0, $zero, 0x80
/* 51FC 800E49FC 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 5200 800E4A00 304E20AC */  sw         $zero, %lo(D_800F4E30)($at)
/* 5204 800E4A04 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 5208 800E4A08 F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 520C 800E4A0C 9699030C */  jal        func_800E6658
/* 5210 800E4A10 80000434 */   ori       $a0, $zero, 0x80
.L800E4A14:
/* 5214 800E4A14 0F80023C */  lui        $v0, %hi(D_800F4CEC)
/* 5218 800E4A18 EC4C428C */  lw         $v0, %lo(D_800F4CEC)($v0)
/* 521C 800E4A1C 00000000 */  nop
/* 5220 800E4A20 0F004014 */  bnez       $v0, .L800E4A60
/* 5224 800E4A24 00000000 */   nop
/* 5228 800E4A28 0F80053C */  lui        $a1, %hi(D_800F4E20)
/* 522C 800E4A2C 204EA58C */  lw         $a1, %lo(D_800F4E20)($a1)
/* 5230 800E4A30 0F80063C */  lui        $a2, %hi(D_800F4E28)
/* 5234 800E4A34 284EC68C */  lw         $a2, %lo(D_800F4E28)($a2)
/* 5238 800E4A38 EF8E030C */  jal        func_800E3BBC
/* 523C 800E4A3C 21200002 */   addu      $a0, $s0, $zero
/* 5240 800E4A40 021C0200 */  srl        $v1, $v0, 16
/* 5244 800E4A44 0F80013C */  lui        $at, %hi(D_800F4E28)
/* 5248 800E4A48 284E23AC */  sw         $v1, %lo(D_800F4E28)($at)
/* 524C 800E4A4C FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 5250 800E4A50 0F80013C */  lui        $at, %hi(D_800F4E20)
/* 5254 800E4A54 204E22AC */  sw         $v0, %lo(D_800F4E20)($at)
/* 5258 800E4A58 11930308 */  j          .L800E4C44
/* 525C 800E4A5C 00000000 */   nop
.L800E4A60:
/* 5260 800E4A60 0F80053C */  lui        $a1, %hi(D_800F4E20)
/* 5264 800E4A64 204EA58C */  lw         $a1, %lo(D_800F4E20)($a1)
/* 5268 800E4A68 0F80063C */  lui        $a2, %hi(D_800F4E28)
/* 526C 800E4A6C 284EC68C */  lw         $a2, %lo(D_800F4E28)($a2)
/* 5270 800E4A70 EF8E030C */  jal        func_800E3BBC
/* 5274 800E4A74 21200000 */   addu      $a0, $zero, $zero
/* 5278 800E4A78 0F80043C */  lui        $a0, %hi(D_800F4CF4)
/* 527C 800E4A7C F44C848C */  lw         $a0, %lo(D_800F4CF4)($a0)
/* 5280 800E4A80 00000000 */  nop
/* 5284 800E4A84 0B008004 */  bltz       $a0, .L800E4AB4
/* 5288 800E4A88 00000000 */   nop
/* 528C 800E4A8C 9699030C */  jal        func_800E6658
/* 5290 800E4A90 00000000 */   nop
/* 5294 800E4A94 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 5298 800E4A98 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 529C 800E4A9C 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 52A0 800E4AA0 F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 52A4 800E4AA4 C0100200 */  sll        $v0, $v0, 3
/* 52A8 800E4AA8 23186200 */  subu       $v1, $v1, $v0
/* 52AC 800E4AAC 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 52B0 800E4AB0 F44C23AC */  sw         $v1, %lo(D_800F4CF4)($at)
.L800E4AB4:
/* 52B4 800E4AB4 0F80043C */  lui        $a0, %hi(D_800F4E30)
/* 52B8 800E4AB8 304E848C */  lw         $a0, %lo(D_800F4E30)($a0)
/* 52BC 800E4ABC 00000000 */  nop
/* 52C0 800E4AC0 00018228 */  slti       $v0, $a0, 0x100
/* 52C4 800E4AC4 0D004010 */  beqz       $v0, .L800E4AFC
/* 52C8 800E4AC8 00000000 */   nop
/* 52CC 800E4ACC 0F80033C */  lui        $v1, %hi(D_800F4E18)
/* 52D0 800E4AD0 184E638C */  lw         $v1, %lo(D_800F4E18)($v1)
/* 52D4 800E4AD4 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 52D8 800E4AD8 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 52DC 800E4ADC 00000000 */  nop
/* 52E0 800E4AE0 18006200 */  mult       $v1, $v0
/* 52E4 800E4AE4 12100000 */  mflo       $v0
/* 52E8 800E4AE8 00000000 */  nop
/* 52EC 800E4AEC 00000000 */  nop
/* 52F0 800E4AF0 21104400 */  addu       $v0, $v0, $a0
/* 52F4 800E4AF4 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 52F8 800E4AF8 304E22AC */  sw         $v0, %lo(D_800F4E30)($at)
.L800E4AFC:
/* 52FC 800E4AFC 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 5300 800E4B00 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 5304 800E4B04 0F80023C */  lui        $v0, %hi(D_800F4D74)
/* 5308 800E4B08 744D428C */  lw         $v0, %lo(D_800F4D74)($v0)
/* 530C 800E4B0C 300C638C */  lw         $v1, 0xC30($v1)
/* 5310 800E4B10 01004224 */  addiu      $v0, $v0, 0x1
/* 5314 800E4B14 0F80013C */  lui        $at, %hi(D_800F4D74)
/* 5318 800E4B18 744D22AC */  sw         $v0, %lo(D_800F4D74)($at)
/* 531C 800E4B1C 09F86000 */  jalr       $v1
/* 5320 800E4B20 00000000 */   nop
/* 5324 800E4B24 02004230 */  andi       $v0, $v0, 0x2
/* 5328 800E4B28 07004010 */  beqz       $v0, .L800E4B48
/* 532C 800E4B2C 00000000 */   nop
/* 5330 800E4B30 0F80023C */  lui        $v0, %hi(D_800F4D74)
/* 5334 800E4B34 744D428C */  lw         $v0, %lo(D_800F4D74)($v0)
/* 5338 800E4B38 00000000 */  nop
/* 533C 800E4B3C 79004228 */  slti       $v0, $v0, 0x79
/* 5340 800E4B40 40004014 */  bnez       $v0, .L800E4C44
/* 5344 800E4B44 00000000 */   nop
.L800E4B48:
/* 5348 800E4B48 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 534C 800E4B4C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5350 800E4B50 00000000 */  nop
/* 5354 800E4B54 3006428C */  lw         $v0, 0x630($v0)
/* 5358 800E4B58 00000000 */  nop
/* 535C 800E4B5C 09F84000 */  jalr       $v0
/* 5360 800E4B60 21200000 */   addu      $a0, $zero, $zero
/* 5364 800E4B64 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5368 800E4B68 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 536C 800E4B6C 00000000 */  nop
/* 5370 800E4B70 8804428C */  lw         $v0, 0x488($v0)
/* 5374 800E4B74 00000000 */  nop
/* 5378 800E4B78 09F84000 */  jalr       $v0
/* 537C 800E4B7C 00000000 */   nop
/* 5380 800E4B80 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5384 800E4B84 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5388 800E4B88 00000000 */  nop
/* 538C 800E4B8C 0C04428C */  lw         $v0, 0x40C($v0)
/* 5390 800E4B90 00000000 */  nop
/* 5394 800E4B94 09F84000 */  jalr       $v0
/* 5398 800E4B98 00000000 */   nop
/* 539C 800E4B9C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 53A0 800E4BA0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 53A4 800E4BA4 00000000 */  nop
/* 53A8 800E4BA8 3C0C428C */  lw         $v0, 0xC3C($v0)
/* 53AC 800E4BAC 00000000 */  nop
/* 53B0 800E4BB0 09F84000 */  jalr       $v0
/* 53B4 800E4BB4 00000000 */   nop
/* 53B8 800E4BB8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 53BC 800E4BBC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 53C0 800E4BC0 0F80043C */  lui        $a0, %hi(D_800F4CEC)
/* 53C4 800E4BC4 EC4C848C */  lw         $a0, %lo(D_800F4CEC)($a0)
/* 53C8 800E4BC8 0C00428C */  lw         $v0, 0xC($v0)
/* 53CC 800E4BCC 00000000 */  nop
/* 53D0 800E4BD0 09F84000 */  jalr       $v0
/* 53D4 800E4BD4 00000000 */   nop
/* 53D8 800E4BD8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 53DC 800E4BDC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 53E0 800E4BE0 00000000 */  nop
/* 53E4 800E4BE4 0406428C */  lw         $v0, 0x604($v0)
/* 53E8 800E4BE8 00000000 */  nop
/* 53EC 800E4BEC 09F84000 */  jalr       $v0
/* 53F0 800E4BF0 21200000 */   addu      $a0, $zero, $zero
/* 53F4 800E4BF4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 53F8 800E4BF8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 53FC 800E4BFC 00000000 */  nop
/* 5400 800E4C00 0C06428C */  lw         $v0, 0x60C($v0)
/* 5404 800E4C04 00000000 */  nop
/* 5408 800E4C08 09F84000 */  jalr       $v0
/* 540C 800E4C0C 21200000 */   addu      $a0, $zero, $zero
/* 5410 800E4C10 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 5414 800E4C14 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 5418 800E4C18 00000000 */  nop
/* 541C 800E4C1C 16054390 */  lbu        $v1, 0x516($v0)
/* 5420 800E4C20 03000234 */  ori        $v0, $zero, 0x3
/* 5424 800E4C24 3D006214 */  bne        $v1, $v0, .L800E4D1C
/* 5428 800E4C28 00000000 */   nop
/* 542C 800E4C2C 4882030C */  jal        func_800E0920
/* 5430 800E4C30 00000000 */   nop
/* 5434 800E4C34 E4A1030C */  jal        func_800E8790
/* 5438 800E4C38 00000000 */   nop
/* 543C 800E4C3C 47930308 */  j          .L800E4D1C
/* 5440 800E4C40 00000000 */   nop
.L800E4C44:
/* 5444 800E4C44 0F80023C */  lui        $v0, %hi(D_800F4E20)
/* 5448 800E4C48 204E428C */  lw         $v0, %lo(D_800F4E20)($v0)
/* 544C 800E4C4C 00000000 */  nop
/* 5450 800E4C50 03004014 */  bnez       $v0, .L800E4C60
/* 5454 800E4C54 08000234 */   ori       $v0, $zero, 0x8
/* 5458 800E4C58 0F80013C */  lui        $at, %hi(D_800F4E38)
/* 545C 800E4C5C 384E22AC */  sw         $v0, %lo(D_800F4E38)($at)
.L800E4C60:
/* 5460 800E4C60 B493030C */  jal        func_800E4ED0
/* 5464 800E4C64 21200000 */   addu      $a0, $zero, $zero
/* 5468 800E4C68 0F80033C */  lui        $v1, %hi(D_800F4E20)
/* 546C 800E4C6C 204E638C */  lw         $v1, %lo(D_800F4E20)($v1)
/* 5470 800E4C70 00000000 */  nop
/* 5474 800E4C74 FCFF6224 */  addiu      $v0, $v1, -0x4
/* 5478 800E4C78 0200422C */  sltiu      $v0, $v0, 0x2
/* 547C 800E4C7C 03004014 */  bnez       $v0, .L800E4C8C
/* 5480 800E4C80 06000234 */   ori       $v0, $zero, 0x6
/* 5484 800E4C84 05006214 */  bne        $v1, $v0, .L800E4C9C
/* 5488 800E4C88 00000000 */   nop
.L800E4C8C:
/* 548C 800E4C8C 0F80043C */  lui        $a0, %hi(D_800F4CBC)
/* 5490 800E4C90 BC4C848C */  lw         $a0, %lo(D_800F4CBC)($a0)
/* 5494 800E4C94 B688030C */  jal        func_800E22D8
/* 5498 800E4C98 00000000 */   nop
.L800E4C9C:
/* 549C 800E4C9C 0F80043C */  lui        $a0, %hi(D_800F4E20)
/* 54A0 800E4CA0 204E848C */  lw         $a0, %lo(D_800F4E20)($a0)
/* 54A4 800E4CA4 B688030C */  jal        func_800E22D8
/* 54A8 800E4CA8 00000000 */   nop
/* 54AC 800E4CAC EE87030C */  jal        func_800E1FB8
/* 54B0 800E4CB0 00000000 */   nop
/* 54B4 800E4CB4 0F80043C */  lui        $a0, %hi(D_800F4E20)
/* 54B8 800E4CB8 204E848C */  lw         $a0, %lo(D_800F4E20)($a0)
/* 54BC 800E4CBC 8D88030C */  jal        func_800E2234
/* 54C0 800E4CC0 00000000 */   nop
/* 54C4 800E4CC4 AAA0030C */  jal        func_800E82A8
/* 54C8 800E4CC8 00000000 */   nop
/* 54CC 800E4CCC 079A030C */  jal        func_800E681C
/* 54D0 800E4CD0 00000000 */   nop
/* 54D4 800E4CD4 9882030C */  jal        func_800E0A60
/* 54D8 800E4CD8 00000000 */   nop
/* 54DC 800E4CDC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 54E0 800E4CE0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 54E4 800E4CE4 00000000 */  nop
/* 54E8 800E4CE8 0804428C */  lw         $v0, 0x408($v0)
/* 54EC 800E4CEC 00000000 */  nop
/* 54F0 800E4CF0 09F84000 */  jalr       $v0
/* 54F4 800E4CF4 00000000 */   nop
/* 54F8 800E4CF8 0F80023C */  lui        $v0, %hi(D_800F4E20)
/* 54FC 800E4CFC 204E428C */  lw         $v0, %lo(D_800F4E20)($v0)
/* 5500 800E4D00 00000000 */  nop
/* 5504 800E4D04 2BFE4014 */  bnez       $v0, .L800E45B4
/* 5508 800E4D08 00000000 */   nop
/* 550C 800E4D0C 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 5510 800E4D10 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 5514 800E4D14 6D910308 */  j          .L800E45B4
/* 5518 800E4D18 21882202 */   addu      $s1, $s1, $v0
.L800E4D1C:
/* 551C 800E4D1C 3800BF8F */  lw         $ra, 0x38($sp)
/* 5520 800E4D20 3400B58F */  lw         $s5, 0x34($sp)
/* 5524 800E4D24 3000B48F */  lw         $s4, 0x30($sp)
/* 5528 800E4D28 2C00B38F */  lw         $s3, 0x2C($sp)
/* 552C 800E4D2C 2800B28F */  lw         $s2, 0x28($sp)
/* 5530 800E4D30 2400B18F */  lw         $s1, 0x24($sp)
/* 5534 800E4D34 2000B08F */  lw         $s0, 0x20($sp)
/* 5538 800E4D38 0800E003 */  jr         $ra
/* 553C 800E4D3C 4000BD27 */   addiu     $sp, $sp, 0x40
glabel func_800E4D40
/* 5540 800E4D40 0F80043C */  lui        $a0, %hi(D_800F4CF4)
/* 5544 800E4D44 F44C848C */  lw         $a0, %lo(D_800F4CF4)($a0)
/* 5548 800E4D48 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 554C 800E4D4C 1000BFAF */  sw         $ra, 0x10($sp)
/* 5550 800E4D50 9699030C */  jal        func_800E6658
/* 5554 800E4D54 00000000 */   nop
/* 5558 800E4D58 0F80033C */  lui        $v1, %hi(D_800F4E20)
/* 555C 800E4D5C 204E638C */  lw         $v1, %lo(D_800F4E20)($v1)
/* 5560 800E4D60 00000000 */  nop
/* 5564 800E4D64 FCFF6224 */  addiu      $v0, $v1, -0x4
/* 5568 800E4D68 0200422C */  sltiu      $v0, $v0, 0x2
/* 556C 800E4D6C 03004014 */  bnez       $v0, .L800E4D7C
/* 5570 800E4D70 06000234 */   ori       $v0, $zero, 0x6
/* 5574 800E4D74 07006214 */  bne        $v1, $v0, .L800E4D94
/* 5578 800E4D78 00000000 */   nop
.L800E4D7C:
/* 557C 800E4D7C 0F80043C */  lui        $a0, %hi(D_800F4CBC)
/* 5580 800E4D80 BC4C848C */  lw         $a0, %lo(D_800F4CBC)($a0)
/* 5584 800E4D84 0F80053C */  lui        $a1, %hi(D_800F4CC0)
/* 5588 800E4D88 C04CA58C */  lw         $a1, %lo(D_800F4CC0)($a1)
/* 558C 800E4D8C 0E89030C */  jal        func_800E2438
/* 5590 800E4D90 21300000 */   addu      $a2, $zero, $zero
.L800E4D94:
/* 5594 800E4D94 0F80043C */  lui        $a0, %hi(D_800F4E20)
/* 5598 800E4D98 204E848C */  lw         $a0, %lo(D_800F4E20)($a0)
/* 559C 800E4D9C 0F80053C */  lui        $a1, %hi(D_800F4E28)
/* 55A0 800E4DA0 284EA58C */  lw         $a1, %lo(D_800F4E28)($a1)
/* 55A4 800E4DA4 0E89030C */  jal        func_800E2438
/* 55A8 800E4DA8 21300000 */   addu      $a2, $zero, $zero
/* 55AC 800E4DAC 0F80043C */  lui        $a0, %hi(D_800F4E20)
/* 55B0 800E4DB0 204E848C */  lw         $a0, %lo(D_800F4E20)($a0)
/* 55B4 800E4DB4 0F80053C */  lui        $a1, %hi(D_800F4E28)
/* 55B8 800E4DB8 284EA58C */  lw         $a1, %lo(D_800F4E28)($a1)
/* 55BC 800E4DBC 5A8C030C */  jal        func_800E3168
/* 55C0 800E4DC0 00000000 */   nop
/* 55C4 800E4DC4 0F80033C */  lui        $v1, %hi(D_800F4E38)
/* 55C8 800E4DC8 384E638C */  lw         $v1, %lo(D_800F4E38)($v1)
/* 55CC 800E4DCC 00000000 */  nop
/* 55D0 800E4DD0 08006228 */  slti       $v0, $v1, 0x8
/* 55D4 800E4DD4 05004010 */  beqz       $v0, .L800E4DEC
/* 55D8 800E4DD8 01006224 */   addiu     $v0, $v1, 0x1
/* 55DC 800E4DDC 0F80013C */  lui        $at, %hi(D_800F4E38)
/* 55E0 800E4DE0 384E22AC */  sw         $v0, %lo(D_800F4E38)($at)
/* 55E4 800E4DE4 1E9D030C */  jal        func_800E7478
/* 55E8 800E4DE8 00000000 */   nop
.L800E4DEC:
/* 55EC 800E4DEC 0F80033C */  lui        $v1, %hi(D_800F4E20)
/* 55F0 800E4DF0 204E638C */  lw         $v1, %lo(D_800F4E20)($v1)
/* 55F4 800E4DF4 00000000 */  nop
/* 55F8 800E4DF8 FCFF6224 */  addiu      $v0, $v1, -0x4
/* 55FC 800E4DFC 0200422C */  sltiu      $v0, $v0, 0x2
/* 5600 800E4E00 03004014 */  bnez       $v0, .L800E4E10
/* 5604 800E4E04 06000234 */   ori       $v0, $zero, 0x6
/* 5608 800E4E08 05006214 */  bne        $v1, $v0, .L800E4E20
/* 560C 800E4E0C 00000000 */   nop
.L800E4E10:
/* 5610 800E4E10 0F80043C */  lui        $a0, %hi(D_800F4CBC)
/* 5614 800E4E14 BC4C848C */  lw         $a0, %lo(D_800F4CBC)($a0)
/* 5618 800E4E18 B688030C */  jal        func_800E22D8
/* 561C 800E4E1C 00000000 */   nop
.L800E4E20:
/* 5620 800E4E20 0F80043C */  lui        $a0, %hi(D_800F4E20)
/* 5624 800E4E24 204E848C */  lw         $a0, %lo(D_800F4E20)($a0)
/* 5628 800E4E28 B688030C */  jal        func_800E22D8
/* 562C 800E4E2C 00000000 */   nop
/* 5630 800E4E30 EE87030C */  jal        func_800E1FB8
/* 5634 800E4E34 00000000 */   nop
/* 5638 800E4E38 0F80043C */  lui        $a0, %hi(D_800F4E20)
/* 563C 800E4E3C 204E848C */  lw         $a0, %lo(D_800F4E20)($a0)
/* 5640 800E4E40 8D88030C */  jal        func_800E2234
/* 5644 800E4E44 00000000 */   nop
/* 5648 800E4E48 AAA0030C */  jal        func_800E82A8
/* 564C 800E4E4C 00000000 */   nop
/* 5650 800E4E50 079A030C */  jal        func_800E681C
/* 5654 800E4E54 00000000 */   nop
/* 5658 800E4E58 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 565C 800E4E5C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5660 800E4E60 00000000 */  nop
/* 5664 800E4E64 0804428C */  lw         $v0, 0x408($v0)
/* 5668 800E4E68 00000000 */  nop
/* 566C 800E4E6C 09F84000 */  jalr       $v0
/* 5670 800E4E70 00000000 */   nop
/* 5674 800E4E74 9882030C */  jal        func_800E0A60
/* 5678 800E4E78 00000000 */   nop
/* 567C 800E4E7C 7B82030C */  jal        func_800E09EC
/* 5680 800E4E80 00000000 */   nop
/* 5684 800E4E84 9395030C */  jal        func_800E564C
/* 5688 800E4E88 00000000 */   nop
/* 568C 800E4E8C 1D83030C */  jal        func_800E0C74
/* 5690 800E4E90 00000000 */   nop
/* 5694 800E4E94 1000BF8F */  lw         $ra, 0x10($sp)
/* 5698 800E4E98 00000000 */  nop
/* 569C 800E4E9C 0800E003 */  jr         $ra
/* 56A0 800E4EA0 1800BD27 */   addiu     $sp, $sp, 0x18
/* 56A4 800E4EA4 00000000 */  nop
/* 56A8 800E4EA8 02008288 */  lwl        $v0, 0x2($a0)
/* 56AC 800E4EAC 001A0500 */  sll        $v1, $a1, 8
/* 56B0 800E4EB0 0200A2A8 */  swl        $v0, 0x2($a1)
/* 56B4 800E4EB4 020083A8 */  swl        $v1, 0x2($a0)
/* 56B8 800E4EB8 0800E003 */  jr         $ra
/* 56BC 800E4EBC 00000000 */   nop
/* 56C0 800E4EC0 0F80013C */  lui        $at, %hi(D_800F4D8C)
/* 56C4 800E4EC4 8C4D24A4 */  sh         $a0, %lo(D_800F4D8C)($at)
/* 56C8 800E4EC8 0800E003 */  jr         $ra
/* 56CC 800E4ECC 00000000 */   nop
glabel func_800E4ED0
/* 56D0 800E4ED0 0F80023C */  lui        $v0, %hi(D_800F4D8E)
/* 56D4 800E4ED4 8E4D4290 */  lbu        $v0, %lo(D_800F4D8E)($v0)
/* 56D8 800E4ED8 0F80013C */  lui        $at, %hi(D_800F4D8E)
/* 56DC 800E4EDC 8E4D24A0 */  sb         $a0, %lo(D_800F4D8E)($at)
/* 56E0 800E4EE0 0800E003 */  jr         $ra
/* 56E4 800E4EE4 00000000 */   nop
glabel func_800E4EE8
/* 56E8 800E4EE8 A8FDBD27 */  addiu      $sp, $sp, -0x258
/* 56EC 800E4EEC 5402BFAF */  sw         $ra, 0x254($sp)
/* 56F0 800E4EF0 5002B4AF */  sw         $s4, 0x250($sp)
/* 56F4 800E4EF4 4C02B3AF */  sw         $s3, 0x24C($sp)
/* 56F8 800E4EF8 4802B2AF */  sw         $s2, 0x248($sp)
/* 56FC 800E4EFC 4402B1AF */  sw         $s1, 0x244($sp)
/* 5700 800E4F00 4002B0AF */  sw         $s0, 0x240($sp)
/* 5704 800E4F04 0F80013C */  lui        $at, %hi(D_800F4EE0)
/* 5708 800E4F08 E04E20AC */  sw         $zero, %lo(D_800F4EE0)($at)
/* 570C 800E4F0C 0F80013C */  lui        $at, %hi(D_800F4ED8)
/* 5710 800E4F10 D84E20AC */  sw         $zero, %lo(D_800F4ED8)($at)
/* 5714 800E4F14 F0000234 */  ori        $v0, $zero, 0xF0
/* 5718 800E4F18 1000A2AF */  sw         $v0, 0x10($sp)
/* 571C 800E4F1C 2000B027 */  addiu      $s0, $sp, 0x20
/* 5720 800E4F20 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5724 800E4F24 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5728 800E4F28 21200002 */  addu       $a0, $s0, $zero
/* 572C 800E4F2C 21280000 */  addu       $a1, $zero, $zero
/* 5730 800E4F30 3806428C */  lw         $v0, 0x638($v0)
/* 5734 800E4F34 21300000 */  addu       $a2, $zero, $zero
/* 5738 800E4F38 09F84000 */  jalr       $v0
/* 573C 800E4F3C 40010734 */   ori       $a3, $zero, 0x140
/* 5740 800E4F40 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5744 800E4F44 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5748 800E4F48 3200A0A3 */  sb         $zero, 0x32($sp)
/* 574C 800E4F4C 1C00428C */  lw         $v0, 0x1C($v0)
/* 5750 800E4F50 00000000 */  nop
/* 5754 800E4F54 09F84000 */  jalr       $v0
/* 5758 800E4F58 00000000 */   nop
/* 575C 800E4F5C 01000334 */  ori        $v1, $zero, 0x1
/* 5760 800E4F60 05004314 */  bne        $v0, $v1, .L800E4F78
/* 5764 800E4F64 01000334 */   ori       $v1, $zero, 0x1
/* 5768 800E4F68 2A00A297 */  lhu        $v0, 0x2A($sp)
/* 576C 800E4F6C 3200A3A3 */  sb         $v1, 0x32($sp)
/* 5770 800E4F70 18004224 */  addiu      $v0, $v0, 0x18
/* 5774 800E4F74 2A00A2A7 */  sh         $v0, 0x2A($sp)
.L800E4F78:
/* 5778 800E4F78 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 577C 800E4F7C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5780 800E4F80 00000000 */  nop
/* 5784 800E4F84 1406428C */  lw         $v0, 0x614($v0)
/* 5788 800E4F88 00000000 */  nop
/* 578C 800E4F8C 09F84000 */  jalr       $v0
/* 5790 800E4F90 21200002 */   addu      $a0, $s0, $zero
/* 5794 800E4F94 1800A0A7 */  sh         $zero, 0x18($sp)
/* 5798 800E4F98 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 579C 800E4F9C 00040234 */  ori        $v0, $zero, 0x400
/* 57A0 800E4FA0 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 57A4 800E4FA4 00020234 */  ori        $v0, $zero, 0x200
/* 57A8 800E4FA8 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* 57AC 800E4FAC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 57B0 800E4FB0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 57B4 800E4FB4 1800A427 */  addiu      $a0, $sp, 0x18
/* 57B8 800E4FB8 21280000 */  addu       $a1, $zero, $zero
/* 57BC 800E4FBC 2C06428C */  lw         $v0, 0x62C($v0)
/* 57C0 800E4FC0 21300000 */  addu       $a2, $zero, $zero
/* 57C4 800E4FC4 09F84000 */  jalr       $v0
/* 57C8 800E4FC8 21380000 */   addu      $a3, $zero, $zero
/* 57CC 800E4FCC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 57D0 800E4FD0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 57D4 800E4FD4 00000000 */  nop
/* 57D8 800E4FD8 3006428C */  lw         $v0, 0x630($v0)
/* 57DC 800E4FDC 00000000 */  nop
/* 57E0 800E4FE0 09F84000 */  jalr       $v0
/* 57E4 800E4FE4 21200000 */   addu      $a0, $zero, $zero
/* 57E8 800E4FE8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 57EC 800E4FEC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 57F0 800E4FF0 1800A427 */  addiu      $a0, $sp, 0x18
/* 57F4 800E4FF4 21280000 */  addu       $a1, $zero, $zero
/* 57F8 800E4FF8 2C06428C */  lw         $v0, 0x62C($v0)
/* 57FC 800E4FFC 21300000 */  addu       $a2, $zero, $zero
/* 5800 800E5000 09F84000 */  jalr       $v0
/* 5804 800E5004 21380000 */   addu      $a3, $zero, $zero
/* 5808 800E5008 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 580C 800E500C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5810 800E5010 00000000 */  nop
/* 5814 800E5014 3006428C */  lw         $v0, 0x630($v0)
/* 5818 800E5018 00000000 */  nop
/* 581C 800E501C 09F84000 */  jalr       $v0
/* 5820 800E5020 21200000 */   addu      $a0, $zero, $zero
/* 5824 800E5024 B493030C */  jal        func_800E4ED0
/* 5828 800E5028 21200000 */   addu      $a0, $zero, $zero
/* 582C 800E502C 7F070334 */  ori        $v1, $zero, 0x77F
/* 5830 800E5030 0F80023C */  lui        $v0, %hi(D_800F7F4E)
/* 5834 800E5034 4E7F4224 */  addiu      $v0, $v0, %lo(D_800F7F4E)
.L800E5038:
/* 5838 800E5038 000040A4 */  sh         $zero, 0x0($v0)
/* 583C 800E503C FFFF6324 */  addiu      $v1, $v1, -0x1
/* 5840 800E5040 FDFF6104 */  bgez       $v1, .L800E5038
/* 5844 800E5044 FEFF4224 */   addiu     $v0, $v0, -0x2
/* 5848 800E5048 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 584C 800E504C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5850 800E5050 00000000 */  nop
/* 5854 800E5054 0403428C */  lw         $v0, 0x304($v0)
/* 5858 800E5058 0F80043C */  lui        $a0, %hi(D_800EC034)
/* 585C 800E505C 34C08424 */  addiu      $a0, $a0, %lo(D_800EC034)
/* 5860 800E5060 0F80053C */  lui        $a1, %hi(D_800F5050)
/* 5864 800E5064 5050A524 */  addiu      $a1, $a1, %lo(D_800F5050)
/* 5868 800E5068 09F84000 */  jalr       $v0
/* 586C 800E506C 21900000 */   addu      $s2, $zero, $zero
/* 5870 800E5070 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5874 800E5074 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5878 800E5078 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 587C 800E507C 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5880 800E5080 0403428C */  lw         $v0, 0x304($v0)
/* 5884 800E5084 0F80043C */  lui        $a0, %hi(D_800EC82C)
/* 5888 800E5088 2CC88424 */  addiu      $a0, $a0, %lo(D_800EC82C)
/* 588C 800E508C 09F84000 */  jalr       $v0
/* 5890 800E5090 80001134 */   ori       $s1, $zero, 0x80
/* 5894 800E5094 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 5898 800E5098 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 589C 800E509C 1800A0A7 */  sh         $zero, 0x18($sp)
/* 58A0 800E50A0 F1000234 */  ori        $v0, $zero, 0xF1
/* 58A4 800E50A4 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 58A8 800E50A8 00010234 */  ori        $v0, $zero, 0x100
/* 58AC 800E50AC 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 58B0 800E50B0 01000234 */  ori        $v0, $zero, 0x1
/* 58B4 800E50B4 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* 58B8 800E50B8 2806628C */  lw         $v0, 0x628($v1)
/* 58BC 800E50BC 0F80053C */  lui        $a1, %hi(D_800EE6D0)
/* 58C0 800E50C0 D0E6A524 */  addiu      $a1, $a1, %lo(D_800EE6D0)
/* 58C4 800E50C4 09F84000 */  jalr       $v0
/* 58C8 800E50C8 1800A427 */   addiu     $a0, $sp, 0x18
/* 58CC 800E50CC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 58D0 800E50D0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 58D4 800E50D4 00000000 */  nop
/* 58D8 800E50D8 3006428C */  lw         $v0, 0x630($v0)
/* 58DC 800E50DC 00000000 */  nop
/* 58E0 800E50E0 09F84000 */  jalr       $v0
/* 58E4 800E50E4 21200000 */   addu      $a0, $zero, $zero
/* 58E8 800E50E8 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 58EC 800E50EC A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 58F0 800E50F0 0F80143C */  lui        $s4, %hi(D_800F7F5C)
/* 58F4 800E50F4 5C7F9426 */  addiu      $s4, $s4, %lo(D_800F7F5C)
/* 58F8 800E50F8 40010234 */  ori        $v0, $zero, 0x140
/* 58FC 800E50FC 1800A2A7 */  sh         $v0, 0x18($sp)
/* 5900 800E5100 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 5904 800E5104 A0000234 */  ori        $v0, $zero, 0xA0
/* 5908 800E5108 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 590C 800E510C F0000234 */  ori        $v0, $zero, 0xF0
/* 5910 800E5110 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* 5914 800E5114 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5918 800E5118 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 591C 800E511C 2806628C */  lw         $v0, 0x628($v1)
/* 5920 800E5120 1800A427 */  addiu      $a0, $sp, 0x18
/* 5924 800E5124 09F84000 */  jalr       $v0
/* 5928 800E5128 0800A524 */   addiu     $a1, $a1, 0x8
/* 592C 800E512C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5930 800E5130 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5934 800E5134 08001334 */  ori        $s3, $zero, 0x8
/* 5938 800E5138 3006428C */  lw         $v0, 0x630($v0)
/* 593C 800E513C 21800000 */  addu       $s0, $zero, $zero
/* 5940 800E5140 09F84000 */  jalr       $v0
/* 5944 800E5144 21200000 */   addu      $a0, $zero, $zero
.L800E5148:
/* 5948 800E5148 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 594C 800E514C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5950 800E5150 00000000 */  nop
/* 5954 800E5154 4006428C */  lw         $v0, 0x640($v0)
/* 5958 800E5158 00000000 */  nop
/* 595C 800E515C 09F84000 */  jalr       $v0
/* 5960 800E5160 00000000 */   nop
/* 5964 800E5164 02004010 */  beqz       $v0, .L800E5170
/* 5968 800E5168 8A000734 */   ori       $a3, $zero, 0x8A
/* 596C 800E516C 0A020734 */  ori        $a3, $zero, 0x20A
.L800E5170:
/* 5970 800E5170 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 5974 800E5174 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 5978 800E5178 1000A2AF */  sw         $v0, 0x10($sp)
/* 597C 800E517C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5980 800E5180 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5984 800E5184 0F80043C */  lui        $a0, %hi(D_800F7F50)
/* 5988 800E5188 507F8424 */  addiu      $a0, $a0, %lo(D_800F7F50)
/* 598C 800E518C 21200402 */  addu       $a0, $s0, $a0
/* 5990 800E5190 3406428C */  lw         $v0, 0x634($v0)
/* 5994 800E5194 21280000 */  addu       $a1, $zero, $zero
/* 5998 800E5198 09F84000 */  jalr       $v0
/* 599C 800E519C 21300000 */   addu      $a2, $zero, $zero
/* 59A0 800E51A0 21280000 */  addu       $a1, $zero, $zero
/* 59A4 800E51A4 00960634 */  ori        $a2, $zero, 0x9600
.L800E51A8:
/* 59A8 800E51A8 2120B000 */  addu       $a0, $a1, $s0
/* 59AC 800E51AC 21189400 */  addu       $v1, $a0, $s4
/* 59B0 800E51B0 04000234 */  ori        $v0, $zero, 0x4
/* 59B4 800E51B4 030062A0 */  sb         $v0, 0x3($v1)
/* 59B8 800E51B8 64000234 */  ori        $v0, $zero, 0x64
/* 59BC 800E51BC 070062A0 */  sb         $v0, 0x7($v1)
/* 59C0 800E51C0 040071A0 */  sb         $s1, 0x4($v1)
/* 59C4 800E51C4 050071A0 */  sb         $s1, 0x5($v1)
/* 59C8 800E51C8 060071A0 */  sb         $s1, 0x6($v1)
/* 59CC 800E51CC 003C0234 */  ori        $v0, $zero, 0x3C00
/* 59D0 800E51D0 0E0062A4 */  sh         $v0, 0xE($v1)
/* 59D4 800E51D4 0F80013C */  lui        $at, %hi(D_800F7F6C)
/* 59D8 800E51D8 6C7F2124 */  addiu      $at, $at, %lo(D_800F7F6C)
/* 59DC 800E51DC 21082400 */  addu       $at, $at, $a0
/* 59E0 800E51E0 000033A4 */  sh         $s3, 0x0($at)
/* 59E4 800E51E4 0F80013C */  lui        $at, %hi(D_800F7F6E)
/* 59E8 800E51E8 6E7F2124 */  addiu      $at, $at, %lo(D_800F7F6E)
/* 59EC 800E51EC 21082400 */  addu       $at, $at, $a0
/* 59F0 800E51F0 000033A4 */  sh         $s3, 0x0($at)
/* 59F4 800E51F4 1400A524 */  addiu      $a1, $a1, 0x14
/* 59F8 800E51F8 2A10A600 */  slt        $v0, $a1, $a2
/* 59FC 800E51FC EAFF4014 */  bnez       $v0, .L800E51A8
/* 5A00 800E5200 0500023C */   lui       $v0, (0x52C24 >> 16)
/* 5A04 800E5204 242C4234 */  ori        $v0, $v0, (0x52C24 & 0xFFFF)
/* 5A08 800E5208 21800202 */  addu       $s0, $s0, $v0
/* 5A0C 800E520C 01005226 */  addiu      $s2, $s2, 0x1
/* 5A10 800E5210 0200422A */  slti       $v0, $s2, 0x2
/* 5A14 800E5214 CCFF4014 */  bnez       $v0, .L800E5148
/* 5A18 800E5218 F0000234 */   ori       $v0, $zero, 0xF0
/* 5A1C 800E521C 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 5A20 800E5220 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 5A24 800E5224 3800A0A7 */  sh         $zero, 0x38($sp)
/* 5A28 800E5228 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 5A2C 800E522C 00010234 */  ori        $v0, $zero, 0x100
/* 5A30 800E5230 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 5A34 800E5234 01000234 */  ori        $v0, $zero, 0x1
/* 5A38 800E5238 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 5A3C 800E523C 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5A40 800E5240 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5A44 800E5244 0403628C */  lw         $v0, 0x304($v1)
/* 5A48 800E5248 0F80043C */  lui        $a0, %hi(D_800EBFEC)
/* 5A4C 800E524C ECBF8424 */  addiu      $a0, $a0, %lo(D_800EBFEC)
/* 5A50 800E5250 09F84000 */  jalr       $v0
/* 5A54 800E5254 21800000 */   addu      $s0, $zero, $zero
/* 5A58 800E5258 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5A5C 800E525C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5A60 800E5260 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5A64 800E5264 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5A68 800E5268 2806428C */  lw         $v0, 0x628($v0)
/* 5A6C 800E526C 00000000 */  nop
/* 5A70 800E5270 09F84000 */  jalr       $v0
/* 5A74 800E5274 3800A427 */   addiu     $a0, $sp, 0x38
/* 5A78 800E5278 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5A7C 800E527C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5A80 800E5280 00000000 */  nop
/* 5A84 800E5284 3006428C */  lw         $v0, 0x630($v0)
/* 5A88 800E5288 00000000 */  nop
/* 5A8C 800E528C 09F84000 */  jalr       $v0
/* 5A90 800E5290 21200000 */   addu      $a0, $zero, $zero
/* 5A94 800E5294 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5A98 800E5298 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5A9C 800E529C 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5AA0 800E52A0 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5AA4 800E52A4 0403428C */  lw         $v0, 0x304($v0)
/* 5AA8 800E52A8 0F80043C */  lui        $a0, %hi(D_800EC238)
/* 5AAC 800E52AC 38C28424 */  addiu      $a0, $a0, %lo(D_800EC238)
/* 5AB0 800E52B0 09F84000 */  jalr       $v0
/* 5AB4 800E52B4 00000000 */   nop
/* 5AB8 800E52B8 0F80113C */  lui        $s1, %hi(D_800F4D78)
/* 5ABC 800E52BC 784D318E */  lw         $s1, %lo(D_800F4D78)($s1)
/* 5AC0 800E52C0 1F000232 */  andi       $v0, $s0, 0x1F
.L800E52C4:
/* 5AC4 800E52C4 80100200 */  sll        $v0, $v0, 2
/* 5AC8 800E52C8 00034224 */  addiu      $v0, $v0, 0x300
/* 5ACC 800E52CC 3800A2A7 */  sh         $v0, 0x38($sp)
/* 5AD0 800E52D0 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 5AD4 800E52D4 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 5AD8 800E52D8 43111000 */  sra        $v0, $s0, 5
/* 5ADC 800E52DC C0100200 */  sll        $v0, $v0, 3
/* 5AE0 800E52E0 3A00A2A7 */  sh         $v0, 0x3A($sp)
/* 5AE4 800E52E4 04000234 */  ori        $v0, $zero, 0x4
/* 5AE8 800E52E8 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 5AEC 800E52EC 08000234 */  ori        $v0, $zero, 0x8
/* 5AF0 800E52F0 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 5AF4 800E52F4 2806628C */  lw         $v0, 0x628($v1)
/* 5AF8 800E52F8 3800A427 */  addiu      $a0, $sp, 0x38
/* 5AFC 800E52FC 09F84000 */  jalr       $v0
/* 5B00 800E5300 21282002 */   addu      $a1, $s1, $zero
/* 5B04 800E5304 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5B08 800E5308 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5B0C 800E530C 40003126 */  addiu      $s1, $s1, 0x40
/* 5B10 800E5310 3006428C */  lw         $v0, 0x630($v0)
/* 5B14 800E5314 01001026 */  addiu      $s0, $s0, 0x1
/* 5B18 800E5318 09F84000 */  jalr       $v0
/* 5B1C 800E531C 21200000 */   addu      $a0, $zero, $zero
/* 5B20 800E5320 0004022A */  slti       $v0, $s0, 0x400
/* 5B24 800E5324 E7FF4014 */  bnez       $v0, .L800E52C4
/* 5B28 800E5328 1F000232 */   andi      $v0, $s0, 0x1F
/* 5B2C 800E532C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5B30 800E5330 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5B34 800E5334 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5B38 800E5338 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5B3C 800E533C 0403428C */  lw         $v0, 0x304($v0)
/* 5B40 800E5340 0F80043C */  lui        $a0, %hi(D_800EBA7C)
/* 5B44 800E5344 7CBA8424 */  addiu      $a0, $a0, %lo(D_800EBA7C)
/* 5B48 800E5348 09F84000 */  jalr       $v0
/* 5B4C 800E534C 21880000 */   addu      $s1, $zero, $zero
/* 5B50 800E5350 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 5B54 800E5354 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 5B58 800E5358 80020234 */  ori        $v0, $zero, 0x280
/* 5B5C 800E535C 3800A2A7 */  sh         $v0, 0x38($sp)
/* 5B60 800E5360 3A00A0A7 */  sh         $zero, 0x3A($sp)
/* 5B64 800E5364 40000234 */  ori        $v0, $zero, 0x40
/* 5B68 800E5368 3C00A2A7 */  sh         $v0, 0x3C($sp)
/* 5B6C 800E536C 3E00A2A7 */  sh         $v0, 0x3E($sp)
/* 5B70 800E5370 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5B74 800E5374 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5B78 800E5378 2806628C */  lw         $v0, 0x628($v1)
/* 5B7C 800E537C 3800A427 */  addiu      $a0, $sp, 0x38
/* 5B80 800E5380 09F84000 */  jalr       $v0
/* 5B84 800E5384 0800A524 */   addiu     $a1, $a1, 0x8
/* 5B88 800E5388 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5B8C 800E538C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5B90 800E5390 00000000 */  nop
/* 5B94 800E5394 3006428C */  lw         $v0, 0x630($v0)
/* 5B98 800E5398 00000000 */  nop
/* 5B9C 800E539C 09F84000 */  jalr       $v0
/* 5BA0 800E53A0 21200000 */   addu      $a0, $zero, $zero
/* 5BA4 800E53A4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5BA8 800E53A8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5BAC 800E53AC 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5BB0 800E53B0 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5BB4 800E53B4 0403428C */  lw         $v0, 0x304($v0)
/* 5BB8 800E53B8 0F80043C */  lui        $a0, %hi(D_800EE8D4)
/* 5BBC 800E53BC D4E88424 */  addiu      $a0, $a0, %lo(D_800EE8D4)
/* 5BC0 800E53C0 09F84000 */  jalr       $v0
/* 5BC4 800E53C4 00000000 */   nop
/* 5BC8 800E53C8 0F80033C */  lui        $v1, %hi(D_800F4D78)
/* 5BCC 800E53CC 784D638C */  lw         $v1, %lo(D_800F4D78)($v1)
/* 5BD0 800E53D0 0100023C */  lui        $v0, (0x10000 >> 16)
/* 5BD4 800E53D4 08006424 */  addiu      $a0, $v1, 0x8
/* 5BD8 800E53D8 21306200 */  addu       $a2, $v1, $v0
.L800E53DC:
/* 5BDC 800E53DC 21280000 */  addu       $a1, $zero, $zero
.L800E53E0:
/* 5BE0 800E53E0 00008390 */  lbu        $v1, 0x0($a0)
/* 5BE4 800E53E4 01008424 */  addiu      $a0, $a0, 0x1
/* 5BE8 800E53E8 00008290 */  lbu        $v0, 0x0($a0)
/* 5BEC 800E53EC 01008424 */  addiu      $a0, $a0, 0x1
/* 5BF0 800E53F0 0100A524 */  addiu      $a1, $a1, 0x1
/* 5BF4 800E53F4 00110200 */  sll        $v0, $v0, 4
/* 5BF8 800E53F8 0F006330 */  andi       $v1, $v1, 0xF
/* 5BFC 800E53FC 25186200 */  or         $v1, $v1, $v0
/* 5C00 800E5400 0000C3A0 */  sb         $v1, 0x0($a2)
/* 5C04 800E5404 4000A228 */  slti       $v0, $a1, 0x40
/* 5C08 800E5408 F5FF4014 */  bnez       $v0, .L800E53E0
/* 5C0C 800E540C 0100C624 */   addiu     $a2, $a2, 0x1
/* 5C10 800E5410 01003126 */  addiu      $s1, $s1, 0x1
/* 5C14 800E5414 8000222A */  slti       $v0, $s1, 0x80
/* 5C18 800E5418 F0FF4014 */  bnez       $v0, .L800E53DC
/* 5C1C 800E541C 80020234 */   ori       $v0, $zero, 0x280
/* 5C20 800E5420 1800A2A7 */  sh         $v0, 0x18($sp)
/* 5C24 800E5424 00011034 */  ori        $s0, $zero, 0x100
/* 5C28 800E5428 1A00B0A7 */  sh         $s0, 0x1A($sp)
/* 5C2C 800E542C 20000234 */  ori        $v0, $zero, 0x20
/* 5C30 800E5430 1C00A2A7 */  sh         $v0, 0x1C($sp)
/* 5C34 800E5434 80000234 */  ori        $v0, $zero, 0x80
/* 5C38 800E5438 1E00A2A7 */  sh         $v0, 0x1E($sp)
/* 5C3C 800E543C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5C40 800E5440 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5C44 800E5444 1800A427 */  addiu      $a0, $sp, 0x18
/* 5C48 800E5448 0F80033C */  lui        $v1, %hi(D_800F4D78)
/* 5C4C 800E544C 784D638C */  lw         $v1, %lo(D_800F4D78)($v1)
/* 5C50 800E5450 2806428C */  lw         $v0, 0x628($v0)
/* 5C54 800E5454 0100053C */  lui        $a1, (0x10000 >> 16)
/* 5C58 800E5458 09F84000 */  jalr       $v0
/* 5C5C 800E545C 21286500 */   addu      $a1, $v1, $a1
/* 5C60 800E5460 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5C64 800E5464 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5C68 800E5468 00000000 */  nop
/* 5C6C 800E546C 3006428C */  lw         $v0, 0x630($v0)
/* 5C70 800E5470 21880000 */  addu       $s1, $zero, $zero
/* 5C74 800E5474 09F84000 */  jalr       $v0
/* 5C78 800E5478 21200000 */   addu      $a0, $zero, $zero
/* 5C7C 800E547C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5C80 800E5480 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5C84 800E5484 1F001234 */  ori        $s2, $zero, 0x1F
/* 5C88 800E5488 0F80053C */  lui        $a1, %hi(D_800F4D78)
/* 5C8C 800E548C 784DA58C */  lw         $a1, %lo(D_800F4D78)($a1)
/* 5C90 800E5490 0403428C */  lw         $v0, 0x304($v0)
/* 5C94 800E5494 0F80043C */  lui        $a0, %hi(D_800F04F0)
/* 5C98 800E5498 F0048424 */  addiu      $a0, $a0, %lo(D_800F04F0)
/* 5C9C 800E549C 09F84000 */  jalr       $v0
/* 5CA0 800E54A0 21980000 */   addu      $s3, $zero, $zero
/* 5CA4 800E54A4 40010234 */  ori        $v0, $zero, 0x140
/* 5CA8 800E54A8 1800A2A7 */  sh         $v0, 0x18($sp)
/* 5CAC 800E54AC E0010234 */  ori        $v0, $zero, 0x1E0
/* 5CB0 800E54B0 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 5CB4 800E54B4 1C00B0A7 */  sh         $s0, 0x1C($sp)
/* 5CB8 800E54B8 01000234 */  ori        $v0, $zero, 0x1
/* 5CBC 800E54BC 1E00A2A7 */  sh         $v0, 0x1E($sp)
.L800E54C0:
/* 5CC0 800E54C0 0F800B3C */  lui        $t3, %hi(D_800F4D78)
/* 5CC4 800E54C4 784D6B8D */  lw         $t3, %lo(D_800F4D78)($t3)
/* 5CC8 800E54C8 21400000 */  addu       $t0, $zero, $zero
/* 5CCC 800E54CC 23505102 */  subu       $t2, $s2, $s1
/* 5CD0 800E54D0 21486002 */  addu       $t1, $s3, $zero
.L800E54D4:
/* 5CD4 800E54D4 00006395 */  lhu        $v1, 0x0($t3)
/* 5CD8 800E54D8 00000000 */  nop
/* 5CDC 800E54DC 1F006530 */  andi       $a1, $v1, 0x1F
/* 5CE0 800E54E0 1800AA00 */  mult       $a1, $t2
/* 5CE4 800E54E4 12280000 */  mflo       $a1
/* 5CE8 800E54E8 00000000 */  nop
/* 5CEC 800E54EC 00000000 */  nop
/* 5CF0 800E54F0 2128A900 */  addu       $a1, $a1, $t1
/* 5CF4 800E54F4 1B00B200 */  divu       $zero, $a1, $s2
/* 5CF8 800E54F8 02004016 */  bnez       $s2, .L800E5504
/* 5CFC 800E54FC 00000000 */   nop
/* 5D00 800E5500 0D000700 */  break      7
.L800E5504:
/* 5D04 800E5504 12280000 */  mflo       $a1
/* 5D08 800E5508 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 5D0C 800E550C 42110300 */  srl        $v0, $v1, 5
/* 5D10 800E5510 1F004430 */  andi       $a0, $v0, 0x1F
/* 5D14 800E5514 18008A00 */  mult       $a0, $t2
/* 5D18 800E5518 12200000 */  mflo       $a0
/* 5D1C 800E551C 00000000 */  nop
/* 5D20 800E5520 00000000 */  nop
/* 5D24 800E5524 21208900 */  addu       $a0, $a0, $t1
/* 5D28 800E5528 1B009200 */  divu       $zero, $a0, $s2
/* 5D2C 800E552C 02004016 */  bnez       $s2, .L800E5538
/* 5D30 800E5530 00000000 */   nop
/* 5D34 800E5534 0D000700 */  break      7
.L800E5538:
/* 5D38 800E5538 12200000 */  mflo       $a0
/* 5D3C 800E553C 821A0300 */  srl        $v1, $v1, 10
/* 5D40 800E5540 1F006230 */  andi       $v0, $v1, 0x1F
/* 5D44 800E5544 18004A00 */  mult       $v0, $t2
/* 5D48 800E5548 12100000 */  mflo       $v0
/* 5D4C 800E554C 00000000 */  nop
/* 5D50 800E5550 00000000 */  nop
/* 5D54 800E5554 21104900 */  addu       $v0, $v0, $t1
/* 5D58 800E5558 1B005200 */  divu       $zero, $v0, $s2
/* 5D5C 800E555C 02004016 */  bnez       $s2, .L800E5568
/* 5D60 800E5560 00000000 */   nop
/* 5D64 800E5564 0D000700 */  break      7
.L800E5568:
/* 5D68 800E5568 12100000 */  mflo       $v0
/* 5D6C 800E556C 40300800 */  sll        $a2, $t0, 1
/* 5D70 800E5570 01000825 */  addiu      $t0, $t0, 0x1
/* 5D74 800E5574 1800A727 */  addiu      $a3, $sp, 0x18
/* 5D78 800E5578 2130C700 */  addu       $a2, $a2, $a3
/* 5D7C 800E557C 1F00A530 */  andi       $a1, $a1, 0x1F
/* 5D80 800E5580 1F008430 */  andi       $a0, $a0, 0x1F
/* 5D84 800E5584 40190400 */  sll        $v1, $a0, 5
/* 5D88 800E5588 1F004230 */  andi       $v0, $v0, 0x1F
/* 5D8C 800E558C 80120200 */  sll        $v0, $v0, 10
/* 5D90 800E5590 25104300 */  or         $v0, $v0, $v1
/* 5D94 800E5594 25104500 */  or         $v0, $v0, $a1
/* 5D98 800E5598 2800C2A4 */  sh         $v0, 0x28($a2)
/* 5D9C 800E559C 00010229 */  slti       $v0, $t0, 0x100
/* 5DA0 800E55A0 CCFF4014 */  bnez       $v0, .L800E54D4
/* 5DA4 800E55A4 02006B25 */   addiu     $t3, $t3, 0x2
/* 5DA8 800E55A8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5DAC 800E55AC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5DB0 800E55B0 00000000 */  nop
/* 5DB4 800E55B4 2806428C */  lw         $v0, 0x628($v0)
/* 5DB8 800E55B8 2120E000 */  addu       $a0, $a3, $zero
/* 5DBC 800E55BC 09F84000 */  jalr       $v0
/* 5DC0 800E55C0 4000A527 */   addiu     $a1, $sp, 0x40
/* 5DC4 800E55C4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 5DC8 800E55C8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 5DCC 800E55CC 00000000 */  nop
/* 5DD0 800E55D0 3006428C */  lw         $v0, 0x630($v0)
/* 5DD4 800E55D4 00000000 */  nop
/* 5DD8 800E55D8 09F84000 */  jalr       $v0
/* 5DDC 800E55DC 21200000 */   addu      $a0, $zero, $zero
/* 5DE0 800E55E0 1A00A297 */  lhu        $v0, 0x1A($sp)
/* 5DE4 800E55E4 01003126 */  addiu      $s1, $s1, 0x1
/* 5DE8 800E55E8 01004224 */  addiu      $v0, $v0, 0x1
/* 5DEC 800E55EC 1A00A2A7 */  sh         $v0, 0x1A($sp)
/* 5DF0 800E55F0 2000222A */  slti       $v0, $s1, 0x20
/* 5DF4 800E55F4 B2FF4014 */  bnez       $v0, .L800E54C0
/* 5DF8 800E55F8 1F007326 */   addiu     $s3, $s3, 0x1F
/* 5DFC 800E55FC 5402BF8F */  lw         $ra, 0x254($sp)
/* 5E00 800E5600 5002B48F */  lw         $s4, 0x250($sp)
/* 5E04 800E5604 4C02B38F */  lw         $s3, 0x24C($sp)
/* 5E08 800E5608 4802B28F */  lw         $s2, 0x248($sp)
/* 5E0C 800E560C 4402B18F */  lw         $s1, 0x244($sp)
/* 5E10 800E5610 4002B08F */  lw         $s0, 0x240($sp)
/* 5E14 800E5614 0800E003 */  jr         $ra
/* 5E18 800E5618 5802BD27 */   addiu     $sp, $sp, 0x258
glabel func_800E561C
/* 5E1C 800E561C 0F80013C */  lui        $at, %hi(D_800F4D84)
/* 5E20 800E5620 844D24AC */  sw         $a0, %lo(D_800F4D84)($at)
/* 5E24 800E5624 0F80013C */  lui        $at, %hi(D_800F4D88)
/* 5E28 800E5628 884D25AC */  sw         $a1, %lo(D_800F4D88)($at)
/* 5E2C 800E562C 0800E003 */  jr         $ra
/* 5E30 800E5630 00000000 */   nop
glabel func_800E5634
/* 5E34 800E5634 0F80013C */  lui        $at, %hi(D_800F4EE8)
/* 5E38 800E5638 E84E24AC */  sw         $a0, %lo(D_800F4EE8)($at)
/* 5E3C 800E563C 0F80013C */  lui        $at, %hi(D_800F4EF0)
/* 5E40 800E5640 F04E25AC */  sw         $a1, %lo(D_800F4EF0)($at)
/* 5E44 800E5644 0800E003 */  jr         $ra
/* 5E48 800E5648 00000000 */   nop
glabel func_800E564C
/* 5E4C 800E564C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5E50 800E5650 1000BFAF */  sw         $ra, 0x10($sp)
/* 5E54 800E5654 7F070334 */  ori        $v1, $zero, 0x77F
/* 5E58 800E5658 0F80023C */  lui        $v0, %hi(D_800F7F4E)
/* 5E5C 800E565C 4E7F4224 */  addiu      $v0, $v0, %lo(D_800F7F4E)
.L800E5660:
/* 5E60 800E5660 000040A4 */  sh         $zero, 0x0($v0)
/* 5E64 800E5664 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 5E68 800E5668 FDFF6104 */  bgez       $v1, .L800E5660
/* 5E6C 800E566C FEFF4224 */   addiu     $v0, $v0, -0x2
/* 5E70 800E5670 21200000 */  addu       $a0, $zero, $zero
/* 5E74 800E5674 8D95030C */  jal        func_800E5634
/* 5E78 800E5678 21280000 */   addu      $a1, $zero, $zero
/* 5E7C 800E567C 1000BF8F */  lw         $ra, 0x10($sp)
/* 5E80 800E5680 00000000 */  nop
/* 5E84 800E5684 0800E003 */  jr         $ra
/* 5E88 800E5688 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E568C
/* 5E8C 800E568C 0F80033C */  lui        $v1, %hi(D_800F4EE8)
/* 5E90 800E5690 E84E638C */  lw         $v1, %lo(D_800F4EE8)($v1)
/* 5E94 800E5694 00000000 */  nop
/* 5E98 800E5698 3F006228 */  slti       $v0, $v1, 0x3F
/* 5E9C 800E569C 15004010 */  beqz       $v0, .L800E56F4
/* 5EA0 800E56A0 21288000 */   addu      $a1, $a0, $zero
/* 5EA4 800E56A4 0F80043C */  lui        $a0, %hi(D_800F4EF0)
/* 5EA8 800E56A8 F04E848C */  lw         $a0, %lo(D_800F4EF0)($a0)
/* 5EAC 800E56AC 00000000 */  nop
/* 5EB0 800E56B0 1D008228 */  slti       $v0, $a0, 0x1D
/* 5EB4 800E56B4 0F004010 */  beqz       $v0, .L800E56F4
/* 5EB8 800E56B8 01006224 */   addiu     $v0, $v1, 0x1
/* 5EBC 800E56BC 0F80013C */  lui        $at, %hi(D_800F4EE8)
/* 5EC0 800E56C0 E84E22AC */  sw         $v0, %lo(D_800F4EE8)($at)
/* 5EC4 800E56C4 80210400 */  sll        $a0, $a0, 6
/* 5EC8 800E56C8 21208300 */  addu       $a0, $a0, $v1
/* 5ECC 800E56CC 0F80033C */  lui        $v1, %hi(D_800F4D8E)
/* 5ED0 800E56D0 8E4D6390 */  lbu        $v1, %lo(D_800F4D8E)($v1)
/* 5ED4 800E56D4 40200400 */  sll        $a0, $a0, 1
/* 5ED8 800E56D8 FF00A230 */  andi       $v0, $a1, 0xFF
/* 5EDC 800E56DC 001A0300 */  sll        $v1, $v1, 8
/* 5EE0 800E56E0 25104300 */  or         $v0, $v0, $v1
/* 5EE4 800E56E4 0F80013C */  lui        $at, %hi(D_800F7050)
/* 5EE8 800E56E8 50702124 */  addiu      $at, $at, %lo(D_800F7050)
/* 5EEC 800E56EC 21082400 */  addu       $at, $at, $a0
/* 5EF0 800E56F0 000022A4 */  sh         $v0, 0x0($at)
.L800E56F4:
/* 5EF4 800E56F4 0800E003 */  jr         $ra
/* 5EF8 800E56F8 00000000 */   nop
glabel func_800E56FC
/* 5EFC 800E56FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5F00 800E5700 1400BFAF */  sw         $ra, 0x14($sp)
/* 5F04 800E5704 1000B0AF */  sw         $s0, 0x10($sp)
/* 5F08 800E5708 21808000 */  addu       $s0, $a0, $zero
/* 5F0C 800E570C 00000292 */  lbu        $v0, 0x0($s0)
/* 5F10 800E5710 00000000 */  nop
/* 5F14 800E5714 08004010 */  beqz       $v0, .L800E5738
/* 5F18 800E5718 00000000 */   nop
.L800E571C:
/* 5F1C 800E571C 00000492 */  lbu        $a0, 0x0($s0)
/* 5F20 800E5720 A395030C */  jal        func_800E568C
/* 5F24 800E5724 01001026 */   addiu     $s0, $s0, 0x1
/* 5F28 800E5728 00000292 */  lbu        $v0, 0x0($s0)
/* 5F2C 800E572C 00000000 */  nop
/* 5F30 800E5730 FAFF4014 */  bnez       $v0, .L800E571C
/* 5F34 800E5734 00000000 */   nop
.L800E5738:
/* 5F38 800E5738 1400BF8F */  lw         $ra, 0x14($sp)
/* 5F3C 800E573C 1000B08F */  lw         $s0, 0x10($sp)
/* 5F40 800E5740 0800E003 */  jr         $ra
/* 5F44 800E5744 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E5748
/* 5F48 800E5748 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5F4C 800E574C 0F008330 */  andi       $v1, $a0, 0xF
/* 5F50 800E5750 21106000 */  addu       $v0, $v1, $zero
/* 5F54 800E5754 21204000 */  addu       $a0, $v0, $zero
/* 5F58 800E5758 0A00822C */  sltiu      $v0, $a0, 0xA
/* 5F5C 800E575C 02004014 */  bnez       $v0, .L800E5768
/* 5F60 800E5760 1000BFAF */   sw        $ra, 0x10($sp)
/* 5F64 800E5764 07006424 */  addiu      $a0, $v1, 0x7
.L800E5768:
/* 5F68 800E5768 A395030C */  jal        func_800E568C
/* 5F6C 800E576C 30008424 */   addiu     $a0, $a0, 0x30
/* 5F70 800E5770 1000BF8F */  lw         $ra, 0x10($sp)
/* 5F74 800E5774 00000000 */  nop
/* 5F78 800E5778 0800E003 */  jr         $ra
/* 5F7C 800E577C 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E5780
/* 5F80 800E5780 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5F84 800E5784 1400BFAF */  sw         $ra, 0x14($sp)
/* 5F88 800E5788 1000B0AF */  sw         $s0, 0x10($sp)
/* 5F8C 800E578C 21808000 */  addu       $s0, $a0, $zero
/* 5F90 800E5790 FF000432 */  andi       $a0, $s0, 0xFF
/* 5F94 800E5794 D295030C */  jal        func_800E5748
/* 5F98 800E5798 02210400 */   srl       $a0, $a0, 4
/* 5F9C 800E579C D295030C */  jal        func_800E5748
/* 5FA0 800E57A0 0F000432 */   andi      $a0, $s0, 0xF
/* 5FA4 800E57A4 1400BF8F */  lw         $ra, 0x14($sp)
/* 5FA8 800E57A8 1000B08F */  lw         $s0, 0x10($sp)
/* 5FAC 800E57AC 0800E003 */  jr         $ra
/* 5FB0 800E57B0 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E57B4
/* 5FB4 800E57B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5FB8 800E57B8 1400BFAF */  sw         $ra, 0x14($sp)
/* 5FBC 800E57BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 5FC0 800E57C0 21808000 */  addu       $s0, $a0, $zero
/* 5FC4 800E57C4 FFFF0432 */  andi       $a0, $s0, 0xFFFF
/* 5FC8 800E57C8 E095030C */  jal        func_800E5780
/* 5FCC 800E57CC 02220400 */   srl       $a0, $a0, 8
/* 5FD0 800E57D0 E095030C */  jal        func_800E5780
/* 5FD4 800E57D4 FF000432 */   andi      $a0, $s0, 0xFF
/* 5FD8 800E57D8 1400BF8F */  lw         $ra, 0x14($sp)
/* 5FDC 800E57DC 1000B08F */  lw         $s0, 0x10($sp)
/* 5FE0 800E57E0 0800E003 */  jr         $ra
/* 5FE4 800E57E4 1800BD27 */   addiu     $sp, $sp, 0x18
/* 5FE8 800E57E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5FEC 800E57EC 1400BFAF */  sw         $ra, 0x14($sp)
/* 5FF0 800E57F0 1000B0AF */  sw         $s0, 0x10($sp)
/* 5FF4 800E57F4 21808000 */  addu       $s0, $a0, $zero
/* 5FF8 800E57F8 ED95030C */  jal        func_800E57B4
/* 5FFC 800E57FC 02241000 */   srl       $a0, $s0, 16
/* 6000 800E5800 ED95030C */  jal        func_800E57B4
/* 6004 800E5804 FFFF0432 */   andi      $a0, $s0, 0xFFFF
/* 6008 800E5808 1400BF8F */  lw         $ra, 0x14($sp)
/* 600C 800E580C 1000B08F */  lw         $s0, 0x10($sp)
/* 6010 800E5810 0800E003 */  jr         $ra
/* 6014 800E5814 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E5818
/* 6018 800E5818 0F80023C */  lui        $v0, %hi(D_800F4ED8)
/* 601C 800E581C D84E428C */  lw         $v0, %lo(D_800F4ED8)($v0)
/* 6020 800E5820 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6024 800E5824 0600401C */  bgtz       $v0, .L800E5840
/* 6028 800E5828 1000BFAF */   sw        $ra, 0x10($sp)
/* 602C 800E582C 01004224 */  addiu      $v0, $v0, 0x1
/* 6030 800E5830 0F80013C */  lui        $at, %hi(D_800F4ED8)
/* 6034 800E5834 D84E22AC */  sw         $v0, %lo(D_800F4ED8)($at)
/* 6038 800E5838 12960308 */  j          .L800E5848
/* 603C 800E583C 00000000 */   nop
.L800E5840:
/* 6040 800E5840 0F80013C */  lui        $at, %hi(D_800F4ED8)
/* 6044 800E5844 D84E20AC */  sw         $zero, %lo(D_800F4ED8)($at)
.L800E5848:
/* 6048 800E5848 0F80033C */  lui        $v1, %hi(D_800F4ED8)
/* 604C 800E584C D84E638C */  lw         $v1, %lo(D_800F4ED8)($v1)
/* 6050 800E5850 0500053C */  lui        $a1, (0x52C0C >> 16)
/* 6054 800E5854 0C2CA534 */  ori        $a1, $a1, (0x52C0C & 0xFFFF)
/* 6058 800E5858 80200300 */  sll        $a0, $v1, 2
/* 605C 800E585C 21208300 */  addu       $a0, $a0, $v1
/* 6060 800E5860 80210400 */  sll        $a0, $a0, 6
/* 6064 800E5864 21208300 */  addu       $a0, $a0, $v1
/* 6068 800E5868 40110400 */  sll        $v0, $a0, 5
/* 606C 800E586C 21208200 */  addu       $a0, $a0, $v0
/* 6070 800E5870 C0200400 */  sll        $a0, $a0, 3
/* 6074 800E5874 21208300 */  addu       $a0, $a0, $v1
/* 6078 800E5878 80200400 */  sll        $a0, $a0, 2
/* 607C 800E587C 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 6080 800E5880 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 6084 800E5884 0F80023C */  lui        $v0, %hi(D_800F7F50)
/* 6088 800E5888 507F4224 */  addiu      $v0, $v0, %lo(D_800F7F50)
/* 608C 800E588C 21208200 */  addu       $a0, $a0, $v0
/* 6090 800E5890 0F80013C */  lui        $at, %hi(D_800F4ED0)
/* 6094 800E5894 D04E24AC */  sw         $a0, %lo(D_800F4ED0)($at)
/* 6098 800E5898 1C06628C */  lw         $v0, 0x61C($v1)
/* 609C 800E589C 21208500 */  addu       $a0, $a0, $a1
/* 60A0 800E58A0 09F84000 */  jalr       $v0
/* 60A4 800E58A4 05000534 */   ori       $a1, $zero, 0x5
/* 60A8 800E58A8 0100043C */  lui        $a0, (0x12C0C >> 16)
/* 60AC 800E58AC 0F80033C */  lui        $v1, %hi(D_800F4ED0)
/* 60B0 800E58B0 D04E638C */  lw         $v1, %lo(D_800F4ED0)($v1)
/* 60B4 800E58B4 0C2C8434 */  ori        $a0, $a0, (0x12C0C & 0xFFFF)
/* 60B8 800E58B8 0500023C */  lui        $v0, (0x52C20 >> 16)
/* 60BC 800E58BC 21106200 */  addu       $v0, $v1, $v0
/* 60C0 800E58C0 21186400 */  addu       $v1, $v1, $a0
/* 60C4 800E58C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 60C8 800E58C8 202C43AC */  sw         $v1, (0x52C20 & 0xFFFF)($v0)
/* 60CC 800E58CC 0800E003 */  jr         $ra
/* 60D0 800E58D0 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E58D4
/* 60D4 800E58D4 0F80013C */  lui        $at, %hi(D_800F4EE0)
/* 60D8 800E58D8 E04E24AC */  sw         $a0, %lo(D_800F4EE0)($at)
/* 60DC 800E58DC 0800E003 */  jr         $ra
/* 60E0 800E58E0 00000000 */   nop
glabel func_800E58E4
/* 60E4 800E58E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 60E8 800E58E8 1000BFAF */  sw         $ra, 0x10($sp)
/* 60EC 800E58EC 3596030C */  jal        func_800E58D4
/* 60F0 800E58F0 FF008430 */   andi      $a0, $a0, 0xFF
/* 60F4 800E58F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 60F8 800E58F8 00000000 */  nop
/* 60FC 800E58FC 0800E003 */  jr         $ra
/* 6100 800E5900 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E5904
/* 6104 800E5904 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6108 800E5908 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 610C 800E590C 3800BEAF */  sw         $fp, 0x38($sp)
/* 6110 800E5910 3400B7AF */  sw         $s7, 0x34($sp)
/* 6114 800E5914 3000B6AF */  sw         $s6, 0x30($sp)
/* 6118 800E5918 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 611C 800E591C 2800B4AF */  sw         $s4, 0x28($sp)
/* 6120 800E5920 2400B3AF */  sw         $s3, 0x24($sp)
/* 6124 800E5924 2000B2AF */  sw         $s2, 0x20($sp)
/* 6128 800E5928 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 612C 800E592C 1800B0AF */  sw         $s0, 0x18($sp)
/* 6130 800E5930 21A08000 */  addu       $s4, $a0, $zero
/* 6134 800E5934 2190A000 */  addu       $s2, $a1, $zero
/* 6138 800E5938 21B8C000 */  addu       $s7, $a2, $zero
/* 613C 800E593C 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 6140 800E5940 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 6144 800E5944 0500033C */  lui        $v1, (0x52C20 >> 16)
/* 6148 800E5948 1000918E */  lw         $s1, 0x10($s4)
/* 614C 800E594C 21104300 */  addu       $v0, $v0, $v1
/* 6150 800E5950 202C538C */  lw         $s3, (0x52C20 & 0xFFFF)($v0)
/* 6154 800E5954 21F0E000 */  addu       $fp, $a3, $zero
/* 6158 800E5958 21800000 */  addu       $s0, $zero, $zero
/* 615C 800E595C 0000228E */  lw         $v0, 0x0($s1)
/* 6160 800E5960 5000A493 */  lbu        $a0, 0x50($sp)
/* 6164 800E5964 1A80163C */  lui        $s6, %hi(D_801A0FF0)
/* 6168 800E5968 F00FD692 */  lbu        $s6, %lo(D_801A0FF0)($s6)
/* 616C 800E596C 2B104202 */  sltu       $v0, $s2, $v0
/* 6170 800E5970 03004014 */  bnez       $v0, .L800E5980
/* 6174 800E5974 04003126 */   addiu     $s1, $s1, 0x4
/* 6178 800E5978 E3960308 */  j          .L800E5B8C
/* 617C 800E597C 21100000 */   addu      $v0, $zero, $zero
.L800E5980:
/* 6180 800E5980 3996030C */  jal        func_800E58E4
/* 6184 800E5984 00000000 */   nop
/* 6188 800E5988 07004012 */  beqz       $s2, .L800E59A8
/* 618C 800E598C 00000000 */   nop
.L800E5990:
/* 6190 800E5990 0000358E */  lw         $s5, 0x0($s1)
/* 6194 800E5994 04003126 */  addiu      $s1, $s1, 0x4
/* 6198 800E5998 01001026 */  addiu      $s0, $s0, 0x1
/* 619C 800E599C 80101500 */  sll        $v0, $s5, 2
/* 61A0 800E59A0 FBFF5016 */  bne        $s2, $s0, .L800E5990
/* 61A4 800E59A4 21882202 */   addu      $s1, $s1, $v0
.L800E59A8:
/* 61A8 800E59A8 0000358E */  lw         $s5, 0x0($s1)
/* 61AC 800E59AC 00000000 */  nop
/* 61B0 800E59B0 6E00A012 */  beqz       $s5, .L800E5B6C
/* 61B4 800E59B4 04003126 */   addiu     $s1, $s1, 0x4
/* 61B8 800E59B8 06007026 */  addiu      $s0, $s3, 0x6
.L800E59BC:
/* 61BC 800E59BC 00002592 */  lbu        $a1, 0x0($s1)
/* 61C0 800E59C0 01003126 */  addiu      $s1, $s1, 0x1
/* 61C4 800E59C4 00002692 */  lbu        $a2, 0x0($s1)
/* 61C8 800E59C8 01003126 */  addiu      $s1, $s1, 0x1
/* 61CC 800E59CC 00002796 */  lhu        $a3, 0x0($s1)
/* 61D0 800E59D0 04000234 */  ori        $v0, $zero, 0x4
/* 61D4 800E59D4 FDFF02A2 */  sb         $v0, -0x3($s0)
/* 61D8 800E59D8 64000234 */  ori        $v0, $zero, 0x64
/* 61DC 800E59DC 010002A2 */  sb         $v0, 0x1($s0)
/* 61E0 800E59E0 04008496 */  lhu        $a0, 0x4($s4)
/* 61E4 800E59E4 0F80033C */  lui        $v1, %hi(D_800F4EE0)
/* 61E8 800E59E8 E04E638C */  lw         $v1, %lo(D_800F4EE0)($v1)
/* 61EC 800E59EC 0000888E */  lw         $t0, 0x0($s4)
/* 61F0 800E59F0 02003126 */  addiu      $s1, $s1, 0x2
/* 61F4 800E59F4 08000234 */  ori        $v0, $zero, 0x8
/* 61F8 800E59F8 0A0002A6 */  sh         $v0, 0xA($s0)
/* 61FC 800E59FC 0C0002A6 */  sh         $v0, 0xC($s0)
/* 6200 800E5A00 FEFF16A2 */  sb         $s6, -0x2($s0)
/* 6204 800E5A04 FFFF16A2 */  sb         $s6, -0x1($s0)
/* 6208 800E5A08 000016A2 */  sb         $s6, 0x0($s0)
/* 620C 800E5A0C 0500093C */  lui        $t1, (0x52C1C >> 16)
/* 6210 800E5A10 1C2C2935 */  ori        $t1, $t1, (0x52C1C & 0xFFFF)
/* 6214 800E5A14 80210400 */  sll        $a0, $a0, 6
/* 6218 800E5A18 00190300 */  sll        $v1, $v1, 4
/* 621C 800E5A1C 21186800 */  addu       $v1, $v1, $t0
/* 6220 800E5A20 03190300 */  sra        $v1, $v1, 4
/* 6224 800E5A24 3F006330 */  andi       $v1, $v1, 0x3F
/* 6228 800E5A28 25208300 */  or         $a0, $a0, $v1
/* 622C 800E5A2C 080004A6 */  sh         $a0, 0x8($s0)
/* 6230 800E5A30 FF0FF230 */  andi       $s2, $a3, 0xFFF
/* 6234 800E5A34 0F004232 */  andi       $v0, $s2, 0xF
/* 6238 800E5A38 C0100200 */  sll        $v0, $v0, 3
/* 623C 800E5A3C 060002A2 */  sb         $v0, 0x6($s0)
/* 6240 800E5A40 42111200 */  srl        $v0, $s2, 5
/* 6244 800E5A44 C0100200 */  sll        $v0, $v0, 3
/* 6248 800E5A48 070002A2 */  sb         $v0, 0x7($s0)
/* 624C 800E5A4C 002E0500 */  sll        $a1, $a1, 24
/* 6250 800E5A50 032E0500 */  sra        $a1, $a1, 24
/* 6254 800E5A54 2128B700 */  addu       $a1, $a1, $s7
/* 6258 800E5A58 020005A6 */  sh         $a1, 0x2($s0)
/* 625C 800E5A5C 00360600 */  sll        $a2, $a2, 24
/* 6260 800E5A60 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6264 800E5A64 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6268 800E5A68 03360600 */  sra        $a2, $a2, 24
/* 626C 800E5A6C 2130DE00 */  addu       $a2, $a2, $fp
/* 6270 800E5A70 040006A6 */  sh         $a2, 0x4($s0)
/* 6274 800E5A74 21208900 */  addu       $a0, $a0, $t1
/* 6278 800E5A78 00000000 */  nop
/* 627C 800E5A7C 02008288 */  lwl        $v0, 0x2($a0)
/* 6280 800E5A80 001A1300 */  sll        $v1, $s3, 8
/* 6284 800E5A84 020062AA */  swl        $v0, 0x2($s3)
/* 6288 800E5A88 020083A8 */  swl        $v1, 0x2($a0)
/* 628C 800E5A8C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6290 800E5A90 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6294 800E5A94 00000000 */  nop
/* 6298 800E5A98 4006428C */  lw         $v0, 0x640($v0)
/* 629C 800E5A9C 14001026 */  addiu      $s0, $s0, 0x14
/* 62A0 800E5AA0 09F84000 */  jalr       $v0
/* 62A4 800E5AA4 14007326 */   addiu     $s3, $s3, 0x14
/* 62A8 800E5AA8 0B004010 */  beqz       $v0, .L800E5AD8
/* 62AC 800E5AAC 00000000 */   nop
/* 62B0 800E5AB0 0C00828E */  lw         $v0, 0xC($s4)
/* 62B4 800E5AB4 0800838E */  lw         $v1, 0x8($s4)
/* 62B8 800E5AB8 00034230 */  andi       $v0, $v0, 0x300
/* 62BC 800E5ABC C3100200 */  sra        $v0, $v0, 3
/* 62C0 800E5AC0 00024734 */  ori        $a3, $v0, 0x200
/* 62C4 800E5AC4 10004232 */  andi       $v0, $s2, 0x10
/* 62C8 800E5AC8 0D004010 */  beqz       $v0, .L800E5B00
/* 62CC 800E5ACC 40006224 */   addiu     $v0, $v1, 0x40
/* 62D0 800E5AD0 C1960308 */  j          .L800E5B04
/* 62D4 800E5AD4 FF034230 */   andi      $v0, $v0, 0x3FF
.L800E5AD8:
/* 62D8 800E5AD8 0C00828E */  lw         $v0, 0xC($s4)
/* 62DC 800E5ADC 0800838E */  lw         $v1, 0x8($s4)
/* 62E0 800E5AE0 00014230 */  andi       $v0, $v0, 0x100
/* 62E4 800E5AE4 03110200 */  sra        $v0, $v0, 4
/* 62E8 800E5AE8 80004734 */  ori        $a3, $v0, 0x80
/* 62EC 800E5AEC 10004232 */  andi       $v0, $s2, 0x10
/* 62F0 800E5AF0 03004010 */  beqz       $v0, .L800E5B00
/* 62F4 800E5AF4 40006224 */   addiu     $v0, $v1, 0x40
/* 62F8 800E5AF8 C1960308 */  j          .L800E5B04
/* 62FC 800E5AFC FF034230 */   andi      $v0, $v0, 0x3FF
.L800E5B00:
/* 6300 800E5B00 FF036230 */  andi       $v0, $v1, 0x3FF
.L800E5B04:
/* 6304 800E5B04 83110200 */  sra        $v0, $v0, 6
/* 6308 800E5B08 2538E200 */  or         $a3, $a3, $v0
/* 630C 800E5B0C 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 6310 800E5B10 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 6314 800E5B14 1000A2AF */  sw         $v0, 0x10($sp)
/* 6318 800E5B18 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 631C 800E5B1C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6320 800E5B20 21206002 */  addu       $a0, $s3, $zero
/* 6324 800E5B24 3406428C */  lw         $v0, 0x634($v0)
/* 6328 800E5B28 21280000 */  addu       $a1, $zero, $zero
/* 632C 800E5B2C 09F84000 */  jalr       $v0
/* 6330 800E5B30 21300000 */   addu      $a2, $zero, $zero
/* 6334 800E5B34 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6338 800E5B38 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 633C 800E5B3C 0500023C */  lui        $v0, (0x52C1C >> 16)
/* 6340 800E5B40 1C2C4234 */  ori        $v0, $v0, (0x52C1C & 0xFFFF)
/* 6344 800E5B44 21208200 */  addu       $a0, $a0, $v0
/* 6348 800E5B48 00000000 */  nop
/* 634C 800E5B4C 02008288 */  lwl        $v0, 0x2($a0)
/* 6350 800E5B50 001A1300 */  sll        $v1, $s3, 8
/* 6354 800E5B54 020062AA */  swl        $v0, 0x2($s3)
/* 6358 800E5B58 020083A8 */  swl        $v1, 0x2($a0)
/* 635C 800E5B5C 0C001026 */  addiu      $s0, $s0, 0xC
/* 6360 800E5B60 FFFFB526 */  addiu      $s5, $s5, -0x1
/* 6364 800E5B64 95FFA016 */  bnez       $s5, .L800E59BC
/* 6368 800E5B68 0C007326 */   addiu     $s3, $s3, 0xC
.L800E5B6C:
/* 636C 800E5B6C 3996030C */  jal        func_800E58E4
/* 6370 800E5B70 21200000 */   addu      $a0, $zero, $zero
/* 6374 800E5B74 0F80033C */  lui        $v1, %hi(D_800F4ED0)
/* 6378 800E5B78 D04E638C */  lw         $v1, %lo(D_800F4ED0)($v1)
/* 637C 800E5B7C 01000234 */  ori        $v0, $zero, 0x1
/* 6380 800E5B80 0500043C */  lui        $a0, (0x52C20 >> 16)
/* 6384 800E5B84 21186400 */  addu       $v1, $v1, $a0
/* 6388 800E5B88 202C73AC */  sw         $s3, (0x52C20 & 0xFFFF)($v1)
.L800E5B8C:
/* 638C 800E5B8C 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 6390 800E5B90 3800BE8F */  lw         $fp, 0x38($sp)
/* 6394 800E5B94 3400B78F */  lw         $s7, 0x34($sp)
/* 6398 800E5B98 3000B68F */  lw         $s6, 0x30($sp)
/* 639C 800E5B9C 2C00B58F */  lw         $s5, 0x2C($sp)
/* 63A0 800E5BA0 2800B48F */  lw         $s4, 0x28($sp)
/* 63A4 800E5BA4 2400B38F */  lw         $s3, 0x24($sp)
/* 63A8 800E5BA8 2000B28F */  lw         $s2, 0x20($sp)
/* 63AC 800E5BAC 1C00B18F */  lw         $s1, 0x1C($sp)
/* 63B0 800E5BB0 1800B08F */  lw         $s0, 0x18($sp)
/* 63B4 800E5BB4 0800E003 */  jr         $ra
/* 63B8 800E5BB8 4000BD27 */   addiu     $sp, $sp, 0x40
glabel func_800E5BBC
/* 63BC 800E5BBC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 63C0 800E5BC0 1800BFAF */  sw         $ra, 0x18($sp)
/* 63C4 800E5BC4 21108000 */  addu       $v0, $a0, $zero
/* 63C8 800E5BC8 2118A000 */  addu       $v1, $a1, $zero
/* 63CC 800E5BCC 2140C000 */  addu       $t0, $a2, $zero
/* 63D0 800E5BD0 FF00E730 */  andi       $a3, $a3, 0xFF
/* 63D4 800E5BD4 1000A7AF */  sw         $a3, 0x10($sp)
/* 63D8 800E5BD8 0F80043C */  lui        $a0, %hi(D_800EB9A0)
/* 63DC 800E5BDC A0B98424 */  addiu      $a0, $a0, %lo(D_800EB9A0)
/* 63E0 800E5BE0 21284000 */  addu       $a1, $v0, $zero
/* 63E4 800E5BE4 21306000 */  addu       $a2, $v1, $zero
/* 63E8 800E5BE8 4196030C */  jal        func_800E5904
/* 63EC 800E5BEC 21380001 */   addu      $a3, $t0, $zero
/* 63F0 800E5BF0 1800BF8F */  lw         $ra, 0x18($sp)
/* 63F4 800E5BF4 00000000 */  nop
/* 63F8 800E5BF8 0800E003 */  jr         $ra
/* 63FC 800E5BFC 2000BD27 */   addiu     $sp, $sp, 0x20
glabel func_800E5C00
/* 6400 800E5C00 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6404 800E5C04 3800BFAF */  sw         $ra, 0x38($sp)
/* 6408 800E5C08 3400B7AF */  sw         $s7, 0x34($sp)
/* 640C 800E5C0C 3000B6AF */  sw         $s6, 0x30($sp)
/* 6410 800E5C10 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 6414 800E5C14 2800B4AF */  sw         $s4, 0x28($sp)
/* 6418 800E5C18 2400B3AF */  sw         $s3, 0x24($sp)
/* 641C 800E5C1C 2000B2AF */  sw         $s2, 0x20($sp)
/* 6420 800E5C20 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6424 800E5C24 1800B0AF */  sw         $s0, 0x18($sp)
/* 6428 800E5C28 21B08000 */  addu       $s6, $a0, $zero
/* 642C 800E5C2C 21B8A000 */  addu       $s7, $a1, $zero
/* 6430 800E5C30 0F80143C */  lui        $s4, %hi(D_800EB9B4)
/* 6434 800E5C34 B4B99426 */  addiu      $s4, $s4, %lo(D_800EB9B4)
/* 6438 800E5C38 21900000 */  addu       $s2, $zero, $zero
/* 643C 800E5C3C 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 6440 800E5C40 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 6444 800E5C44 0500153C */  lui        $s5, (0x52C14 >> 16)
/* 6448 800E5C48 0500033C */  lui        $v1, (0x52C20 >> 16)
/* 644C 800E5C4C 21104300 */  addu       $v0, $v0, $v1
/* 6450 800E5C50 202C518C */  lw         $s1, (0x52C20 & 0xFFFF)($v0)
/* 6454 800E5C54 142CB536 */  ori        $s5, $s5, (0x52C14 & 0xFFFF)
/* 6458 800E5C58 1A80133C */  lui        $s3, %hi(D_801A0FF0)
/* 645C 800E5C5C F00F7392 */  lbu        $s3, %lo(D_801A0FF0)($s3)
/* 6460 800E5C60 0E003026 */  addiu      $s0, $s1, 0xE
.L800E5C64:
/* 6464 800E5C64 64000234 */  ori        $v0, $zero, 0x64
/* 6468 800E5C68 F9FF02A2 */  sb         $v0, -0x7($s0)
/* 646C 800E5C6C F9FF0392 */  lbu        $v1, -0x7($s0)
/* 6470 800E5C70 04000234 */  ori        $v0, $zero, 0x4
/* 6474 800E5C74 F5FF02A2 */  sb         $v0, -0xB($s0)
/* 6478 800E5C78 FEFF00A2 */  sb         $zero, -0x2($s0)
/* 647C 800E5C7C D3000234 */  ori        $v0, $zero, 0xD3
/* 6480 800E5C80 FFFF02A2 */  sb         $v0, -0x1($s0)
/* 6484 800E5C84 0F000234 */  ori        $v0, $zero, 0xF
/* 6488 800E5C88 040002A6 */  sh         $v0, 0x4($s0)
/* 648C 800E5C8C 80000234 */  ori        $v0, $zero, 0x80
/* 6490 800E5C90 020002A6 */  sh         $v0, 0x2($s0)
/* 6494 800E5C94 2110D202 */  addu       $v0, $s6, $s2
/* 6498 800E5C98 FAFF02A6 */  sh         $v0, -0x6($s0)
/* 649C 800E5C9C FCFF17A6 */  sh         $s7, -0x4($s0)
/* 64A0 800E5CA0 F6FF13A2 */  sb         $s3, -0xA($s0)
/* 64A4 800E5CA4 F7FF13A2 */  sb         $s3, -0x9($s0)
/* 64A8 800E5CA8 F8FF13A2 */  sb         $s3, -0x8($s0)
/* 64AC 800E5CAC 02006334 */  ori        $v1, $v1, 0x2
/* 64B0 800E5CB0 F9FF03A2 */  sb         $v1, -0x7($s0)
/* 64B4 800E5CB4 04008396 */  lhu        $v1, 0x4($s4)
/* 64B8 800E5CB8 0000828E */  lw         $v0, 0x0($s4)
/* 64BC 800E5CBC 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 64C0 800E5CC0 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 64C4 800E5CC4 80190300 */  sll        $v1, $v1, 6
/* 64C8 800E5CC8 03110200 */  sra        $v0, $v0, 4
/* 64CC 800E5CCC 3F004230 */  andi       $v0, $v0, 0x3F
/* 64D0 800E5CD0 25186200 */  or         $v1, $v1, $v0
/* 64D4 800E5CD4 000003A6 */  sh         $v1, 0x0($s0)
/* 64D8 800E5CD8 21209500 */  addu       $a0, $a0, $s5
/* 64DC 800E5CDC 00000000 */  nop
/* 64E0 800E5CE0 02008288 */  lwl        $v0, 0x2($a0)
/* 64E4 800E5CE4 001A1100 */  sll        $v1, $s1, 8
/* 64E8 800E5CE8 020022AA */  swl        $v0, 0x2($s1)
/* 64EC 800E5CEC 020083A8 */  swl        $v1, 0x2($a0)
/* 64F0 800E5CF0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 64F4 800E5CF4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 64F8 800E5CF8 00000000 */  nop
/* 64FC 800E5CFC 4006428C */  lw         $v0, 0x640($v0)
/* 6500 800E5D00 14001026 */  addiu      $s0, $s0, 0x14
/* 6504 800E5D04 09F84000 */  jalr       $v0
/* 6508 800E5D08 14003126 */   addiu     $s1, $s1, 0x14
/* 650C 800E5D0C 0C004010 */  beqz       $v0, .L800E5D40
/* 6510 800E5D10 C21F1200 */   srl       $v1, $s2, 31
/* 6514 800E5D14 21184302 */  addu       $v1, $s2, $v1
/* 6518 800E5D18 0C00828E */  lw         $v0, 0xC($s4)
/* 651C 800E5D1C 43180300 */  sra        $v1, $v1, 1
/* 6520 800E5D20 0800848E */  lw         $a0, 0x8($s4)
/* 6524 800E5D24 00034230 */  andi       $v0, $v0, 0x300
/* 6528 800E5D28 C3100200 */  sra        $v0, $v0, 3
/* 652C 800E5D2C 21186400 */  addu       $v1, $v1, $a0
/* 6530 800E5D30 FF036330 */  andi       $v1, $v1, 0x3FF
/* 6534 800E5D34 83190300 */  sra        $v1, $v1, 6
/* 6538 800E5D38 5A970308 */  j          .L800E5D68
/* 653C 800E5D3C 00026334 */   ori       $v1, $v1, 0x200
.L800E5D40:
/* 6540 800E5D40 21184302 */  addu       $v1, $s2, $v1
/* 6544 800E5D44 0C00828E */  lw         $v0, 0xC($s4)
/* 6548 800E5D48 43180300 */  sra        $v1, $v1, 1
/* 654C 800E5D4C 0800848E */  lw         $a0, 0x8($s4)
/* 6550 800E5D50 00014230 */  andi       $v0, $v0, 0x100
/* 6554 800E5D54 03110200 */  sra        $v0, $v0, 4
/* 6558 800E5D58 21186400 */  addu       $v1, $v1, $a0
/* 655C 800E5D5C FF036330 */  andi       $v1, $v1, 0x3FF
/* 6560 800E5D60 83190300 */  sra        $v1, $v1, 6
/* 6564 800E5D64 80006334 */  ori        $v1, $v1, 0x80
.L800E5D68:
/* 6568 800E5D68 25384300 */  or         $a3, $v0, $v1
/* 656C 800E5D6C 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 6570 800E5D70 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 6574 800E5D74 1000A2AF */  sw         $v0, 0x10($sp)
/* 6578 800E5D78 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 657C 800E5D7C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6580 800E5D80 21202002 */  addu       $a0, $s1, $zero
/* 6584 800E5D84 3406428C */  lw         $v0, 0x634($v0)
/* 6588 800E5D88 21280000 */  addu       $a1, $zero, $zero
/* 658C 800E5D8C 09F84000 */  jalr       $v0
/* 6590 800E5D90 21300000 */   addu      $a2, $zero, $zero
/* 6594 800E5D94 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6598 800E5D98 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 659C 800E5D9C 00000000 */  nop
/* 65A0 800E5DA0 21209500 */  addu       $a0, $a0, $s5
/* 65A4 800E5DA4 00000000 */  nop
/* 65A8 800E5DA8 02008288 */  lwl        $v0, 0x2($a0)
/* 65AC 800E5DAC 001A1100 */  sll        $v1, $s1, 8
/* 65B0 800E5DB0 020022AA */  swl        $v0, 0x2($s1)
/* 65B4 800E5DB4 020083A8 */  swl        $v1, 0x2($a0)
/* 65B8 800E5DB8 0C001026 */  addiu      $s0, $s0, 0xC
/* 65BC 800E5DBC 80005226 */  addiu      $s2, $s2, 0x80
/* 65C0 800E5DC0 0001422A */  slti       $v0, $s2, 0x100
/* 65C4 800E5DC4 A7FF4014 */  bnez       $v0, .L800E5C64
/* 65C8 800E5DC8 0C003126 */   addiu     $s1, $s1, 0xC
/* 65CC 800E5DCC 64000234 */  ori        $v0, $zero, 0x64
/* 65D0 800E5DD0 070022A2 */  sb         $v0, 0x7($s1)
/* 65D4 800E5DD4 04000234 */  ori        $v0, $zero, 0x4
/* 65D8 800E5DD8 030022A2 */  sb         $v0, 0x3($s1)
/* 65DC 800E5DDC 0C0020A2 */  sb         $zero, 0xC($s1)
/* 65E0 800E5DE0 D3000234 */  ori        $v0, $zero, 0xD3
/* 65E4 800E5DE4 0D0022A2 */  sb         $v0, 0xD($s1)
/* 65E8 800E5DE8 0F000234 */  ori        $v0, $zero, 0xF
/* 65EC 800E5DEC 120022A6 */  sh         $v0, 0x12($s1)
/* 65F0 800E5DF0 40000234 */  ori        $v0, $zero, 0x40
/* 65F4 800E5DF4 100022A6 */  sh         $v0, 0x10($s1)
/* 65F8 800E5DF8 0001C226 */  addiu      $v0, $s6, 0x100
/* 65FC 800E5DFC 080022A6 */  sh         $v0, 0x8($s1)
/* 6600 800E5E00 0A0037A6 */  sh         $s7, 0xA($s1)
/* 6604 800E5E04 040033A2 */  sb         $s3, 0x4($s1)
/* 6608 800E5E08 050033A2 */  sb         $s3, 0x5($s1)
/* 660C 800E5E0C 060033A2 */  sb         $s3, 0x6($s1)
/* 6610 800E5E10 07002392 */  lbu        $v1, 0x7($s1)
/* 6614 800E5E14 0500053C */  lui        $a1, (0x52C14 >> 16)
/* 6618 800E5E18 142CA534 */  ori        $a1, $a1, (0x52C14 & 0xFFFF)
/* 661C 800E5E1C 02006334 */  ori        $v1, $v1, 0x2
/* 6620 800E5E20 070023A2 */  sb         $v1, 0x7($s1)
/* 6624 800E5E24 04008396 */  lhu        $v1, 0x4($s4)
/* 6628 800E5E28 0000828E */  lw         $v0, 0x0($s4)
/* 662C 800E5E2C 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6630 800E5E30 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6634 800E5E34 80190300 */  sll        $v1, $v1, 6
/* 6638 800E5E38 03110200 */  sra        $v0, $v0, 4
/* 663C 800E5E3C 3F004230 */  andi       $v0, $v0, 0x3F
/* 6640 800E5E40 25186200 */  or         $v1, $v1, $v0
/* 6644 800E5E44 0E0023A6 */  sh         $v1, 0xE($s1)
/* 6648 800E5E48 21208500 */  addu       $a0, $a0, $a1
/* 664C 800E5E4C 00000000 */  nop
/* 6650 800E5E50 02008288 */  lwl        $v0, 0x2($a0)
/* 6654 800E5E54 001A1100 */  sll        $v1, $s1, 8
/* 6658 800E5E58 020022AA */  swl        $v0, 0x2($s1)
/* 665C 800E5E5C 020083A8 */  swl        $v1, 0x2($a0)
/* 6660 800E5E60 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6664 800E5E64 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6668 800E5E68 00000000 */  nop
/* 666C 800E5E6C 4006428C */  lw         $v0, 0x640($v0)
/* 6670 800E5E70 00000000 */  nop
/* 6674 800E5E74 09F84000 */  jalr       $v0
/* 6678 800E5E78 14003126 */   addiu     $s1, $s1, 0x14
/* 667C 800E5E7C 0A004010 */  beqz       $v0, .L800E5EA8
/* 6680 800E5E80 00000000 */   nop
/* 6684 800E5E84 0C00838E */  lw         $v1, 0xC($s4)
/* 6688 800E5E88 0800828E */  lw         $v0, 0x8($s4)
/* 668C 800E5E8C 00036330 */  andi       $v1, $v1, 0x300
/* 6690 800E5E90 C3180300 */  sra        $v1, $v1, 3
/* 6694 800E5E94 80004224 */  addiu      $v0, $v0, 0x80
/* 6698 800E5E98 FF034230 */  andi       $v0, $v0, 0x3FF
/* 669C 800E5E9C 83110200 */  sra        $v0, $v0, 6
/* 66A0 800E5EA0 B2970308 */  j          .L800E5EC8
/* 66A4 800E5EA4 00024234 */   ori       $v0, $v0, 0x200
.L800E5EA8:
/* 66A8 800E5EA8 0C00838E */  lw         $v1, 0xC($s4)
/* 66AC 800E5EAC 0800828E */  lw         $v0, 0x8($s4)
/* 66B0 800E5EB0 00016330 */  andi       $v1, $v1, 0x100
/* 66B4 800E5EB4 03190300 */  sra        $v1, $v1, 4
/* 66B8 800E5EB8 80004224 */  addiu      $v0, $v0, 0x80
/* 66BC 800E5EBC FF034230 */  andi       $v0, $v0, 0x3FF
/* 66C0 800E5EC0 83110200 */  sra        $v0, $v0, 6
/* 66C4 800E5EC4 80004234 */  ori        $v0, $v0, 0x80
.L800E5EC8:
/* 66C8 800E5EC8 25386200 */  or         $a3, $v1, $v0
/* 66CC 800E5ECC 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 66D0 800E5ED0 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 66D4 800E5ED4 1000A2AF */  sw         $v0, 0x10($sp)
/* 66D8 800E5ED8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 66DC 800E5EDC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 66E0 800E5EE0 21202002 */  addu       $a0, $s1, $zero
/* 66E4 800E5EE4 3406428C */  lw         $v0, 0x634($v0)
/* 66E8 800E5EE8 21280000 */  addu       $a1, $zero, $zero
/* 66EC 800E5EEC 09F84000 */  jalr       $v0
/* 66F0 800E5EF0 21300000 */   addu      $a2, $zero, $zero
/* 66F4 800E5EF4 0F80053C */  lui        $a1, %hi(D_800F4ED0)
/* 66F8 800E5EF8 D04EA58C */  lw         $a1, %lo(D_800F4ED0)($a1)
/* 66FC 800E5EFC 0500043C */  lui        $a0, (0x52C14 >> 16)
/* 6700 800E5F00 142C8434 */  ori        $a0, $a0, (0x52C14 & 0xFFFF)
/* 6704 800E5F04 2120A400 */  addu       $a0, $a1, $a0
/* 6708 800E5F08 00000000 */  nop
/* 670C 800E5F0C 02008288 */  lwl        $v0, 0x2($a0)
/* 6710 800E5F10 001A1100 */  sll        $v1, $s1, 8
/* 6714 800E5F14 020022AA */  swl        $v0, 0x2($s1)
/* 6718 800E5F18 020083A8 */  swl        $v1, 0x2($a0)
/* 671C 800E5F1C 0C003126 */  addiu      $s1, $s1, 0xC
/* 6720 800E5F20 0500023C */  lui        $v0, (0x52C20 >> 16)
/* 6724 800E5F24 2128A200 */  addu       $a1, $a1, $v0
/* 6728 800E5F28 202CB1AC */  sw         $s1, (0x52C20 & 0xFFFF)($a1)
/* 672C 800E5F2C 3800BF8F */  lw         $ra, 0x38($sp)
/* 6730 800E5F30 3400B78F */  lw         $s7, 0x34($sp)
/* 6734 800E5F34 3000B68F */  lw         $s6, 0x30($sp)
/* 6738 800E5F38 2C00B58F */  lw         $s5, 0x2C($sp)
/* 673C 800E5F3C 2800B48F */  lw         $s4, 0x28($sp)
/* 6740 800E5F40 2400B38F */  lw         $s3, 0x24($sp)
/* 6744 800E5F44 2000B28F */  lw         $s2, 0x20($sp)
/* 6748 800E5F48 1C00B18F */  lw         $s1, 0x1C($sp)
/* 674C 800E5F4C 1800B08F */  lw         $s0, 0x18($sp)
/* 6750 800E5F50 0800E003 */  jr         $ra
/* 6754 800E5F54 4000BD27 */   addiu     $sp, $sp, 0x40
glabel func_800E5F58
/* 6758 800E5F58 1A80023C */  lui        $v0, %hi(D_801A0FF0)
/* 675C 800E5F5C F00F4290 */  lbu        $v0, %lo(D_801A0FF0)($v0)
/* 6760 800E5F60 00000000 */  nop
/* 6764 800E5F64 18004700 */  mult       $v0, $a3
/* 6768 800E5F68 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 676C 800E5F6C D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 6770 800E5F70 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6774 800E5F74 3C00BFAF */  sw         $ra, 0x3C($sp)
/* 6778 800E5F78 3800BEAF */  sw         $fp, 0x38($sp)
/* 677C 800E5F7C 3400B7AF */  sw         $s7, 0x34($sp)
/* 6780 800E5F80 3000B6AF */  sw         $s6, 0x30($sp)
/* 6784 800E5F84 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 6788 800E5F88 2800B4AF */  sw         $s4, 0x28($sp)
/* 678C 800E5F8C 2400B3AF */  sw         $s3, 0x24($sp)
/* 6790 800E5F90 2000B2AF */  sw         $s2, 0x20($sp)
/* 6794 800E5F94 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6798 800E5F98 1800B0AF */  sw         $s0, 0x18($sp)
/* 679C 800E5F9C 0500033C */  lui        $v1, (0x52C20 >> 16)
/* 67A0 800E5FA0 21104300 */  addu       $v0, $v0, $v1
/* 67A4 800E5FA4 202C518C */  lw         $s1, (0x52C20 & 0xFFFF)($v0)
/* 67A8 800E5FA8 21B88000 */  addu       $s7, $a0, $zero
/* 67AC 800E5FAC 21B0A000 */  addu       $s6, $a1, $zero
/* 67B0 800E5FB0 12100000 */  mflo       $v0
/* 67B4 800E5FB4 00000000 */  nop
/* 67B8 800E5FB8 0F80143C */  lui        $s4, %hi(D_800EB9B4)
/* 67BC 800E5FBC B4B99426 */  addiu      $s4, $s4, %lo(D_800EB9B4)
/* 67C0 800E5FC0 02004104 */  bgez       $v0, .L800E5FCC
/* 67C4 800E5FC4 21F0C000 */   addu      $fp, $a2, $zero
/* 67C8 800E5FC8 7F004224 */  addiu      $v0, $v0, 0x7F
.L800E5FCC:
/* 67CC 800E5FCC C2990200 */  srl        $s3, $v0, 7
/* 67D0 800E5FD0 21900000 */  addu       $s2, $zero, $zero
/* 67D4 800E5FD4 21A8DE02 */  addu       $s5, $s6, $fp
/* 67D8 800E5FD8 0E003026 */  addiu      $s0, $s1, 0xE
.L800E5FDC:
/* 67DC 800E5FDC 09000234 */  ori        $v0, $zero, 0x9
/* 67E0 800E5FE0 F5FF02A2 */  sb         $v0, -0xB($s0)
/* 67E4 800E5FE4 2C000234 */  ori        $v0, $zero, 0x2C
/* 67E8 800E5FE8 F9FF02A2 */  sb         $v0, -0x7($s0)
/* 67EC 800E5FEC 0E0000A2 */  sb         $zero, 0xE($s0)
/* 67F0 800E5FF0 FEFF00A2 */  sb         $zero, -0x2($s0)
/* 67F4 800E5FF4 80000234 */  ori        $v0, $zero, 0x80
/* 67F8 800E5FF8 160002A2 */  sb         $v0, 0x16($s0)
/* 67FC 800E5FFC 060002A2 */  sb         $v0, 0x6($s0)
/* 6800 800E6000 070000A2 */  sb         $zero, 0x7($s0)
/* 6804 800E6004 FFFF00A2 */  sb         $zero, -0x1($s0)
/* 6808 800E6008 8D000234 */  ori        $v0, $zero, 0x8D
/* 680C 800E600C 170002A2 */  sb         $v0, 0x17($s0)
/* 6810 800E6010 0F0002A2 */  sb         $v0, 0xF($s0)
/* 6814 800E6014 F6FF13A2 */  sb         $s3, -0xA($s0)
/* 6818 800E6018 F7FF13A2 */  sb         $s3, -0x9($s0)
/* 681C 800E601C F8FF13A2 */  sb         $s3, -0x8($s0)
/* 6820 800E6020 0E80043C */  lui        $a0, %hi(D_800E7FA0)
/* 6824 800E6024 A07F848C */  lw         $a0, %lo(D_800E7FA0)($a0)
/* 6828 800E6028 2110F202 */  addu       $v0, $s7, $s2
/* 682C 800E602C 21184000 */  addu       $v1, $v0, $zero
/* 6830 800E6030 0A0003A6 */  sh         $v1, 0xA($s0)
/* 6834 800E6034 FAFF03A6 */  sh         $v1, -0x6($s0)
/* 6838 800E6038 80004224 */  addiu      $v0, $v0, 0x80
/* 683C 800E603C 120002A6 */  sh         $v0, 0x12($s0)
/* 6840 800E6040 020002A6 */  sh         $v0, 0x2($s0)
/* 6844 800E6044 2110C002 */  addu       $v0, $s6, $zero
/* 6848 800E6048 040002A6 */  sh         $v0, 0x4($s0)
/* 684C 800E604C FCFF02A6 */  sh         $v0, -0x4($s0)
/* 6850 800E6050 140015A6 */  sh         $s5, 0x14($s0)
/* 6854 800E6054 0C0015A6 */  sh         $s5, 0xC($s0)
/* 6858 800E6058 4006828C */  lw         $v0, 0x640($a0)
/* 685C 800E605C 00000000 */  nop
/* 6860 800E6060 09F84000 */  jalr       $v0
/* 6864 800E6064 00000000 */   nop
/* 6868 800E6068 0C004010 */  beqz       $v0, .L800E609C
/* 686C 800E606C C21F1200 */   srl       $v1, $s2, 31
/* 6870 800E6070 21184302 */  addu       $v1, $s2, $v1
/* 6874 800E6074 0C00828E */  lw         $v0, 0xC($s4)
/* 6878 800E6078 43180300 */  sra        $v1, $v1, 1
/* 687C 800E607C 0800848E */  lw         $a0, 0x8($s4)
/* 6880 800E6080 00034230 */  andi       $v0, $v0, 0x300
/* 6884 800E6084 C3100200 */  sra        $v0, $v0, 3
/* 6888 800E6088 21186400 */  addu       $v1, $v1, $a0
/* 688C 800E608C FF036330 */  andi       $v1, $v1, 0x3FF
/* 6890 800E6090 83190300 */  sra        $v1, $v1, 6
/* 6894 800E6094 31980308 */  j          .L800E60C4
/* 6898 800E6098 00026334 */   ori       $v1, $v1, 0x200
.L800E609C:
/* 689C 800E609C 21184302 */  addu       $v1, $s2, $v1
/* 68A0 800E60A0 0C00828E */  lw         $v0, 0xC($s4)
/* 68A4 800E60A4 43180300 */  sra        $v1, $v1, 1
/* 68A8 800E60A8 0800848E */  lw         $a0, 0x8($s4)
/* 68AC 800E60AC 00014230 */  andi       $v0, $v0, 0x100
/* 68B0 800E60B0 03110200 */  sra        $v0, $v0, 4
/* 68B4 800E60B4 21186400 */  addu       $v1, $v1, $a0
/* 68B8 800E60B8 FF036330 */  andi       $v1, $v1, 0x3FF
/* 68BC 800E60BC 83190300 */  sra        $v1, $v1, 6
/* 68C0 800E60C0 80006334 */  ori        $v1, $v1, 0x80
.L800E60C4:
/* 68C4 800E60C4 25104300 */  or         $v0, $v0, $v1
/* 68C8 800E60C8 080002A6 */  sh         $v0, 0x8($s0)
/* 68CC 800E60CC 0500053C */  lui        $a1, (0x52C14 >> 16)
/* 68D0 800E60D0 142CA534 */  ori        $a1, $a1, (0x52C14 & 0xFFFF)
/* 68D4 800E60D4 04008396 */  lhu        $v1, 0x4($s4)
/* 68D8 800E60D8 0000828E */  lw         $v0, 0x0($s4)
/* 68DC 800E60DC 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 68E0 800E60E0 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 68E4 800E60E4 80190300 */  sll        $v1, $v1, 6
/* 68E8 800E60E8 03110200 */  sra        $v0, $v0, 4
/* 68EC 800E60EC 3F004230 */  andi       $v0, $v0, 0x3F
/* 68F0 800E60F0 25186200 */  or         $v1, $v1, $v0
/* 68F4 800E60F4 000003A6 */  sh         $v1, 0x0($s0)
/* 68F8 800E60F8 21208500 */  addu       $a0, $a0, $a1
/* 68FC 800E60FC 00000000 */  nop
/* 6900 800E6100 02008288 */  lwl        $v0, 0x2($a0)
/* 6904 800E6104 001A1100 */  sll        $v1, $s1, 8
/* 6908 800E6108 020022AA */  swl        $v0, 0x2($s1)
/* 690C 800E610C 020083A8 */  swl        $v1, 0x2($a0)
/* 6910 800E6110 28001026 */  addiu      $s0, $s0, 0x28
/* 6914 800E6114 80005226 */  addiu      $s2, $s2, 0x80
/* 6918 800E6118 0001422A */  slti       $v0, $s2, 0x100
/* 691C 800E611C AFFF4014 */  bnez       $v0, .L800E5FDC
/* 6920 800E6120 28003126 */   addiu     $s1, $s1, 0x28
/* 6924 800E6124 09000234 */  ori        $v0, $zero, 0x9
/* 6928 800E6128 030022A2 */  sb         $v0, 0x3($s1)
/* 692C 800E612C 2C000234 */  ori        $v0, $zero, 0x2C
/* 6930 800E6130 070022A2 */  sb         $v0, 0x7($s1)
/* 6934 800E6134 1C0020A2 */  sb         $zero, 0x1C($s1)
/* 6938 800E6138 0C0020A2 */  sb         $zero, 0xC($s1)
/* 693C 800E613C 40000234 */  ori        $v0, $zero, 0x40
/* 6940 800E6140 240022A2 */  sb         $v0, 0x24($s1)
/* 6944 800E6144 140022A2 */  sb         $v0, 0x14($s1)
/* 6948 800E6148 150020A2 */  sb         $zero, 0x15($s1)
/* 694C 800E614C 0D0020A2 */  sb         $zero, 0xD($s1)
/* 6950 800E6150 8D000234 */  ori        $v0, $zero, 0x8D
/* 6954 800E6154 250022A2 */  sb         $v0, 0x25($s1)
/* 6958 800E6158 1D0022A2 */  sb         $v0, 0x1D($s1)
/* 695C 800E615C 040033A2 */  sb         $s3, 0x4($s1)
/* 6960 800E6160 050033A2 */  sb         $s3, 0x5($s1)
/* 6964 800E6164 060033A2 */  sb         $s3, 0x6($s1)
/* 6968 800E6168 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 696C 800E616C A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 6970 800E6170 0001E226 */  addiu      $v0, $s7, 0x100
/* 6974 800E6174 180022A6 */  sh         $v0, 0x18($s1)
/* 6978 800E6178 080022A6 */  sh         $v0, 0x8($s1)
/* 697C 800E617C 4001E226 */  addiu      $v0, $s7, 0x140
/* 6980 800E6180 200022A6 */  sh         $v0, 0x20($s1)
/* 6984 800E6184 100022A6 */  sh         $v0, 0x10($s1)
/* 6988 800E6188 2110C002 */  addu       $v0, $s6, $zero
/* 698C 800E618C 120022A6 */  sh         $v0, 0x12($s1)
/* 6990 800E6190 0A0022A6 */  sh         $v0, 0xA($s1)
/* 6994 800E6194 2110DE02 */  addu       $v0, $s6, $fp
/* 6998 800E6198 220022A6 */  sh         $v0, 0x22($s1)
/* 699C 800E619C 1A0022A6 */  sh         $v0, 0x1A($s1)
/* 69A0 800E61A0 4006628C */  lw         $v0, 0x640($v1)
/* 69A4 800E61A4 00000000 */  nop
/* 69A8 800E61A8 09F84000 */  jalr       $v0
/* 69AC 800E61AC 00000000 */   nop
/* 69B0 800E61B0 0A004010 */  beqz       $v0, .L800E61DC
/* 69B4 800E61B4 00000000 */   nop
/* 69B8 800E61B8 0C00838E */  lw         $v1, 0xC($s4)
/* 69BC 800E61BC 0800828E */  lw         $v0, 0x8($s4)
/* 69C0 800E61C0 00036330 */  andi       $v1, $v1, 0x300
/* 69C4 800E61C4 C3180300 */  sra        $v1, $v1, 3
/* 69C8 800E61C8 80004224 */  addiu      $v0, $v0, 0x80
/* 69CC 800E61CC FF034230 */  andi       $v0, $v0, 0x3FF
/* 69D0 800E61D0 83110200 */  sra        $v0, $v0, 6
/* 69D4 800E61D4 7F980308 */  j          .L800E61FC
/* 69D8 800E61D8 00024234 */   ori       $v0, $v0, 0x200
.L800E61DC:
/* 69DC 800E61DC 0C00838E */  lw         $v1, 0xC($s4)
/* 69E0 800E61E0 0800828E */  lw         $v0, 0x8($s4)
/* 69E4 800E61E4 00016330 */  andi       $v1, $v1, 0x100
/* 69E8 800E61E8 03190300 */  sra        $v1, $v1, 4
/* 69EC 800E61EC 80004224 */  addiu      $v0, $v0, 0x80
/* 69F0 800E61F0 FF034230 */  andi       $v0, $v0, 0x3FF
/* 69F4 800E61F4 83110200 */  sra        $v0, $v0, 6
/* 69F8 800E61F8 80004234 */  ori        $v0, $v0, 0x80
.L800E61FC:
/* 69FC 800E61FC 25186200 */  or         $v1, $v1, $v0
/* 6A00 800E6200 160023A6 */  sh         $v1, 0x16($s1)
/* 6A04 800E6204 0500103C */  lui        $s0, (0x52C14 >> 16)
/* 6A08 800E6208 142C1036 */  ori        $s0, $s0, (0x52C14 & 0xFFFF)
/* 6A0C 800E620C 04008396 */  lhu        $v1, 0x4($s4)
/* 6A10 800E6210 0000828E */  lw         $v0, 0x0($s4)
/* 6A14 800E6214 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6A18 800E6218 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6A1C 800E621C 80190300 */  sll        $v1, $v1, 6
/* 6A20 800E6220 03110200 */  sra        $v0, $v0, 4
/* 6A24 800E6224 3F004230 */  andi       $v0, $v0, 0x3F
/* 6A28 800E6228 25186200 */  or         $v1, $v1, $v0
/* 6A2C 800E622C 0E0023A6 */  sh         $v1, 0xE($s1)
/* 6A30 800E6230 21209000 */  addu       $a0, $a0, $s0
/* 6A34 800E6234 00000000 */  nop
/* 6A38 800E6238 02008288 */  lwl        $v0, 0x2($a0)
/* 6A3C 800E623C 001A1100 */  sll        $v1, $s1, 8
/* 6A40 800E6240 020022AA */  swl        $v0, 0x2($s1)
/* 6A44 800E6244 020083A8 */  swl        $v1, 0x2($a0)
/* 6A48 800E6248 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6A4C 800E624C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6A50 800E6250 00000000 */  nop
/* 6A54 800E6254 4006428C */  lw         $v0, 0x640($v0)
/* 6A58 800E6258 00000000 */  nop
/* 6A5C 800E625C 09F84000 */  jalr       $v0
/* 6A60 800E6260 28003126 */   addiu     $s1, $s1, 0x28
/* 6A64 800E6264 02004010 */  beqz       $v0, .L800E6270
/* 6A68 800E6268 C0000734 */   ori       $a3, $zero, 0xC0
/* 6A6C 800E626C 00030734 */  ori        $a3, $zero, 0x300
.L800E6270:
/* 6A70 800E6270 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 6A74 800E6274 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 6A78 800E6278 1000A2AF */  sw         $v0, 0x10($sp)
/* 6A7C 800E627C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6A80 800E6280 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6A84 800E6284 21202002 */  addu       $a0, $s1, $zero
/* 6A88 800E6288 3406428C */  lw         $v0, 0x634($v0)
/* 6A8C 800E628C 21280000 */  addu       $a1, $zero, $zero
/* 6A90 800E6290 09F84000 */  jalr       $v0
/* 6A94 800E6294 21300000 */   addu      $a2, $zero, $zero
/* 6A98 800E6298 0F80053C */  lui        $a1, %hi(D_800F4ED0)
/* 6A9C 800E629C D04EA58C */  lw         $a1, %lo(D_800F4ED0)($a1)
/* 6AA0 800E62A0 00000000 */  nop
/* 6AA4 800E62A4 2120B000 */  addu       $a0, $a1, $s0
/* 6AA8 800E62A8 00000000 */  nop
/* 6AAC 800E62AC 02008288 */  lwl        $v0, 0x2($a0)
/* 6AB0 800E62B0 001A1100 */  sll        $v1, $s1, 8
/* 6AB4 800E62B4 020022AA */  swl        $v0, 0x2($s1)
/* 6AB8 800E62B8 020083A8 */  swl        $v1, 0x2($a0)
/* 6ABC 800E62BC 0C003126 */  addiu      $s1, $s1, 0xC
/* 6AC0 800E62C0 0500023C */  lui        $v0, (0x52C20 >> 16)
/* 6AC4 800E62C4 2128A200 */  addu       $a1, $a1, $v0
/* 6AC8 800E62C8 202CB1AC */  sw         $s1, (0x52C20 & 0xFFFF)($a1)
/* 6ACC 800E62CC 01000234 */  ori        $v0, $zero, 0x1
/* 6AD0 800E62D0 3C00BF8F */  lw         $ra, 0x3C($sp)
/* 6AD4 800E62D4 3800BE8F */  lw         $fp, 0x38($sp)
/* 6AD8 800E62D8 3400B78F */  lw         $s7, 0x34($sp)
/* 6ADC 800E62DC 3000B68F */  lw         $s6, 0x30($sp)
/* 6AE0 800E62E0 2C00B58F */  lw         $s5, 0x2C($sp)
/* 6AE4 800E62E4 2800B48F */  lw         $s4, 0x28($sp)
/* 6AE8 800E62E8 2400B38F */  lw         $s3, 0x24($sp)
/* 6AEC 800E62EC 2000B28F */  lw         $s2, 0x20($sp)
/* 6AF0 800E62F0 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6AF4 800E62F4 1800B08F */  lw         $s0, 0x18($sp)
/* 6AF8 800E62F8 0800E003 */  jr         $ra
/* 6AFC 800E62FC 4000BD27 */   addiu     $sp, $sp, 0x40
glabel func_800E6300
/* 6B00 800E6300 1A80023C */  lui        $v0, %hi(D_801A0FF0)
/* 6B04 800E6304 F00F4290 */  lbu        $v0, %lo(D_801A0FF0)($v0)
/* 6B08 800E6308 00000000 */  nop
/* 6B0C 800E630C 18004700 */  mult       $v0, $a3
/* 6B10 800E6310 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 6B14 800E6314 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 6B18 800E6318 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 6B1C 800E631C 3800BFAF */  sw         $ra, 0x38($sp)
/* 6B20 800E6320 3400B7AF */  sw         $s7, 0x34($sp)
/* 6B24 800E6324 3000B6AF */  sw         $s6, 0x30($sp)
/* 6B28 800E6328 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 6B2C 800E632C 2800B4AF */  sw         $s4, 0x28($sp)
/* 6B30 800E6330 2400B3AF */  sw         $s3, 0x24($sp)
/* 6B34 800E6334 2000B2AF */  sw         $s2, 0x20($sp)
/* 6B38 800E6338 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 6B3C 800E633C 1800B0AF */  sw         $s0, 0x18($sp)
/* 6B40 800E6340 0500033C */  lui        $v1, (0x52C20 >> 16)
/* 6B44 800E6344 21104300 */  addu       $v0, $v0, $v1
/* 6B48 800E6348 202C518C */  lw         $s1, (0x52C20 & 0xFFFF)($v0)
/* 6B4C 800E634C 21B08000 */  addu       $s6, $a0, $zero
/* 6B50 800E6350 12100000 */  mflo       $v0
/* 6B54 800E6354 00000000 */  nop
/* 6B58 800E6358 0F80133C */  lui        $s3, %hi(D_800EB9B4)
/* 6B5C 800E635C B4B97326 */  addiu      $s3, $s3, %lo(D_800EB9B4)
/* 6B60 800E6360 02004104 */  bgez       $v0, .L800E636C
/* 6B64 800E6364 21B8A000 */   addu      $s7, $a1, $zero
/* 6B68 800E6368 7F004224 */  addiu      $v0, $v0, 0x7F
.L800E636C:
/* 6B6C 800E636C C2A10200 */  srl        $s4, $v0, 7
/* 6B70 800E6370 21900000 */  addu       $s2, $zero, $zero
/* 6B74 800E6374 0500153C */  lui        $s5, (0x52C14 >> 16)
/* 6B78 800E6378 142CB536 */  ori        $s5, $s5, (0x52C14 & 0xFFFF)
/* 6B7C 800E637C 0E003026 */  addiu      $s0, $s1, 0xE
.L800E6380:
/* 6B80 800E6380 04000234 */  ori        $v0, $zero, 0x4
/* 6B84 800E6384 F5FF02A2 */  sb         $v0, -0xB($s0)
/* 6B88 800E6388 64000234 */  ori        $v0, $zero, 0x64
/* 6B8C 800E638C F9FF02A2 */  sb         $v0, -0x7($s0)
/* 6B90 800E6390 FEFF00A2 */  sb         $zero, -0x2($s0)
/* 6B94 800E6394 FFFF00A2 */  sb         $zero, -0x1($s0)
/* 6B98 800E6398 8D000234 */  ori        $v0, $zero, 0x8D
/* 6B9C 800E639C 040002A6 */  sh         $v0, 0x4($s0)
/* 6BA0 800E63A0 80000234 */  ori        $v0, $zero, 0x80
/* 6BA4 800E63A4 020002A6 */  sh         $v0, 0x2($s0)
/* 6BA8 800E63A8 2110D202 */  addu       $v0, $s6, $s2
/* 6BAC 800E63AC FAFF02A6 */  sh         $v0, -0x6($s0)
/* 6BB0 800E63B0 FCFF17A6 */  sh         $s7, -0x4($s0)
/* 6BB4 800E63B4 F6FF14A2 */  sb         $s4, -0xA($s0)
/* 6BB8 800E63B8 F7FF14A2 */  sb         $s4, -0x9($s0)
/* 6BBC 800E63BC F8FF14A2 */  sb         $s4, -0x8($s0)
/* 6BC0 800E63C0 04006396 */  lhu        $v1, 0x4($s3)
/* 6BC4 800E63C4 0000628E */  lw         $v0, 0x0($s3)
/* 6BC8 800E63C8 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6BCC 800E63CC D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6BD0 800E63D0 80190300 */  sll        $v1, $v1, 6
/* 6BD4 800E63D4 03110200 */  sra        $v0, $v0, 4
/* 6BD8 800E63D8 3F004230 */  andi       $v0, $v0, 0x3F
/* 6BDC 800E63DC 25186200 */  or         $v1, $v1, $v0
/* 6BE0 800E63E0 000003A6 */  sh         $v1, 0x0($s0)
/* 6BE4 800E63E4 21209500 */  addu       $a0, $a0, $s5
/* 6BE8 800E63E8 00000000 */  nop
/* 6BEC 800E63EC 02008288 */  lwl        $v0, 0x2($a0)
/* 6BF0 800E63F0 001A1100 */  sll        $v1, $s1, 8
/* 6BF4 800E63F4 020022AA */  swl        $v0, 0x2($s1)
/* 6BF8 800E63F8 020083A8 */  swl        $v1, 0x2($a0)
/* 6BFC 800E63FC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6C00 800E6400 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6C04 800E6404 00000000 */  nop
/* 6C08 800E6408 4006428C */  lw         $v0, 0x640($v0)
/* 6C0C 800E640C 14001026 */  addiu      $s0, $s0, 0x14
/* 6C10 800E6410 09F84000 */  jalr       $v0
/* 6C14 800E6414 14003126 */   addiu     $s1, $s1, 0x14
/* 6C18 800E6418 0C004010 */  beqz       $v0, .L800E644C
/* 6C1C 800E641C C21F1200 */   srl       $v1, $s2, 31
/* 6C20 800E6420 21184302 */  addu       $v1, $s2, $v1
/* 6C24 800E6424 0C00628E */  lw         $v0, 0xC($s3)
/* 6C28 800E6428 43180300 */  sra        $v1, $v1, 1
/* 6C2C 800E642C 0800648E */  lw         $a0, 0x8($s3)
/* 6C30 800E6430 00034230 */  andi       $v0, $v0, 0x300
/* 6C34 800E6434 C3100200 */  sra        $v0, $v0, 3
/* 6C38 800E6438 21186400 */  addu       $v1, $v1, $a0
/* 6C3C 800E643C FF036330 */  andi       $v1, $v1, 0x3FF
/* 6C40 800E6440 83190300 */  sra        $v1, $v1, 6
/* 6C44 800E6444 1D990308 */  j          .L800E6474
/* 6C48 800E6448 00026334 */   ori       $v1, $v1, 0x200
.L800E644C:
/* 6C4C 800E644C 21184302 */  addu       $v1, $s2, $v1
/* 6C50 800E6450 0C00628E */  lw         $v0, 0xC($s3)
/* 6C54 800E6454 43180300 */  sra        $v1, $v1, 1
/* 6C58 800E6458 0800648E */  lw         $a0, 0x8($s3)
/* 6C5C 800E645C 00014230 */  andi       $v0, $v0, 0x100
/* 6C60 800E6460 03110200 */  sra        $v0, $v0, 4
/* 6C64 800E6464 21186400 */  addu       $v1, $v1, $a0
/* 6C68 800E6468 FF036330 */  andi       $v1, $v1, 0x3FF
/* 6C6C 800E646C 83190300 */  sra        $v1, $v1, 6
/* 6C70 800E6470 80006334 */  ori        $v1, $v1, 0x80
.L800E6474:
/* 6C74 800E6474 25384300 */  or         $a3, $v0, $v1
/* 6C78 800E6478 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 6C7C 800E647C 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 6C80 800E6480 1000A2AF */  sw         $v0, 0x10($sp)
/* 6C84 800E6484 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6C88 800E6488 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6C8C 800E648C 21202002 */  addu       $a0, $s1, $zero
/* 6C90 800E6490 3406428C */  lw         $v0, 0x634($v0)
/* 6C94 800E6494 21280000 */  addu       $a1, $zero, $zero
/* 6C98 800E6498 09F84000 */  jalr       $v0
/* 6C9C 800E649C 21300000 */   addu      $a2, $zero, $zero
/* 6CA0 800E64A0 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6CA4 800E64A4 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6CA8 800E64A8 00000000 */  nop
/* 6CAC 800E64AC 21209500 */  addu       $a0, $a0, $s5
/* 6CB0 800E64B0 00000000 */  nop
/* 6CB4 800E64B4 02008288 */  lwl        $v0, 0x2($a0)
/* 6CB8 800E64B8 001A1100 */  sll        $v1, $s1, 8
/* 6CBC 800E64BC 020022AA */  swl        $v0, 0x2($s1)
/* 6CC0 800E64C0 020083A8 */  swl        $v1, 0x2($a0)
/* 6CC4 800E64C4 0C001026 */  addiu      $s0, $s0, 0xC
/* 6CC8 800E64C8 80005226 */  addiu      $s2, $s2, 0x80
/* 6CCC 800E64CC 0001422A */  slti       $v0, $s2, 0x100
/* 6CD0 800E64D0 ABFF4014 */  bnez       $v0, .L800E6380
/* 6CD4 800E64D4 0C003126 */   addiu     $s1, $s1, 0xC
/* 6CD8 800E64D8 04000234 */  ori        $v0, $zero, 0x4
/* 6CDC 800E64DC 030022A2 */  sb         $v0, 0x3($s1)
/* 6CE0 800E64E0 64000234 */  ori        $v0, $zero, 0x64
/* 6CE4 800E64E4 070022A2 */  sb         $v0, 0x7($s1)
/* 6CE8 800E64E8 0C0020A2 */  sb         $zero, 0xC($s1)
/* 6CEC 800E64EC 0D0020A2 */  sb         $zero, 0xD($s1)
/* 6CF0 800E64F0 8D000234 */  ori        $v0, $zero, 0x8D
/* 6CF4 800E64F4 120022A6 */  sh         $v0, 0x12($s1)
/* 6CF8 800E64F8 80000234 */  ori        $v0, $zero, 0x80
/* 6CFC 800E64FC 100022A6 */  sh         $v0, 0x10($s1)
/* 6D00 800E6500 0001C226 */  addiu      $v0, $s6, 0x100
/* 6D04 800E6504 080022A6 */  sh         $v0, 0x8($s1)
/* 6D08 800E6508 0A0037A6 */  sh         $s7, 0xA($s1)
/* 6D0C 800E650C 040034A2 */  sb         $s4, 0x4($s1)
/* 6D10 800E6510 050034A2 */  sb         $s4, 0x5($s1)
/* 6D14 800E6514 060034A2 */  sb         $s4, 0x6($s1)
/* 6D18 800E6518 0500053C */  lui        $a1, (0x52C14 >> 16)
/* 6D1C 800E651C 142CA534 */  ori        $a1, $a1, (0x52C14 & 0xFFFF)
/* 6D20 800E6520 04006396 */  lhu        $v1, 0x4($s3)
/* 6D24 800E6524 0000628E */  lw         $v0, 0x0($s3)
/* 6D28 800E6528 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6D2C 800E652C D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6D30 800E6530 80190300 */  sll        $v1, $v1, 6
/* 6D34 800E6534 03110200 */  sra        $v0, $v0, 4
/* 6D38 800E6538 3F004230 */  andi       $v0, $v0, 0x3F
/* 6D3C 800E653C 25186200 */  or         $v1, $v1, $v0
/* 6D40 800E6540 0E0023A6 */  sh         $v1, 0xE($s1)
/* 6D44 800E6544 21208500 */  addu       $a0, $a0, $a1
/* 6D48 800E6548 00000000 */  nop
/* 6D4C 800E654C 02008288 */  lwl        $v0, 0x2($a0)
/* 6D50 800E6550 001A1100 */  sll        $v1, $s1, 8
/* 6D54 800E6554 020022AA */  swl        $v0, 0x2($s1)
/* 6D58 800E6558 020083A8 */  swl        $v1, 0x2($a0)
/* 6D5C 800E655C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6D60 800E6560 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6D64 800E6564 00000000 */  nop
/* 6D68 800E6568 4006428C */  lw         $v0, 0x640($v0)
/* 6D6C 800E656C 00000000 */  nop
/* 6D70 800E6570 09F84000 */  jalr       $v0
/* 6D74 800E6574 14003126 */   addiu     $s1, $s1, 0x14
/* 6D78 800E6578 0A004010 */  beqz       $v0, .L800E65A4
/* 6D7C 800E657C 00000000 */   nop
/* 6D80 800E6580 0C00638E */  lw         $v1, 0xC($s3)
/* 6D84 800E6584 0800628E */  lw         $v0, 0x8($s3)
/* 6D88 800E6588 00036330 */  andi       $v1, $v1, 0x300
/* 6D8C 800E658C C3180300 */  sra        $v1, $v1, 3
/* 6D90 800E6590 80004224 */  addiu      $v0, $v0, 0x80
/* 6D94 800E6594 FF034230 */  andi       $v0, $v0, 0x3FF
/* 6D98 800E6598 83110200 */  sra        $v0, $v0, 6
/* 6D9C 800E659C 71990308 */  j          .L800E65C4
/* 6DA0 800E65A0 00024234 */   ori       $v0, $v0, 0x200
.L800E65A4:
/* 6DA4 800E65A4 0C00638E */  lw         $v1, 0xC($s3)
/* 6DA8 800E65A8 0800628E */  lw         $v0, 0x8($s3)
/* 6DAC 800E65AC 00016330 */  andi       $v1, $v1, 0x100
/* 6DB0 800E65B0 03190300 */  sra        $v1, $v1, 4
/* 6DB4 800E65B4 80004224 */  addiu      $v0, $v0, 0x80
/* 6DB8 800E65B8 FF034230 */  andi       $v0, $v0, 0x3FF
/* 6DBC 800E65BC 83110200 */  sra        $v0, $v0, 6
/* 6DC0 800E65C0 80004234 */  ori        $v0, $v0, 0x80
.L800E65C4:
/* 6DC4 800E65C4 25386200 */  or         $a3, $v1, $v0
/* 6DC8 800E65C8 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 6DCC 800E65CC 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 6DD0 800E65D0 1000A2AF */  sw         $v0, 0x10($sp)
/* 6DD4 800E65D4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6DD8 800E65D8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6DDC 800E65DC 21202002 */  addu       $a0, $s1, $zero
/* 6DE0 800E65E0 3406428C */  lw         $v0, 0x634($v0)
/* 6DE4 800E65E4 21280000 */  addu       $a1, $zero, $zero
/* 6DE8 800E65E8 09F84000 */  jalr       $v0
/* 6DEC 800E65EC 21300000 */   addu      $a2, $zero, $zero
/* 6DF0 800E65F0 0F80053C */  lui        $a1, %hi(D_800F4ED0)
/* 6DF4 800E65F4 D04EA58C */  lw         $a1, %lo(D_800F4ED0)($a1)
/* 6DF8 800E65F8 0500043C */  lui        $a0, (0x52C14 >> 16)
/* 6DFC 800E65FC 142C8434 */  ori        $a0, $a0, (0x52C14 & 0xFFFF)
/* 6E00 800E6600 2120A400 */  addu       $a0, $a1, $a0
/* 6E04 800E6604 00000000 */  nop
/* 6E08 800E6608 02008288 */  lwl        $v0, 0x2($a0)
/* 6E0C 800E660C 001A1100 */  sll        $v1, $s1, 8
/* 6E10 800E6610 020022AA */  swl        $v0, 0x2($s1)
/* 6E14 800E6614 020083A8 */  swl        $v1, 0x2($a0)
/* 6E18 800E6618 0C003126 */  addiu      $s1, $s1, 0xC
/* 6E1C 800E661C 0500023C */  lui        $v0, (0x52C20 >> 16)
/* 6E20 800E6620 2128A200 */  addu       $a1, $a1, $v0
/* 6E24 800E6624 202CB1AC */  sw         $s1, (0x52C20 & 0xFFFF)($a1)
/* 6E28 800E6628 01000234 */  ori        $v0, $zero, 0x1
/* 6E2C 800E662C 3800BF8F */  lw         $ra, 0x38($sp)
/* 6E30 800E6630 3400B78F */  lw         $s7, 0x34($sp)
/* 6E34 800E6634 3000B68F */  lw         $s6, 0x30($sp)
/* 6E38 800E6638 2C00B58F */  lw         $s5, 0x2C($sp)
/* 6E3C 800E663C 2800B48F */  lw         $s4, 0x28($sp)
/* 6E40 800E6640 2400B38F */  lw         $s3, 0x24($sp)
/* 6E44 800E6644 2000B28F */  lw         $s2, 0x20($sp)
/* 6E48 800E6648 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6E4C 800E664C 1800B08F */  lw         $s0, 0x18($sp)
/* 6E50 800E6650 0800E003 */  jr         $ra
/* 6E54 800E6654 4000BD27 */   addiu     $sp, $sp, 0x40
glabel func_800E6658
/* 6E58 800E6658 1A80013C */  lui        $at, %hi(D_801A0FF0)
/* 6E5C 800E665C F00F24A0 */  sb         $a0, %lo(D_801A0FF0)($at)
/* 6E60 800E6660 0800E003 */  jr         $ra
/* 6E64 800E6664 00000000 */   nop
glabel func_800E6668
/* 6E68 800E6668 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 6E6C 800E666C 3000BFAF */  sw         $ra, 0x30($sp)
/* 6E70 800E6670 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 6E74 800E6674 2800B6AF */  sw         $s6, 0x28($sp)
/* 6E78 800E6678 2400B5AF */  sw         $s5, 0x24($sp)
/* 6E7C 800E667C 2000B4AF */  sw         $s4, 0x20($sp)
/* 6E80 800E6680 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 6E84 800E6684 1800B2AF */  sw         $s2, 0x18($sp)
/* 6E88 800E6688 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E8C 800E668C 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E90 800E6690 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 6E94 800E6694 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 6E98 800E6698 0F80173C */  lui        $s7, %hi(D_800F7050)
/* 6E9C 800E669C 5070F726 */  addiu      $s7, $s7, %lo(D_800F7050)
/* 6EA0 800E66A0 21B00000 */  addu       $s6, $zero, $zero
/* 6EA4 800E66A4 0C005524 */  addiu      $s5, $v0, 0xC
.L800E66A8:
/* 6EA8 800E66A8 21A00000 */  addu       $s4, $zero, $zero
/* 6EAC 800E66AC 0600B026 */  addiu      $s0, $s5, 0x6
.L800E66B0:
/* 6EB0 800E66B0 0000E296 */  lhu        $v0, 0x0($s7)
/* 6EB4 800E66B4 00000000 */  nop
/* 6EB8 800E66B8 FF7F4430 */  andi       $a0, $v0, 0x7FFF
/* 6EBC 800E66BC 21888000 */  addu       $s1, $a0, $zero
/* 6EC0 800E66C0 FF002332 */  andi       $v1, $s1, 0xFF
/* 6EC4 800E66C4 30006010 */  beqz       $v1, .L800E6788
/* 6EC8 800E66C8 0200F726 */   addiu     $s7, $s7, 0x2
/* 6ECC 800E66CC 20000234 */  ori        $v0, $zero, 0x20
/* 6ED0 800E66D0 2D006210 */  beq        $v1, $v0, .L800E6788
/* 6ED4 800E66D4 E0FF3226 */   addiu     $s2, $s1, -0x20
/* 6ED8 800E66D8 1A80133C */  lui        $s3, %hi(D_801A0FF0)
/* 6EDC 800E66DC F00F7392 */  lbu        $s3, %lo(D_801A0FF0)($s3)
/* 6EE0 800E66E0 3996030C */  jal        func_800E58E4
/* 6EE4 800E66E4 02220400 */   srl       $a0, $a0, 8
/* 6EE8 800E66E8 4F002226 */  addiu      $v0, $s1, 0x4F
/* 6EEC 800E66EC FF004230 */  andi       $v0, $v0, 0xFF
/* 6EF0 800E66F0 0C00422C */  sltiu      $v0, $v0, 0xC
/* 6EF4 800E66F4 02004010 */  beqz       $v0, .L800E6700
/* 6EF8 800E66F8 0500063C */   lui       $a2, (0x52C1C >> 16)
/* 6EFC 800E66FC BFFF3226 */  addiu      $s2, $s1, -0x41
.L800E6700:
/* 6F00 800E6700 0F004232 */  andi       $v0, $s2, 0xF
/* 6F04 800E6704 C0100200 */  sll        $v0, $v0, 3
/* 6F08 800E6708 060002A2 */  sb         $v0, 0x6($s0)
/* 6F0C 800E670C 42101200 */  srl        $v0, $s2, 1
/* 6F10 800E6710 78004230 */  andi       $v0, $v0, 0x78
/* 6F14 800E6714 070002A2 */  sb         $v0, 0x7($s0)
/* 6F18 800E6718 0F80053C */  lui        $a1, %hi(D_800F4D84)
/* 6F1C 800E671C 844DA594 */  lhu        $a1, %lo(D_800F4D84)($a1)
/* 6F20 800E6720 0F80043C */  lui        $a0, %hi(D_800F4D88)
/* 6F24 800E6724 884D8494 */  lhu        $a0, %lo(D_800F4D88)($a0)
/* 6F28 800E6728 0F80033C */  lui        $v1, %hi(D_800F4EE0)
/* 6F2C 800E672C E04E638C */  lw         $v1, %lo(D_800F4EE0)($v1)
/* 6F30 800E6730 FEFF13A2 */  sb         $s3, -0x2($s0)
/* 6F34 800E6734 FFFF13A2 */  sb         $s3, -0x1($s0)
/* 6F38 800E6738 000013A2 */  sb         $s3, 0x0($s0)
/* 6F3C 800E673C 1C2CC634 */  ori        $a2, $a2, (0x52C1C & 0xFFFF)
/* 6F40 800E6740 C0101400 */  sll        $v0, $s4, 3
/* 6F44 800E6744 21104500 */  addu       $v0, $v0, $a1
/* 6F48 800E6748 020002A6 */  sh         $v0, 0x2($s0)
/* 6F4C 800E674C 2120C402 */  addu       $a0, $s6, $a0
/* 6F50 800E6750 040004A6 */  sh         $a0, 0x4($s0)
/* 6F54 800E6754 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6F58 800E6758 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6F5C 800E675C 3F006330 */  andi       $v1, $v1, 0x3F
/* 6F60 800E6760 003C6334 */  ori        $v1, $v1, 0x3C00
/* 6F64 800E6764 080003A6 */  sh         $v1, 0x8($s0)
/* 6F68 800E6768 21208600 */  addu       $a0, $a0, $a2
/* 6F6C 800E676C 00000000 */  nop
/* 6F70 800E6770 02008288 */  lwl        $v0, 0x2($a0)
/* 6F74 800E6774 001A1500 */  sll        $v1, $s5, 8
/* 6F78 800E6778 0200A2AA */  swl        $v0, 0x2($s5)
/* 6F7C 800E677C 020083A8 */  swl        $v1, 0x2($a0)
/* 6F80 800E6780 14001026 */  addiu      $s0, $s0, 0x14
/* 6F84 800E6784 1400B526 */  addiu      $s5, $s5, 0x14
.L800E6788:
/* 6F88 800E6788 01009426 */  addiu      $s4, $s4, 0x1
/* 6F8C 800E678C 4000822A */  slti       $v0, $s4, 0x40
/* 6F90 800E6790 C7FF4014 */  bnez       $v0, .L800E66B0
/* 6F94 800E6794 00000000 */   nop
/* 6F98 800E6798 0C00D626 */  addiu      $s6, $s6, 0xC
/* 6F9C 800E679C 6801C22A */  slti       $v0, $s6, 0x168
/* 6FA0 800E67A0 C1FF4014 */  bnez       $v0, .L800E66A8
/* 6FA4 800E67A4 0500053C */   lui       $a1, (0x52C1C >> 16)
/* 6FA8 800E67A8 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 6FAC 800E67AC D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 6FB0 800E67B0 1C2CA534 */  ori        $a1, $a1, (0x52C1C & 0xFFFF)
/* 6FB4 800E67B4 21288500 */  addu       $a1, $a0, $a1
/* 6FB8 800E67B8 00000000 */  nop
/* 6FBC 800E67BC 0200A288 */  lwl        $v0, 0x2($a1)
/* 6FC0 800E67C0 001A0400 */  sll        $v1, $a0, 8
/* 6FC4 800E67C4 020082A8 */  swl        $v0, 0x2($a0)
/* 6FC8 800E67C8 0200A3A8 */  swl        $v1, 0x2($a1)
/* 6FCC 800E67CC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 6FD0 800E67D0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 6FD4 800E67D4 0500033C */  lui        $v1, (0x52C0C >> 16)
/* 6FD8 800E67D8 2406428C */  lw         $v0, 0x624($v0)
/* 6FDC 800E67DC 0C2C6334 */  ori        $v1, $v1, (0x52C0C & 0xFFFF)
/* 6FE0 800E67E0 09F84000 */  jalr       $v0
/* 6FE4 800E67E4 21208300 */   addu      $a0, $a0, $v1
/* 6FE8 800E67E8 3996030C */  jal        func_800E58E4
/* 6FEC 800E67EC 21200000 */   addu      $a0, $zero, $zero
/* 6FF0 800E67F0 3000BF8F */  lw         $ra, 0x30($sp)
/* 6FF4 800E67F4 2C00B78F */  lw         $s7, 0x2C($sp)
/* 6FF8 800E67F8 2800B68F */  lw         $s6, 0x28($sp)
/* 6FFC 800E67FC 2400B58F */  lw         $s5, 0x24($sp)
/* 7000 800E6800 2000B48F */  lw         $s4, 0x20($sp)
/* 7004 800E6804 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7008 800E6808 1800B28F */  lw         $s2, 0x18($sp)
/* 700C 800E680C 1400B18F */  lw         $s1, 0x14($sp)
/* 7010 800E6810 1000B08F */  lw         $s0, 0x10($sp)
/* 7014 800E6814 0800E003 */  jr         $ra
/* 7018 800E6818 3800BD27 */   addiu     $sp, $sp, 0x38
glabel func_800E681C
/* 701C 800E681C FF000734 */  ori        $a3, $zero, 0xFF
/* 7020 800E6820 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 7024 800E6824 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 7028 800E6828 FF000534 */  ori        $a1, $zero, 0xFF
/* 702C 800E682C 0500033C */  lui        $v1, (0x52C20 >> 16)
/* 7030 800E6830 21104300 */  addu       $v0, $v0, $v1
/* 7034 800E6834 202C468C */  lw         $a2, (0x52C20 & 0xFFFF)($v0)
/* 7038 800E6838 1A80033C */  lui        $v1, %hi(D_801A0FF0)
/* 703C 800E683C F00F6390 */  lbu        $v1, %lo(D_801A0FF0)($v1)
/* 7040 800E6840 80000234 */  ori        $v0, $zero, 0x80
/* 7044 800E6844 08006210 */  beq        $v1, $v0, .L800E6868
/* 7048 800E6848 FF000434 */   ori       $a0, $zero, 0xFF
/* 704C 800E684C 18006400 */  mult       $v1, $a0
/* 7050 800E6850 12100000 */  mflo       $v0
/* 7054 800E6854 00000000 */  nop
/* 7058 800E6858 00000000 */  nop
/* 705C 800E685C C3290200 */  sra        $a1, $v0, 7
/* 7060 800E6860 2138A000 */  addu       $a3, $a1, $zero
/* 7064 800E6864 2120A000 */  addu       $a0, $a1, $zero
.L800E6868:
/* 7068 800E6868 0600E004 */  bltz       $a3, .L800E6884
/* 706C 800E686C 2118E000 */   addu      $v1, $a3, $zero
/* 7070 800E6870 00016228 */  slti       $v0, $v1, 0x100
/* 7074 800E6874 04004014 */  bnez       $v0, .L800E6888
/* 7078 800E6878 00000000 */   nop
/* 707C 800E687C 229A0308 */  j          .L800E6888
/* 7080 800E6880 FF000334 */   ori       $v1, $zero, 0xFF
.L800E6884:
/* 7084 800E6884 21180000 */  addu       $v1, $zero, $zero
.L800E6888:
/* 7088 800E6888 0700A004 */  bltz       $a1, .L800E68A8
/* 708C 800E688C 21386000 */   addu      $a3, $v1, $zero
/* 7090 800E6890 2118A000 */  addu       $v1, $a1, $zero
/* 7094 800E6894 00016228 */  slti       $v0, $v1, 0x100
/* 7098 800E6898 04004014 */  bnez       $v0, .L800E68AC
/* 709C 800E689C 00000000 */   nop
/* 70A0 800E68A0 2B9A0308 */  j          .L800E68AC
/* 70A4 800E68A4 FF000334 */   ori       $v1, $zero, 0xFF
.L800E68A8:
/* 70A8 800E68A8 21180000 */  addu       $v1, $zero, $zero
.L800E68AC:
/* 70AC 800E68AC 07008004 */  bltz       $a0, .L800E68CC
/* 70B0 800E68B0 21286000 */   addu      $a1, $v1, $zero
/* 70B4 800E68B4 21188000 */  addu       $v1, $a0, $zero
/* 70B8 800E68B8 00016228 */  slti       $v0, $v1, 0x100
/* 70BC 800E68BC 05004014 */  bnez       $v0, .L800E68D4
/* 70C0 800E68C0 03000234 */   ori       $v0, $zero, 0x3
/* 70C4 800E68C4 359A0308 */  j          .L800E68D4
/* 70C8 800E68C8 FF000334 */   ori       $v1, $zero, 0xFF
.L800E68CC:
/* 70CC 800E68CC 21180000 */  addu       $v1, $zero, $zero
/* 70D0 800E68D0 03000234 */  ori        $v0, $zero, 0x3
.L800E68D4:
/* 70D4 800E68D4 0300C2A0 */  sb         $v0, 0x3($a2)
/* 70D8 800E68D8 60000234 */  ori        $v0, $zero, 0x60
/* 70DC 800E68DC 0700C2A0 */  sb         $v0, 0x7($a2)
/* 70E0 800E68E0 0800C0A4 */  sh         $zero, 0x8($a2)
/* 70E4 800E68E4 0A00C0A4 */  sh         $zero, 0xA($a2)
/* 70E8 800E68E8 40010234 */  ori        $v0, $zero, 0x140
/* 70EC 800E68EC 0C00C2A4 */  sh         $v0, 0xC($a2)
/* 70F0 800E68F0 F0000234 */  ori        $v0, $zero, 0xF0
/* 70F4 800E68F4 0E00C2A4 */  sh         $v0, 0xE($a2)
/* 70F8 800E68F8 0400C7A0 */  sb         $a3, 0x4($a2)
/* 70FC 800E68FC 0500C5A0 */  sb         $a1, 0x5($a2)
/* 7100 800E6900 0600C3A0 */  sb         $v1, 0x6($a2)
/* 7104 800E6904 0F80053C */  lui        $a1, %hi(D_800F4ED0)
/* 7108 800E6908 D04EA58C */  lw         $a1, %lo(D_800F4ED0)($a1)
/* 710C 800E690C 0500043C */  lui        $a0, (0x52C0C >> 16)
/* 7110 800E6910 0C2C8434 */  ori        $a0, $a0, (0x52C0C & 0xFFFF)
/* 7114 800E6914 2120A400 */  addu       $a0, $a1, $a0
/* 7118 800E6918 00000000 */  nop
/* 711C 800E691C 02008288 */  lwl        $v0, 0x2($a0)
/* 7120 800E6920 001A0600 */  sll        $v1, $a2, 8
/* 7124 800E6924 0200C2A8 */  swl        $v0, 0x2($a2)
/* 7128 800E6928 020083A8 */  swl        $v1, 0x2($a0)
/* 712C 800E692C 1000C624 */  addiu      $a2, $a2, 0x10
/* 7130 800E6930 0500023C */  lui        $v0, (0x52C20 >> 16)
/* 7134 800E6934 2128A200 */  addu       $a1, $a1, $v0
/* 7138 800E6938 0800E003 */  jr         $ra
/* 713C 800E693C 202CA6AC */   sw        $a2, (0x52C20 & 0xFFFF)($a1)
glabel func_800E6940
/* 7140 800E6940 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 7144 800E6944 2800BFAF */  sw         $ra, 0x28($sp)
/* 7148 800E6948 2400B3AF */  sw         $s3, 0x24($sp)
/* 714C 800E694C 2000B2AF */  sw         $s2, 0x20($sp)
/* 7150 800E6950 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 7154 800E6954 1800B0AF */  sw         $s0, 0x18($sp)
/* 7158 800E6958 21888000 */  addu       $s1, $a0, $zero
/* 715C 800E695C CF000A34 */  ori        $t2, $zero, 0xCF
/* 7160 800E6960 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 7164 800E6964 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 7168 800E6968 CF000B34 */  ori        $t3, $zero, 0xCF
/* 716C 800E696C 0500133C */  lui        $s3, (0x50002 >> 16)
/* 7170 800E6970 21105300 */  addu       $v0, $v0, $s3
/* 7174 800E6974 202C508C */  lw         $s0, (0x52C20 & 0xFFFF)($v0)
/* 7178 800E6978 AF000934 */  ori        $t1, $zero, 0xAF
/* 717C 800E697C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 7180 800E6980 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 7184 800E6984 02002296 */  lhu        $v0, 0x2($s1)
/* 7188 800E6988 4F000734 */  ori        $a3, $zero, 0x4F
/* 718C 800E698C 4F000834 */  ori        $t0, $zero, 0x4F
/* 7190 800E6990 020022A6 */  sh         $v0, 0x2($s1)
/* 7194 800E6994 19056390 */  lbu        $v1, 0x519($v1)
/* 7198 800E6998 01000234 */  ori        $v0, $zero, 0x1
/* 719C 800E699C 05006214 */  bne        $v1, $v0, .L800E69B4
/* 71A0 800E69A0 2F000634 */   ori       $a2, $zero, 0x2F
/* 71A4 800E69A4 AF000A34 */  ori        $t2, $zero, 0xAF
/* 71A8 800E69A8 CF000934 */  ori        $t1, $zero, 0xCF
/* 71AC 800E69AC 2F000734 */  ori        $a3, $zero, 0x2F
/* 71B0 800E69B0 4F000634 */  ori        $a2, $zero, 0x4F
.L800E69B4:
/* 71B4 800E69B4 20000234 */  ori        $v0, $zero, 0x20
/* 71B8 800E69B8 1700A210 */  beq        $a1, $v0, .L800E6A18
/* 71BC 800E69BC 0500123C */   lui       $s2, (0x52C18 >> 16)
/* 71C0 800E69C0 40180500 */  sll        $v1, $a1, 1
/* 71C4 800E69C4 21186500 */  addu       $v1, $v1, $a1
/* 71C8 800E69C8 80100300 */  sll        $v0, $v1, 2
/* 71CC 800E69CC 21104500 */  addu       $v0, $v0, $a1
/* 71D0 800E69D0 00110200 */  sll        $v0, $v0, 4
/* 71D4 800E69D4 23104500 */  subu       $v0, $v0, $a1
/* 71D8 800E69D8 43590200 */  sra        $t3, $v0, 5
/* 71DC 800E69DC 21506001 */  addu       $t2, $t3, $zero
/* 71E0 800E69E0 80100300 */  sll        $v0, $v1, 2
/* 71E4 800E69E4 23104500 */  subu       $v0, $v0, $a1
/* 71E8 800E69E8 00110200 */  sll        $v0, $v0, 4
/* 71EC 800E69EC 23104500 */  subu       $v0, $v0, $a1
/* 71F0 800E69F0 43490200 */  sra        $t1, $v0, 5
/* 71F4 800E69F4 80100500 */  sll        $v0, $a1, 2
/* 71F8 800E69F8 21104500 */  addu       $v0, $v0, $a1
/* 71FC 800E69FC 00110200 */  sll        $v0, $v0, 4
/* 7200 800E6A00 23104500 */  subu       $v0, $v0, $a1
/* 7204 800E6A04 43410200 */  sra        $t0, $v0, 5
/* 7208 800E6A08 21380001 */  addu       $a3, $t0, $zero
/* 720C 800E6A0C 00190300 */  sll        $v1, $v1, 4
/* 7210 800E6A10 23186500 */  subu       $v1, $v1, $a1
/* 7214 800E6A14 43310300 */  sra        $a2, $v1, 5
.L800E6A18:
/* 7218 800E6A18 08000234 */  ori        $v0, $zero, 0x8
/* 721C 800E6A1C 030002A2 */  sb         $v0, 0x3($s0)
/* 7220 800E6A20 38000234 */  ori        $v0, $zero, 0x38
/* 7224 800E6A24 070002A2 */  sb         $v0, 0x7($s0)
/* 7228 800E6A28 00002296 */  lhu        $v0, 0x0($s1)
/* 722C 800E6A2C 00000000 */  nop
/* 7230 800E6A30 180002A6 */  sh         $v0, 0x18($s0)
/* 7234 800E6A34 080002A6 */  sh         $v0, 0x8($s0)
/* 7238 800E6A38 02002296 */  lhu        $v0, 0x2($s1)
/* 723C 800E6A3C 00000000 */  nop
/* 7240 800E6A40 120002A6 */  sh         $v0, 0x12($s0)
/* 7244 800E6A44 0A0002A6 */  sh         $v0, 0xA($s0)
/* 7248 800E6A48 00002296 */  lhu        $v0, 0x0($s1)
/* 724C 800E6A4C 04002396 */  lhu        $v1, 0x4($s1)
/* 7250 800E6A50 182C5236 */  ori        $s2, $s2, (0x52C18 & 0xFFFF)
/* 7254 800E6A54 07000492 */  lbu        $a0, 0x7($s0)
/* 7258 800E6A58 21104300 */  addu       $v0, $v0, $v1
/* 725C 800E6A5C 200002A6 */  sh         $v0, 0x20($s0)
/* 7260 800E6A60 100002A6 */  sh         $v0, 0x10($s0)
/* 7264 800E6A64 02002396 */  lhu        $v1, 0x2($s1)
/* 7268 800E6A68 06002596 */  lhu        $a1, 0x6($s1)
/* 726C 800E6A6C 02008434 */  ori        $a0, $a0, 0x2
/* 7270 800E6A70 21104001 */  addu       $v0, $t2, $zero
/* 7274 800E6A74 0C0002A2 */  sb         $v0, 0xC($s0)
/* 7278 800E6A78 040002A2 */  sb         $v0, 0x4($s0)
/* 727C 800E6A7C 21106001 */  addu       $v0, $t3, $zero
/* 7280 800E6A80 0D0002A2 */  sb         $v0, 0xD($s0)
/* 7284 800E6A84 050002A2 */  sb         $v0, 0x5($s0)
/* 7288 800E6A88 21102001 */  addu       $v0, $t1, $zero
/* 728C 800E6A8C 0E0002A2 */  sb         $v0, 0xE($s0)
/* 7290 800E6A90 060002A2 */  sb         $v0, 0x6($s0)
/* 7294 800E6A94 2110E000 */  addu       $v0, $a3, $zero
/* 7298 800E6A98 1C0002A2 */  sb         $v0, 0x1C($s0)
/* 729C 800E6A9C 140002A2 */  sb         $v0, 0x14($s0)
/* 72A0 800E6AA0 21100001 */  addu       $v0, $t0, $zero
/* 72A4 800E6AA4 1D0002A2 */  sb         $v0, 0x1D($s0)
/* 72A8 800E6AA8 150002A2 */  sb         $v0, 0x15($s0)
/* 72AC 800E6AAC 2110C000 */  addu       $v0, $a2, $zero
/* 72B0 800E6AB0 1E0002A2 */  sb         $v0, 0x1E($s0)
/* 72B4 800E6AB4 160002A2 */  sb         $v0, 0x16($s0)
/* 72B8 800E6AB8 070004A2 */  sb         $a0, 0x7($s0)
/* 72BC 800E6ABC 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 72C0 800E6AC0 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 72C4 800E6AC4 21186500 */  addu       $v1, $v1, $a1
/* 72C8 800E6AC8 220003A6 */  sh         $v1, 0x22($s0)
/* 72CC 800E6ACC 1A0003A6 */  sh         $v1, 0x1A($s0)
/* 72D0 800E6AD0 21209200 */  addu       $a0, $a0, $s2
/* 72D4 800E6AD4 00000000 */  nop
/* 72D8 800E6AD8 02008288 */  lwl        $v0, 0x2($a0)
/* 72DC 800E6ADC 001A1000 */  sll        $v1, $s0, 8
/* 72E0 800E6AE0 020002AA */  swl        $v0, 0x2($s0)
/* 72E4 800E6AE4 020083A8 */  swl        $v1, 0x2($a0)
/* 72E8 800E6AE8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 72EC 800E6AEC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 72F0 800E6AF0 00000000 */  nop
/* 72F4 800E6AF4 4006428C */  lw         $v0, 0x640($v0)
/* 72F8 800E6AF8 00000000 */  nop
/* 72FC 800E6AFC 09F84000 */  jalr       $v0
/* 7300 800E6B00 24001026 */   addiu     $s0, $s0, 0x24
/* 7304 800E6B04 02004010 */  beqz       $v0, .L800E6B10
/* 7308 800E6B08 C0000734 */   ori       $a3, $zero, 0xC0
/* 730C 800E6B0C 00030734 */  ori        $a3, $zero, 0x300
.L800E6B10:
/* 7310 800E6B10 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 7314 800E6B14 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 7318 800E6B18 1000A2AF */  sw         $v0, 0x10($sp)
/* 731C 800E6B1C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7320 800E6B20 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7324 800E6B24 21200002 */  addu       $a0, $s0, $zero
/* 7328 800E6B28 3406428C */  lw         $v0, 0x634($v0)
/* 732C 800E6B2C 21280000 */  addu       $a1, $zero, $zero
/* 7330 800E6B30 09F84000 */  jalr       $v0
/* 7334 800E6B34 01000634 */   ori       $a2, $zero, 0x1
/* 7338 800E6B38 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 733C 800E6B3C D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 7340 800E6B40 00000000 */  nop
/* 7344 800E6B44 21289200 */  addu       $a1, $a0, $s2
/* 7348 800E6B48 00000000 */  nop
/* 734C 800E6B4C 0200A288 */  lwl        $v0, 0x2($a1)
/* 7350 800E6B50 001A1000 */  sll        $v1, $s0, 8
/* 7354 800E6B54 020002AA */  swl        $v0, 0x2($s0)
/* 7358 800E6B58 0200A3A8 */  swl        $v1, 0x2($a1)
/* 735C 800E6B5C 0C001026 */  addiu      $s0, $s0, 0xC
/* 7360 800E6B60 21209300 */  addu       $a0, $a0, $s3
/* 7364 800E6B64 202C90AC */  sw         $s0, (0x52C20 & 0xFFFF)($a0)
/* 7368 800E6B68 02002296 */  lhu        $v0, 0x2($s1)
/* 736C 800E6B6C 00000000 */  nop
/* 7370 800E6B70 020022A6 */  sh         $v0, 0x2($s1)
/* 7374 800E6B74 2800BF8F */  lw         $ra, 0x28($sp)
/* 7378 800E6B78 2400B38F */  lw         $s3, 0x24($sp)
/* 737C 800E6B7C 2000B28F */  lw         $s2, 0x20($sp)
/* 7380 800E6B80 1C00B18F */  lw         $s1, 0x1C($sp)
/* 7384 800E6B84 1800B08F */  lw         $s0, 0x18($sp)
/* 7388 800E6B88 0800E003 */  jr         $ra
/* 738C 800E6B8C 3000BD27 */   addiu     $sp, $sp, 0x30
glabel func_800E6B90
/* 7390 800E6B90 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 7394 800E6B94 3000BFAF */  sw         $ra, 0x30($sp)
/* 7398 800E6B98 2C00B5AF */  sw         $s5, 0x2C($sp)
/* 739C 800E6B9C 2800B4AF */  sw         $s4, 0x28($sp)
/* 73A0 800E6BA0 2400B3AF */  sw         $s3, 0x24($sp)
/* 73A4 800E6BA4 2000B2AF */  sw         $s2, 0x20($sp)
/* 73A8 800E6BA8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 73AC 800E6BAC 1800B0AF */  sw         $s0, 0x18($sp)
/* 73B0 800E6BB0 21808000 */  addu       $s0, $a0, $zero
/* 73B4 800E6BB4 2190A000 */  addu       $s2, $a1, $zero
/* 73B8 800E6BB8 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 73BC 800E6BBC D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 73C0 800E6BC0 0500153C */  lui        $s5, (0x52C20 >> 16)
/* 73C4 800E6BC4 1A80113C */  lui        $s1, %hi(D_801A0FF0)
/* 73C8 800E6BC8 F00F3192 */  lbu        $s1, %lo(D_801A0FF0)($s1)
/* 73CC 800E6BCC 21105500 */  addu       $v0, $v0, $s5
/* 73D0 800E6BD0 202C548C */  lw         $s4, (0x52C20 & 0xFFFF)($v0)
/* 73D4 800E6BD4 2198C000 */  addu       $s3, $a2, $zero
/* 73D8 800E6BD8 3996030C */  jal        func_800E58E4
/* 73DC 800E6BDC 02000434 */   ori       $a0, $zero, 0x2
/* 73E0 800E6BE0 04000234 */  ori        $v0, $zero, 0x4
/* 73E4 800E6BE4 030082A2 */  sb         $v0, 0x3($s4)
/* 73E8 800E6BE8 64000234 */  ori        $v0, $zero, 0x64
/* 73EC 800E6BEC 070082A2 */  sb         $v0, 0x7($s4)
/* 73F0 800E6BF0 0F80023C */  lui        $v0, %hi(D_800F4EE0)
/* 73F4 800E6BF4 E04E428C */  lw         $v0, %lo(D_800F4EE0)($v0)
/* 73F8 800E6BF8 00000000 */  nop
/* 73FC 800E6BFC 3F004230 */  andi       $v0, $v0, 0x3F
/* 7400 800E6C00 003C4234 */  ori        $v0, $v0, 0x3C00
/* 7404 800E6C04 0E0082A6 */  sh         $v0, 0xE($s4)
/* 7408 800E6C08 04000296 */  lhu        $v0, (0x50004 & 0xFFFF)($s0)
/* 740C 800E6C0C 00000000 */  nop
/* 7410 800E6C10 100082A6 */  sh         $v0, 0x10($s4)
/* 7414 800E6C14 06000296 */  lhu        $v0, (0x50006 & 0xFFFF)($s0)
/* 7418 800E6C18 00000000 */  nop
/* 741C 800E6C1C 120082A6 */  sh         $v0, 0x12($s4)
/* 7420 800E6C20 00000292 */  lbu        $v0, (0x50000 & 0xFFFF)($s0)
/* 7424 800E6C24 00000000 */  nop
/* 7428 800E6C28 0C0082A2 */  sb         $v0, 0xC($s4)
/* 742C 800E6C2C 02000292 */  lbu        $v0, (0x50002 & 0xFFFF)($s0)
/* 7430 800E6C30 040091A2 */  sb         $s1, 0x4($s4)
/* 7434 800E6C34 050091A2 */  sb         $s1, 0x5($s4)
/* 7438 800E6C38 060091A2 */  sb         $s1, 0x6($s4)
/* 743C 800E6C3C 0D0082A2 */  sb         $v0, 0xD($s4)
/* 7440 800E6C40 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 7444 800E6C44 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 7448 800E6C48 0500103C */  lui        $s0, (0x52C1C >> 16)
/* 744C 800E6C4C 1C2C1036 */  ori        $s0, $s0, (0x52C1C & 0xFFFF)
/* 7450 800E6C50 080092A6 */  sh         $s2, 0x8($s4)
/* 7454 800E6C54 0A0093A6 */  sh         $s3, 0xA($s4)
/* 7458 800E6C58 21209000 */  addu       $a0, $a0, $s0
/* 745C 800E6C5C 00000000 */  nop
/* 7460 800E6C60 02008288 */  lwl        $v0, 0x2($a0)
/* 7464 800E6C64 001A1400 */  sll        $v1, $s4, 8
/* 7468 800E6C68 020082AA */  swl        $v0, 0x2($s4)
/* 746C 800E6C6C 020083A8 */  swl        $v1, 0x2($a0)
/* 7470 800E6C70 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7474 800E6C74 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7478 800E6C78 00000000 */  nop
/* 747C 800E6C7C 4006428C */  lw         $v0, 0x640($v0)
/* 7480 800E6C80 00000000 */  nop
/* 7484 800E6C84 09F84000 */  jalr       $v0
/* 7488 800E6C88 14009426 */   addiu     $s4, $s4, 0x14
/* 748C 800E6C8C 02004010 */  beqz       $v0, .L800E6C98
/* 7490 800E6C90 8E000734 */   ori       $a3, $zero, 0x8E
/* 7494 800E6C94 0E020734 */  ori        $a3, $zero, 0x20E
.L800E6C98:
/* 7498 800E6C98 0F80023C */  lui        $v0, %hi(D_800F4D7C)
/* 749C 800E6C9C 7C4D4224 */  addiu      $v0, $v0, %lo(D_800F4D7C)
/* 74A0 800E6CA0 1000A2AF */  sw         $v0, 0x10($sp)
/* 74A4 800E6CA4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 74A8 800E6CA8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 74AC 800E6CAC 21208002 */  addu       $a0, $s4, $zero
/* 74B0 800E6CB0 3406428C */  lw         $v0, 0x634($v0)
/* 74B4 800E6CB4 21280000 */  addu       $a1, $zero, $zero
/* 74B8 800E6CB8 09F84000 */  jalr       $v0
/* 74BC 800E6CBC 21300000 */   addu      $a2, $zero, $zero
/* 74C0 800E6CC0 0F80043C */  lui        $a0, %hi(D_800F4ED0)
/* 74C4 800E6CC4 D04E848C */  lw         $a0, %lo(D_800F4ED0)($a0)
/* 74C8 800E6CC8 00000000 */  nop
/* 74CC 800E6CCC 21289000 */  addu       $a1, $a0, $s0
/* 74D0 800E6CD0 00000000 */  nop
/* 74D4 800E6CD4 0200A288 */  lwl        $v0, 0x2($a1)
/* 74D8 800E6CD8 001A1400 */  sll        $v1, $s4, 8
/* 74DC 800E6CDC 020082AA */  swl        $v0, 0x2($s4)
/* 74E0 800E6CE0 0200A3A8 */  swl        $v1, 0x2($a1)
/* 74E4 800E6CE4 0C009426 */  addiu      $s4, $s4, 0xC
/* 74E8 800E6CE8 21209500 */  addu       $a0, $a0, $s5
/* 74EC 800E6CEC 202C94AC */  sw         $s4, (0x52C20 & 0xFFFF)($a0)
/* 74F0 800E6CF0 3996030C */  jal        func_800E58E4
/* 74F4 800E6CF4 21200000 */   addu      $a0, $zero, $zero
/* 74F8 800E6CF8 3000BF8F */  lw         $ra, 0x30($sp)
/* 74FC 800E6CFC 2C00B58F */  lw         $s5, 0x2C($sp)
/* 7500 800E6D00 2800B48F */  lw         $s4, 0x28($sp)
/* 7504 800E6D04 2400B38F */  lw         $s3, 0x24($sp)
/* 7508 800E6D08 2000B28F */  lw         $s2, 0x20($sp)
/* 750C 800E6D0C 1C00B18F */  lw         $s1, 0x1C($sp)
/* 7510 800E6D10 1800B08F */  lw         $s0, 0x18($sp)
/* 7514 800E6D14 0800E003 */  jr         $ra
/* 7518 800E6D18 3800BD27 */   addiu     $sp, $sp, 0x38
glabel func_800E6D1C
/* 751C 800E6D1C D0FEBD27 */  addiu      $sp, $sp, -0x130
/* 7520 800E6D20 2801BFAF */  sw         $ra, 0x128($sp)
/* 7524 800E6D24 2401B3AF */  sw         $s3, 0x124($sp)
/* 7528 800E6D28 2001B2AF */  sw         $s2, 0x120($sp)
/* 752C 800E6D2C 1C01B1AF */  sw         $s1, 0x11C($sp)
/* 7530 800E6D30 1801B0AF */  sw         $s0, 0x118($sp)
/* 7534 800E6D34 21908000 */  addu       $s2, $a0, $zero
/* 7538 800E6D38 0300C288 */  lwl        $v0, 0x3($a2)
/* 753C 800E6D3C 0000C298 */  lwr        $v0, 0x0($a2)
/* 7540 800E6D40 0700C388 */  lwl        $v1, 0x7($a2)
/* 7544 800E6D44 0400C398 */  lwr        $v1, 0x4($a2)
/* 7548 800E6D48 1301A2AB */  swl        $v0, 0x113($sp)
/* 754C 800E6D4C 1001A2BB */  swr        $v0, 0x110($sp)
/* 7550 800E6D50 1701A3AB */  swl        $v1, 0x117($sp)
/* 7554 800E6D54 1401A3BB */  swr        $v1, 0x114($sp)
/* 7558 800E6D58 04000234 */  ori        $v0, $zero, 0x4
/* 755C 800E6D5C 1401A2A7 */  sh         $v0, 0x114($sp)
/* 7560 800E6D60 10000234 */  ori        $v0, $zero, 0x10
/* 7564 800E6D64 1601A2A7 */  sh         $v0, 0x116($sp)
/* 7568 800E6D68 00004292 */  lbu        $v0, 0x0($s2)
/* 756C 800E6D6C 00000000 */  nop
/* 7570 800E6D70 3C004010 */  beqz       $v0, .L800E6E64
/* 7574 800E6D74 2198A000 */   addu      $s3, $a1, $zero
.L800E6D78:
/* 7578 800E6D78 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 757C 800E6D7C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7580 800E6D80 00004492 */  lbu        $a0, 0x0($s2)
/* 7584 800E6D84 4003428C */  lw         $v0, 0x340($v0)
/* 7588 800E6D88 00000000 */  nop
/* 758C 800E6D8C 09F84000 */  jalr       $v0
/* 7590 800E6D90 6C000534 */   ori       $a1, $zero, 0x6C
/* 7594 800E6D94 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 7598 800E6D98 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 759C 800E6D9C 1000B027 */  addiu      $s0, $sp, 0x10
/* 75A0 800E6DA0 21884000 */  addu       $s1, $v0, $zero
/* 75A4 800E6DA4 5C06628C */  lw         $v0, 0x65C($v1)
/* 75A8 800E6DA8 1001A427 */  addiu      $a0, $sp, 0x110
/* 75AC 800E6DAC 09F84000 */  jalr       $v0
/* 75B0 800E6DB0 21280002 */   addu      $a1, $s0, $zero
/* 75B4 800E6DB4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 75B8 800E6DB8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 75BC 800E6DBC 00000000 */  nop
/* 75C0 800E6DC0 3006428C */  lw         $v0, 0x630($v0)
/* 75C4 800E6DC4 01005226 */  addiu      $s2, $s2, 0x1
/* 75C8 800E6DC8 09F84000 */  jalr       $v0
/* 75CC 800E6DCC 21200000 */   addu      $a0, $zero, $zero
/* 75D0 800E6DD0 21280000 */  addu       $a1, $zero, $zero
.L800E6DD4:
/* 75D4 800E6DD4 00002492 */  lbu        $a0, 0x0($s1)
/* 75D8 800E6DD8 01003126 */  addiu      $s1, $s1, 0x1
/* 75DC 800E6DDC 07000334 */  ori        $v1, $zero, 0x7
.L800E6DE0:
/* 75E0 800E6DE0 80008230 */  andi       $v0, $a0, 0x80
/* 75E4 800E6DE4 02004010 */  beqz       $v0, .L800E6DF0
/* 75E8 800E6DE8 40200400 */   sll       $a0, $a0, 1
/* 75EC 800E6DEC 000013A2 */  sb         $s3, 0x0($s0)
.L800E6DF0:
/* 75F0 800E6DF0 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 75F4 800E6DF4 FAFF6104 */  bgez       $v1, .L800E6DE0
/* 75F8 800E6DF8 01001026 */   addiu     $s0, $s0, 0x1
/* 75FC 800E6DFC 0100A524 */  addiu      $a1, $a1, 0x1
/* 7600 800E6E00 0F00A228 */  slti       $v0, $a1, 0xF
/* 7604 800E6E04 F3FF4014 */  bnez       $v0, .L800E6DD4
/* 7608 800E6E08 1001A427 */   addiu     $a0, $sp, 0x110
/* 760C 800E6E0C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7610 800E6E10 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7614 800E6E14 00000000 */  nop
/* 7618 800E6E18 2806428C */  lw         $v0, 0x628($v0)
/* 761C 800E6E1C 00000000 */  nop
/* 7620 800E6E20 09F84000 */  jalr       $v0
/* 7624 800E6E24 1000A527 */   addiu     $a1, $sp, 0x10
/* 7628 800E6E28 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 762C 800E6E2C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7630 800E6E30 00000000 */  nop
/* 7634 800E6E34 3006428C */  lw         $v0, 0x630($v0)
/* 7638 800E6E38 00000000 */  nop
/* 763C 800E6E3C 09F84000 */  jalr       $v0
/* 7640 800E6E40 21200000 */   addu      $a0, $zero, $zero
/* 7644 800E6E44 1001A297 */  lhu        $v0, 0x110($sp)
/* 7648 800E6E48 00000000 */  nop
/* 764C 800E6E4C 04004224 */  addiu      $v0, $v0, 0x4
/* 7650 800E6E50 1001A2A7 */  sh         $v0, 0x110($sp)
/* 7654 800E6E54 00004292 */  lbu        $v0, 0x0($s2)
/* 7658 800E6E58 00000000 */  nop
/* 765C 800E6E5C C6FF4014 */  bnez       $v0, .L800E6D78
/* 7660 800E6E60 00000000 */   nop
.L800E6E64:
/* 7664 800E6E64 2801BF8F */  lw         $ra, 0x128($sp)
/* 7668 800E6E68 2401B38F */  lw         $s3, 0x124($sp)
/* 766C 800E6E6C 2001B28F */  lw         $s2, 0x120($sp)
/* 7670 800E6E70 1C01B18F */  lw         $s1, 0x11C($sp)
/* 7674 800E6E74 1801B08F */  lw         $s0, 0x118($sp)
/* 7678 800E6E78 0800E003 */  jr         $ra
/* 767C 800E6E7C 3001BD27 */   addiu     $sp, $sp, 0x130
glabel func_800E6E80
/* 7680 800E6E80 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 7684 800E6E84 4C00BFAF */  sw         $ra, 0x4C($sp)
/* 7688 800E6E88 4800BEAF */  sw         $fp, 0x48($sp)
/* 768C 800E6E8C 4400B7AF */  sw         $s7, 0x44($sp)
/* 7690 800E6E90 4000B6AF */  sw         $s6, 0x40($sp)
/* 7694 800E6E94 3C00B5AF */  sw         $s5, 0x3C($sp)
/* 7698 800E6E98 3800B4AF */  sw         $s4, 0x38($sp)
/* 769C 800E6E9C 3400B3AF */  sw         $s3, 0x34($sp)
/* 76A0 800E6EA0 3000B2AF */  sw         $s2, 0x30($sp)
/* 76A4 800E6EA4 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 76A8 800E6EA8 2800B0AF */  sw         $s0, 0x28($sp)
/* 76AC 800E6EAC 21A88000 */  addu       $s5, $a0, $zero
/* 76B0 800E6EB0 21B8A000 */  addu       $s7, $a1, $zero
/* 76B4 800E6EB4 21A0C000 */  addu       $s4, $a2, $zero
/* 76B8 800E6EB8 21F0E000 */  addu       $fp, $a3, $zero
/* 76BC 800E6EBC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 76C0 800E6EC0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 76C4 800E6EC4 801F113C */  lui        $s1, (0x1F800000 >> 16)
/* 76C8 800E6EC8 6000B28F */  lw         $s2, 0x60($sp)
/* 76CC 800E6ECC 4006428C */  lw         $v0, 0x640($v0)
/* 76D0 800E6ED0 801F103C */  lui        $s0, (0x1F800154 >> 16)
/* 76D4 800E6ED4 09F84000 */  jalr       $v0
/* 76D8 800E6ED8 54011036 */   ori       $s0, $s0, (0x1F800154 & 0xFFFF)
/* 76DC 800E6EDC 02004010 */  beqz       $v0, .L800E6EE8
/* 76E0 800E6EE0 1A000734 */   ori       $a3, $zero, 0x1A
/* 76E4 800E6EE4 2A000734 */  ori        $a3, $zero, 0x2A
.L800E6EE8:
/* 76E8 800E6EE8 0500043C */  lui        $a0, (0x52C10 >> 16)
/* 76EC 800E6EEC 0F80033C */  lui        $v1, %hi(D_800F4ED0)
/* 76F0 800E6EF0 D04E638C */  lw         $v1, %lo(D_800F4ED0)($v1)
/* 76F4 800E6EF4 102C8434 */  ori        $a0, $a0, (0x52C10 & 0xFFFF)
/* 76F8 800E6EF8 0500023C */  lui        $v0, (0x52C20 >> 16)
/* 76FC 800E6EFC 21106200 */  addu       $v0, $v1, $v0
/* 7700 800E6F00 202C538C */  lw         $s3, (0x52C20 & 0xFFFF)($v0)
/* 7704 800E6F04 14780F34 */  ori        $t7, $zero, 0x7814
/* 7708 800E6F08 02008106 */  bgez       $s4, .L800E6F14
/* 770C 800E6F0C 21B06400 */   addu      $s6, $v1, $a0
/* 7710 800E6F10 0F009426 */  addiu      $s4, $s4, 0xF
.L800E6F14:
/* 7714 800E6F14 03A11400 */  sra        $s4, $s4, 4
/* 7718 800E6F18 0200CD8A */  lwl        $t5, 0x2($s6)
/* 771C 800E6F1C 1A80023C */  lui        $v0, %hi(D_801A0FF0)
/* 7720 800E6F20 F00F4290 */  lbu        $v0, %lo(D_801A0FF0)($v0)
/* 7724 800E6F24 21600000 */  addu       $t4, $zero, $zero
/* 7728 800E6F28 001A0200 */  sll        $v1, $v0, 8
/* 772C 800E6F2C 25184300 */  or         $v1, $v0, $v1
/* 7730 800E6F30 00140200 */  sll        $v0, $v0, 16
/* 7734 800E6F34 25186200 */  or         $v1, $v1, $v0
/* 7738 800E6F38 002C023C */  lui        $v0, (0x2C000000 >> 16)
/* 773C 800E6F3C 4900E01A */  blez       $s7, .L800E7064
/* 7740 800E6F40 25706200 */   or        $t6, $v1, $v0
.L800E6F44:
/* 7744 800E6F44 02004106 */  bgez       $s2, .L800E6F50
/* 7748 800E6F48 21104002 */   addu      $v0, $s2, $zero
/* 774C 800E6F4C 7F004226 */  addiu      $v0, $s2, 0x7F
.L800E6F50:
/* 7750 800E6F50 C3110200 */  sra        $v0, $v0, 7
/* 7754 800E6F54 C0110200 */  sll        $v0, $v0, 7
/* 7758 800E6F58 23904202 */  subu       $s2, $s2, $v0
/* 775C 800E6F5C 2140C003 */  addu       $t0, $fp, $zero
/* 7760 800E6F60 21480000 */  addu       $t1, $zero, $zero
/* 7764 800E6F64 3900A01A */  blez       $s5, .L800E704C
/* 7768 800E6F68 21105402 */   addu      $v0, $s2, $s4
/* 776C 800E6F6C 21584002 */  addu       $t3, $s2, $zero
/* 7770 800E6F70 21504000 */  addu       $t2, $v0, $zero
/* 7774 800E6F74 0E006626 */  addiu      $a2, $s3, 0xE
.L800E6F78:
/* 7778 800E6F78 02000105 */  bgez       $t0, .L800E6F84
/* 777C 800E6F7C 21180001 */   addu      $v1, $t0, $zero
/* 7780 800E6F80 7F000325 */  addiu      $v1, $t0, 0x7F
.L800E6F84:
/* 7784 800E6F84 09000234 */  ori        $v0, $zero, 0x9
/* 7788 800E6F88 F5FFC2A0 */  sb         $v0, -0xB($a2)
/* 778C 800E6F8C 0000028E */  lw         $v0, 0x0($s0)
/* 7790 800E6F90 04001026 */  addiu      $s0, $s0, 0x4
/* 7794 800E6F94 FAFFC2AC */  sw         $v0, -0x6($a2)
/* 7798 800E6F98 0000028E */  lw         $v0, 0x0($s0)
/* 779C 800E6F9C C3190300 */  sra        $v1, $v1, 7
/* 77A0 800E6FA0 0200C2AC */  sw         $v0, 0x2($a2)
/* 77A4 800E6FA4 80101500 */  sll        $v0, $s5, 2
/* 77A8 800E6FA8 21105000 */  addu       $v0, $v0, $s0
/* 77AC 800E6FAC 0000448C */  lw         $a0, 0x0($v0)
/* 77B0 800E6FB0 C0190300 */  sll        $v1, $v1, 7
/* 77B4 800E6FB4 23400301 */  subu       $t0, $t0, $v1
/* 77B8 800E6FB8 0A00C4AC */  sw         $a0, 0xA($a2)
/* 77BC 800E6FBC 0400438C */  lw         $v1, 0x4($v0)
/* 77C0 800E6FC0 21100001 */  addu       $v0, $t0, $zero
/* 77C4 800E6FC4 21401401 */  addu       $t0, $t0, $s4
/* 77C8 800E6FC8 F6FFCEAC */  sw         $t6, -0xA($a2)
/* 77CC 800E6FCC 0E00C2A0 */  sb         $v0, 0xE($a2)
/* 77D0 800E6FD0 FEFFC2A0 */  sb         $v0, -0x2($a2)
/* 77D4 800E6FD4 0700CBA0 */  sb         $t3, 0x7($a2)
/* 77D8 800E6FD8 FFFFCBA0 */  sb         $t3, -0x1($a2)
/* 77DC 800E6FDC 21100001 */  addu       $v0, $t0, $zero
/* 77E0 800E6FE0 1600C2A0 */  sb         $v0, 0x16($a2)
/* 77E4 800E6FE4 0600C2A0 */  sb         $v0, 0x6($a2)
/* 77E8 800E6FE8 1700CAA0 */  sb         $t2, 0x17($a2)
/* 77EC 800E6FEC 0F00CAA0 */  sb         $t2, 0xF($a2)
/* 77F0 800E6FF0 1200C3AC */  sw         $v1, 0x12($a2)
/* 77F4 800E6FF4 00002596 */  lhu        $a1, (0x1F800000 & 0xFFFF)($s1)
/* 77F8 800E6FF8 40101500 */  sll        $v0, $s5, 1
/* 77FC 800E6FFC 02003126 */  addiu      $s1, $s1, %lo(D_1F800002)
/* 7800 800E7000 21105100 */  addu       $v0, $v0, $s1
/* 7804 800E7004 00004494 */  lhu        $a0, 0x0($v0)
/* 7808 800E7008 00002396 */  lhu        $v1, 0x0($s1)
/* 780C 800E700C 02004294 */  lhu        $v0, 0x2($v0)
/* 7810 800E7010 0800C7A4 */  sh         $a3, 0x8($a2)
/* 7814 800E7014 2128A300 */  addu       $a1, $a1, $v1
/* 7818 800E7018 2128A400 */  addu       $a1, $a1, $a0
/* 781C 800E701C 2128A200 */  addu       $a1, $a1, $v0
/* 7820 800E7020 82100500 */  srl        $v0, $a1, 2
/* 7824 800E7024 C0FF4530 */  andi       $a1, $v0, 0xFFC0
/* 7828 800E7028 2110E501 */  addu       $v0, $t7, $a1
/* 782C 800E702C 0000C2A4 */  sh         $v0, 0x0($a2)
/* 7830 800E7030 02006DAA */  swl        $t5, 0x2($s3)
/* 7834 800E7034 006A1300 */  sll        $t5, $s3, 8
/* 7838 800E7038 2800C624 */  addiu      $a2, $a2, 0x28
/* 783C 800E703C 01002925 */  addiu      $t1, $t1, 0x1
/* 7840 800E7040 2A103501 */  slt        $v0, $t1, $s5
/* 7844 800E7044 CCFF4014 */  bnez       $v0, .L800E6F78
/* 7848 800E7048 28007326 */   addiu     $s3, $s3, 0x28
.L800E704C:
/* 784C 800E704C 01008C25 */  addiu      $t4, $t4, 0x1
/* 7850 800E7050 04001026 */  addiu      $s0, $s0, 0x4
/* 7854 800E7054 21905402 */  addu       $s2, $s2, $s4
/* 7858 800E7058 2A109701 */  slt        $v0, $t4, $s7
/* 785C 800E705C B9FF4014 */  bnez       $v0, .L800E6F44
/* 7860 800E7060 02003126 */   addiu     $s1, $s1, 0x2
.L800E7064:
/* 7864 800E7064 00000000 */  nop
/* 7868 800E7068 0200CDAA */  swl        $t5, 0x2($s6)
/* 786C 800E706C 0F80023C */  lui        $v0, %hi(D_800F4D90)
/* 7870 800E7070 904D4224 */  addiu      $v0, $v0, %lo(D_800F4D90)
/* 7874 800E7074 1000A2AF */  sw         $v0, 0x10($sp)
/* 7878 800E7078 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 787C 800E707C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7880 800E7080 21206002 */  addu       $a0, $s3, $zero
/* 7884 800E7084 21280000 */  addu       $a1, $zero, $zero
/* 7888 800E7088 3406428C */  lw         $v0, 0x634($v0)
/* 788C 800E708C 00000000 */  nop
/* 7890 800E7090 09F84000 */  jalr       $v0
/* 7894 800E7094 21300000 */   addu      $a2, $zero, $zero
/* 7898 800E7098 00000000 */  nop
/* 789C 800E709C 0200C28A */  lwl        $v0, 0x2($s6)
/* 78A0 800E70A0 001A1300 */  sll        $v1, $s3, 8
/* 78A4 800E70A4 020062AA */  swl        $v0, 0x2($s3)
/* 78A8 800E70A8 0200C3AA */  swl        $v1, 0x2($s6)
/* 78AC 800E70AC 0F80023C */  lui        $v0, %hi(D_800F4ED0)
/* 78B0 800E70B0 D04E428C */  lw         $v0, %lo(D_800F4ED0)($v0)
/* 78B4 800E70B4 0C007326 */  addiu      $s3, $s3, 0xC
/* 78B8 800E70B8 0500033C */  lui        $v1, (0x52C20 >> 16)
/* 78BC 800E70BC 21104300 */  addu       $v0, $v0, $v1
/* 78C0 800E70C0 202C53AC */  sw         $s3, (0x52C20 & 0xFFFF)($v0)
/* 78C4 800E70C4 4C00BF8F */  lw         $ra, 0x4C($sp)
/* 78C8 800E70C8 4800BE8F */  lw         $fp, 0x48($sp)
/* 78CC 800E70CC 4400B78F */  lw         $s7, 0x44($sp)
/* 78D0 800E70D0 4000B68F */  lw         $s6, 0x40($sp)
/* 78D4 800E70D4 3C00B58F */  lw         $s5, 0x3C($sp)
/* 78D8 800E70D8 3800B48F */  lw         $s4, 0x38($sp)
/* 78DC 800E70DC 3400B38F */  lw         $s3, 0x34($sp)
/* 78E0 800E70E0 3000B28F */  lw         $s2, 0x30($sp)
/* 78E4 800E70E4 2C00B18F */  lw         $s1, 0x2C($sp)
/* 78E8 800E70E8 2800B08F */  lw         $s0, 0x28($sp)
/* 78EC 800E70EC 0800E003 */  jr         $ra
/* 78F0 800E70F0 5000BD27 */   addiu     $sp, $sp, 0x50
glabel func_800E70F4
/* 78F4 800E70F4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 78F8 800E70F8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 78FC 800E70FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7900 800E7100 1000BFAF */  sw         $ra, 0x10($sp)
/* 7904 800E7104 1C00428C */  lw         $v0, 0x1C($v0)
/* 7908 800E7108 00000000 */  nop
/* 790C 800E710C 09F84000 */  jalr       $v0
/* 7910 800E7110 00000000 */   nop
/* 7914 800E7114 01000334 */  ori        $v1, $zero, 0x1
/* 7918 800E7118 05004314 */  bne        $v0, $v1, .L800E7130
/* 791C 800E711C 08000234 */   ori       $v0, $zero, 0x8
/* 7920 800E7120 0F80013C */  lui        $at, %hi(D_800F4F00)
/* 7924 800E7124 004F22AC */  sw         $v0, %lo(D_800F4F00)($at)
/* 7928 800E7128 509C0308 */  j          .L800E7140
/* 792C 800E712C 03000234 */   ori       $v0, $zero, 0x3
.L800E7130:
/* 7930 800E7130 0C000234 */  ori        $v0, $zero, 0xC
/* 7934 800E7134 0F80013C */  lui        $at, %hi(D_800F4F00)
/* 7938 800E7138 004F22AC */  sw         $v0, %lo(D_800F4F00)($at)
/* 793C 800E713C 05000234 */  ori        $v0, $zero, 0x5
.L800E7140:
/* 7940 800E7140 0F80013C */  lui        $at, %hi(D_800F4F08)
/* 7944 800E7144 084F22AC */  sw         $v0, %lo(D_800F4F08)($at)
/* 7948 800E7148 0F80023C */  lui        $v0, %hi(D_800F4F00)
/* 794C 800E714C 004F428C */  lw         $v0, %lo(D_800F4F00)($v0)
/* 7950 800E7150 00000000 */  nop
/* 7954 800E7154 0F80013C */  lui        $at, %hi(D_800F4F10)
/* 7958 800E7158 104F22AC */  sw         $v0, %lo(D_800F4F10)($at)
/* 795C 800E715C 0F80013C */  lui        $at, %hi(D_800F4F18)
/* 7960 800E7160 184F22AC */  sw         $v0, %lo(D_800F4F18)($at)
/* 7964 800E7164 1000BF8F */  lw         $ra, 0x10($sp)
/* 7968 800E7168 00000000 */  nop
/* 796C 800E716C 0800E003 */  jr         $ra
/* 7970 800E7170 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E7174
/* 7974 800E7174 33008014 */  bnez       $a0, .L800E7244
/* 7978 800E7178 0200A538 */   xori      $a1, $a1, 0x2
/* 797C 800E717C 2F00A010 */  beqz       $a1, .L800E723C
/* 7980 800E7180 00000000 */   nop
/* 7984 800E7184 0F80023C */  lui        $v0, %hi(D_800F4D9C)
/* 7988 800E7188 9C4D428C */  lw         $v0, %lo(D_800F4D9C)($v0)
/* 798C 800E718C 00000000 */  nop
/* 7990 800E7190 2C004014 */  bnez       $v0, .L800E7244
/* 7994 800E7194 00000000 */   nop
/* 7998 800E7198 0F80033C */  lui        $v1, %hi(D_800F4D98)
/* 799C 800E719C 984D638C */  lw         $v1, %lo(D_800F4D98)($v1)
/* 79A0 800E71A0 00000000 */  nop
/* 79A4 800E71A4 0000628C */  lw         $v0, 0x0($v1)
/* 79A8 800E71A8 00000000 */  nop
/* 79AC 800E71AC 03004510 */  beq        $v0, $a1, .L800E71BC
/* 79B0 800E71B0 04006224 */   addiu     $v0, $v1, 0x4
/* 79B4 800E71B4 0F80023C */  lui        $v0, %hi(D_800EB9D4)
/* 79B8 800E71B8 D4B94224 */  addiu      $v0, $v0, %lo(D_800EB9D4)
.L800E71BC:
/* 79BC 800E71BC 0F80013C */  lui        $at, %hi(D_800F4D98)
/* 79C0 800E71C0 984D22AC */  sw         $v0, %lo(D_800F4D98)($at)
/* 79C4 800E71C4 0F80023C */  lui        $v0, %hi(D_800F4D98)
/* 79C8 800E71C8 984D428C */  lw         $v0, %lo(D_800F4D98)($v0)
/* 79CC 800E71CC 01000434 */  ori        $a0, $zero, 0x1
/* 79D0 800E71D0 0F80013C */  lui        $at, %hi(D_800F4D9C)
/* 79D4 800E71D4 9C4D24AC */  sw         $a0, %lo(D_800F4D9C)($at)
/* 79D8 800E71D8 0000428C */  lw         $v0, 0x0($v0)
/* 79DC 800E71DC 00000000 */  nop
/* 79E0 800E71E0 18004014 */  bnez       $v0, .L800E7244
/* 79E4 800E71E4 00000000 */   nop
/* 79E8 800E71E8 0F80023C */  lui        $v0, %hi(D_800F4EF8)
/* 79EC 800E71EC F84E428C */  lw         $v0, %lo(D_800F4EF8)($v0)
/* 79F0 800E71F0 00000000 */  nop
/* 79F4 800E71F4 0A004014 */  bnez       $v0, .L800E7220
/* 79F8 800E71F8 00000000 */   nop
/* 79FC 800E71FC 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 7A00 800E7200 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 7A04 800E7204 00000000 */  nop
/* 7A08 800E7208 17056290 */  lbu        $v0, 0x517($v1)
/* 7A0C 800E720C 00000000 */  nop
/* 7A10 800E7210 0A004414 */  bne        $v0, $a0, .L800E723C
/* 7A14 800E7214 00000000 */   nop
/* 7A18 800E7218 8F9C0308 */  j          .L800E723C
/* 7A1C 800E721C 170560A0 */   sb        $zero, 0x517($v1)
.L800E7220:
/* 7A20 800E7220 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 7A24 800E7224 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 7A28 800E7228 00000000 */  nop
/* 7A2C 800E722C 17056290 */  lbu        $v0, 0x517($v1)
/* 7A30 800E7230 00000000 */  nop
/* 7A34 800E7234 0100422C */  sltiu      $v0, $v0, 0x1
/* 7A38 800E7238 170562A0 */  sb         $v0, 0x517($v1)
.L800E723C:
/* 7A3C 800E723C 0F80013C */  lui        $at, %hi(D_800F4D9C)
/* 7A40 800E7240 9C4D20AC */  sw         $zero, %lo(D_800F4D9C)($at)
.L800E7244:
/* 7A44 800E7244 0800E003 */  jr         $ra
/* 7A48 800E7248 00000000 */   nop
/* 7A4C 800E724C 34008014 */  bnez       $a0, .L800E7320
/* 7A50 800E7250 00000000 */   nop
/* 7A54 800E7254 3000A010 */  beqz       $a1, .L800E7318
/* 7A58 800E7258 00000000 */   nop
/* 7A5C 800E725C 0F80023C */  lui        $v0, %hi(D_800F4DA4)
/* 7A60 800E7260 A44D428C */  lw         $v0, %lo(D_800F4DA4)($v0)
/* 7A64 800E7264 00000000 */  nop
/* 7A68 800E7268 2D004014 */  bnez       $v0, .L800E7320
/* 7A6C 800E726C 00000000 */   nop
/* 7A70 800E7270 0F80033C */  lui        $v1, %hi(D_800F4DA0)
/* 7A74 800E7274 A04D638C */  lw         $v1, %lo(D_800F4DA0)($v1)
/* 7A78 800E7278 00000000 */  nop
/* 7A7C 800E727C 0000628C */  lw         $v0, 0x0($v1)
/* 7A80 800E7280 00000000 */  nop
/* 7A84 800E7284 03004510 */  beq        $v0, $a1, .L800E7294
/* 7A88 800E7288 04006224 */   addiu     $v0, $v1, 0x4
/* 7A8C 800E728C 0F80023C */  lui        $v0, %hi(D_800EBA0C)
/* 7A90 800E7290 0CBA4224 */  addiu      $v0, $v0, %lo(D_800EBA0C)
.L800E7294:
/* 7A94 800E7294 0F80013C */  lui        $at, %hi(D_800F4DA0)
/* 7A98 800E7298 A04D22AC */  sw         $v0, %lo(D_800F4DA0)($at)
/* 7A9C 800E729C 0F80023C */  lui        $v0, %hi(D_800F4DA0)
/* 7AA0 800E72A0 A04D428C */  lw         $v0, %lo(D_800F4DA0)($v0)
/* 7AA4 800E72A4 01000434 */  ori        $a0, $zero, 0x1
/* 7AA8 800E72A8 0F80013C */  lui        $at, %hi(D_800F4DA4)
/* 7AAC 800E72AC A44D24AC */  sw         $a0, %lo(D_800F4DA4)($at)
/* 7AB0 800E72B0 0000428C */  lw         $v0, 0x0($v0)
/* 7AB4 800E72B4 00000000 */  nop
/* 7AB8 800E72B8 19004014 */  bnez       $v0, .L800E7320
/* 7ABC 800E72BC 00000000 */   nop
/* 7AC0 800E72C0 0F80023C */  lui        $v0, %hi(D_800F4EF8)
/* 7AC4 800E72C4 F84E428C */  lw         $v0, %lo(D_800F4EF8)($v0)
/* 7AC8 800E72C8 00000000 */  nop
/* 7ACC 800E72CC 0A004014 */  bnez       $v0, .L800E72F8
/* 7AD0 800E72D0 00000000 */   nop
/* 7AD4 800E72D4 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 7AD8 800E72D8 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 7ADC 800E72DC 00000000 */  nop
/* 7AE0 800E72E0 17056290 */  lbu        $v0, 0x517($v1)
/* 7AE4 800E72E4 00000000 */  nop
/* 7AE8 800E72E8 0B004414 */  bne        $v0, $a0, .L800E7318
/* 7AEC 800E72EC 00000000 */   nop
/* 7AF0 800E72F0 C69C0308 */  j          .L800E7318
/* 7AF4 800E72F4 170560A0 */   sb        $zero, 0x517($v1)
.L800E72F8:
/* 7AF8 800E72F8 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 7AFC 800E72FC D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 7B00 800E7300 00000000 */  nop
/* 7B04 800E7304 17056290 */  lbu        $v0, 0x517($v1)
/* 7B08 800E7308 00000000 */  nop
/* 7B0C 800E730C 0100422C */  sltiu      $v0, $v0, 0x1
/* 7B10 800E7310 40100200 */  sll        $v0, $v0, 1
/* 7B14 800E7314 170562A0 */  sb         $v0, 0x517($v1)
.L800E7318:
/* 7B18 800E7318 0F80013C */  lui        $at, %hi(D_800F4DA4)
/* 7B1C 800E731C A44D20AC */  sw         $zero, %lo(D_800F4DA4)($at)
.L800E7320:
/* 7B20 800E7320 0800E003 */  jr         $ra
/* 7B24 800E7324 00000000 */   nop
glabel func_800E7328
/* 7B28 800E7328 26008014 */  bnez       $a0, .L800E73C4
/* 7B2C 800E732C 00000000 */   nop
/* 7B30 800E7330 2200A010 */  beqz       $a1, .L800E73BC
/* 7B34 800E7334 00000000 */   nop
/* 7B38 800E7338 0F80023C */  lui        $v0, %hi(D_800F4DAC)
/* 7B3C 800E733C AC4D428C */  lw         $v0, %lo(D_800F4DAC)($v0)
/* 7B40 800E7340 00000000 */  nop
/* 7B44 800E7344 1F004014 */  bnez       $v0, .L800E73C4
/* 7B48 800E7348 00000000 */   nop
/* 7B4C 800E734C 0F80033C */  lui        $v1, %hi(D_800F4DA8)
/* 7B50 800E7350 A84D638C */  lw         $v1, %lo(D_800F4DA8)($v1)
/* 7B54 800E7354 00000000 */  nop
/* 7B58 800E7358 0000628C */  lw         $v0, 0x0($v1)
/* 7B5C 800E735C 00000000 */  nop
/* 7B60 800E7360 03004510 */  beq        $v0, $a1, .L800E7370
/* 7B64 800E7364 04006224 */   addiu     $v0, $v1, 0x4
/* 7B68 800E7368 0F80023C */  lui        $v0, %hi(D_800EBA3C)
/* 7B6C 800E736C 3CBA4224 */  addiu      $v0, $v0, %lo(D_800EBA3C)
.L800E7370:
/* 7B70 800E7370 0F80013C */  lui        $at, %hi(D_800F4DA8)
/* 7B74 800E7374 A84D22AC */  sw         $v0, %lo(D_800F4DA8)($at)
/* 7B78 800E7378 0F80023C */  lui        $v0, %hi(D_800F4DA8)
/* 7B7C 800E737C A84D428C */  lw         $v0, %lo(D_800F4DA8)($v0)
/* 7B80 800E7380 01000334 */  ori        $v1, $zero, 0x1
/* 7B84 800E7384 0F80013C */  lui        $at, %hi(D_800F4DAC)
/* 7B88 800E7388 AC4D23AC */  sw         $v1, %lo(D_800F4DAC)($at)
/* 7B8C 800E738C 0000428C */  lw         $v0, 0x0($v0)
/* 7B90 800E7390 00000000 */  nop
/* 7B94 800E7394 0B004014 */  bnez       $v0, .L800E73C4
/* 7B98 800E7398 00000000 */   nop
/* 7B9C 800E739C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 7BA0 800E73A0 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 7BA4 800E73A4 00000000 */  nop
/* 7BA8 800E73A8 19056290 */  lbu        $v0, 0x519($v1)
/* 7BAC 800E73AC 00000000 */  nop
/* 7BB0 800E73B0 0100422C */  sltiu      $v0, $v0, 0x1
/* 7BB4 800E73B4 F19C0308 */  j          .L800E73C4
/* 7BB8 800E73B8 190562A0 */   sb        $v0, 0x519($v1)
.L800E73BC:
/* 7BBC 800E73BC 0F80013C */  lui        $at, %hi(D_800F4DAC)
/* 7BC0 800E73C0 AC4D20AC */  sw         $zero, %lo(D_800F4DAC)($at)
.L800E73C4:
/* 7BC4 800E73C4 0800E003 */  jr         $ra
/* 7BC8 800E73C8 00000000 */   nop
glabel func_800E73CC
/* 7BCC 800E73CC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7BD0 800E73D0 1000BFAF */  sw         $ra, 0x10($sp)
/* 7BD4 800E73D4 11008014 */  bnez       $a0, .L800E741C
/* 7BD8 800E73D8 21300000 */   addu      $a2, $zero, $zero
/* 7BDC 800E73DC 0F00A330 */  andi       $v1, $a1, 0xF
/* 7BE0 800E73E0 0F000234 */  ori        $v0, $zero, 0xF
/* 7BE4 800E73E4 0D006214 */  bne        $v1, $v0, .L800E741C
/* 7BE8 800E73E8 00000000 */   nop
/* 7BEC 800E73EC 0010A230 */  andi       $v0, $a1, 0x1000
/* 7BF0 800E73F0 05004010 */  beqz       $v0, .L800E7408
/* 7BF4 800E73F4 0040A230 */   andi      $v0, $a1, 0x4000
/* 7BF8 800E73F8 8EA0030C */  jal        func_800E8238
/* 7BFC 800E73FC 00000000 */   nop
/* 7C00 800E7400 079D0308 */  j          .L800E741C
/* 7C04 800E7404 01000634 */   ori       $a2, $zero, 0x1
.L800E7408:
/* 7C08 800E7408 04004010 */  beqz       $v0, .L800E741C
/* 7C0C 800E740C 00000000 */   nop
/* 7C10 800E7410 9EA0030C */  jal        func_800E8278
/* 7C14 800E7414 00000000 */   nop
/* 7C18 800E7418 01000634 */  ori        $a2, $zero, 0x1
.L800E741C:
/* 7C1C 800E741C 1000BF8F */  lw         $ra, 0x10($sp)
/* 7C20 800E7420 2110C000 */  addu       $v0, $a2, $zero
/* 7C24 800E7424 0800E003 */  jr         $ra
/* 7C28 800E7428 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E742C
/* 7C2C 800E742C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7C30 800E7430 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7C34 800E7434 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7C38 800E7438 1000BFAF */  sw         $ra, 0x10($sp)
/* 7C3C 800E743C C003428C */  lw         $v0, 0x3C0($v0)
/* 7C40 800E7440 00000000 */  nop
/* 7C44 800E7444 09F84000 */  jalr       $v0
/* 7C48 800E7448 21200000 */   addu      $a0, $zero, $zero
/* 7C4C 800E744C 0F80013C */  lui        $at, %hi(D_800F4EF8)
/* 7C50 800E7450 F84E20AC */  sw         $zero, %lo(D_800F4EF8)($at)
/* 7C54 800E7454 0E000334 */  ori        $v1, $zero, 0xE
/* 7C58 800E7458 03004314 */  bne        $v0, $v1, .L800E7468
/* 7C5C 800E745C 01000234 */   ori       $v0, $zero, 0x1
/* 7C60 800E7460 0F80013C */  lui        $at, %hi(D_800F4EF8)
/* 7C64 800E7464 F84E22AC */  sw         $v0, %lo(D_800F4EF8)($at)
.L800E7468:
/* 7C68 800E7468 1000BF8F */  lw         $ra, 0x10($sp)
/* 7C6C 800E746C 00000000 */  nop
/* 7C70 800E7470 0800E003 */  jr         $ra
/* 7C74 800E7474 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E7478
/* 7C78 800E7478 0F80023C */  lui        $v0, %hi(D_800F4F00)
/* 7C7C 800E747C 004F428C */  lw         $v0, %lo(D_800F4F00)($v0)
/* 7C80 800E7480 0F80013C */  lui        $at, %hi(D_800F4DB0)
/* 7C84 800E7484 B04D20AC */  sw         $zero, %lo(D_800F4DB0)($at)
/* 7C88 800E7488 0F80013C */  lui        $at, %hi(D_800F4DB4)
/* 7C8C 800E748C B44D20AC */  sw         $zero, %lo(D_800F4DB4)($at)
/* 7C90 800E7490 0F80013C */  lui        $at, %hi(D_800F4F10)
/* 7C94 800E7494 104F22AC */  sw         $v0, %lo(D_800F4F10)($at)
/* 7C98 800E7498 0F80013C */  lui        $at, %hi(D_800F4F18)
/* 7C9C 800E749C 184F22AC */  sw         $v0, %lo(D_800F4F18)($at)
/* 7CA0 800E74A0 0800E003 */  jr         $ra
/* 7CA4 800E74A4 00000000 */   nop
glabel func_800E74A8
/* 7CA8 800E74A8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 7CAC 800E74AC 2000BFAF */  sw         $ra, 0x20($sp)
/* 7CB0 800E74B0 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 7CB4 800E74B4 1800B2AF */  sw         $s2, 0x18($sp)
/* 7CB8 800E74B8 1400B1AF */  sw         $s1, 0x14($sp)
/* 7CBC 800E74BC 1000B0AF */  sw         $s0, 0x10($sp)
/* 7CC0 800E74C0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7CC4 800E74C4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7CC8 800E74C8 21808000 */  addu       $s0, $a0, $zero
/* 7CCC 800E74CC C003428C */  lw         $v0, 0x3C0($v0)
/* 7CD0 800E74D0 21980000 */  addu       $s3, $zero, $zero
/* 7CD4 800E74D4 09F84000 */  jalr       $v0
/* 7CD8 800E74D8 21900000 */   addu      $s2, $zero, $zero
/* 7CDC 800E74DC 21884000 */  addu       $s1, $v0, $zero
/* 7CE0 800E74E0 21200002 */  addu       $a0, $s0, $zero
/* 7CE4 800E74E4 CA9C030C */  jal        func_800E7328
/* 7CE8 800E74E8 21282002 */   addu      $a1, $s1, $zero
/* 7CEC 800E74EC 21200002 */  addu       $a0, $s0, $zero
/* 7CF0 800E74F0 5D9C030C */  jal        func_800E7174
/* 7CF4 800E74F4 21282002 */   addu      $a1, $s1, $zero
/* 7CF8 800E74F8 21200002 */  addu       $a0, $s0, $zero
/* 7CFC 800E74FC F39C030C */  jal        func_800E73CC
/* 7D00 800E7500 21282002 */   addu      $a1, $s1, $zero
/* 7D04 800E7504 01000434 */  ori        $a0, $zero, 0x1
/* 7D08 800E7508 03004414 */  bne        $v0, $a0, .L800E7518
/* 7D0C 800E750C 00F02632 */   andi      $a2, $s1, 0xF000
/* 7D10 800E7510 21880000 */  addu       $s1, $zero, $zero
/* 7D14 800E7514 00F02632 */  andi       $a2, $s1, 0xF000
.L800E7518:
/* 7D18 800E7518 E0082532 */  andi       $a1, $s1, 0x8E0
/* 7D1C 800E751C 2510C500 */  or         $v0, $a2, $a1
/* 7D20 800E7520 03004014 */  bnez       $v0, .L800E7530
/* 7D24 800E7524 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 7D28 800E7528 0F80013C */  lui        $at, %hi(D_800F4DB8)
/* 7D2C 800E752C B84D22AC */  sw         $v0, %lo(D_800F4DB8)($at)
.L800E7530:
/* 7D30 800E7530 0F80033C */  lui        $v1, %hi(D_800F4DB8)
/* 7D34 800E7534 B84D638C */  lw         $v1, %lo(D_800F4DB8)($v1)
/* 7D38 800E7538 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7D3C 800E753C 17006214 */  bne        $v1, $v0, .L800E759C
/* 7D40 800E7540 00000000 */   nop
/* 7D44 800E7544 0900C010 */  beqz       $a2, .L800E756C
/* 7D48 800E7548 00000000 */   nop
/* 7D4C 800E754C 0F80023C */  lui        $v0, %hi(D_800F4F00)
/* 7D50 800E7550 004F428C */  lw         $v0, %lo(D_800F4F00)($v0)
/* 7D54 800E7554 0F80013C */  lui        $at, %hi(D_800F4DB0)
/* 7D58 800E7558 B04D20AC */  sw         $zero, %lo(D_800F4DB0)($at)
/* 7D5C 800E755C 0F80013C */  lui        $at, %hi(D_800F4DB8)
/* 7D60 800E7560 B84D20AC */  sw         $zero, %lo(D_800F4DB8)($at)
/* 7D64 800E7564 0F80013C */  lui        $at, %hi(D_800F4F10)
/* 7D68 800E7568 104F22AC */  sw         $v0, %lo(D_800F4F10)($at)
.L800E756C:
/* 7D6C 800E756C 0900A010 */  beqz       $a1, .L800E7594
/* 7D70 800E7570 00000000 */   nop
/* 7D74 800E7574 0F80023C */  lui        $v0, %hi(D_800F4F00)
/* 7D78 800E7578 004F428C */  lw         $v0, %lo(D_800F4F00)($v0)
/* 7D7C 800E757C 0F80013C */  lui        $at, %hi(D_800F4DB4)
/* 7D80 800E7580 B44D20AC */  sw         $zero, %lo(D_800F4DB4)($at)
/* 7D84 800E7584 0F80013C */  lui        $at, %hi(D_800F4DB8)
/* 7D88 800E7588 B84D24AC */  sw         $a0, %lo(D_800F4DB8)($at)
/* 7D8C 800E758C 0F80013C */  lui        $at, %hi(D_800F4F18)
/* 7D90 800E7590 184F22AC */  sw         $v0, %lo(D_800F4F18)($at)
.L800E7594:
/* 7D94 800E7594 0F80033C */  lui        $v1, %hi(D_800F4DB8)
/* 7D98 800E7598 B84D638C */  lw         $v1, %lo(D_800F4DB8)($v1)
.L800E759C:
/* 7D9C 800E759C 00000000 */  nop
/* 7DA0 800E75A0 05006010 */  beqz       $v1, .L800E75B8
/* 7DA4 800E75A4 01000234 */   ori       $v0, $zero, 0x1
/* 7DA8 800E75A8 21006210 */  beq        $v1, $v0, .L800E7630
/* 7DAC 800E75AC 00000000 */   nop
/* 7DB0 800E75B0 A99D0308 */  j          .L800E76A4
/* 7DB4 800E75B4 00000000 */   nop
.L800E75B8:
/* 7DB8 800E75B8 0F80023C */  lui        $v0, %hi(D_800F4DBC)
/* 7DBC 800E75BC BC4D428C */  lw         $v0, %lo(D_800F4DBC)($v0)
/* 7DC0 800E75C0 00000000 */  nop
/* 7DC4 800E75C4 2410C200 */  and        $v0, $a2, $v0
/* 7DC8 800E75C8 11004010 */  beqz       $v0, .L800E7610
/* 7DCC 800E75CC 00000000 */   nop
/* 7DD0 800E75D0 0F80023C */  lui        $v0, %hi(D_800F4DB0)
/* 7DD4 800E75D4 B04D428C */  lw         $v0, %lo(D_800F4DB0)($v0)
/* 7DD8 800E75D8 0F80043C */  lui        $a0, %hi(D_800F4CC4)
/* 7DDC 800E75DC C44C848C */  lw         $a0, %lo(D_800F4CC4)($a0)
/* 7DE0 800E75E0 0F80033C */  lui        $v1, %hi(D_800F4F10)
/* 7DE4 800E75E4 104F638C */  lw         $v1, %lo(D_800F4F10)($v1)
/* 7DE8 800E75E8 21104400 */  addu       $v0, $v0, $a0
/* 7DEC 800E75EC 0F80013C */  lui        $at, %hi(D_800F4DB0)
/* 7DF0 800E75F0 B04D22AC */  sw         $v0, %lo(D_800F4DB0)($at)
/* 7DF4 800E75F4 2A186200 */  slt        $v1, $v1, $v0
/* 7DF8 800E75F8 2A006010 */  beqz       $v1, .L800E76A4
/* 7DFC 800E75FC 00000000 */   nop
/* 7E00 800E7600 0F80023C */  lui        $v0, %hi(D_800F4F08)
/* 7E04 800E7604 084F428C */  lw         $v0, %lo(D_800F4F08)($v0)
/* 7E08 800E7608 869D0308 */  j          .L800E7618
/* 7E0C 800E760C 00000000 */   nop
.L800E7610:
/* 7E10 800E7610 0F80023C */  lui        $v0, %hi(D_800F4F00)
/* 7E14 800E7614 004F428C */  lw         $v0, %lo(D_800F4F00)($v0)
.L800E7618:
/* 7E18 800E7618 0F80013C */  lui        $at, %hi(D_800F4DB0)
/* 7E1C 800E761C B04D20AC */  sw         $zero, %lo(D_800F4DB0)($at)
/* 7E20 800E7620 0F80013C */  lui        $at, %hi(D_800F4F10)
/* 7E24 800E7624 104F22AC */  sw         $v0, %lo(D_800F4F10)($at)
/* 7E28 800E7628 A99D0308 */  j          .L800E76A4
/* 7E2C 800E762C 2198C000 */   addu      $s3, $a2, $zero
.L800E7630:
/* 7E30 800E7630 0F80023C */  lui        $v0, %hi(D_800F4DC0)
/* 7E34 800E7634 C04D428C */  lw         $v0, %lo(D_800F4DC0)($v0)
/* 7E38 800E7638 00000000 */  nop
/* 7E3C 800E763C 2410A200 */  and        $v0, $a1, $v0
/* 7E40 800E7640 11004010 */  beqz       $v0, .L800E7688
/* 7E44 800E7644 00000000 */   nop
/* 7E48 800E7648 0F80023C */  lui        $v0, %hi(D_800F4DB4)
/* 7E4C 800E764C B44D428C */  lw         $v0, %lo(D_800F4DB4)($v0)
/* 7E50 800E7650 0F80043C */  lui        $a0, %hi(D_800F4CC4)
/* 7E54 800E7654 C44C848C */  lw         $a0, %lo(D_800F4CC4)($a0)
/* 7E58 800E7658 0F80033C */  lui        $v1, %hi(D_800F4F18)
/* 7E5C 800E765C 184F638C */  lw         $v1, %lo(D_800F4F18)($v1)
/* 7E60 800E7660 21104400 */  addu       $v0, $v0, $a0
/* 7E64 800E7664 0F80013C */  lui        $at, %hi(D_800F4DB4)
/* 7E68 800E7668 B44D22AC */  sw         $v0, %lo(D_800F4DB4)($at)
/* 7E6C 800E766C 2A186200 */  slt        $v1, $v1, $v0
/* 7E70 800E7670 0C006010 */  beqz       $v1, .L800E76A4
/* 7E74 800E7674 00000000 */   nop
/* 7E78 800E7678 0F80023C */  lui        $v0, %hi(D_800F4F08)
/* 7E7C 800E767C 084F428C */  lw         $v0, %lo(D_800F4F08)($v0)
/* 7E80 800E7680 A59D0308 */  j          .L800E7694
/* 7E84 800E7684 2190A000 */   addu      $s2, $a1, $zero
.L800E7688:
/* 7E88 800E7688 0F80023C */  lui        $v0, %hi(D_800F4F00)
/* 7E8C 800E768C 004F428C */  lw         $v0, %lo(D_800F4F00)($v0)
/* 7E90 800E7690 2190A000 */  addu       $s2, $a1, $zero
.L800E7694:
/* 7E94 800E7694 0F80013C */  lui        $at, %hi(D_800F4DB4)
/* 7E98 800E7698 B44D20AC */  sw         $zero, %lo(D_800F4DB4)($at)
/* 7E9C 800E769C 0F80013C */  lui        $at, %hi(D_800F4F18)
/* 7EA0 800E76A0 184F22AC */  sw         $v0, %lo(D_800F4F18)($at)
.L800E76A4:
/* 7EA4 800E76A4 0F80013C */  lui        $at, %hi(D_800F4DBC)
/* 7EA8 800E76A8 BC4D26AC */  sw         $a2, %lo(D_800F4DBC)($at)
/* 7EAC 800E76AC 0F80013C */  lui        $at, %hi(D_800F4DC0)
/* 7EB0 800E76B0 C04D25AC */  sw         $a1, %lo(D_800F4DC0)($at)
/* 7EB4 800E76B4 25107202 */  or         $v0, $s3, $s2
/* 7EB8 800E76B8 2000BF8F */  lw         $ra, 0x20($sp)
/* 7EBC 800E76BC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 7EC0 800E76C0 1800B28F */  lw         $s2, 0x18($sp)
/* 7EC4 800E76C4 1400B18F */  lw         $s1, 0x14($sp)
/* 7EC8 800E76C8 1000B08F */  lw         $s0, 0x10($sp)
/* 7ECC 800E76CC 0800E003 */  jr         $ra
/* 7ED0 800E76D0 2800BD27 */   addiu     $sp, $sp, 0x28
glabel func_800E76D4
/* 7ED4 800E76D4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7ED8 800E76D8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7EDC 800E76DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7EE0 800E76E0 1000BFAF */  sw         $ra, 0x10($sp)
/* 7EE4 800E76E4 2000428C */  lw         $v0, 0x20($v0)
/* 7EE8 800E76E8 00000000 */  nop
/* 7EEC 800E76EC 09F84000 */  jalr       $v0
/* 7EF0 800E76F0 00000000 */   nop
/* 7EF4 800E76F4 21184000 */  addu       $v1, $v0, $zero
/* 7EF8 800E76F8 02000234 */  ori        $v0, $zero, 0x2
/* 7EFC 800E76FC 10006210 */  beq        $v1, $v0, .L800E7740
/* 7F00 800E7700 03006228 */   slti      $v0, $v1, 0x3
/* 7F04 800E7704 05004010 */  beqz       $v0, .L800E771C
/* 7F08 800E7708 01000234 */   ori       $v0, $zero, 0x1
/* 7F0C 800E770C 08006210 */  beq        $v1, $v0, .L800E7730
/* 7F10 800E7710 00000000 */   nop
/* 7F14 800E7714 E29D0308 */  j          .L800E7788
/* 7F18 800E7718 00000000 */   nop
.L800E771C:
/* 7F1C 800E771C 03000234 */  ori        $v0, $zero, 0x3
/* 7F20 800E7720 0B006210 */  beq        $v1, $v0, .L800E7750
/* 7F24 800E7724 00000000 */   nop
/* 7F28 800E7728 E29D0308 */  j          .L800E7788
/* 7F2C 800E772C 00000000 */   nop
.L800E7730:
/* 7F30 800E7730 0F80023C */  lui        $v0, %hi(D_800F0574)
/* 7F34 800E7734 74054224 */  addiu      $v0, $v0, %lo(D_800F0574)
/* 7F38 800E7738 E49D0308 */  j          .L800E7790
/* 7F3C 800E773C 00000000 */   nop
.L800E7740:
/* 7F40 800E7740 0F80023C */  lui        $v0, %hi(D_800F0538)
/* 7F44 800E7744 38054224 */  addiu      $v0, $v0, %lo(D_800F0538)
/* 7F48 800E7748 E49D0308 */  j          .L800E7790
/* 7F4C 800E774C 00000000 */   nop
.L800E7750:
/* 7F50 800E7750 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 7F54 800E7754 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 7F58 800E7758 00000000 */  nop
/* 7F5C 800E775C 2C00438C */  lw         $v1, 0x2C($v0)
/* 7F60 800E7760 0F80023C */  lui        $v0, %hi(D_800F0560)
/* 7F64 800E7764 60054224 */  addiu      $v0, $v0, %lo(D_800F0560)
/* 7F68 800E7768 0F80013C */  lui        $at, %hi(D_800F4F20)
/* 7F6C 800E776C 204F22AC */  sw         $v0, %lo(D_800F4F20)($at)
/* 7F70 800E7770 09F86000 */  jalr       $v1
/* 7F74 800E7774 00000000 */   nop
/* 7F78 800E7778 07004010 */  beqz       $v0, .L800E7798
/* 7F7C 800E777C 00000000 */   nop
/* 7F80 800E7780 E49D0308 */  j          .L800E7790
/* 7F84 800E7784 00000000 */   nop
.L800E7788:
/* 7F88 800E7788 0F80023C */  lui        $v0, %hi(D_800F0560)
/* 7F8C 800E778C 60054224 */  addiu      $v0, $v0, %lo(D_800F0560)
.L800E7790:
/* 7F90 800E7790 0F80013C */  lui        $at, %hi(D_800F4F20)
/* 7F94 800E7794 204F22AC */  sw         $v0, %lo(D_800F4F20)($at)
.L800E7798:
/* 7F98 800E7798 1000BF8F */  lw         $ra, 0x10($sp)
/* 7F9C 800E779C 00000000 */  nop
/* 7FA0 800E77A0 0800E003 */  jr         $ra
/* 7FA4 800E77A4 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E77A8
/* 7FA8 800E77A8 0F80013C */  lui        $at, %hi(D_800F4DDC)
/* 7FAC 800E77AC DC4D24AC */  sw         $a0, %lo(D_800F4DDC)($at)
/* 7FB0 800E77B0 0800E003 */  jr         $ra
/* 7FB4 800E77B4 00000000 */   nop
glabel func_800E77B8
/* 7FB8 800E77B8 0F80023C */  lui        $v0, %hi(D_800F4DDC)
/* 7FBC 800E77BC DC4D428C */  lw         $v0, %lo(D_800F4DDC)($v0)
/* 7FC0 800E77C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 7FC4 800E77C4 03004010 */  beqz       $v0, .L800E77D4
/* 7FC8 800E77C8 1000BFAF */   sw        $ra, 0x10($sp)
/* 7FCC 800E77CC 09F84000 */  jalr       $v0
/* 7FD0 800E77D0 00000000 */   nop
.L800E77D4:
/* 7FD4 800E77D4 1000BF8F */  lw         $ra, 0x10($sp)
/* 7FD8 800E77D8 00000000 */  nop
/* 7FDC 800E77DC 0800E003 */  jr         $ra
/* 7FE0 800E77E0 1800BD27 */   addiu     $sp, $sp, 0x18
glabel func_800E77E4
/* 7FE4 800E77E4 30FFBD27 */  addiu      $sp, $sp, -0xD0
/* 7FE8 800E77E8 CC00BFAF */  sw         $ra, 0xCC($sp)
/* 7FEC 800E77EC C800B4AF */  sw         $s4, 0xC8($sp)
/* 7FF0 800E77F0 C400B3AF */  sw         $s3, 0xC4($sp)
/* 7FF4 800E77F4 C000B2AF */  sw         $s2, 0xC0($sp)
/* 7FF8 800E77F8 BC00B1AF */  sw         $s1, 0xBC($sp)
/* 7FFC 800E77FC B800B0AF */  sw         $s0, 0xB8($sp)
/* 8000 800E7800 21908000 */  addu       $s2, $a0, $zero
/* 8004 800E7804 21A0A000 */  addu       $s4, $a1, $zero
/* 8008 800E7808 21880000 */  addu       $s1, $zero, $zero
.L800E780C:
/* 800C 800E780C EE9D030C */  jal        func_800E77B8
/* 8010 800E7810 00000000 */   nop
/* 8014 800E7814 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8018 800E7818 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 801C 800E781C 21204002 */  addu       $a0, $s2, $zero
/* 8020 800E7820 0F80053C */  lui        $a1, %hi(D_800F4DE0)
/* 8024 800E7824 E04DA524 */  addiu      $a1, $a1, %lo(D_800F4DE0)
/* 8028 800E7828 5C0A428C */  lw         $v0, 0xA5C($v0)
/* 802C 800E782C 9000B027 */  addiu      $s0, $sp, 0x90
/* 8030 800E7830 09F84000 */  jalr       $v0
/* 8034 800E7834 21300002 */   addu      $a2, $s0, $zero
/* 8038 800E7838 20005014 */  bne        $v0, $s0, .L800E78BC
/* 803C 800E783C 21982002 */   addu      $s3, $s1, $zero
/* 8040 800E7840 21804000 */  addu       $s0, $v0, $zero
.L800E7844:
/* 8044 800E7844 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8048 800E7848 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 804C 800E784C A800A38F */  lw         $v1, 0xA8($sp)
/* 8050 800E7850 600A428C */  lw         $v0, 0xA60($v0)
/* 8054 800E7854 21200002 */  addu       $a0, $s0, $zero
/* 8058 800E7858 09F84000 */  jalr       $v0
/* 805C 800E785C 21882302 */   addu      $s1, $s1, $v1
/* 8060 800E7860 F8FF5010 */  beq        $v0, $s0, .L800E7844
/* 8064 800E7864 00000000 */   nop
/* 8068 800E7868 EE9D030C */  jal        func_800E77B8
/* 806C 800E786C 00000000 */   nop
/* 8070 800E7870 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8074 800E7874 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8078 800E7878 21204002 */  addu       $a0, $s2, $zero
/* 807C 800E787C 5C0A428C */  lw         $v0, 0xA5C($v0)
/* 8080 800E7880 21288002 */  addu       $a1, $s4, $zero
/* 8084 800E7884 09F84000 */  jalr       $v0
/* 8088 800E7888 21300002 */   addu      $a2, $s0, $zero
/* 808C 800E788C 0B005014 */  bne        $v0, $s0, .L800E78BC
/* 8090 800E7890 21982002 */   addu      $s3, $s1, $zero
/* 8094 800E7894 21804000 */  addu       $s0, $v0, $zero
.L800E7898:
/* 8098 800E7898 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 809C 800E789C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 80A0 800E78A0 A800A38F */  lw         $v1, 0xA8($sp)
/* 80A4 800E78A4 600A428C */  lw         $v0, 0xA60($v0)
/* 80A8 800E78A8 21200002 */  addu       $a0, $s0, $zero
/* 80AC 800E78AC 09F84000 */  jalr       $v0
/* 80B0 800E78B0 23882302 */   subu      $s1, $s1, $v1
/* 80B4 800E78B4 F8FF5010 */  beq        $v0, $s0, .L800E7898
/* 80B8 800E78B8 21982002 */   addu      $s3, $s1, $zero
.L800E78BC:
/* 80BC 800E78BC EE9D030C */  jal        func_800E77B8
/* 80C0 800E78C0 21880000 */   addu      $s1, $zero, $zero
/* 80C4 800E78C4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 80C8 800E78C8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 80CC 800E78CC 21204002 */  addu       $a0, $s2, $zero
/* 80D0 800E78D0 0F80053C */  lui        $a1, %hi(D_800F4DE0)
/* 80D4 800E78D4 E04DA524 */  addiu      $a1, $a1, %lo(D_800F4DE0)
/* 80D8 800E78D8 5C0A428C */  lw         $v0, 0xA5C($v0)
/* 80DC 800E78DC 9000B027 */  addiu      $s0, $sp, 0x90
/* 80E0 800E78E0 09F84000 */  jalr       $v0
/* 80E4 800E78E4 21300002 */   addu      $a2, $s0, $zero
/* 80E8 800E78E8 20005014 */  bne        $v0, $s0, .L800E796C
/* 80EC 800E78EC 00000000 */   nop
/* 80F0 800E78F0 21804000 */  addu       $s0, $v0, $zero
.L800E78F4:
/* 80F4 800E78F4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 80F8 800E78F8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 80FC 800E78FC A800A38F */  lw         $v1, 0xA8($sp)
/* 8100 800E7900 600A428C */  lw         $v0, 0xA60($v0)
/* 8104 800E7904 21200002 */  addu       $a0, $s0, $zero
/* 8108 800E7908 09F84000 */  jalr       $v0
/* 810C 800E790C 21882302 */   addu      $s1, $s1, $v1
/* 8110 800E7910 F8FF5010 */  beq        $v0, $s0, .L800E78F4
/* 8114 800E7914 00000000 */   nop
/* 8118 800E7918 EE9D030C */  jal        func_800E77B8
/* 811C 800E791C 00000000 */   nop
/* 8120 800E7920 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8124 800E7924 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8128 800E7928 21204002 */  addu       $a0, $s2, $zero
/* 812C 800E792C 5C0A428C */  lw         $v0, 0xA5C($v0)
/* 8130 800E7930 21288002 */  addu       $a1, $s4, $zero
/* 8134 800E7934 09F84000 */  jalr       $v0
/* 8138 800E7938 21300002 */   addu      $a2, $s0, $zero
/* 813C 800E793C 0B005014 */  bne        $v0, $s0, .L800E796C
/* 8140 800E7940 00000000 */   nop
/* 8144 800E7944 21804000 */  addu       $s0, $v0, $zero
.L800E7948:
/* 8148 800E7948 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 814C 800E794C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8150 800E7950 A800A38F */  lw         $v1, 0xA8($sp)
/* 8154 800E7954 600A428C */  lw         $v0, 0xA60($v0)
/* 8158 800E7958 21200002 */  addu       $a0, $s0, $zero
/* 815C 800E795C 09F84000 */  jalr       $v0
/* 8160 800E7960 23882302 */   subu      $s1, $s1, $v1
/* 8164 800E7964 F8FF5010 */  beq        $v0, $s0, .L800E7948
/* 8168 800E7968 00000000 */   nop
.L800E796C:
/* 816C 800E796C A7FF7116 */  bne        $s3, $s1, .L800E780C
/* 8170 800E7970 0100023C */   lui       $v0, (0x1E000 >> 16)
/* 8174 800E7974 00E04234 */  ori        $v0, $v0, (0x1E000 & 0xFFFF)
/* 8178 800E7978 23105100 */  subu       $v0, $v0, $s1
/* 817C 800E797C CC00BF8F */  lw         $ra, 0xCC($sp)
/* 8180 800E7980 C800B48F */  lw         $s4, 0xC8($sp)
/* 8184 800E7984 C400B38F */  lw         $s3, 0xC4($sp)
/* 8188 800E7988 C000B28F */  lw         $s2, 0xC0($sp)
/* 818C 800E798C BC00B18F */  lw         $s1, 0xBC($sp)
/* 8190 800E7990 B800B08F */  lw         $s0, 0xB8($sp)
/* 8194 800E7994 0800E003 */  jr         $ra
/* 8198 800E7998 D000BD27 */   addiu     $sp, $sp, 0xD0
glabel func_800E799C
/* 819C 800E799C 48FEBD27 */  addiu      $sp, $sp, -0x1B8
/* 81A0 800E79A0 B001BFAF */  sw         $ra, 0x1B0($sp)
/* 81A4 800E79A4 AC01B5AF */  sw         $s5, 0x1AC($sp)
/* 81A8 800E79A8 A801B4AF */  sw         $s4, 0x1A8($sp)
/* 81AC 800E79AC A401B3AF */  sw         $s3, 0x1A4($sp)
/* 81B0 800E79B0 A001B2AF */  sw         $s2, 0x1A0($sp)
/* 81B4 800E79B4 9C01B1AF */  sw         $s1, 0x19C($sp)
/* 81B8 800E79B8 9801B0AF */  sw         $s0, 0x198($sp)
/* 81BC 800E79BC 21908000 */  addu       $s2, $a0, $zero
/* 81C0 800E79C0 2180A000 */  addu       $s0, $a1, $zero
/* 81C4 800E79C4 21A8C000 */  addu       $s5, $a2, $zero
/* 81C8 800E79C8 C801B38F */  lw         $s3, 0x1C8($sp)
/* 81CC 800E79CC 21A0E000 */  addu       $s4, $a3, $zero
/* 81D0 800E79D0 06000006 */  bltz       $s0, .L800E79EC
/* 81D4 800E79D4 30001134 */   ori       $s1, $zero, 0x30
/* 81D8 800E79D8 0300A228 */  slti       $v0, $a1, 0x3
/* 81DC 800E79DC 04004014 */  bnez       $v0, .L800E79F0
/* 81E0 800E79E0 00000000 */   nop
/* 81E4 800E79E4 7C9E0308 */  j          .L800E79F0
/* 81E8 800E79E8 02000534 */   ori       $a1, $zero, 0x2
.L800E79EC:
/* 81EC 800E79EC 21280000 */  addu       $a1, $zero, $zero
.L800E79F0:
/* 81F0 800E79F0 0F80043C */  lui        $a0, %hi(D_800F4F20)
/* 81F4 800E79F4 204F848C */  lw         $a0, %lo(D_800F4F20)($a0)
/* 81F8 800E79F8 2180A000 */  addu       $s0, $a1, $zero
/* 81FC 800E79FC 5E9F030C */  jal        func_800E7D78
/* 8200 800E7A00 1800A527 */   addiu     $a1, $sp, 0x18
/* 8204 800E7A04 0F80043C */  lui        $a0, %hi(D_800F4F20)
/* 8208 800E7A08 204F848C */  lw         $a0, %lo(D_800F4F20)($a0)
/* 820C 800E7A0C DE9F030C */  jal        func_800E7F78
/* 8210 800E7A10 21883002 */   addu      $s1, $s1, $s0
/* 8214 800E7A14 1800A527 */  addiu      $a1, $sp, 0x18
/* 8218 800E7A18 2118A200 */  addu       $v1, $a1, $v0
/* 821C 800E7A1C 000071A0 */  sb         $s1, 0x0($v1)
/* 8220 800E7A20 1900A327 */  addiu      $v1, $sp, 0x19
/* 8224 800E7A24 21186200 */  addu       $v1, $v1, $v0
/* 8228 800E7A28 000060A0 */  sb         $zero, 0x0($v1)
/* 822C 800E7A2C F99D030C */  jal        func_800E77E4
/* 8230 800E7A30 21204002 */   addu      $a0, $s2, $zero
/* 8234 800E7A34 001E4228 */  slti       $v0, $v0, 0x1E00
/* 8238 800E7A38 5E004014 */  bnez       $v0, .L800E7BB4
/* 823C 800E7A3C 21100000 */   addu      $v0, $zero, $zero
/* 8240 800E7A40 0F80043C */  lui        $a0, %hi(D_800F0588)
/* 8244 800E7A44 88058424 */  addiu      $a0, $a0, %lo(D_800F0588)
/* 8248 800E7A48 80101000 */  sll        $v0, $s0, 2
/* 824C 800E7A4C 0F80013C */  lui        $at, %hi(D_800F05B4)
/* 8250 800E7A50 B4052124 */  addiu      $at, $at, %lo(D_800F05B4)
/* 8254 800E7A54 21082200 */  addu       $at, $at, $v0
/* 8258 800E7A58 0000258C */  lw         $a1, 0x0($at)
/* 825C 800E7A5C 1801B027 */  addiu      $s0, $sp, 0x118
/* 8260 800E7A60 699F030C */  jal        func_800E7DA4
/* 8264 800E7A64 21300002 */   addu      $a2, $s0, $zero
/* 8268 800E7A68 06006012 */  beqz       $s3, .L800E7A84
/* 826C 800E7A6C 21200002 */   addu      $a0, $s0, $zero
/* 8270 800E7A70 21286002 */  addu       $a1, $s3, $zero
/* 8274 800E7A74 699F030C */  jal        func_800E7DA4
/* 8278 800E7A78 9800A627 */   addiu     $a2, $sp, 0x98
/* 827C 800E7A7C A39E0308 */  j          .L800E7A8C
/* 8280 800E7A80 00000000 */   nop
.L800E7A84:
/* 8284 800E7A84 5E9F030C */  jal        func_800E7D78
/* 8288 800E7A88 9800A527 */   addiu     $a1, $sp, 0x98
.L800E7A8C:
/* 828C 800E7A8C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8290 800E7A90 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8294 800E7A94 00000000 */  nop
/* 8298 800E7A98 080A428C */  lw         $v0, 0xA08($v0)
/* 829C 800E7A9C 21204002 */  addu       $a0, $s2, $zero
/* 82A0 800E7AA0 09F84000 */  jalr       $v0
/* 82A4 800E7AA4 1800A527 */   addiu     $a1, $sp, 0x18
/* 82A8 800E7AA8 21184000 */  addu       $v1, $v0, $zero
/* 82AC 800E7AAC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 82B0 800E7AB0 2A006210 */  beq        $v1, $v0, .L800E7B5C
/* 82B4 800E7AB4 21204002 */   addu      $a0, $s2, $zero
/* 82B8 800E7AB8 34006004 */  bltz       $v1, .L800E7B8C
/* 82BC 800E7ABC 00000000 */   nop
/* 82C0 800E7AC0 05006010 */  beqz       $v1, .L800E7AD8
/* 82C4 800E7AC4 01000234 */   ori       $v0, $zero, 0x1
/* 82C8 800E7AC8 17006210 */  beq        $v1, $v0, .L800E7B28
/* 82CC 800E7ACC 00000000 */   nop
/* 82D0 800E7AD0 E39E0308 */  j          .L800E7B8C
/* 82D4 800E7AD4 00000000 */   nop
.L800E7AD8:
/* 82D8 800E7AD8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 82DC 800E7ADC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 82E0 800E7AE0 00000000 */  nop
/* 82E4 800E7AE4 080A428C */  lw         $v0, 0xA08($v0)
/* 82E8 800E7AE8 21204002 */  addu       $a0, $s2, $zero
/* 82EC 800E7AEC 09F84000 */  jalr       $v0
/* 82F0 800E7AF0 1800A527 */   addiu     $a1, $sp, 0x18
/* 82F4 800E7AF4 E5FF4014 */  bnez       $v0, .L800E7A8C
/* 82F8 800E7AF8 21204002 */   addu      $a0, $s2, $zero
/* 82FC 800E7AFC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8300 800E7B00 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8304 800E7B04 1800A527 */  addiu      $a1, $sp, 0x18
/* 8308 800E7B08 080D428C */  lw         $v0, 0xD08($v0)
/* 830C 800E7B0C 001E0634 */  ori        $a2, $zero, 0x1E00
/* 8310 800E7B10 09F84000 */  jalr       $v0
/* 8314 800E7B14 9800A727 */   addiu     $a3, $sp, 0x98
/* 8318 800E7B18 03004104 */  bgez       $v0, .L800E7B28
/* 831C 800E7B1C 00000000 */   nop
/* 8320 800E7B20 ED9E0308 */  j          .L800E7BB4
/* 8324 800E7B24 21100000 */   addu      $v0, $zero, $zero
.L800E7B28:
/* 8328 800E7B28 1000B4AF */  sw         $s4, 0x10($sp)
/* 832C 800E7B2C 9800A227 */  addiu      $v0, $sp, 0x98
/* 8330 800E7B30 1400A2AF */  sw         $v0, 0x14($sp)
/* 8334 800E7B34 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8338 800E7B38 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 833C 800E7B3C 21204002 */  addu       $a0, $s2, $zero
/* 8340 800E7B40 1800A527 */  addiu      $a1, $sp, 0x18
/* 8344 800E7B44 040D428C */  lw         $v0, 0xD04($v0)
/* 8348 800E7B48 2130A002 */  addu       $a2, $s5, $zero
/* 834C 800E7B4C 09F84000 */  jalr       $v0
/* 8350 800E7B50 21380000 */   addu      $a3, $zero, $zero
/* 8354 800E7B54 ED9E0308 */  j          .L800E7BB4
/* 8358 800E7B58 2A100200 */   slt       $v0, $zero, $v0
.L800E7B5C:
/* 835C 800E7B5C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8360 800E7B60 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8364 800E7B64 00000000 */  nop
/* 8368 800E7B68 080A428C */  lw         $v0, 0xA08($v0)
/* 836C 800E7B6C 00000000 */  nop
/* 8370 800E7B70 09F84000 */  jalr       $v0
/* 8374 800E7B74 1800A527 */   addiu     $a1, $sp, 0x18
/* 8378 800E7B78 27100200 */  nor        $v0, $zero, $v0
/* 837C 800E7B7C C3FF4014 */  bnez       $v0, .L800E7A8C
/* 8380 800E7B80 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 8384 800E7B84 ED9E0308 */  j          .L800E7BB4
/* 8388 800E7B88 00000000 */   nop
.L800E7B8C:
/* 838C 800E7B8C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8390 800E7B90 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8394 800E7B94 00000000 */  nop
/* 8398 800E7B98 080A428C */  lw         $v0, 0xA08($v0)
/* 839C 800E7B9C 21204002 */  addu       $a0, $s2, $zero
/* 83A0 800E7BA0 09F84000 */  jalr       $v0
/* 83A4 800E7BA4 1800A527 */   addiu     $a1, $sp, 0x18
/* 83A8 800E7BA8 FEFF0324 */  addiu      $v1, $zero, -0x2
/* 83AC 800E7BAC B7FF4314 */  bne        $v0, $v1, .L800E7A8C
/* 83B0 800E7BB0 FEFF0224 */   addiu     $v0, $zero, -0x2
.L800E7BB4:
/* 83B4 800E7BB4 B001BF8F */  lw         $ra, 0x1B0($sp)
/* 83B8 800E7BB8 AC01B58F */  lw         $s5, 0x1AC($sp)
/* 83BC 800E7BBC A801B48F */  lw         $s4, 0x1A8($sp)
/* 83C0 800E7BC0 A401B38F */  lw         $s3, 0x1A4($sp)
/* 83C4 800E7BC4 A001B28F */  lw         $s2, 0x1A0($sp)
/* 83C8 800E7BC8 9C01B18F */  lw         $s1, 0x19C($sp)
/* 83CC 800E7BCC 9801B08F */  lw         $s0, 0x198($sp)
/* 83D0 800E7BD0 0800E003 */  jr         $ra
/* 83D4 800E7BD4 B801BD27 */   addiu     $sp, $sp, 0x1B8
glabel func_800E7BD8
/* 83D8 800E7BD8 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* 83DC 800E7BDC A800BFAF */  sw         $ra, 0xA8($sp)
/* 83E0 800E7BE0 A400B3AF */  sw         $s3, 0xA4($sp)
/* 83E4 800E7BE4 A000B2AF */  sw         $s2, 0xA0($sp)
/* 83E8 800E7BE8 9C00B1AF */  sw         $s1, 0x9C($sp)
/* 83EC 800E7BEC 9800B0AF */  sw         $s0, 0x98($sp)
/* 83F0 800E7BF0 21888000 */  addu       $s1, $a0, $zero
/* 83F4 800E7BF4 2190C000 */  addu       $s2, $a2, $zero
/* 83F8 800E7BF8 2198E000 */  addu       $s3, $a3, $zero
/* 83FC 800E7BFC 0600A004 */  bltz       $a1, .L800E7C18
/* 8400 800E7C00 30001034 */   ori       $s0, $zero, 0x30
/* 8404 800E7C04 0300A228 */  slti       $v0, $a1, 0x3
/* 8408 800E7C08 04004014 */  bnez       $v0, .L800E7C1C
/* 840C 800E7C0C 00000000 */   nop
/* 8410 800E7C10 079F0308 */  j          .L800E7C1C
/* 8414 800E7C14 02000534 */   ori       $a1, $zero, 0x2
.L800E7C18:
/* 8418 800E7C18 21280000 */  addu       $a1, $zero, $zero
.L800E7C1C:
/* 841C 800E7C1C 0F80043C */  lui        $a0, %hi(D_800F4F20)
/* 8420 800E7C20 204F848C */  lw         $a0, %lo(D_800F4F20)($a0)
/* 8424 800E7C24 21800502 */  addu       $s0, $s0, $a1
/* 8428 800E7C28 5E9F030C */  jal        func_800E7D78
/* 842C 800E7C2C 1800A527 */   addiu     $a1, $sp, 0x18
/* 8430 800E7C30 0F80043C */  lui        $a0, %hi(D_800F4F20)
/* 8434 800E7C34 204F848C */  lw         $a0, %lo(D_800F4F20)($a0)
/* 8438 800E7C38 DE9F030C */  jal        func_800E7F78
/* 843C 800E7C3C 00000000 */   nop
/* 8440 800E7C40 1800A327 */  addiu      $v1, $sp, 0x18
/* 8444 800E7C44 21186200 */  addu       $v1, $v1, $v0
/* 8448 800E7C48 000070A0 */  sb         $s0, 0x0($v1)
/* 844C 800E7C4C 1900A327 */  addiu      $v1, $sp, 0x19
/* 8450 800E7C50 21186200 */  addu       $v1, $v1, $v0
/* 8454 800E7C54 000060A0 */  sb         $zero, 0x0($v1)
.L800E7C58:
/* 8458 800E7C58 1000B3AF */  sw         $s3, 0x10($sp)
/* 845C 800E7C5C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8460 800E7C60 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8464 800E7C64 21202002 */  addu       $a0, $s1, $zero
/* 8468 800E7C68 1800A527 */  addiu      $a1, $sp, 0x18
/* 846C 800E7C6C 000D428C */  lw         $v0, 0xD00($v0)
/* 8470 800E7C70 21304002 */  addu       $a2, $s2, $zero
/* 8474 800E7C74 09F84000 */  jalr       $v0
/* 8478 800E7C78 21380000 */   addu      $a3, $zero, $zero
/* 847C 800E7C7C 21804000 */  addu       $s0, $v0, $zero
/* 8480 800E7C80 0E00001E */  bgtz       $s0, .L800E7CBC
/* 8484 800E7C84 01000234 */   ori       $v0, $zero, 0x1
/* 8488 800E7C88 EE9D030C */  jal        func_800E77B8
/* 848C 800E7C8C 00000000 */   nop
/* 8490 800E7C90 1000B3AF */  sw         $s3, 0x10($sp)
/* 8494 800E7C94 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8498 800E7C98 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 849C 800E7C9C 21202002 */  addu       $a0, $s1, $zero
/* 84A0 800E7CA0 1800A527 */  addiu      $a1, $sp, 0x18
/* 84A4 800E7CA4 000D428C */  lw         $v0, 0xD00($v0)
/* 84A8 800E7CA8 21304002 */  addu       $a2, $s2, $zero
/* 84AC 800E7CAC 09F84000 */  jalr       $v0
/* 84B0 800E7CB0 21380000 */   addu      $a3, $zero, $zero
/* 84B4 800E7CB4 E8FF401C */  bgtz       $v0, .L800E7C58
/* 84B8 800E7CB8 21100002 */   addu      $v0, $s0, $zero
.L800E7CBC:
/* 84BC 800E7CBC A800BF8F */  lw         $ra, 0xA8($sp)
/* 84C0 800E7CC0 A400B38F */  lw         $s3, 0xA4($sp)
/* 84C4 800E7CC4 A000B28F */  lw         $s2, 0xA0($sp)
/* 84C8 800E7CC8 9C00B18F */  lw         $s1, 0x9C($sp)
/* 84CC 800E7CCC 9800B08F */  lw         $s0, 0x98($sp)
/* 84D0 800E7CD0 0800E003 */  jr         $ra
/* 84D4 800E7CD4 B000BD27 */   addiu     $sp, $sp, 0xB0
glabel func_800E7CD8
/* 84D8 800E7CD8 60FFBD27 */  addiu      $sp, $sp, -0xA0
/* 84DC 800E7CDC 9800BFAF */  sw         $ra, 0x98($sp)
/* 84E0 800E7CE0 9400B1AF */  sw         $s1, 0x94($sp)
/* 84E4 800E7CE4 9000B0AF */  sw         $s0, 0x90($sp)
/* 84E8 800E7CE8 21888000 */  addu       $s1, $a0, $zero
/* 84EC 800E7CEC 0600A004 */  bltz       $a1, .L800E7D08
/* 84F0 800E7CF0 30001034 */   ori       $s0, $zero, 0x30
/* 84F4 800E7CF4 0300A228 */  slti       $v0, $a1, 0x3
/* 84F8 800E7CF8 04004014 */  bnez       $v0, .L800E7D0C
/* 84FC 800E7CFC 00000000 */   nop
/* 8500 800E7D00 439F0308 */  j          .L800E7D0C
/* 8504 800E7D04 02000534 */   ori       $a1, $zero, 0x2
.L800E7D08:
/* 8508 800E7D08 21280000 */  addu       $a1, $zero, $zero
.L800E7D0C:
/* 850C 800E7D0C 0F80043C */  lui        $a0, %hi(D_800F4F20)
/* 8510 800E7D10 204F848C */  lw         $a0, %lo(D_800F4F20)($a0)
/* 8514 800E7D14 21800502 */  addu       $s0, $s0, $a1
/* 8518 800E7D18 5E9F030C */  jal        func_800E7D78
/* 851C 800E7D1C 1000A527 */   addiu     $a1, $sp, 0x10
/* 8520 800E7D20 0F80043C */  lui        $a0, %hi(D_800F4F20)
/* 8524 800E7D24 204F848C */  lw         $a0, %lo(D_800F4F20)($a0)
/* 8528 800E7D28 DE9F030C */  jal        func_800E7F78
/* 852C 800E7D2C 00000000 */   nop
/* 8530 800E7D30 1000A527 */  addiu      $a1, $sp, 0x10
/* 8534 800E7D34 2118A200 */  addu       $v1, $a1, $v0
/* 8538 800E7D38 000070A0 */  sb         $s0, 0x0($v1)
/* 853C 800E7D3C 1100A327 */  addiu      $v1, $sp, 0x11
/* 8540 800E7D40 21186200 */  addu       $v1, $v1, $v0
/* 8544 800E7D44 000060A0 */  sb         $zero, 0x0($v1)
/* 8548 800E7D48 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 854C 800E7D4C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8550 800E7D50 00000000 */  nop
/* 8554 800E7D54 580A428C */  lw         $v0, 0xA58($v0)
/* 8558 800E7D58 00000000 */  nop
/* 855C 800E7D5C 09F84000 */  jalr       $v0
/* 8560 800E7D60 21202002 */   addu      $a0, $s1, $zero
/* 8564 800E7D64 9800BF8F */  lw         $ra, 0x98($sp)
/* 8568 800E7D68 9400B18F */  lw         $s1, 0x94($sp)
/* 856C 800E7D6C 9000B08F */  lw         $s0, 0x90($sp)
/* 8570 800E7D70 0800E003 */  jr         $ra
/* 8574 800E7D74 A000BD27 */   addiu     $sp, $sp, 0xA0
glabel func_800E7D78
/* 8578 800E7D78 00008290 */  lbu        $v0, 0x0($a0)
/* 857C 800E7D7C 00000000 */  nop
/* 8580 800E7D80 06004010 */  beqz       $v0, .L800E7D9C
/* 8584 800E7D84 01008424 */   addiu     $a0, $a0, 0x1
.L800E7D88:
/* 8588 800E7D88 0000A2A0 */  sb         $v0, 0x0($a1)
/* 858C 800E7D8C 00008290 */  lbu        $v0, 0x0($a0)
/* 8590 800E7D90 0100A524 */  addiu      $a1, $a1, 0x1
/* 8594 800E7D94 FCFF4014 */  bnez       $v0, .L800E7D88
/* 8598 800E7D98 01008424 */   addiu     $a0, $a0, 0x1
.L800E7D9C:
/* 859C 800E7D9C 0800E003 */  jr         $ra
/* 85A0 800E7DA0 0000A0A0 */   sb        $zero, 0x0($a1)
glabel func_800E7DA4
/* 85A4 800E7DA4 00008290 */  lbu        $v0, 0x0($a0)
/* 85A8 800E7DA8 00000000 */  nop
/* 85AC 800E7DAC 06004010 */  beqz       $v0, .L800E7DC8
/* 85B0 800E7DB0 01008424 */   addiu     $a0, $a0, 0x1
.L800E7DB4:
/* 85B4 800E7DB4 0000C2A0 */  sb         $v0, 0x0($a2)
/* 85B8 800E7DB8 00008290 */  lbu        $v0, 0x0($a0)
/* 85BC 800E7DBC 0100C624 */  addiu      $a2, $a2, 0x1
/* 85C0 800E7DC0 FCFF4014 */  bnez       $v0, .L800E7DB4
/* 85C4 800E7DC4 01008424 */   addiu     $a0, $a0, 0x1
.L800E7DC8:
/* 85C8 800E7DC8 0000A290 */  lbu        $v0, 0x0($a1)
/* 85CC 800E7DCC 00000000 */  nop
/* 85D0 800E7DD0 06004010 */  beqz       $v0, .L800E7DEC
/* 85D4 800E7DD4 0100A524 */   addiu     $a1, $a1, 0x1
.L800E7DD8:
/* 85D8 800E7DD8 0000C2A0 */  sb         $v0, 0x0($a2)
/* 85DC 800E7DDC 0000A290 */  lbu        $v0, 0x0($a1)
/* 85E0 800E7DE0 0100C624 */  addiu      $a2, $a2, 0x1
/* 85E4 800E7DE4 FCFF4014 */  bnez       $v0, .L800E7DD8
/* 85E8 800E7DE8 0100A524 */   addiu     $a1, $a1, 0x1
.L800E7DEC:
/* 85EC 800E7DEC 0800E003 */  jr         $ra
/* 85F0 800E7DF0 0000C0A0 */   sb        $zero, 0x0($a2)
/* 85F4 800E7DF4 00008390 */  lbu        $v1, 0x0($a0)
/* 85F8 800E7DF8 21100000 */  addu       $v0, $zero, $zero
/* 85FC 800E7DFC 09006010 */  beqz       $v1, .L800E7E24
/* 8600 800E7E00 01008424 */   addiu     $a0, $a0, 0x1
/* 8604 800E7E04 FF00A530 */  andi       $a1, $a1, 0xFF
.L800E7E08:
/* 8608 800E7E08 0200A314 */  bne        $a1, $v1, .L800E7E14
/* 860C 800E7E0C 00000000 */   nop
/* 8610 800E7E10 01000234 */  ori        $v0, $zero, 0x1
.L800E7E14:
/* 8614 800E7E14 00008390 */  lbu        $v1, 0x0($a0)
/* 8618 800E7E18 00000000 */  nop
/* 861C 800E7E1C FAFF6014 */  bnez       $v1, .L800E7E08
/* 8620 800E7E20 01008424 */   addiu     $a0, $a0, 0x1
.L800E7E24:
/* 8624 800E7E24 0800E003 */  jr         $ra
/* 8628 800E7E28 00000000 */   nop
/* 862C 800E7E2C 00008390 */  lbu        $v1, 0x0($a0)
/* 8630 800E7E30 00000000 */  nop
/* 8634 800E7E34 0B006010 */  beqz       $v1, .L800E7E64
/* 8638 800E7E38 01008424 */   addiu     $a0, $a0, 0x1
.L800E7E3C:
/* 863C 800E7E3C 9FFF6224 */  addiu      $v0, $v1, -0x61
/* 8640 800E7E40 1A00422C */  sltiu      $v0, $v0, 0x1A
/* 8644 800E7E44 02004010 */  beqz       $v0, .L800E7E50
/* 8648 800E7E48 00000000 */   nop
/* 864C 800E7E4C DF006330 */  andi       $v1, $v1, 0xDF
.L800E7E50:
/* 8650 800E7E50 0000A3A0 */  sb         $v1, 0x0($a1)
/* 8654 800E7E54 00008390 */  lbu        $v1, 0x0($a0)
/* 8658 800E7E58 0100A524 */  addiu      $a1, $a1, 0x1
/* 865C 800E7E5C F7FF6014 */  bnez       $v1, .L800E7E3C
/* 8660 800E7E60 01008424 */   addiu     $a0, $a0, 0x1
.L800E7E64:
/* 8664 800E7E64 0800E003 */  jr         $ra
/* 8668 800E7E68 0000A0A0 */   sb        $zero, 0x0($a1)
/* 866C 800E7E6C 00008390 */  lbu        $v1, 0x0($a0)
/* 8670 800E7E70 21100000 */  addu       $v0, $zero, $zero
/* 8674 800E7E74 05006010 */  beqz       $v1, .L800E7E8C
/* 8678 800E7E78 01008424 */   addiu     $a0, $a0, 0x1
.L800E7E7C:
/* 867C 800E7E7C 00008390 */  lbu        $v1, 0x0($a0)
/* 8680 800E7E80 01008424 */  addiu      $a0, $a0, 0x1
/* 8684 800E7E84 FDFF6014 */  bnez       $v1, .L800E7E7C
/* 8688 800E7E88 01004224 */   addiu     $v0, $v0, 0x1
.L800E7E8C:
/* 868C 800E7E8C 0800E003 */  jr         $ra
/* 8690 800E7E90 00000000 */   nop
/* 8694 800E7E94 00008390 */  lbu        $v1, 0x0($a0)
/* 8698 800E7E98 00000000 */  nop
/* 869C 800E7E9C 0A006010 */  beqz       $v1, .L800E7EC8
/* 86A0 800E7EA0 01008224 */   addiu     $v0, $a0, 0x1
/* 86A4 800E7EA4 5C000634 */  ori        $a2, $zero, 0x5C
.L800E7EA8:
/* 86A8 800E7EA8 02006614 */  bne        $v1, $a2, .L800E7EB4
/* 86AC 800E7EAC 00000000 */   nop
/* 86B0 800E7EB0 21204000 */  addu       $a0, $v0, $zero
.L800E7EB4:
/* 86B4 800E7EB4 00004390 */  lbu        $v1, 0x0($v0)
/* 86B8 800E7EB8 00000000 */  nop
/* 86BC 800E7EBC FAFF6014 */  bnez       $v1, .L800E7EA8
/* 86C0 800E7EC0 01004224 */   addiu     $v0, $v0, 0x1
/* 86C4 800E7EC4 00008390 */  lbu        $v1, 0x0($a0)
.L800E7EC8:
/* 86C8 800E7EC8 00000000 */  nop
/* 86CC 800E7ECC 06006010 */  beqz       $v1, .L800E7EE8
/* 86D0 800E7ED0 01008424 */   addiu     $a0, $a0, 0x1
.L800E7ED4:
/* 86D4 800E7ED4 0000A3A0 */  sb         $v1, 0x0($a1)
/* 86D8 800E7ED8 00008390 */  lbu        $v1, 0x0($a0)
/* 86DC 800E7EDC 0100A524 */  addiu      $a1, $a1, 0x1
/* 86E0 800E7EE0 FCFF6014 */  bnez       $v1, .L800E7ED4
/* 86E4 800E7EE4 01008424 */   addiu     $a0, $a0, 0x1
.L800E7EE8:
/* 86E8 800E7EE8 0800E003 */  jr         $ra
/* 86EC 800E7EEC 0000A0A0 */   sb        $zero, 0x0($a1)
/* 86F0 800E7EF0 0D008018 */  blez       $a0, .L800E7F28
/* 86F4 800E7EF4 01000734 */   ori       $a3, $zero, 0x1
/* 86F8 800E7EF8 01000834 */  ori        $t0, $zero, 0x1
.L800E7EFC:
/* 86FC 800E7EFC 0000A390 */  lbu        $v1, 0x0($a1)
/* 8700 800E7F00 0000C290 */  lbu        $v0, 0x0($a2)
/* 8704 800E7F04 00000000 */  nop
/* 8708 800E7F08 02006210 */  beq        $v1, $v0, .L800E7F14
/* 870C 800E7F0C 0100A524 */   addiu     $a1, $a1, 0x1
/* 8710 800E7F10 21380000 */  addu       $a3, $zero, $zero
.L800E7F14:
/* 8714 800E7F14 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 8718 800E7F18 03008018 */  blez       $a0, .L800E7F28
/* 871C 800E7F1C 0100C624 */   addiu     $a2, $a2, 0x1
/* 8720 800E7F20 F6FFE810 */  beq        $a3, $t0, .L800E7EFC
/* 8724 800E7F24 00000000 */   nop
.L800E7F28:
/* 8728 800E7F28 0800E003 */  jr         $ra
/* 872C 800E7F2C 2110E000 */   addu      $v0, $a3, $zero
/* 8730 800E7F30 07008018 */  blez       $a0, .L800E7F50
/* 8734 800E7F34 00000000 */   nop
.L800E7F38:
/* 8738 800E7F38 0000A290 */  lbu        $v0, 0x0($a1)
/* 873C 800E7F3C 0100A524 */  addiu      $a1, $a1, 0x1
/* 8740 800E7F40 FFFF8424 */  addiu      $a0, $a0, -0x1
/* 8744 800E7F44 0000C2A0 */  sb         $v0, 0x0($a2)
/* 8748 800E7F48 FBFF801C */  bgtz       $a0, .L800E7F38
/* 874C 800E7F4C 0100C624 */   addiu     $a2, $a2, 0x1
.L800E7F50:
/* 8750 800E7F50 0800E003 */  jr         $ra
/* 8754 800E7F54 00000000 */   nop
/* 8758 800E7F58 0500A018 */  blez       $a1, .L800E7F70
/* 875C 800E7F5C 00000000 */   nop
.L800E7F60:
/* 8760 800E7F60 000086A0 */  sb         $a2, 0x0($a0)
/* 8764 800E7F64 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 8768 800E7F68 FDFFA01C */  bgtz       $a1, .L800E7F60
/* 876C 800E7F6C 01008424 */   addiu     $a0, $a0, 0x1
.L800E7F70:
/* 8770 800E7F70 0800E003 */  jr         $ra
/* 8774 800E7F74 00000000 */   nop
glabel func_800E7F78
/* 8778 800E7F78 00008290 */  lbu        $v0, 0x0($a0)
/* 877C 800E7F7C 21180000 */  addu       $v1, $zero, $zero
/* 8780 800E7F80 05004010 */  beqz       $v0, .L800E7F98
/* 8784 800E7F84 01008424 */   addiu     $a0, $a0, 0x1
.L800E7F88:
/* 8788 800E7F88 00008290 */  lbu        $v0, 0x0($a0)
/* 878C 800E7F8C 01006324 */  addiu      $v1, $v1, 0x1
/* 8790 800E7F90 FDFF4014 */  bnez       $v0, .L800E7F88
/* 8794 800E7F94 01008424 */   addiu     $a0, $a0, 0x1
.L800E7F98:
/* 8798 800E7F98 0800E003 */  jr         $ra
/* 879C 800E7F9C 21106000 */   addu      $v0, $v1, $zero
D_800E7FA0:
/* 87A0 800E7FA0 00000180 */  lb         $at, 0x0($zero)
glabel func_800E7FA4
/* 87A4 800E7FA4 FCFFBD23 */  addi       $sp, $sp, -0x4 # handwritten instruction
/* 87A8 800E7FA8 0000BFAF */  sw         $ra, 0x0($sp)
/* 87AC 800E7FAC 0080043C */  lui        $a0, (0x80000000 >> 16)
/* 87B0 800E7FB0 0C000000 */  syscall    0
/* 87B4 800E7FB4 03004010 */  beqz       $v0, .L800E7FC4
/* 87B8 800E7FB8 00000000 */   nop
/* 87BC 800E7FBC 09F84000 */  jalr       $v0
/* 87C0 800E7FC0 00000000 */   nop
.L800E7FC4:
/* 87C4 800E7FC4 0000BF8F */  lw         $ra, 0x0($sp)
/* 87C8 800E7FC8 0400BD23 */  addi       $sp, $sp, 0x4 # handwritten instruction
/* 87CC 800E7FCC 0800E003 */  jr         $ra
/* 87D0 800E7FD0 00000000 */   nop
glabel func_800E7FD4
/* 87D4 800E7FD4 0800E003 */  jr         $ra
/* 87D8 800E7FD8 00000000 */   nop
/* 87DC 800E7FDC 0F801C3C */  lui        $gp, (0x800F0000 >> 16)
/* 87E0 800E7FE0 204C9C27 */  addiu      $gp, $gp, 0x4C20
/* 87E4 800E7FE4 94900308 */  j          func_800E4250
/* 87E8 800E7FE8 00000000 */   nop
glabel func_800E7FEC
/* 87EC 800E7FEC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 87F0 800E7FF0 1800BFAF */  sw         $ra, 0x18($sp)
/* 87F4 800E7FF4 1400B1AF */  sw         $s1, 0x14($sp)
/* 87F8 800E7FF8 1000B0AF */  sw         $s0, 0x10($sp)
/* 87FC 800E7FFC 2188A000 */  addu       $s1, $a1, $zero
/* 8800 800E8000 CCA8030C */  jal        func_800EA330
/* 8804 800E8004 801F053C */   lui       $a1, (0x1F800000 >> 16)
/* 8808 800E8008 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 880C 800E800C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8810 800E8010 00000000 */  nop
/* 8814 800E8014 2400428C */  lw         $v0, 0x24($v0)
/* 8818 800E8018 00000000 */  nop
/* 881C 800E801C 09F84000 */  jalr       $v0
/* 8820 800E8020 801F103C */   lui       $s0, (0x1F800000 >> 16)
/* 8824 800E8024 07004010 */  beqz       $v0, .L800E8044
/* 8828 800E8028 00000000 */   nop
/* 882C 800E802C 0F80053C */  lui        $a1, %hi(D_800F05D0)
/* 8830 800E8030 D005A524 */  addiu      $a1, $a1, %lo(D_800F05D0)
/* 8834 800E8034 8FA4030C */  jal        func_800E923C
/* 8838 800E8038 801F043C */   lui       $a0, (0x1F800000 >> 16)
/* 883C 800E803C 15A00308 */  j          .L800E8054
/* 8840 800E8040 00000000 */   nop
.L800E8044:
/* 8844 800E8044 0F80053C */  lui        $a1, %hi(D_800F05C0)
/* 8848 800E8048 C005A524 */  addiu      $a1, $a1, %lo(D_800F05C0)
/* 884C 800E804C 8FA4030C */  jal        func_800E923C
/* 8850 800E8050 801F043C */   lui       $a0, (0x1F800000 >> 16)
.L800E8054:
/* 8854 800E8054 21A5030C */  jal        func_800E9484
/* 8858 800E8058 21200002 */   addu      $a0, $s0, $zero
/* 885C 800E805C 21200002 */  addu       $a0, $s0, $zero
/* 8860 800E8060 86A4030C */  jal        func_800E9218
/* 8864 800E8064 21282002 */   addu      $a1, $s1, $zero
/* 8868 800E8068 45A5030C */  jal        func_800E9514
/* 886C 800E806C 21200002 */   addu      $a0, $s0, $zero
/* 8870 800E8070 1800BF8F */  lw         $ra, 0x18($sp)
/* 8874 800E8074 1400B18F */  lw         $s1, 0x14($sp)
/* 8878 800E8078 1000B08F */  lw         $s0, 0x10($sp)
/* 887C 800E807C 0800E003 */  jr         $ra
/* 8880 800E8080 2000BD27 */   addiu     $sp, $sp, 0x20
