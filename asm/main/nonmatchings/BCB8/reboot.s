.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel reboot
/* C07C 8002387C A0FFBD27 */  addiu      $sp, $sp, -0x60
/* C080 80023880 2400BFAF */  sw         $ra, 0x24($sp)
/* C084 80023884 6000A4AF */  sw         $a0, 0x60($sp)
/* C088 80023888 2118A000 */  addu       $v1, $a1, $zero
/* C08C 8002388C 00006E80 */  lb         $t6, 0x0($v1)
/* C090 80023890 00000000 */  nop
/* C094 80023894 0300C015 */  bnez       $t6, .L800238A4
/* C098 80023898 00000000 */   nop
/* C09C 8002389C 0380033C */  lui        $v1, %hi(D_80034CB4)
/* C0A0 800238A0 B44C6324 */  addiu      $v1, $v1, %lo(D_80034CB4)
.L800238A4:
/* C0A4 800238A4 0380053C */  lui        $a1, %hi(D_80034CF0)
/* C0A8 800238A8 F04CA524 */  addiu      $a1, $a1, %lo(D_80034CF0)
/* C0AC 800238AC 4C00A427 */  addiu      $a0, $sp, 0x4C
/* C0B0 800238B0 228F000C */  jal        k_strcpy
/* C0B4 800238B4 6400A3AF */   sw        $v1, 0x64($sp)
/* C0B8 800238B8 6000A58F */  lw         $a1, 0x60($sp)
/* C0BC 800238BC 1A8F000C */  jal        k_strcat
/* C0C0 800238C0 4C00A427 */   addiu     $a0, $sp, 0x4C
/* C0C4 800238C4 0380053C */  lui        $a1, %hi(D_80034CF8)
/* C0C8 800238C8 F84CA524 */  addiu      $a1, $a1, %lo(D_80034CF8)
/* C0CC 800238CC 1A8F000C */  jal        k_strcat
/* C0D0 800238D0 4C00A427 */   addiu     $a0, $sp, 0x4C
/* C0D4 800238D4 0380053C */  lui        $a1, %hi(D_80034CFC)
/* C0D8 800238D8 FC4CA524 */  addiu      $a1, $a1, %lo(D_80034CFC)
/* C0DC 800238DC 228F000C */  jal        k_strcpy
/* C0E0 800238E0 3800A427 */   addiu     $a0, $sp, 0x38
/* C0E4 800238E4 6400A58F */  lw         $a1, 0x64($sp)
/* C0E8 800238E8 1A8F000C */  jal        k_strcat
/* C0EC 800238EC 3800A427 */   addiu     $a0, $sp, 0x38
/* C0F0 800238F0 0380053C */  lui        $a1, %hi(D_80034D04)
/* C0F4 800238F4 044DA524 */  addiu      $a1, $a1, %lo(D_80034D04)
/* C0F8 800238F8 1A8F000C */  jal        k_strcat
/* C0FC 800238FC 3800A427 */   addiu     $a0, $sp, 0x38
/* C100 80023900 C0BF183C */  lui        $t8, %hi(D_BFC00104)
/* C104 80023904 0401198F */  lw         $t9, %lo(D_BFC00104)($t8)
/* C108 80023908 C0BF0F3C */  lui        $t7, %hi(D_BFC00100)
/* C10C 8002390C 0001E78D */  lw         $a3, %lo(D_BFC00100)($t7)
/* C110 80023910 0380043C */  lui        $a0, %hi(D_80034D08)
/* C114 80023914 084D8424 */  addiu      $a0, $a0, %lo(D_80034D08)
/* C118 80023918 4C00A527 */  addiu      $a1, $sp, 0x4C
/* C11C 8002391C 3800A627 */  addiu      $a2, $sp, 0x38
/* C120 80023920 1E8F000C */  jal        k_printf
/* C124 80023924 1000B9AF */   sw        $t9, 0x10($sp)
/* C128 80023928 728E000C */  jal        func_800239C8
/* C12C 8002392C 00000000 */   nop
/* C130 80023930 C0BF083C */  lui        $t0, %hi(D_BFC00104)
/* C134 80023934 0401098D */  lw         $t1, %lo(D_BFC00104)($t0)
/* C138 80023938 00200124 */  addiu      $at, $zero, 0x2000
/* C13C 8002393C 0F002115 */  bne        $t1, $at, .L8002397C
/* C140 80023940 3800A427 */   addiu     $a0, $sp, 0x38
/* C144 80023944 C0BF0A3C */  lui        $t2, %hi(D_BFC00100)
/* C148 80023948 00014B8D */  lw         $t3, %lo(D_BFC00100)($t2)
/* C14C 8002394C 9419013C */  lui        $at, (0x19940728 >> 16)
/* C150 80023950 28072134 */  ori        $at, $at, (0x19940728 & 0xFFFF)
/* C154 80023954 09006115 */  bne        $t3, $at, .L8002397C
/* C158 80023958 3800A427 */   addiu     $a0, $sp, 0x38
/* C15C 8002395C C0BF0C3C */  lui        $t4, (0xBFC0E228 >> 16)
/* C160 80023960 28E28C35 */  ori        $t4, $t4, (0xBFC0E228 & 0xFFFF)
/* C164 80023964 3800A427 */  addiu      $a0, $sp, 0x38
/* C168 80023968 09F88001 */  jalr       $t4
/* C16C 8002396C 4C00A527 */   addiu     $a1, $sp, 0x4C
/* C170 80023970 05000010 */  b          .L80023988
/* C174 80023974 2400BF8F */   lw        $ra, 0x24($sp)
/* C178 80023978 3800A427 */  addiu      $a0, $sp, 0x38
.L8002397C:
/* C17C 8002397C 008E000C */  jal        k_boot
/* C180 80023980 4C00A527 */   addiu     $a1, $sp, 0x4C
/* C184 80023984 2400BF8F */  lw         $ra, 0x24($sp)
.L80023988:
/* C188 80023988 6000BD27 */  addiu      $sp, $sp, 0x60
/* C18C 8002398C 0800E003 */  jr         $ra
/* C190 80023990 00000000 */   nop
/* C194 80023994 00000000 */  nop
/* C198 80023998 00000000 */  nop
/* C19C 8002399C 00000000 */  nop
