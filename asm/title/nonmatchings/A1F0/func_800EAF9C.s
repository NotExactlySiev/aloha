.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EAF9C
/* B79C 800EAF9C 0F00E105 */  bgez       $t7, .L800EAFDC
/* B7A0 800EAFA0 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B7A4 800EAFA4 23780F00 */  negu       $t7, $t7
/* B7A8 800EAFA8 0100E105 */  bgez       $t7, .L800EAFB0
/* B7AC 800EAFAC FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EAFB0:
/* B7B0 800EAFB0 80C00F00 */  sll        $t8, $t7, 2
/* B7B4 800EAFB4 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B7B8 800EAFB8 21C83803 */  addu       $t9, $t9, $t8
/* B7BC 800EAFBC 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B7C0 800EAFC0 00000000 */  nop
/* B7C4 800EAFC4 00C41900 */  sll        $t8, $t9, 16
/* B7C8 800EAFC8 03C41800 */  sra        $t8, $t8, 16
/* B7CC 800EAFCC 23C01800 */  negu       $t8, $t8
/* B7D0 800EAFD0 037C1900 */  sra        $t7, $t9, 16
/* B7D4 800EAFD4 0800E003 */  jr         $ra
/* B7D8 800EAFD8 00000000 */   nop
.L800EAFDC:
/* B7DC 800EAFDC 80C01900 */  sll        $t8, $t9, 2
/* B7E0 800EAFE0 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B7E4 800EAFE4 21C83803 */  addu       $t9, $t9, $t8
/* B7E8 800EAFE8 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B7EC 800EAFEC 00000000 */  nop
/* B7F0 800EAFF0 00C41900 */  sll        $t8, $t9, 16
/* B7F4 800EAFF4 03C41800 */  sra        $t8, $t8, 16
/* B7F8 800EAFF8 037C1900 */  sra        $t7, $t9, 16
/* B7FC 800EAFFC 0800E003 */  jr         $ra
/* B800 800EB000 00000000 */   nop
