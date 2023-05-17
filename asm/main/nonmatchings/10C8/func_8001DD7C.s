.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DD7C
/* 657C 8001DD7C 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 6580 8001DD80 7C00BFAF */  sw         $ra, 0x7C($sp)
/* 6584 8001DD84 7800B0AF */  sw         $s0, 0x78($sp)
/* 6588 8001DD88 0480023C */  lui        $v0, %hi(D_80047E04)
/* 658C 8001DD8C 047E428C */  lw         $v0, %lo(D_80047E04)($v0)
/* 6590 8001DD90 01001034 */  ori        $s0, $zero, 0x1
/* 6594 8001DD94 3C005010 */  beq        $v0, $s0, .L8001DE88
/* 6598 8001DD98 00000000 */   nop
/* 659C 8001DD9C 0480013C */  lui        $at, %hi(D_80047E04)
/* 65A0 8001DDA0 047E30AC */  sw         $s0, %lo(D_80047E04)($at)
/* 65A4 8001DDA4 87B8000C */  jal        func_8002E21C
/* 65A8 8001DDA8 00000000 */   nop
/* 65AC 8001DDAC 0580053C */  lui        $a1, %hi(D_8004DCF8)
/* 65B0 8001DDB0 F8DCA524 */  addiu      $a1, $a1, %lo(D_8004DCF8)
/* 65B4 8001DDB4 B0B5000C */  jal        func_8002D6C0
/* 65B8 8001DDB8 10000434 */   ori       $a0, $zero, 0x10
/* 65BC 8001DDBC 85C5000C */  jal        func_80031614
/* 65C0 8001DDC0 21200000 */   addu      $a0, $zero, $zero
/* 65C4 8001DDC4 3FC5000C */  jal        func_800314FC
/* 65C8 8001DDC8 21200000 */   addu      $a0, $zero, $zero
/* 65CC 8001DDCC 05000434 */  ori        $a0, $zero, 0x5
/* 65D0 8001DDD0 C577000C */  jal        func_8001DF14
/* 65D4 8001DDD4 00180534 */   ori       $a1, $zero, 0x1800
/* 65D8 8001DDD8 E6C5000C */  jal        func_80031798
/* 65DC 8001DDDC 01000434 */   ori       $a0, $zero, 0x1
/* 65E0 8001DDE0 A5C3000C */  jal        func_80030E94
/* 65E4 8001DDE4 05000434 */   ori       $a0, $zero, 0x5
/* 65E8 8001DDE8 0F3C0234 */  ori        $v0, $zero, 0x3C0F
/* 65EC 8001DDEC 1000A2AF */  sw         $v0, 0x10($sp)
/* 65F0 8001DDF0 1400A0A7 */  sh         $zero, 0x14($sp)
/* 65F4 8001DDF4 1600A0A7 */  sh         $zero, 0x16($sp)
/* 65F8 8001DDF8 1800A0A7 */  sh         $zero, 0x18($sp)
/* 65FC 8001DDFC 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 6600 8001DE00 3000A0AF */  sw         $zero, 0x30($sp)
/* 6604 8001DE04 3400A0AF */  sw         $zero, 0x34($sp)
/* 6608 8001DE08 2C00A0A7 */  sh         $zero, 0x2C($sp)
/* 660C 8001DE0C 2E00A0A7 */  sh         $zero, 0x2E($sp)
/* 6610 8001DE10 2400A0AF */  sw         $zero, 0x24($sp)
/* 6614 8001DE14 2800B0AF */  sw         $s0, 0x28($sp)
/* 6618 8001DE18 2000A0A7 */  sh         $zero, 0x20($sp)
/* 661C 8001DE1C 2200A0A7 */  sh         $zero, 0x22($sp)
/* 6620 8001DE20 B477000C */  jal        func_8001DED0
/* 6624 8001DE24 1000A427 */   addiu     $a0, $sp, 0x10
/* 6628 8001DE28 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* 662C 8001DE2C FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 6630 8001DE30 3800A2AF */  sw         $v0, 0x38($sp)
/* 6634 8001DE34 83FF0234 */  ori        $v0, $zero, 0xFF83
/* 6638 8001DE38 3C00A2AF */  sw         $v0, 0x3C($sp)
/* 663C 8001DE3C 4000A0A7 */  sh         $zero, 0x40($sp)
/* 6640 8001DE40 4200A0A7 */  sh         $zero, 0x42($sp)
/* 6644 8001DE44 5400A0AF */  sw         $zero, 0x54($sp)
/* 6648 8001DE48 5800A0AF */  sw         $zero, 0x58($sp)
/* 664C 8001DE4C 5C00B0AF */  sw         $s0, 0x5C($sp)
/* 6650 8001DE50 6000B0AF */  sw         $s0, 0x60($sp)
/* 6654 8001DE54 03000234 */  ori        $v0, $zero, 0x3
/* 6658 8001DE58 6400A2AF */  sw         $v0, 0x64($sp)
/* 665C 8001DE5C 1F000234 */  ori        $v0, $zero, 0x1F
/* 6660 8001DE60 6800A2A7 */  sh         $v0, 0x68($sp)
/* 6664 8001DE64 6A00A0A7 */  sh         $zero, 0x6A($sp)
/* 6668 8001DE68 6C00A0A7 */  sh         $zero, 0x6C($sp)
/* 666C 8001DE6C 6E00A2A7 */  sh         $v0, 0x6E($sp)
/* 6670 8001DE70 7000A0A7 */  sh         $zero, 0x70($sp)
/* 6674 8001DE74 2AB1000C */  jal        func_8002C4A8
/* 6678 8001DE78 3800A427 */   addiu     $a0, $sp, 0x38
/* 667C 8001DE7C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 6680 8001DE80 9478000C */  jal        func_8001E250
/* 6684 8001DE84 FFFF8434 */   ori       $a0, $a0, (0xFFFFFF & 0xFFFF)
.L8001DE88:
/* 6688 8001DE88 7C00BF8F */  lw         $ra, 0x7C($sp)
/* 668C 8001DE8C 7800B08F */  lw         $s0, 0x78($sp)
/* 6690 8001DE90 0800E003 */  jr         $ra
/* 6694 8001DE94 8000BD27 */   addiu     $sp, $sp, 0x80
