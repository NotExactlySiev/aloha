.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D398
/* 5B98 8001D398 0480033C */  lui        $v1, %hi(D_80047DB0)
/* 5B9C 8001D39C B07D638C */  lw         $v1, %lo(D_80047DB0)($v1)
/* 5BA0 8001D3A0 1000023C */  lui        $v0, (0x100000 >> 16)
/* 5BA4 8001D3A4 2B104300 */  sltu       $v0, $v0, $v1
/* 5BA8 8001D3A8 12004010 */  beqz       $v0, .L8001D3F4
/* 5BAC 8001D3AC 00000000 */   nop
/* 5BB0 8001D3B0 0580033C */  lui        $v1, %hi(D_80048090)
/* 5BB4 8001D3B4 90806324 */  addiu      $v1, $v1, %lo(D_80048090)
/* 5BB8 8001D3B8 50506524 */  addiu      $a1, $v1, 0x5050
.L8001D3BC:
/* 5BBC 8001D3BC 0000628C */  lw         $v0, 0x0($v1)
/* 5BC0 8001D3C0 00000000 */  nop
/* 5BC4 8001D3C4 42100200 */  srl        $v0, $v0, 1
/* 5BC8 8001D3C8 000062AC */  sw         $v0, 0x0($v1)
/* 5BCC 8001D3CC 08086324 */  addiu      $v1, $v1, 0x808
/* 5BD0 8001D3D0 2A106500 */  slt        $v0, $v1, $a1
/* 5BD4 8001D3D4 F9FF4014 */  bnez       $v0, .L8001D3BC
/* 5BD8 8001D3D8 00000000 */   nop
/* 5BDC 8001D3DC 0480023C */  lui        $v0, %hi(D_80047DB0)
/* 5BE0 8001D3E0 B07D428C */  lw         $v0, %lo(D_80047DB0)($v0)
/* 5BE4 8001D3E4 00000000 */  nop
/* 5BE8 8001D3E8 42100200 */  srl        $v0, $v0, 1
/* 5BEC 8001D3EC 0480013C */  lui        $at, %hi(D_80047DB0)
/* 5BF0 8001D3F0 B07D22AC */  sw         $v0, %lo(D_80047DB0)($at)
.L8001D3F4:
/* 5BF4 8001D3F4 0480023C */  lui        $v0, %hi(D_80047DB0)
/* 5BF8 8001D3F8 B07D428C */  lw         $v0, %lo(D_80047DB0)($v0)
/* 5BFC 8001D3FC 00000000 */  nop
/* 5C00 8001D400 01004224 */  addiu      $v0, $v0, 0x1
/* 5C04 8001D404 0480013C */  lui        $at, %hi(D_80047DB0)
/* 5C08 8001D408 B07D22AC */  sw         $v0, %lo(D_80047DB0)($at)
/* 5C0C 8001D40C 0800E003 */  jr         $ra
/* 5C10 8001D410 000082AC */   sw        $v0, 0x0($a0)
