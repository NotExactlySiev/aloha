.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FCF4
/* 84F4 8001FCF4 0480043C */  lui        $a0, %hi(D_80047FDC)
/* 84F8 8001FCF8 DC7F848C */  lw         $a0, %lo(D_80047FDC)($a0)
/* 84FC 8001FCFC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8500 8001FD00 1400BFAF */  sw         $ra, 0x14($sp)
/* 8504 8001FD04 028F000C */  jal        func_80023C08
/* 8508 8001FD08 1000B0AF */   sw        $s0, 0x10($sp)
/* 850C 8001FD0C 01001034 */  ori        $s0, $zero, 0x1
/* 8510 8001FD10 1A005010 */  beq        $v0, $s0, .L8001FD7C
/* 8514 8001FD14 04000234 */   ori       $v0, $zero, 0x4
/* 8518 8001FD18 0480043C */  lui        $a0, %hi(D_80047FE4)
/* 851C 8001FD1C E47F848C */  lw         $a0, %lo(D_80047FE4)($a0)
/* 8520 8001FD20 028F000C */  jal        func_80023C08
/* 8524 8001FD24 00000000 */   nop
/* 8528 8001FD28 14005010 */  beq        $v0, $s0, .L8001FD7C
/* 852C 8001FD2C 00800234 */   ori       $v0, $zero, 0x8000
/* 8530 8001FD30 0480043C */  lui        $a0, %hi(D_80047FEC)
/* 8534 8001FD34 EC7F848C */  lw         $a0, %lo(D_80047FEC)($a0)
/* 8538 8001FD38 028F000C */  jal        func_80023C08
/* 853C 8001FD3C 00000000 */   nop
/* 8540 8001FD40 0E005010 */  beq        $v0, $s0, .L8001FD7C
/* 8544 8001FD44 00010234 */   ori       $v0, $zero, 0x100
/* 8548 8001FD48 0480043C */  lui        $a0, %hi(D_80047FF4)
/* 854C 8001FD4C F47F848C */  lw         $a0, %lo(D_80047FF4)($a0)
/* 8550 8001FD50 028F000C */  jal        func_80023C08
/* 8554 8001FD54 00000000 */   nop
/* 8558 8001FD58 08005010 */  beq        $v0, $s0, .L8001FD7C
/* 855C 8001FD5C 00200234 */   ori       $v0, $zero, 0x2000
/* 8560 8001FD60 0480043C */  lui        $a0, %hi(D_80047FFC)
/* 8564 8001FD64 FC7F848C */  lw         $a0, %lo(D_80047FFC)($a0)
/* 8568 8001FD68 028F000C */  jal        func_80023C08
/* 856C 8001FD6C 00000000 */   nop
/* 8570 8001FD70 01004238 */  xori       $v0, $v0, 0x1
/* 8574 8001FD74 0100422C */  sltiu      $v0, $v0, 0x1
/* 8578 8001FD78 40120200 */  sll        $v0, $v0, 9
.L8001FD7C:
/* 857C 8001FD7C 1400BF8F */  lw         $ra, 0x14($sp)
/* 8580 8001FD80 1000B08F */  lw         $s0, 0x10($sp)
/* 8584 8001FD84 0800E003 */  jr         $ra
/* 8588 8001FD88 1800BD27 */   addiu     $sp, $sp, 0x18
