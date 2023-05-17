.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027710
/* FF10 80027710 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* FF14 80027714 FFFF0424 */  addiu      $a0, $zero, -0x1
/* FF18 80027718 1C00BFAF */  sw         $ra, 0x1C($sp)
/* FF1C 8002771C B1B0000C */  jal        func_8002C2C4
/* FF20 80027720 1800B0AF */   sw        $s0, 0x18($sp)
/* FF24 80027724 0580033C */  lui        $v1, %hi(D_8005367C)
/* FF28 80027728 7C36638C */  lw         $v1, %lo(D_8005367C)($v1)
/* FF2C 8002772C 00000000 */  nop
/* FF30 80027730 2A186200 */  slt        $v1, $v1, $v0
/* FF34 80027734 0B006014 */  bnez       $v1, .L80027764
/* FF38 80027738 00000000 */   nop
/* FF3C 8002773C 0580033C */  lui        $v1, %hi(D_80053680)
/* FF40 80027740 8036638C */  lw         $v1, %lo(D_80053680)($v1)
/* FF44 80027744 00000000 */  nop
/* FF48 80027748 01006224 */  addiu      $v0, $v1, 0x1
/* FF4C 8002774C 0580013C */  lui        $at, %hi(D_80053680)
/* FF50 80027750 803622AC */  sw         $v0, %lo(D_80053680)($at)
/* FF54 80027754 7800023C */  lui        $v0, (0x780000 >> 16)
/* FF58 80027758 2A104300 */  slt        $v0, $v0, $v1
/* FF5C 8002775C 4D004010 */  beqz       $v0, .L80027894
/* FF60 80027760 21100000 */   addu      $v0, $zero, $zero
.L80027764:
/* FF64 80027764 0480063C */  lui        $a2, %hi(D_80046EF8)
/* FF68 80027768 F86EC68C */  lw         $a2, %lo(D_80046EF8)($a2)
/* FF6C 8002776C 0280043C */  lui        $a0, %hi(D_800183D4)
/* FF70 80027770 D4838424 */  addiu      $a0, $a0, %lo(D_800183D4)
/* FF74 80027774 0000C28C */  lw         $v0, 0x0($a2)
/* FF78 80027778 0480053C */  lui        $a1, %hi(D_80046F18)
/* FF7C 8002777C 186FA58C */  lw         $a1, %lo(D_80046F18)($a1)
/* FF80 80027780 0480023C */  lui        $v0, %hi(D_80046EFC)
/* FF84 80027784 FC6E428C */  lw         $v0, %lo(D_80046EFC)($v0)
/* FF88 80027788 0480033C */  lui        $v1, %hi(D_80046F1C)
/* FF8C 8002778C 1C6F638C */  lw         $v1, %lo(D_80046F1C)($v1)
/* FF90 80027790 0000428C */  lw         $v0, 0x0($v0)
/* FF94 80027794 2328A300 */  subu       $a1, $a1, $v1
/* FF98 80027798 1000A2AF */  sw         $v0, 0x10($sp)
/* FF9C 8002779C 0480023C */  lui        $v0, %hi(D_80046F04)
/* FFA0 800277A0 046F428C */  lw         $v0, %lo(D_80046F04)($v0)
/* FFA4 800277A4 0000C68C */  lw         $a2, 0x0($a2)
/* FFA8 800277A8 0000478C */  lw         $a3, 0x0($v0)
/* FFAC 800277AC 1E8F000C */  jal        k_printf
/* FFB0 800277B0 3F00A530 */   andi      $a1, $a1, 0x3F
/* FFB4 800277B4 0FAE000C */  jal        func_8002B83C
/* FFB8 800277B8 21200000 */   addu      $a0, $zero, $zero
/* FFBC 800277BC 02000434 */  ori        $a0, $zero, 0x2
/* FFC0 800277C0 21280000 */  addu       $a1, $zero, $zero
/* FFC4 800277C4 E0AD000C */  jal        func_8002B780
/* FFC8 800277C8 21804000 */   addu      $s0, $v0, $zero
/* FFCC 800277CC 21200000 */  addu       $a0, $zero, $zero
/* FFD0 800277D0 0480013C */  lui        $at, %hi(D_80046F1C)
/* FFD4 800277D4 1C6F20AC */  sw         $zero, %lo(D_80046F1C)($at)
/* FFD8 800277D8 0480023C */  lui        $v0, %hi(D_80046F1C)
/* FFDC 800277DC 1C6F428C */  lw         $v0, %lo(D_80046F1C)($v0)
/* FFE0 800277E0 21180000 */  addu       $v1, $zero, $zero
/* FFE4 800277E4 0480013C */  lui        $at, %hi(D_80046F18)
/* FFE8 800277E8 186F22AC */  sw         $v0, %lo(D_80046F18)($at)
.L800277EC:
/* FFEC 800277EC 0580013C */  lui        $at, %hi(D_8005237C)
/* FFF0 800277F0 7C232124 */  addiu      $at, $at, %lo(D_8005237C)
/* FFF4 800277F4 21082300 */  addu       $at, $at, $v1
/* FFF8 800277F8 000020AC */  sw         $zero, 0x0($at)
/* FFFC 800277FC 01008424 */  addiu      $a0, $a0, 0x1
/* 10000 80027800 40008228 */  slti       $v0, $a0, 0x40
/* 10004 80027804 F9FF4014 */  bnez       $v0, .L800277EC
/* 10008 80027808 4C006324 */   addiu     $v1, $v1, 0x4C
/* 1000C 8002780C 0480033C */  lui        $v1, %hi(D_80046F04)
/* 10010 80027810 046F638C */  lw         $v1, %lo(D_80046F04)($v1)
/* 10014 80027814 01040234 */  ori        $v0, $zero, 0x401
/* 10018 80027818 000062AC */  sw         $v0, 0x0($v1)
/* 1001C 8002781C 0480033C */  lui        $v1, %hi(D_80046F14)
/* 10020 80027820 146F638C */  lw         $v1, %lo(D_80046F14)($v1)
/* 10024 80027824 00E1053C */  lui        $a1, (0xE1001000 >> 16)
/* 10028 80027828 0000628C */  lw         $v0, 0x0($v1)
/* 1002C 8002782C 0010A534 */  ori        $a1, $a1, (0xE1001000 & 0xFFFF)
/* 10030 80027830 00084234 */  ori        $v0, $v0, 0x800
/* 10034 80027834 000062AC */  sw         $v0, 0x0($v1)
/* 10038 80027838 0480033C */  lui        $v1, %hi(D_80046EF8)
/* 1003C 8002783C F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* 10040 80027840 0002023C */  lui        $v0, (0x2000000 >> 16)
/* 10044 80027844 000062AC */  sw         $v0, 0x0($v1)
/* 10048 80027848 0480033C */  lui        $v1, %hi(D_80046EF8)
/* 1004C 8002784C F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* 10050 80027850 0001023C */  lui        $v0, (0x1000000 >> 16)
/* 10054 80027854 000062AC */  sw         $v0, 0x0($v1)
/* 10058 80027858 0480023C */  lui        $v0, %hi(D_80046EF8)
/* 1005C 8002785C F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* 10060 80027860 21200002 */  addu       $a0, $s0, $zero
/* 10064 80027864 0000428C */  lw         $v0, 0x0($v0)
/* 10068 80027868 0480033C */  lui        $v1, %hi(D_80046EF4)
/* 1006C 8002786C F46E638C */  lw         $v1, %lo(D_80046EF4)($v1)
/* 10070 80027870 FF3F4230 */  andi       $v0, $v0, 0x3FFF
/* 10074 80027874 25104500 */  or         $v0, $v0, $a1
/* 10078 80027878 000062AC */  sw         $v0, 0x0($v1)
/* 1007C 8002787C 0FAE000C */  jal        func_8002B83C
/* 10080 80027880 00000000 */   nop
/* 10084 80027884 0480033C */  lui        $v1, %hi(D_80046EF8)
/* 10088 80027888 F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* 1008C 8002788C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 10090 80027890 0000638C */  lw         $v1, 0x0($v1)
.L80027894:
/* 10094 80027894 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 10098 80027898 1800B08F */  lw         $s0, 0x18($sp)
/* 1009C 8002789C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 100A0 800278A0 0800E003 */  jr         $ra
/* 100A4 800278A4 00000000 */   nop
