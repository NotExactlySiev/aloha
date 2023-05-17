.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel parser
/* BCB8 800234B8 21408000 */  addu       $t0, $a0, $zero    //  arg
/* BCBC 800234BC 2148A000 */  addu       $t1, $a1, $zero    //  src
/* BCC0 800234C0 2150C000 */  addu       $t2, $a2, $zero    //  dst
/* BCC4 800234C4 00000B34 */  ori        $t3, $zero, 0x0    //  t3 = 0          // bit counter
/* BCC8 800234C8 FFFF0825 */  addiu      $t0, $t0, -0x1     //  arg -= 1        // max length
.L800234CC:                                                 //  while (true) {
/* BCCC 800234CC 04006015 */  bnez       $t3, .L800234E0    //      if t3 == 0 {
/* BCD0 800234D0 00000000 */   nop
/* BCD4 800234D4 00002C81 */  lb         $t4, 0x0($t1)      //          t4 = *src++
/* BCD8 800234D8 01002925 */  addiu      $t1, $t1, 0x1      //
/* BCDC 800234DC 08000B34 */  ori        $t3, $zero, 0x8    //          t3 = 8
.L800234E0:                                                 //      }
/* BCE0 800234E0 00003881 */  lb         $t8, 0x0($t1)      //      t8 = *src++
/* BCE4 800234E4 01002925 */  addiu      $t1, $t1, 0x1      //  
/* BCE8 800234E8 80008D31 */  andi       $t5, $t4, 0x80     //  
/* BCEC 800234EC 0300A015 */  bnez       $t5, .L800234FC    //      if t4 & 0x80 == 0
/* BCF0 800234F0 40600C00 */   sll       $t4, $t4, 1        //      {
/* BCF4 800234F4 07000010 */  b          .L80023514         //
/* BCF8 800234F8 01000F34 */   ori       $t7, $zero, 0x1    //          t7 = 1
.L800234FC:                                                 //      } else {
/* BCFC 800234FC 00002F81 */  lb         $t7, 0x0($t1)      //          t7 = *src++ & 0xFF
/* BD00 80023500 01002925 */  addiu      $t1, $t1, 0x1      //          
/* BD04 80023504 FF00EF31 */  andi       $t7, $t7, 0xFF     //
/* BD08 80023508 0200E015 */  bnez       $t7, .L80023514    //          if (t7 == 0) t7 = 0x100;
/* BD0C 8002350C 00000000 */   nop
/* BD10 80023510 00010F34 */  ori        $t7, $zero, 0x100
                                                            //      }
                                                            //      t4 = t4 << 1;
.L80023514:                                                 //      while (t7) {
/* BD14 80023514 000058A1 */  sb         $t8, 0x0($t2)      //          *dst++ = t8;
/* BD18 80023518 01004A25 */  addiu      $t2, $t2, 0x1      //
/* BD1C 8002351C 05000011 */  beqz       $t0, .L80023534    //          if (arg == 0) return;
/* BD20 80023520 FFFFEF21 */   addi      $t7, $t7, -0x1     //          t7--;
/* BD24 80023524 FBFFE015 */  bnez       $t7, .L80023514    //          arg--;
/* BD28 80023528 FFFF0825 */   addiu     $t0, $t0, -0x1     //      }
/* BD2C 8002352C E7FF0010 */  b          .L800234CC         //      t3--;
/* BD30 80023530 FFFF6B25 */   addiu     $t3, $t3, -0x1     //  }
.L80023534:
/* BD34 80023534 0800E003 */  jr         $ra
/* BD38 80023538 00000000 */   nop
