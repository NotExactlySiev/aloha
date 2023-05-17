.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel reset
/* C010 80023810 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C014 80023814 1400BFAF */  sw         $ra, 0x14($sp)
/* C018 80023818 00A0043C */  lui        $a0, (0xA000DF00 >> 16)
/* C01C 8002381C 0380053C */  lui        $a1, %hi(D_80034CC0)
/* C020 80023820 C04CA524 */  addiu      $a1, $a1, %lo(D_80034CC0)
/* C024 80023824 228F000C */  jal        k_strcpy
/* C028 80023828 00DF8434 */   ori       $a0, $a0, (0xA000DF00 & 0xFFFF)
/* C02C 8002382C 0380043C */  lui        $a0, %hi(D_80034CC8)
/* C030 80023830 0380053C */  lui        $a1, %hi(D_80034CD0)
/* C034 80023834 D04CA524 */  addiu      $a1, $a1, %lo(D_80034CD0)
/* C038 80023838 1F8E000C */  jal        reboot
/* C03C 8002383C C84C8424 */   addiu     $a0, $a0, %lo(D_80034CC8)
/* C040 80023840 1400BF8F */  lw         $ra, 0x14($sp)
/* C044 80023844 1800BD27 */  addiu      $sp, $sp, 0x18
/* C048 80023848 0800E003 */  jr         $ra
/* C04C 8002384C 00000000 */   nop
