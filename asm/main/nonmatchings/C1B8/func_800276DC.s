.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800276DC
/* FEDC 800276DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* FEE0 800276E0 1000BFAF */  sw         $ra, 0x10($sp)
/* FEE4 800276E4 B1B0000C */  jal        func_8002C2C4
/* FEE8 800276E8 FFFF0424 */   addiu     $a0, $zero, -0x1
/* FEEC 800276EC F0004224 */  addiu      $v0, $v0, 0xF0
/* FEF0 800276F0 0580013C */  lui        $at, %hi(D_8005367C)
/* FEF4 800276F4 7C3622AC */  sw         $v0, %lo(D_8005367C)($at)
/* FEF8 800276F8 0580013C */  lui        $at, %hi(D_80053680)
/* FEFC 800276FC 803620AC */  sw         $zero, %lo(D_80053680)($at)
/* FF00 80027700 1000BF8F */  lw         $ra, 0x10($sp)
/* FF04 80027704 1800BD27 */  addiu      $sp, $sp, 0x18
/* FF08 80027708 0800E003 */  jr         $ra
/* FF0C 8002770C 00000000 */   nop
