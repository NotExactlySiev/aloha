.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024080
/* C880 80024080 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* C884 80024084 1400B1AF */  sw         $s1, 0x14($sp)
/* C888 80024088 21888000 */  addu       $s1, $a0, $zero
/* C88C 8002408C 1000B0AF */  sw         $s0, 0x10($sp)
/* C890 80024090 1800BFAF */  sw         $ra, 0x18($sp)
/* C894 80024094 6A90000C */  jal        func_800241A8
/* C898 80024098 2180A000 */   addu      $s0, $a1, $zero
/* C89C 8002409C 0380033C */  lui        $v1, %hi(D_80034E94)
/* C8A0 800240A0 944E638C */  lw         $v1, %lo(D_80034E94)($v1)
/* C8A4 800240A4 00000000 */  nop
/* C8A8 800240A8 0000628C */  lw         $v0, 0x0($v1)
/* C8AC 800240AC 42811000 */  srl        $s0, $s0, 5
/* C8B0 800240B0 88004234 */  ori        $v0, $v0, 0x88
/* C8B4 800240B4 000062AC */  sw         $v0, 0x0($v1)
/* C8B8 800240B8 0380023C */  lui        $v0, %hi(D_80034E70)
/* C8BC 800240BC 704E428C */  lw         $v0, %lo(D_80034E70)($v0)
/* C8C0 800240C0 00841000 */  sll        $s0, $s0, 16
/* C8C4 800240C4 000040AC */  sw         $zero, 0x0($v0)
/* C8C8 800240C8 0380023C */  lui        $v0, %hi(D_80034E68)
/* C8CC 800240CC 684E428C */  lw         $v0, %lo(D_80034E68)($v0)
/* C8D0 800240D0 20001036 */  ori        $s0, $s0, 0x20
/* C8D4 800240D4 000051AC */  sw         $s1, 0x0($v0)
/* C8D8 800240D8 0380023C */  lui        $v0, %hi(D_80034E6C)
/* C8DC 800240DC 6C4E428C */  lw         $v0, %lo(D_80034E6C)($v0)
/* C8E0 800240E0 0001033C */  lui        $v1, (0x1000200 >> 16)
/* C8E4 800240E4 000050AC */  sw         $s0, 0x0($v0)
/* C8E8 800240E8 0380023C */  lui        $v0, %hi(D_80034E70)
/* C8EC 800240EC 704E428C */  lw         $v0, %lo(D_80034E70)($v0)
/* C8F0 800240F0 00026334 */  ori        $v1, $v1, (0x1000200 & 0xFFFF)
/* C8F4 800240F4 000043AC */  sw         $v1, 0x0($v0)
/* C8F8 800240F8 1800BF8F */  lw         $ra, 0x18($sp)
/* C8FC 800240FC 1400B18F */  lw         $s1, 0x14($sp)
/* C900 80024100 1000B08F */  lw         $s0, 0x10($sp)
/* C904 80024104 2000BD27 */  addiu      $sp, $sp, 0x20
/* C908 80024108 0800E003 */  jr         $ra
/* C90C 8002410C 00000000 */   nop
