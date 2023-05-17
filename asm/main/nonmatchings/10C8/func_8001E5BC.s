.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E5BC
/* 6DBC 8001E5BC 04000234 */  ori        $v0, $zero, 0x4
/* 6DC0 8001E5C0 0500A210 */  beq        $a1, $v0, .L8001E5D8
/* 6DC4 8001E5C4 08000234 */   ori       $v0, $zero, 0x8
/* 6DC8 8001E5C8 0900A210 */  beq        $a1, $v0, .L8001E5F0
/* 6DCC 8001E5CC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 6DD0 8001E5D0 80790008 */  j          .L8001E600
/* 6DD4 8001E5D4 00000000 */   nop
.L8001E5D8:
/* 6DD8 8001E5D8 0480023C */  lui        $v0, %hi(D_80047F5C)
/* 6DDC 8001E5DC 5C7F428C */  lw         $v0, %lo(D_80047F5C)($v0)
/* 6DE0 8001E5E0 0480013C */  lui        $at, %hi(D_80047F5C)
/* 6DE4 8001E5E4 5C7F24AC */  sw         $a0, %lo(D_80047F5C)($at)
/* 6DE8 8001E5E8 80790008 */  j          .L8001E600
/* 6DEC 8001E5EC 00000000 */   nop
.L8001E5F0:
/* 6DF0 8001E5F0 0480023C */  lui        $v0, %hi(D_80047F64)
/* 6DF4 8001E5F4 647F428C */  lw         $v0, %lo(D_80047F64)($v0)
/* 6DF8 8001E5F8 0480013C */  lui        $at, %hi(D_80047F64)
/* 6DFC 8001E5FC 647F24AC */  sw         $a0, %lo(D_80047F64)($at)
.L8001E600:
/* 6E00 8001E600 0800E003 */  jr         $ra
/* 6E04 8001E604 00000000 */   nop
