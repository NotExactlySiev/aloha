.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FC5C
/* 845C 8001FC5C 0480043C */  lui        $a0, %hi(D_80047FB4)
/* 8460 8001FC60 B47F848C */  lw         $a0, %lo(D_80047FB4)($a0)
/* 8464 8001FC64 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8468 8001FC68 1400BFAF */  sw         $ra, 0x14($sp)
/* 846C 8001FC6C 028F000C */  jal        func_80023C08
/* 8470 8001FC70 1000B0AF */   sw        $s0, 0x10($sp)
/* 8474 8001FC74 01001034 */  ori        $s0, $zero, 0x1
/* 8478 8001FC78 1A005010 */  beq        $v0, $s0, .L8001FCE4
/* 847C 8001FC7C 04000234 */   ori       $v0, $zero, 0x4
/* 8480 8001FC80 0480043C */  lui        $a0, %hi(D_80047FBC)
/* 8484 8001FC84 BC7F848C */  lw         $a0, %lo(D_80047FBC)($a0)
/* 8488 8001FC88 028F000C */  jal        func_80023C08
/* 848C 8001FC8C 00000000 */   nop
/* 8490 8001FC90 14005010 */  beq        $v0, $s0, .L8001FCE4
/* 8494 8001FC94 00800234 */   ori       $v0, $zero, 0x8000
/* 8498 8001FC98 0480043C */  lui        $a0, %hi(D_80047FC4)
/* 849C 8001FC9C C47F848C */  lw         $a0, %lo(D_80047FC4)($a0)
/* 84A0 8001FCA0 028F000C */  jal        func_80023C08
/* 84A4 8001FCA4 00000000 */   nop
/* 84A8 8001FCA8 0E005010 */  beq        $v0, $s0, .L8001FCE4
/* 84AC 8001FCAC 00010234 */   ori       $v0, $zero, 0x100
/* 84B0 8001FCB0 0480043C */  lui        $a0, %hi(D_80047FCC)
/* 84B4 8001FCB4 CC7F848C */  lw         $a0, %lo(D_80047FCC)($a0)
/* 84B8 8001FCB8 028F000C */  jal        func_80023C08
/* 84BC 8001FCBC 00000000 */   nop
/* 84C0 8001FCC0 08005010 */  beq        $v0, $s0, .L8001FCE4
/* 84C4 8001FCC4 00200234 */   ori       $v0, $zero, 0x2000
/* 84C8 8001FCC8 0480043C */  lui        $a0, %hi(D_80047FD4)
/* 84CC 8001FCCC D47F848C */  lw         $a0, %lo(D_80047FD4)($a0)
/* 84D0 8001FCD0 028F000C */  jal        func_80023C08
/* 84D4 8001FCD4 00000000 */   nop
/* 84D8 8001FCD8 01004238 */  xori       $v0, $v0, 0x1
/* 84DC 8001FCDC 0100422C */  sltiu      $v0, $v0, 0x1
/* 84E0 8001FCE0 40120200 */  sll        $v0, $v0, 9
.L8001FCE4:
/* 84E4 8001FCE4 1400BF8F */  lw         $ra, 0x14($sp)
/* 84E8 8001FCE8 1000B08F */  lw         $s0, 0x10($sp)
/* 84EC 8001FCEC 0800E003 */  jr         $ra
/* 84F0 8001FCF0 1800BD27 */   addiu     $sp, $sp, 0x18
