.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.include    "macro.inc"

/* C1A8 800239A8 B0000A24 */
kern 0xB0, 0x09, k_CloseEvent
kern 0xB0, 0x51, k_Krom2RawAdd
sysc 1, k_EnterCriticalSection
kern 0xB0, 0x33, k_lseek
kern 0xB0, 0x36, k_close
kern 0xB0, 0x35, k_write
kern 0xB0, 0x0C, k_EnableEvent
kern 0xB0, 0x45, k_erase
kern 0xB0, 0x41, k_format

glabel func_80023A38
/* C238 80023A38 FFFF8830 */  andi       $t0, $a0, 0xFFFF
/* C23C 80023A3C 03000229 */  slti       $v0, $t0, 0x3
/* C240 80023A40 03004014 */  bnez       $v0, .L80023A50
/* C244 80023A44 48000724 */   addiu     $a3, $zero, 0x48
/* C248 80023A48 B38E0008 */  j          .L80023ACC
/* C24C 80023A4C 21100000 */   addu      $v0, $zero, $zero
.L80023A50:
/* C250 80023A50 0380023C */  lui        $v0, %hi(D_80034D38)
/* C254 80023A54 384D428C */  lw         $v0, %lo(D_80034D38)($v0)
/* C258 80023A58 00190800 */  sll        $v1, $t0, 4
/* C25C 80023A5C 21186200 */  addu       $v1, $v1, $v0
/* C260 80023A60 040060A4 */  sh         $zero, 0x4($v1)
/* C264 80023A64 080065A4 */  sh         $a1, 0x8($v1)
/* C268 80023A68 0200022D */  sltiu      $v0, $t0, 0x2
/* C26C 80023A6C 08004010 */  beqz       $v0, .L80023A90
/* C270 80023A70 1000C230 */   andi      $v0, $a2, 0x10
/* C274 80023A74 02004010 */  beqz       $v0, .L80023A80
/* C278 80023A78 0100C230 */   andi      $v0, $a2, 0x1
/* C27C 80023A7C 49000724 */  addiu      $a3, $zero, 0x49
.L80023A80:
/* C280 80023A80 0A004014 */  bnez       $v0, .L80023AAC
/* C284 80023A84 0010C230 */   andi      $v0, $a2, 0x1000
/* C288 80023A88 AB8E0008 */  j          .L80023AAC
/* C28C 80023A8C 0001E734 */   ori       $a3, $a3, 0x100
.L80023A90:
/* C290 80023A90 02000224 */  addiu      $v0, $zero, 0x2
/* C294 80023A94 05000215 */  bne        $t0, $v0, .L80023AAC
/* C298 80023A98 0010C230 */   andi      $v0, $a2, 0x1000
/* C29C 80023A9C 0100C230 */  andi       $v0, $a2, 0x1
/* C2A0 80023AA0 02004014 */  bnez       $v0, .L80023AAC
/* C2A4 80023AA4 0010C230 */   andi      $v0, $a2, 0x1000
/* C2A8 80023AA8 48020724 */  addiu      $a3, $zero, 0x248
.L80023AAC:
/* C2AC 80023AAC 02004010 */  beqz       $v0, .L80023AB8
/* C2B0 80023AB0 00190800 */   sll       $v1, $t0, 4
/* C2B4 80023AB4 1000E734 */  ori        $a3, $a3, 0x10
.L80023AB8:
/* C2B8 80023AB8 0380043C */  lui        $a0, %hi(D_80034D38)
/* C2BC 80023ABC 384D848C */  lw         $a0, %lo(D_80034D38)($a0)
/* C2C0 80023AC0 01000224 */  addiu      $v0, $zero, 0x1
/* C2C4 80023AC4 21186400 */  addu       $v1, $v1, $a0
/* C2C8 80023AC8 040067A4 */  sh         $a3, 0x4($v1)
.L80023ACC:
/* C2CC 80023ACC 0800E003 */  jr         $ra
/* C2D0 80023AD0 00000000 */   nop


glabel func_80023AD4
/* C2D4 80023AD4 FFFF8330 */  andi       $v1, $a0, 0xFFFF
/* C2D8 80023AD8 03006228 */  slti       $v0, $v1, 0x3
/* C2DC 80023ADC 08004010 */  beqz       $v0, .L80023B00
/* C2E0 80023AE0 00190300 */   sll       $v1, $v1, 4
/* C2E4 80023AE4 0380023C */  lui        $v0, %hi(D_80034D38)
/* C2E8 80023AE8 384D428C */  lw         $v0, %lo(D_80034D38)($v0)
/* C2EC 80023AEC 00000000 */  nop
/* C2F0 80023AF0 21186200 */  addu       $v1, $v1, $v0
/* C2F4 80023AF4 00006294 */  lhu        $v0, 0x0($v1)
/* C2F8 80023AF8 C18E0008 */  j          .L80023B04
/* C2FC 80023AFC 00000000 */   nop
.L80023B00:
/* C300 80023B00 21100000 */  addu       $v0, $zero, $zero
.L80023B04:
/* C304 80023B04 0800E003 */  jr         $ra
/* C308 80023B08 00000000 */   nop


glabel func_80023B0C
/* C30C 80023B0C FFFF8230 */  andi       $v0, $a0, 0xFFFF
/* C310 80023B10 0380043C */  lui        $a0, %hi(D_80034D3C)
/* C314 80023B14 3C4D8424 */  addiu      $a0, $a0, %lo(D_80034D3C)
/* C318 80023B18 80180200 */  sll        $v1, $v0, 2
/* C31C 80023B1C 0380053C */  lui        $a1, %hi(D_80034D34)
/* C320 80023B20 344DA58C */  lw         $a1, %lo(D_80034D34)($a1)
/* C324 80023B24 21186400 */  addu       $v1, $v1, $a0
/* C328 80023B28 0000638C */  lw         $v1, 0x0($v1)
/* C32C 80023B2C 0400A48C */  lw         $a0, 0x4($a1)
/* C330 80023B30 03004228 */  slti       $v0, $v0, 0x3
/* C334 80023B34 25208300 */  or         $a0, $a0, $v1
/* C338 80023B38 0800E003 */  jr         $ra
/* C33C 80023B3C 0400A4AC */   sw        $a0, 0x4($a1)


glabel func_80023B40
/* C340 80023B40 FFFF8430 */  andi       $a0, $a0, 0xFFFF
/* C344 80023B44 80200400 */  sll        $a0, $a0, 2
/* C348 80023B48 0380053C */  lui        $a1, %hi(D_80034D34)
/* C34C 80023B4C 0380023C */  lui        $v0, %hi(D_80034D3C)
/* C350 80023B50 344DA58C */  lw         $a1, %lo(D_80034D34)($a1)
/* C354 80023B54 21104400 */  addu       $v0, $v0, $a0
/* C358 80023B58 3C4D428C */  lw         $v0, %lo(D_80034D3C)($v0)
/* C35C 80023B5C 0400A38C */  lw         $v1, 0x4($a1)
/* C360 80023B60 27100200 */  nor        $v0, $zero, $v0
/* C364 80023B64 24104300 */  and        $v0, $v0, $v1
/* C368 80023B68 0400A2AC */  sw         $v0, 0x4($a1)
/* C36C 80023B6C 0800E003 */  jr         $ra
/* C370 80023B70 01000224 */   addiu     $v0, $zero, 0x1


glabel func_80023B74
/* C374 80023B74 FFFF8330 */  andi       $v1, $a0, 0xFFFF
/* C378 80023B78 03006228 */  slti       $v0, $v1, 0x3
/* C37C 80023B7C 07004010 */  beqz       $v0, .L80023B9C
/* C380 80023B80 01000224 */   addiu     $v0, $zero, 0x1
/* C384 80023B84 0380043C */  lui        $a0, %hi(D_80034D38)
/* C388 80023B88 384D848C */  lw         $a0, %lo(D_80034D38)($a0)
/* C38C 80023B8C 00190300 */  sll        $v1, $v1, 4
/* C390 80023B90 21186400 */  addu       $v1, $v1, $a0
/* C394 80023B94 E88E0008 */  j          .L80023BA0
/* C398 80023B98 000060A4 */   sh        $zero, 0x0($v1)
.L80023B9C:
/* C39C 80023B9C 21100000 */  addu       $v0, $zero, $zero
.L80023BA0:
/* C3A0 80023BA0 0800E003 */  jr         $ra
/* C3A4 80023BA4 00000000 */   nop


kern 0xB0, 0x5B, k_ChangeClearPAD   //80023BA8
kern 0xA0, 0x39, k_InitHeap
kern 0xB0, 0x43, k_nextfile
kern 0xA0, 0x43, k_Exec
kern 0xB0, 0x8, k_OpenEvent
kern 0xB0, 0x34, k_read
kern 0xB0, 0xB, k_TestEvent
sysc 2, k_ExitCriticalSection
kern 0xB0, 0x32, k_open
kern 0xB0, 0x42, k_firstfile2
kern 0xA0, 0x44, k_FlushCache
kern 0xA0, 0x33, k_malloc
kern 0xA0, 0x15, k_strcat
kern 0xA0, 0x3F, k_printf
kern 0xA0, 0x19, k_strcpy
kern 0xA0, 0xAC, k_card_load
kern 0xA0, 0xAB, k_card_info
kern 0xA0, 0xAD, k_card_auto
kern 0xB0, 0x4E, k_card_write
kern 0xB0, 0x4A, k_InitCARD2
kern 0xB0, 0x4C, k_StopCARD2
kern 0xB0, 0x4B, k_StartCARD2
kern 0xA0, 0x70, k_bu_init
kern 0xB0, 0x50, k_new_card
kern 0xB0, 0x4F, k_card_read        //80023D28


glabel func_80023D38
/* C538 80023D38 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C53C 80023D3C 1000B0AF */  sw         $s0, 0x10($sp)
/* C540 80023D40 21808000 */  addu       $s0, $a0, $zero
/* C544 80023D44 03000016 */  bnez       $s0, .L80023D54
/* C548 80023D48 1400BFAF */   sw        $ra, 0x14($sp)
/* C54C 80023D4C C8AD000C */  jal        func_8002B720
/* C550 80023D50 00000000 */   nop
.L80023D54:
/* C554 80023D54 B98F000C */  jal        func_80023EE4
/* C558 80023D58 21200002 */   addu      $a0, $s0, $zero
/* C55C 80023D5C 1400BF8F */  lw         $ra, 0x14($sp)
/* C560 80023D60 1000B08F */  lw         $s0, 0x10($sp)
/* C564 80023D64 1800BD27 */  addiu      $sp, $sp, 0x18
/* C568 80023D68 0800E003 */  jr         $ra
/* C56C 80023D6C 00000000 */   nop


glabel func_80023D70
/* C570 80023D70 00008294 */  lhu        $v0, 0x0($a0)
/* C574 80023D74 0800E003 */  jr         $ra
/* C578 80023D78 00000000 */   nop


glabel func_80023D7C
/* C57C 80023D7C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* C580 80023D80 1000B0AF */  sw         $s0, 0x10($sp)
/* C584 80023D84 21808000 */  addu       $s0, $a0, $zero
/* C588 80023D88 1400B1AF */  sw         $s1, 0x14($sp)
/* C58C 80023D8C 1800BFAF */  sw         $ra, 0x18($sp)
/* C590 80023D90 E190000C */  jal        func_80024384
/* C594 80023D94 2188A000 */   addu      $s1, $a1, $zero
/* C598 80023D98 03004014 */  bnez       $v0, .L80023DA8
/* C59C 80023D9C 21200002 */   addu      $a0, $s0, $zero
/* C5A0 80023DA0 7591000C */  jal        func_800245D4
/* C5A4 80023DA4 21282002 */   addu      $a1, $s1, $zero
.L80023DA8:
/* C5A8 80023DA8 1800BF8F */  lw         $ra, 0x18($sp)
/* C5AC 80023DAC 1400B18F */  lw         $s1, 0x14($sp)
/* C5B0 80023DB0 1000B08F */  lw         $s0, 0x10($sp)
/* C5B4 80023DB4 2000BD27 */  addiu      $sp, $sp, 0x20
/* C5B8 80023DB8 0800E003 */  jr         $ra
/* C5BC 80023DBC 00000000 */   nop


glabel func_80023DC0
/* C5C0 80023DC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C5C4 80023DC4 0100A230 */  andi       $v0, $a1, 0x1
/* C5C8 80023DC8 06004010 */  beqz       $v0, .L80023DE4
/* C5CC 80023DCC 1000BFAF */   sw        $ra, 0x10($sp)
/* C5D0 80023DD0 FFF7033C */  lui        $v1, (0xF7FFFFFF >> 16)
/* C5D4 80023DD4 0000828C */  lw         $v0, 0x0($a0)
/* C5D8 80023DD8 FFFF6334 */  ori        $v1, $v1, (0xF7FFFFFF & 0xFFFF)
/* C5DC 80023DDC 7C8F0008 */  j          .L80023DF0
/* C5E0 80023DE0 24104300 */   and       $v0, $v0, $v1
.L80023DE4:
/* C5E4 80023DE4 0000828C */  lw         $v0, 0x0($a0)
/* C5E8 80023DE8 0008033C */  lui        $v1, (0x8000000 >> 16)
/* C5EC 80023DEC 25104300 */  or         $v0, $v0, $v1
.L80023DF0:
/* C5F0 80023DF0 000082AC */  sw         $v0, 0x0($a0)
/* C5F4 80023DF4 0200A230 */  andi       $v0, $a1, 0x2
/* C5F8 80023DF8 04004010 */  beqz       $v0, .L80023E0C
/* C5FC 80023DFC 0002033C */   lui       $v1, (0x2000000 >> 16)
/* C600 80023E00 0000828C */  lw         $v0, 0x0($a0)
/* C604 80023E04 878F0008 */  j          .L80023E1C
/* C608 80023E08 25104300 */   or        $v0, $v0, $v1
.L80023E0C:
/* C60C 80023E0C FFFD033C */  lui        $v1, (0xFDFFFFFF >> 16)
/* C610 80023E10 0000828C */  lw         $v0, 0x0($a0)
/* C614 80023E14 FFFF6334 */  ori        $v1, $v1, (0xFDFFFFFF & 0xFFFF)
/* C618 80023E18 24104300 */  and        $v0, $v0, $v1
.L80023E1C:
/* C61C 80023E1C 000082AC */  sw         $v0, 0x0($a0)
/* C620 80023E20 00008594 */  lhu        $a1, 0x0($a0)
/* C624 80023E24 FB8F000C */  jal        func_80023FEC
/* C628 80023E28 00000000 */   nop
/* C62C 80023E2C 1000BF8F */  lw         $ra, 0x10($sp)
/* C630 80023E30 1800BD27 */  addiu      $sp, $sp, 0x18
/* C634 80023E34 0800E003 */  jr         $ra
/* C638 80023E38 00000000 */   nop


glabel func_80023E3C
/* C63C 80023E3C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C640 80023E40 1000BFAF */  sw         $ra, 0x10($sp)
/* C644 80023E44 2090000C */  jal        func_80024080
/* C648 80023E48 00000000 */   nop
/* C64C 80023E4C 1000BF8F */  lw         $ra, 0x10($sp)
/* C650 80023E50 1800BD27 */  addiu      $sp, $sp, 0x18
/* C654 80023E54 0800E003 */  jr         $ra
/* C658 80023E58 00000000 */   nop


glabel func_80023E5C
/* C65C 80023E5C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C660 80023E60 1000BFAF */  sw         $ra, 0x10($sp)
/* C664 80023E64 4490000C */  jal        func_80024110
/* C668 80023E68 00000000 */   nop
/* C66C 80023E6C 1000BF8F */  lw         $ra, 0x10($sp)
/* C670 80023E70 1800BD27 */  addiu      $sp, $sp, 0x18
/* C674 80023E74 0800E003 */  jr         $ra
/* C678 80023E78 00000000 */   nop


glabel func_80023E7C
/* C67C 80023E7C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C680 80023E80 1000BFAF */  sw         $ra, 0x10($sp)
/* C684 80023E84 6A90000C */  jal        func_800241A8
/* C688 80023E88 00000000 */   nop
/* C68C 80023E8C 1000BF8F */  lw         $ra, 0x10($sp)
/* C690 80023E90 1800BD27 */  addiu      $sp, $sp, 0x18
/* C694 80023E94 0800E003 */  jr         $ra
/* C698 80023E98 00000000 */   nop


glabel func_80023E9C
/* C69C 80023E9C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C6A0 80023EA0 1000BFAF */  sw         $ra, 0x10($sp)
/* C6A4 80023EA4 21288000 */  addu       $a1, $a0, $zero
/* C6A8 80023EA8 E0AD000C */  jal        func_8002B780
/* C6AC 80023EAC 21200000 */   addu      $a0, $zero, $zero
/* C6B0 80023EB0 1000BF8F */  lw         $ra, 0x10($sp)
/* C6B4 80023EB4 1800BD27 */  addiu      $sp, $sp, 0x18
/* C6B8 80023EB8 0800E003 */  jr         $ra
/* C6BC 80023EBC 00000000 */   nop


glabel func_80023EC0
/* C6C0 80023EC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C6C4 80023EC4 1000BFAF */  sw         $ra, 0x10($sp)
/* C6C8 80023EC8 21288000 */  addu       $a1, $a0, $zero
/* C6CC 80023ECC E0AD000C */  jal        func_8002B780
/* C6D0 80023ED0 01000434 */   ori       $a0, $zero, 0x1
/* C6D4 80023ED4 1000BF8F */  lw         $ra, 0x10($sp)
/* C6D8 80023ED8 1800BD27 */  addiu      $sp, $sp, 0x18
/* C6DC 80023EDC 0800E003 */  jr         $ra
/* C6E0 80023EE0 00000000 */   nop


glabel func_80023EE4
/* C6E4 80023EE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* C6E8 80023EE8 21288000 */  addu       $a1, $a0, $zero
/* C6EC 80023EEC 0600A010 */  beqz       $a1, .L80023F08
/* C6F0 80023EF0 1000BFAF */   sw        $ra, 0x10($sp)
/* C6F4 80023EF4 01000234 */  ori        $v0, $zero, 0x1
/* C6F8 80023EF8 1C00A210 */  beq        $a1, $v0, .L80023F6C
/* C6FC 80023EFC 0080023C */   lui       $v0, (0x80000000 >> 16)
/* C700 80023F00 F18F0008 */  j          .L80023FC4
/* C704 80023F04 00000000 */   nop
.L80023F08:
/* C708 80023F08 0380033C */  lui        $v1, %hi(D_80034E90)
/* C70C 80023F0C 904E638C */  lw         $v1, %lo(D_80034E90)($v1)
/* C710 80023F10 0080023C */  lui        $v0, (0x80000000 >> 16)
/* C714 80023F14 000062AC */  sw         $v0, 0x0($v1)
/* C718 80023F18 0380023C */  lui        $v0, %hi(D_80034E64)
/* C71C 80023F1C 644E428C */  lw         $v0, %lo(D_80034E64)($v0)
/* C720 80023F20 0380043C */  lui        $a0, %hi(D_80034D54)
/* C724 80023F24 544D8424 */  addiu      $a0, $a0, %lo(D_80034D54)
/* C728 80023F28 000040AC */  sw         $zero, 0x0($v0)
/* C72C 80023F2C 0380023C */  lui        $v0, %hi(D_80034E70)
/* C730 80023F30 704E428C */  lw         $v0, %lo(D_80034E70)($v0)
/* C734 80023F34 20000534 */  ori        $a1, $zero, 0x20
/* C738 80023F38 000040AC */  sw         $zero, 0x0($v0)
/* C73C 80023F3C 0380033C */  lui        $v1, %hi(D_80034E90)
/* C740 80023F40 904E638C */  lw         $v1, %lo(D_80034E90)($v1)
/* C744 80023F44 0060023C */  lui        $v0, (0x60000000 >> 16)
/* C748 80023F48 000062AC */  sw         $v0, 0x0($v1)
/* C74C 80023F4C FB8F000C */  jal        func_80023FEC
/* C750 80023F50 00000000 */   nop
/* C754 80023F54 0380043C */  lui        $a0, %hi(D_80034DD8)
/* C758 80023F58 D84D8424 */  addiu      $a0, $a0, %lo(D_80034DD8)
/* C75C 80023F5C FB8F000C */  jal        func_80023FEC
/* C760 80023F60 20000534 */   ori       $a1, $zero, 0x20
/* C764 80023F64 F78F0008 */  j          .L80023FDC
/* C768 80023F68 00000000 */   nop
.L80023F6C:
/* C76C 80023F6C 0380033C */  lui        $v1, %hi(D_80034E90)
/* C770 80023F70 904E638C */  lw         $v1, %lo(D_80034E90)($v1)
/* C774 80023F74 00000000 */  nop
/* C778 80023F78 000062AC */  sw         $v0, 0x0($v1)
/* C77C 80023F7C 0380023C */  lui        $v0, %hi(D_80034E64)
/* C780 80023F80 644E428C */  lw         $v0, %lo(D_80034E64)($v0)
/* C784 80023F84 00000000 */  nop
/* C788 80023F88 000040AC */  sw         $zero, 0x0($v0)
/* C78C 80023F8C 0380023C */  lui        $v0, %hi(D_80034E70)
/* C790 80023F90 704E428C */  lw         $v0, %lo(D_80034E70)($v0)
/* C794 80023F94 00000000 */  nop
/* C798 80023F98 000040AC */  sw         $zero, 0x0($v0)
/* C79C 80023F9C 0380023C */  lui        $v0, %hi(D_80034E70)
/* C7A0 80023FA0 704E428C */  lw         $v0, %lo(D_80034E70)($v0)
/* C7A4 80023FA4 0380033C */  lui        $v1, %hi(D_80034E90)
/* C7A8 80023FA8 904E638C */  lw         $v1, %lo(D_80034E90)($v1)
/* C7AC 80023FAC 0000428C */  lw         $v0, 0x0($v0)
/* C7B0 80023FB0 00000000 */  nop
/* C7B4 80023FB4 0060023C */  lui        $v0, (0x60000000 >> 16)
/* C7B8 80023FB8 000062AC */  sw         $v0, 0x0($v1)
/* C7BC 80023FBC F78F0008 */  j          .L80023FDC
/* C7C0 80023FC0 00000000 */   nop
.L80023FC4:
/* C7C4 80023FC4 0280043C */  lui        $a0, %hi(D_80018144)
/* C7C8 80023FC8 44818424 */  addiu      $a0, $a0, %lo(D_80018144)
/* C7CC 80023FCC 1E8F000C */  jal        k_printf
/* C7D0 80023FD0 00000000 */   nop
/* C7D4 80023FD4 DD90000C */  jal        func_80024374
/* C7D8 80023FD8 00000000 */   nop
.L80023FDC:
/* C7DC 80023FDC 1000BF8F */  lw         $ra, 0x10($sp)
/* C7E0 80023FE0 1800BD27 */  addiu      $sp, $sp, 0x18
/* C7E4 80023FE4 0800E003 */  jr         $ra
/* C7E8 80023FE8 00000000 */   nop


glabel func_80023FEC
/* C7EC 80023FEC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* C7F0 80023FF0 1400B1AF */  sw         $s1, 0x14($sp)
/* C7F4 80023FF4 21888000 */  addu       $s1, $a0, $zero
/* C7F8 80023FF8 1000B0AF */  sw         $s0, 0x10($sp)
/* C7FC 80023FFC 1800BFAF */  sw         $ra, 0x18($sp)
/* C800 80024000 4490000C */  jal        func_80024110
/* C804 80024004 2180A000 */   addu      $s0, $a1, $zero
/* C808 80024008 0380033C */  lui        $v1, %hi(D_80034E94)
/* C80C 8002400C 944E638C */  lw         $v1, %lo(D_80034E94)($v1)
/* C810 80024010 42811000 */  srl        $s0, $s0, 5
/* C814 80024014 0000628C */  lw         $v0, 0x0($v1)
/* C818 80024018 00841000 */  sll        $s0, $s0, 16
/* C81C 8002401C 88004234 */  ori        $v0, $v0, 0x88
/* C820 80024020 000062AC */  sw         $v0, 0x0($v1)
/* C824 80024024 0380033C */  lui        $v1, %hi(D_80034E5C)
/* C828 80024028 5C4E638C */  lw         $v1, %lo(D_80034E5C)($v1)
/* C82C 8002402C 04002226 */  addiu      $v0, $s1, 0x4
/* C830 80024030 000062AC */  sw         $v0, 0x0($v1)
/* C834 80024034 0380023C */  lui        $v0, %hi(D_80034E60)
/* C838 80024038 604E428C */  lw         $v0, %lo(D_80034E60)($v0)
/* C83C 8002403C 20001036 */  ori        $s0, $s0, 0x20
/* C840 80024040 000050AC */  sw         $s0, 0x0($v0)
/* C844 80024044 0380033C */  lui        $v1, %hi(D_80034E8C)
/* C848 80024048 8C4E638C */  lw         $v1, %lo(D_80034E8C)($v1)
/* C84C 8002404C 0000228E */  lw         $v0, 0x0($s1)
/* C850 80024050 0001043C */  lui        $a0, (0x1000201 >> 16)
/* C854 80024054 000062AC */  sw         $v0, 0x0($v1)
/* C858 80024058 0380023C */  lui        $v0, %hi(D_80034E64)
/* C85C 8002405C 644E428C */  lw         $v0, %lo(D_80034E64)($v0)
/* C860 80024060 01028434 */  ori        $a0, $a0, (0x1000201 & 0xFFFF)
/* C864 80024064 000044AC */  sw         $a0, 0x0($v0)
/* C868 80024068 1800BF8F */  lw         $ra, 0x18($sp)
/* C86C 8002406C 1400B18F */  lw         $s1, 0x14($sp)
/* C870 80024070 1000B08F */  lw         $s0, 0x10($sp)
/* C874 80024074 2000BD27 */  addiu      $sp, $sp, 0x20
/* C878 80024078 0800E003 */  jr         $ra
/* C87C 8002407C 00000000 */   nop
