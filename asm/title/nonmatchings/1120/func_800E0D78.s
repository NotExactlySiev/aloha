.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0D78
/* 1578 800E0D78 0F80023C */  lui        $v0, %hi(D_800F4E68)
/* 157C 800E0D7C 684E428C */  lw         $v0, %lo(D_800F4E68)($v0)
/* 1580 800E0D80 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1584 800E0D84 03004018 */  blez       $v0, .L800E0D94
/* 1588 800E0D88 1000BFAF */   sw        $ra, 0x10($sp)
/* 158C 800E0D8C 66830308 */  j          .L800E0D98
/* 1590 800E0D90 FFFF4224 */   addiu     $v0, $v0, -0x1
.L800E0D94:
/* 1594 800E0D94 1B000234 */  ori        $v0, $zero, 0x1B
.L800E0D98:
/* 1598 800E0D98 0F80013C */  lui        $at, %hi(D_800F4E68)
/* 159C 800E0D9C 684E22AC */  sw         $v0, %lo(D_800F4E68)($at)
/* 15A0 800E0DA0 D582030C */  jal        func_800E0B54
/* 15A4 800E0DA4 002C0434 */   ori       $a0, $zero, 0x2C00
/* 15A8 800E0DA8 1000BF8F */  lw         $ra, 0x10($sp)
/* 15AC 800E0DAC 00000000 */  nop
/* 15B0 800E0DB0 0800E003 */  jr         $ra
/* 15B4 800E0DB4 1800BD27 */   addiu     $sp, $sp, 0x18
