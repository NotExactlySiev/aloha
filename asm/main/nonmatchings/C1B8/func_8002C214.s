.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C214
/* 14A14 8002C214 0480023C */  lui        $v0, %hi(D_800473F8)
/* 14A18 8002C218 F873428C */  lw         $v0, %lo(D_800473F8)($v0)
/* 14A1C 8002C21C 0480033C */  lui        $v1, %hi(D_800473F4)
/* 14A20 8002C220 F473638C */  lw         $v1, %lo(D_800473F4)($v1)
/* 14A24 8002C224 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14A28 8002C228 1000BFAF */  sw         $ra, 0x10($sp)
/* 14A2C 8002C22C 01004224 */  addiu      $v0, $v0, 0x1
/* 14A30 8002C230 0480013C */  lui        $at, %hi(D_800473F8)
/* 14A34 8002C234 F87322AC */  sw         $v0, %lo(D_800473F8)($at)
/* 14A38 8002C238 0480023C */  lui        $v0, %hi(D_800473F8)
/* 14A3C 8002C23C F873428C */  lw         $v0, %lo(D_800473F8)($v0)
/* 14A40 8002C240 03006010 */  beqz       $v1, .L8002C250
/* 14A44 8002C244 00000000 */   nop
/* 14A48 8002C248 09F86000 */  jalr       $v1
/* 14A4C 8002C24C 00000000 */   nop
.L8002C250:
/* 14A50 8002C250 1000BF8F */  lw         $ra, 0x10($sp)
/* 14A54 8002C254 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14A58 8002C258 0800E003 */  jr         $ra
/* 14A5C 8002C25C 00000000 */   nop
