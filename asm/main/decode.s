.include "macro.inc"

.set noat
.set noreorder

.section .text, "ax"

/* Generated by spimdisasm 1.13.2 */

# Handwritten function
glabel rle_decode
/* BCB8 800234B8 21408000 */  addu       $t0, $a0, $zero
/* BCBC 800234BC 2148A000 */  addu       $t1, $a1, $zero
/* BCC0 800234C0 2150C000 */  addu       $t2, $a2, $zero
/* BCC4 800234C4 00000B34 */  ori        $t3, $zero, 0x0
/* BCC8 800234C8 FFFF0825 */  addiu      $t0, $t0, -0x1
.L800234CC:
/* BCCC 800234CC 04006015 */  bnez       $t3, .L800234E0
/* BCD0 800234D0 00000000 */   nop
/* BCD4 800234D4 00002C81 */  lb         $t4, 0x0($t1)
/* BCD8 800234D8 01002925 */  addiu      $t1, $t1, 0x1
/* BCDC 800234DC 08000B34 */  ori        $t3, $zero, 0x8
.L800234E0:
/* BCE0 800234E0 00003881 */  lb         $t8, 0x0($t1)
/* BCE4 800234E4 01002925 */  addiu      $t1, $t1, 0x1
/* BCE8 800234E8 80008D31 */  andi       $t5, $t4, 0x80
/* BCEC 800234EC 0300A015 */  bnez       $t5, .L800234FC
/* BCF0 800234F0 40600C00 */   sll       $t4, $t4, 1
/* BCF4 800234F4 07000010 */  b          .L80023514
/* BCF8 800234F8 01000F34 */   ori       $t7, $zero, 0x1
.L800234FC:
/* BCFC 800234FC 00002F81 */  lb         $t7, 0x0($t1)
/* BD00 80023500 01002925 */  addiu      $t1, $t1, 0x1
/* BD04 80023504 FF00EF31 */  andi       $t7, $t7, 0xFF
/* BD08 80023508 0200E015 */  bnez       $t7, .L80023514
/* BD0C 8002350C 00000000 */   nop
/* BD10 80023510 00010F34 */  ori        $t7, $zero, 0x100
.L80023514:
/* BD14 80023514 000058A1 */  sb         $t8, 0x0($t2)
/* BD18 80023518 01004A25 */  addiu      $t2, $t2, 0x1
/* BD1C 8002351C 05000011 */  beqz       $t0, .L80023534
/* BD20 80023520 FFFFEF21 */   addi      $t7, $t7, -0x1 # handwritten instruction
/* BD24 80023524 FBFFE015 */  bnez       $t7, .L80023514
/* BD28 80023528 FFFF0825 */   addiu     $t0, $t0, -0x1
/* BD2C 8002352C E7FF0010 */  b          .L800234CC
/* BD30 80023530 FFFF6B25 */   addiu     $t3, $t3, -0x1
.L80023534:
/* BD34 80023534 0800E003 */  jr         $ra
/* BD38 80023538 00000000 */   nop

# Handwritten function
glabel lz1_decode
/* BD3C 8002353C 00000000 */  nop
/* BD40 80023540 2170E003 */  addu       $t6, $ra, $zero
/* BD44 80023544 21608000 */  addu       $t4, $a0, $zero
/* BD48 80023548 2168A000 */  addu       $t5, $a1, $zero
/* BD4C 8002354C 00008881 */  lb         $t0, 0x0($t4)
/* BD50 80023550 01008C25 */  addiu      $t4, $t4, 0x1
/* BD54 80023554 07000934 */  ori        $t1, $zero, 0x7
.L80023558:
/* BD58 80023558 00008181 */  lb         $at, 0x0($t4)
/* BD5C 8002355C 01008C25 */  addiu      $t4, $t4, 0x1
/* BD60 80023560 0000A1A1 */  sb         $at, 0x0($t5)
/* BD64 80023564 0100AD25 */  addiu      $t5, $t5, 0x1
.L80023568:
/* BD68 80023568 0400201D */  bgtz       $t1, .L8002357C
/* BD6C 8002356C 00000000 */   nop
/* BD70 80023570 08000934 */  ori        $t1, $zero, 0x8
/* BD74 80023574 00008881 */  lb         $t0, 0x0($t4)
/* BD78 80023578 01008C25 */  addiu      $t4, $t4, 0x1
.L8002357C:
/* BD7C 8002357C FFFF2925 */  addiu      $t1, $t1, -0x1
/* BD80 80023580 06102801 */  srlv       $v0, $t0, $t1
/* BD84 80023584 01004230 */  andi       $v0, $v0, 0x1
/* BD88 80023588 F3FF4010 */  beqz       $v0, .L80023558
/* BD8C 8002358C 00000000 */   nop
/* BD90 80023590 0400201D */  bgtz       $t1, .L800235A4
/* BD94 80023594 00000000 */   nop
/* BD98 80023598 08000934 */  ori        $t1, $zero, 0x8
/* BD9C 8002359C 00008881 */  lb         $t0, 0x0($t4)
/* BDA0 800235A0 01008C25 */  addiu      $t4, $t4, 0x1
.L800235A4:
/* BDA4 800235A4 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BDA8 800235A8 06102801 */  srlv       $v0, $t0, $t1
/* BDAC 800235AC 01004230 */  andi       $v0, $v0, 0x1
/* BDB0 800235B0 07004014 */  bnez       $v0, .L800235D0
/* BDB4 800235B4 00FF0A24 */   addiu     $t2, $zero, -0x100
/* BDB8 800235B8 00008191 */  lbu        $at, 0x0($t4)
/* BDBC 800235BC 01008C25 */  addiu      $t4, $t4, 0x1
/* BDC0 800235C0 2F002014 */  bnez       $at, .L80023680
/* BDC4 800235C4 25504101 */   or        $t2, $t2, $at
/* BDC8 800235C8 56000010 */  b          .L80023724
/* BDCC 800235CC 00000000 */   nop
.L800235D0:
/* BDD0 800235D0 00008191 */  lbu        $at, 0x0($t4)
/* BDD4 800235D4 01008C25 */  addiu      $t4, $t4, 0x1
/* BDD8 800235D8 25504101 */  or         $t2, $t2, $at
/* BDDC 800235DC 0400201D */  bgtz       $t1, .L800235F0
/* BDE0 800235E0 00000000 */   nop
/* BDE4 800235E4 08000934 */  ori        $t1, $zero, 0x8
/* BDE8 800235E8 00008881 */  lb         $t0, 0x0($t4)
/* BDEC 800235EC 01008C25 */  addiu      $t4, $t4, 0x1
.L800235F0:
/* BDF0 800235F0 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BDF4 800235F4 06102801 */  srlv       $v0, $t0, $t1
/* BDF8 800235F8 01004230 */  andi       $v0, $v0, 0x1
/* BDFC 800235FC 40500A00 */  sll        $t2, $t2, 1
/* BE00 80023600 25504201 */  or         $t2, $t2, $v0
/* BE04 80023604 0400201D */  bgtz       $t1, .L80023618
/* BE08 80023608 00000000 */   nop
/* BE0C 8002360C 08000934 */  ori        $t1, $zero, 0x8
/* BE10 80023610 00008881 */  lb         $t0, 0x0($t4)
/* BE14 80023614 01008C25 */  addiu      $t4, $t4, 0x1
.L80023618:
/* BE18 80023618 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BE1C 8002361C 06102801 */  srlv       $v0, $t0, $t1
/* BE20 80023620 01004230 */  andi       $v0, $v0, 0x1
/* BE24 80023624 40500A00 */  sll        $t2, $t2, 1
/* BE28 80023628 25504201 */  or         $t2, $t2, $v0
/* BE2C 8002362C 0400201D */  bgtz       $t1, .L80023640
/* BE30 80023630 00000000 */   nop
/* BE34 80023634 08000934 */  ori        $t1, $zero, 0x8
/* BE38 80023638 00008881 */  lb         $t0, 0x0($t4)
/* BE3C 8002363C 01008C25 */  addiu      $t4, $t4, 0x1
.L80023640:
/* BE40 80023640 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BE44 80023644 06102801 */  srlv       $v0, $t0, $t1
/* BE48 80023648 01004230 */  andi       $v0, $v0, 0x1
/* BE4C 8002364C 40500A00 */  sll        $t2, $t2, 1
/* BE50 80023650 25504201 */  or         $t2, $t2, $v0
/* BE54 80023654 0400201D */  bgtz       $t1, .L80023668
/* BE58 80023658 00000000 */   nop
/* BE5C 8002365C 08000934 */  ori        $t1, $zero, 0x8
/* BE60 80023660 00008881 */  lb         $t0, 0x0($t4)
/* BE64 80023664 01008C25 */  addiu      $t4, $t4, 0x1
.L80023668:
/* BE68 80023668 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BE6C 8002366C 06102801 */  srlv       $v0, $t0, $t1
/* BE70 80023670 01004230 */  andi       $v0, $v0, 0x1
/* BE74 80023674 40500A00 */  sll        $t2, $t2, 1
/* BE78 80023678 25504201 */  or         $t2, $t2, $v0
/* BE7C 8002367C 01FF4A25 */  addiu      $t2, $t2, -0xFF
.L80023680:
/* BE80 80023680 2108A001 */  addu       $at, $t5, $zero
/* BE84 80023684 20582A00 */  add        $t3, $at, $t2 # handwritten instruction
/* BE88 80023688 0400201D */  bgtz       $t1, .L8002369C
/* BE8C 8002368C 00000000 */   nop
/* BE90 80023690 08000934 */  ori        $t1, $zero, 0x8
/* BE94 80023694 00008881 */  lb         $t0, 0x0($t4)
/* BE98 80023698 01008C25 */  addiu      $t4, $t4, 0x1
.L8002369C:
/* BE9C 8002369C FFFF2925 */  addiu      $t1, $t1, -0x1
/* BEA0 800236A0 06102801 */  srlv       $v0, $t0, $t1
/* BEA4 800236A4 01004230 */  andi       $v0, $v0, 0x1
/* BEA8 800236A8 15004010 */  beqz       $v0, .L80023700
/* BEAC 800236AC 01000A34 */   ori       $t2, $zero, 0x1
.L800236B0:
/* BEB0 800236B0 0400201D */  bgtz       $t1, .L800236C4
/* BEB4 800236B4 00000000 */   nop
/* BEB8 800236B8 08000934 */  ori        $t1, $zero, 0x8
/* BEBC 800236BC 00008881 */  lb         $t0, 0x0($t4)
/* BEC0 800236C0 01008C25 */  addiu      $t4, $t4, 0x1
.L800236C4:
/* BEC4 800236C4 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BEC8 800236C8 06102801 */  srlv       $v0, $t0, $t1
/* BECC 800236CC 01004230 */  andi       $v0, $v0, 0x1
/* BED0 800236D0 40500A00 */  sll        $t2, $t2, 1
/* BED4 800236D4 25504201 */  or         $t2, $t2, $v0
/* BED8 800236D8 0400201D */  bgtz       $t1, .L800236EC
/* BEDC 800236DC 00000000 */   nop
/* BEE0 800236E0 08000934 */  ori        $t1, $zero, 0x8
/* BEE4 800236E4 00008881 */  lb         $t0, 0x0($t4)
/* BEE8 800236E8 01008C25 */  addiu      $t4, $t4, 0x1
.L800236EC:
/* BEEC 800236EC FFFF2925 */  addiu      $t1, $t1, -0x1
/* BEF0 800236F0 06102801 */  srlv       $v0, $t0, $t1
/* BEF4 800236F4 01004230 */  andi       $v0, $v0, 0x1
/* BEF8 800236F8 EDFF4014 */  bnez       $v0, .L800236B0
/* BEFC 800236FC 00000000 */   nop
.L80023700:
/* BF00 80023700 00006181 */  lb         $at, 0x0($t3)
/* BF04 80023704 0100AD25 */  addiu      $t5, $t5, 0x1
/* BF08 80023708 FFFF4A25 */  addiu      $t2, $t2, -0x1
/* BF0C 8002370C FFFFA1A1 */  sb         $at, -0x1($t5)
/* BF10 80023710 01006B25 */  addiu      $t3, $t3, 0x1
/* BF14 80023714 FAFF4105 */  bgez       $t2, .L80023700
/* BF18 80023718 00000000 */   nop
/* BF1C 8002371C 92FF0010 */  b          .L80023568
/* BF20 80023720 00000000 */   nop
.L80023724:
/* BF24 80023724 2210A501 */  sub        $v0, $t5, $a1 # handwritten instruction
/* BF28 80023728 0800C001 */  jr         $t6
/* BF2C 8002372C 00000000 */   nop
/* BF30 80023730 00000000 */  nop
/* BF34 80023734 00000000 */  nop
/* BF38 80023738 00000000 */  nop