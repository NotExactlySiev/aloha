.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E23C8
/* 2BC8 800E23C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2BCC 800E23CC 02000234 */  ori        $v0, $zero, 0x2
/* 2BD0 800E23D0 13008210 */  beq        $a0, $v0, .L800E2420
/* 2BD4 800E23D4 1000BFAF */   sw        $ra, 0x10($sp)
/* 2BD8 800E23D8 03008228 */  slti       $v0, $a0, 0x3
/* 2BDC 800E23DC 05004010 */  beqz       $v0, .L800E23F4
/* 2BE0 800E23E0 01000234 */   ori       $v0, $zero, 0x1
/* 2BE4 800E23E4 08008210 */  beq        $a0, $v0, .L800E2408
/* 2BE8 800E23E8 00000000 */   nop
/* 2BEC 800E23EC 0A890308 */  j          .L800E2428
/* 2BF0 800E23F0 00000000 */   nop
.L800E23F4:
/* 2BF4 800E23F4 03000234 */  ori        $v0, $zero, 0x3
/* 2BF8 800E23F8 07008210 */  beq        $a0, $v0, .L800E2418
/* 2BFC 800E23FC 00000000 */   nop
/* 2C00 800E2400 0A890308 */  j          .L800E2428
/* 2C04 800E2404 00000000 */   nop
.L800E2408:
/* 2C08 800E2408 A395030C */  jal        func_800E568C
/* 2C0C 800E240C B6000434 */   ori       $a0, $zero, 0xB6
/* 2C10 800E2410 0A890308 */  j          .L800E2428
/* 2C14 800E2414 00000000 */   nop
.L800E2418:
/* 2C18 800E2418 A395030C */  jal        func_800E568C
/* 2C1C 800E241C B6000434 */   ori       $a0, $zero, 0xB6
.L800E2420:
/* 2C20 800E2420 A395030C */  jal        func_800E568C
/* 2C24 800E2424 B5000434 */   ori       $a0, $zero, 0xB5
.L800E2428:
/* 2C28 800E2428 1000BF8F */  lw         $ra, 0x10($sp)
/* 2C2C 800E242C 00000000 */  nop
/* 2C30 800E2430 0800E003 */  jr         $ra
/* 2C34 800E2434 1800BD27 */   addiu     $sp, $sp, 0x18
