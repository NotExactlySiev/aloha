.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */           # copy mode  0: copy 1 byte     1: transition out of copy mode
                                                                # ??? mode   0: 

# Handwritten function
glabel wtf
/* BD3C 8002353C 00000000 */  nop
/* BD40 80023540 2170E003 */  addu       $t6, $ra, $zero    # no idea why
/* BD44 80023544 21608000 */  addu       $t4, $a0, $zero    # t4 is the src pointer
/* BD48 80023548 2168A000 */  addu       $t5, $a1, $zero    # t5 is the dst pointer

/* BD4C 8002354C 00008881 */  lb         $t0, 0x0($t4)      # t0 = read(src)
/* BD50 80023550 01008C25 */  addiu      $t4, $t4, 0x1      # 
/* BD54 80023554 07000934 */  ori        $t1, $zero, 0x7    # t1 = 7
.L80023558:                                                 # /-----------------
/* BD58 80023558 00008181 */  lb         $at, 0x0($t4)      # |  copy 1 byte
/* BD5C 8002355C 01008C25 */  addiu      $t4, $t4, 0x1      # |
/* BD60 80023560 0000A1A1 */  sb         $at, 0x0($t5)      # |
/* BD64 80023564 0100AD25 */  addiu      $t5, $t5, 0x1      # |
.L80023568:     # WHAT IS THIS JESUS FUCK                   # |
/* BD68 80023568 0400201D */  bgtz       $t1, .L8002357C    # |  if (t1 == 0)
/* BD6C 8002356C 00000000 */   nop                          # |  {
/* BD70 80023570 08000934 */  ori        $t1, $zero, 0x8    # |      t1 = 8
/* BD74 80023574 00008881 */  lb         $t0, 0x0($t4)      # |      t0 = read(src)
/* BD78 80023578 01008C25 */  addiu      $t4, $t4, 0x1      # |  }
.L8002357C:                                                 # |
/* BD7C 8002357C FFFF2925 */  addiu      $t1, $t1, -0x1     # |  t1 -= 1
/* BD80 80023580 06102801 */  srlv       $v0, $t0, $t1      # |              # t1 = (7 ... 0)
/* BD84 80023584 01004230 */  andi       $v0, $v0, 0x1      # |
/* BD88 80023588 F3FF4010 */  beqz       $v0, .L80023558    # \----- while ((t0 >> t1) & 1 == 0)
/* BD8C 8002358C 00000000 */   nop
/* BD90 80023590 0400201D */  bgtz       $t1, .L800235A4    # if (t1 == 0)
/* BD94 80023594 00000000 */   nop                          # {
/* BD98 80023598 08000934 */  ori        $t1, $zero, 0x8    #       t1 = 8
/* BD9C 8002359C 00008881 */  lb         $t0, 0x0($t4)      #       t0 = read(src)
/* BDA0 800235A0 01008C25 */  addiu      $t4, $t4, 0x1      # }



.L800235A4:
/* BDA4 800235A4 FFFF2925 */  addiu      $t1, $t1, -0x1     # t1 -= 1
/* BDA8 800235A8 06102801 */  srlv       $v0, $t0, $t1
/* BDAC 800235AC 01004230 */  andi       $v0, $v0, 0x1
/* BDB0 800235B0 07004014 */  bnez       $v0, .L800235D0    # if ((t0 >> t1) & 1 == 0) {
/* BDB4 800235B4 00FF0A24 */   addiu     $t2, $zero, -0x100 #   at = read(src)
/* BDB8 800235B8 00008191 */  lbu        $at, 0x0($t4)      #   if (at == 0) return;    # where you're done
/* BDBC 800235BC 01008C25 */  addiu      $t4, $t4, 0x1      #   
/* BDC0 800235C0 2F002014 */  bnez       $at, .L80023680    #
/* BDC4 800235C4 25504101 */   or        $t2, $t2, $at      #   t2 = at - 256
/* BDC8 800235C8 56000010 */  b          .L80023724         #   
/* BDCC 800235CC 00000000 */   nop                          # }
.L800235D0:                                                 # else
/* BDD0 800235D0 00008191 */  lbu        $at, 0x0($t4)      # {
/* BDD4 800235D4 01008C25 */  addiu      $t4, $t4, 0x1      # at = read()
/* BDD8 800235D8 25504101 */  or         $t2, $t2, $at      # off = at - 256
/* BDDC 800235DC 0400201D */  bgtz       $t1, .L800235F0    # decrement t1 and read next head
/* BDE0 800235E0 00000000 */   nop
/* BDE4 800235E4 08000934 */  ori        $t1, $zero, 0x8
/* BDE8 800235E8 00008881 */  lb         $t0, 0x0($t4)
/* BDEC 800235EC 01008C25 */  addiu      $t4, $t4, 0x1
.L800235F0:
/* BDF0 800235F0 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BDF4 800235F4 06102801 */  srlv       $v0, $t0, $t1
/* BDF8 800235F8 01004230 */  andi       $v0, $v0, 0x1
/* BDFC 800235FC 40500A00 */  sll        $t2, $t2, 1        
/* BE00 80023600 25504201 */  or         $t2, $t2, $v0      # off = (off << 2) | shifted
/* BE04 80023604 0400201D */  bgtz       $t1, .L80023618    # decrement t1 and read next head
/* BE08 80023608 00000000 */   nop
/* BE0C 8002360C 08000934 */  ori        $t1, $zero, 0x8
/* BE10 80023610 00008881 */  lb         $t0, 0x0($t4)
/* BE14 80023614 01008C25 */  addiu      $t4, $t4, 0x1
.L80023618:
/* BE18 80023618 FFFF2925 */  addiu      $t1, $t1, -0x1
/* BE1C 8002361C 06102801 */  srlv       $v0, $t0, $t1
/* BE20 80023620 01004230 */  andi       $v0, $v0, 0x1
/* BE24 80023624 40500A00 */  sll        $t2, $t2, 1
/* BE28 80023628 25504201 */  or         $t2, $t2, $v0      # off = (off << 2) | 1
/* BE2C 8002362C 0400201D */  bgtz       $t1, .L80023640    # decrement t1 and read next head
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
.L80023680:                                                 # }
/* BE80 80023680 2108A001 */  addu       $at, $t5, $zero    # 
/* BE84 80023684 20582A00 */  add        $t3, $at, $t2      # t3 = dst + t2  (dst - 256 + offset)
/* BE88 80023688 0400201D */  bgtz       $t1, .L8002369C    # decrement t1 and read next head
/* BE8C 8002368C 00000000 */   nop
/* BE90 80023690 08000934 */  ori        $t1, $zero, 0x8
/* BE94 80023694 00008881 */  lb         $t0, 0x0($t4)
/* BE98 80023698 01008C25 */  addiu      $t4, $t4, 0x1
.L8002369C:
/* BE9C 8002369C FFFF2925 */  addiu      $t1, $t1, -0x1
/* BEA0 800236A0 06102801 */  srlv       $v0, $t0, $t1      
/* BEA4 800236A4 01004230 */  andi       $v0, $v0, 0x1      
/* BEA8 800236A8 15004010 */  beqz       $v0, .L80023700    # t2 = 1
/* BEAC 800236AC 01000A34 */   ori       $t2, $zero, 0x1    # while ((t0 >> t1) & 1) {
.L800236B0:
/* BEB0 800236B0 0400201D */  bgtz       $t1, .L800236C4    # decrement t1 and read next head
/* BEB4 800236B4 00000000 */   nop
/* BEB8 800236B8 08000934 */  ori        $t1, $zero, 0x8
/* BEBC 800236BC 00008881 */  lb         $t0, 0x0($t4)
/* BEC0 800236C0 01008C25 */  addiu      $t4, $t4, 0x1
.L800236C4:
/* BEC4 800236C4 FFFF2925 */  addiu      $t1, $t1, -0x1     
/* BEC8 800236C8 06102801 */  srlv       $v0, $t0, $t1      # t2 = (t2 << 1) | ((t0 >> t1) & 1)  # push the bit in t2 from right
/* BECC 800236CC 01004230 */  andi       $v0, $v0, 0x1
/* BED0 800236D0 40500A00 */  sll        $t2, $t2, 1
/* BED4 800236D4 25504201 */  or         $t2, $t2, $v0
/* BED8 800236D8 0400201D */  bgtz       $t1, .L800236EC    # decrement t1 and read next head
/* BEDC 800236DC 00000000 */   nop
/* BEE0 800236E0 08000934 */  ori        $t1, $zero, 0x8
/* BEE4 800236E4 00008881 */  lb         $t0, 0x0($t4)
/* BEE8 800236E8 01008C25 */  addiu      $t4, $t4, 0x1
.L800236EC:
/* BEEC 800236EC FFFF2925 */  addiu      $t1, $t1, -0x1     
/* BEF0 800236F0 06102801 */  srlv       $v0, $t0, $t1
/* BEF4 800236F4 01004230 */  andi       $v0, $v0, 0x1
/* BEF8 800236F8 EDFF4014 */  bnez       $v0, .L800236B0    
/* BEFC 800236FC 00000000 */   nop                          # }
.L80023700:                                                 # while (t2 >= 0) {
                                                        
/* BF00 80023700 00006181 */  lb         $at, 0x0($t3)      #   at = *t3
/* BF04 80023704 0100AD25 */  addiu      $t5, $t5, 0x1      #   t2 -= 1
/* BF08 80023708 FFFF4A25 */  addiu      $t2, $t2, -0x1     # 
/* BF0C 8002370C FFFFA1A1 */  sb         $at, -0x1($t5)     #   write(at)
/* BF10 80023710 01006B25 */  addiu      $t3, $t3, 0x1
/* BF14 80023714 FAFF4105 */  bgez       $t2, .L80023700
/* BF18 80023718 00000000 */   nop                          # }
/* BF1C 8002371C 92FF0010 */  b          .L80023568
/* BF20 80023720 00000000 */   nop
.L80023724:
/* BF24 80023724 2210A501 */  sub        $v0, $t5, $a1 # handwritten instruction
/* BF28 80023728 0800C001 */  jr         $ra
/* BF2C 8002372C 00000000 */   nop
/* BF30 80023730 00000000 */  nop
/* BF34 80023734 00000000 */  nop
/* BF38 80023738 00000000 */  nop
