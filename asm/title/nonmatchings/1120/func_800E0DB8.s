.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0DB8
/* 15B8 800E0DB8 0F80033C */  lui        $v1, %hi(D_800F4E68)
/* 15BC 800E0DBC 684E638C */  lw         $v1, %lo(D_800F4E68)($v1)
/* 15C0 800E0DC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 15C4 800E0DC4 1B006228 */  slti       $v0, $v1, 0x1B
/* 15C8 800E0DC8 06004010 */  beqz       $v0, .L800E0DE4
/* 15CC 800E0DCC 1000BFAF */   sw        $ra, 0x10($sp)
/* 15D0 800E0DD0 01006224 */  addiu      $v0, $v1, 0x1
/* 15D4 800E0DD4 0F80013C */  lui        $at, %hi(D_800F4E68)
/* 15D8 800E0DD8 684E22AC */  sw         $v0, %lo(D_800F4E68)($at)
/* 15DC 800E0DDC 7B830308 */  j          .L800E0DEC
/* 15E0 800E0DE0 00000000 */   nop
.L800E0DE4:
/* 15E4 800E0DE4 0F80013C */  lui        $at, %hi(D_800F4E68)
/* 15E8 800E0DE8 684E20AC */  sw         $zero, %lo(D_800F4E68)($at)
.L800E0DEC:
/* 15EC 800E0DEC D582030C */  jal        func_800E0B54
/* 15F0 800E0DF0 002C0434 */   ori       $a0, $zero, 0x2C00
/* 15F4 800E0DF4 1000BF8F */  lw         $ra, 0x10($sp)
/* 15F8 800E0DF8 00000000 */  nop
/* 15FC 800E0DFC 0800E003 */  jr         $ra
/* 1600 800E0E00 1800BD27 */   addiu     $sp, $sp, 0x18
