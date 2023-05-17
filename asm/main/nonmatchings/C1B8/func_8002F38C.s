.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002F38C
/* 17B8C 8002F38C FFF0073C */  lui        $a3, (0xF0FFFFFF >> 16)
/* 17B90 8002F390 0480033C */  lui        $v1, %hi(D_80047D08)
/* 17B94 8002F394 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 17B98 8002F398 FFFFE734 */  ori        $a3, $a3, (0xF0FFFFFF & 0xFFFF)
/* 17B9C 8002F39C A60165A4 */  sh         $a1, 0x1A6($v1)
/* 17BA0 8002F3A0 AA016294 */  lhu        $v0, 0x1AA($v1)
/* 17BA4 8002F3A4 0480053C */  lui        $a1, %hi(D_80047D20)
/* 17BA8 8002F3A8 207DA58C */  lw         $a1, %lo(D_80047D20)($a1)
/* 17BAC 8002F3AC 30004234 */  ori        $v0, $v0, 0x30
/* 17BB0 8002F3B0 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* 17BB4 8002F3B4 0000A28C */  lw         $v0, 0x0($a1)
/* 17BB8 8002F3B8 0022033C */  lui        $v1, (0x22000000 >> 16)
/* 17BBC 8002F3BC 24104700 */  and        $v0, $v0, $a3
/* 17BC0 8002F3C0 25104300 */  or         $v0, $v0, $v1
/* 17BC4 8002F3C4 0000A2AC */  sw         $v0, 0x0($a1)
/* 17BC8 8002F3C8 0480053C */  lui        $a1, %hi(D_80047D1C)
/* 17BCC 8002F3CC 1C7DA58C */  lw         $a1, %lo(D_80047D1C)($a1)
/* 17BD0 8002F3D0 00340600 */  sll        $a2, $a2, 16
/* 17BD4 8002F3D4 0000A28C */  lw         $v0, 0x0($a1)
/* 17BD8 8002F3D8 9000033C */  lui        $v1, (0x900000 >> 16)
/* 17BDC 8002F3DC 25104300 */  or         $v0, $v0, $v1
/* 17BE0 8002F3E0 0000A2AC */  sw         $v0, 0x0($a1)
/* 17BE4 8002F3E4 0480053C */  lui        $a1, %hi(D_80047D18)
/* 17BE8 8002F3E8 187DA58C */  lw         $a1, %lo(D_80047D18)($a1)
/* 17BEC 8002F3EC 1000C634 */  ori        $a2, $a2, 0x10
/* 17BF0 8002F3F0 0000A28C */  lw         $v0, 0x0($a1)
/* 17BF4 8002F3F4 0800033C */  lui        $v1, (0x80000 >> 16)
/* 17BF8 8002F3F8 25104300 */  or         $v0, $v0, $v1
/* 17BFC 8002F3FC 0000A2AC */  sw         $v0, 0x0($a1)
/* 17C00 8002F400 0480023C */  lui        $v0, %hi(D_80047D0C)
/* 17C04 8002F404 0C7D428C */  lw         $v0, %lo(D_80047D0C)($v0)
/* 17C08 8002F408 0001073C */  lui        $a3, (0x1000200 >> 16)
/* 17C0C 8002F40C 000044AC */  sw         $a0, 0x0($v0)
/* 17C10 8002F410 0480023C */  lui        $v0, %hi(D_80047D10)
/* 17C14 8002F414 107D428C */  lw         $v0, %lo(D_80047D10)($v0)
/* 17C18 8002F418 0002E734 */  ori        $a3, $a3, (0x1000200 & 0xFFFF)
/* 17C1C 8002F41C 000046AC */  sw         $a2, 0x0($v0)
/* 17C20 8002F420 0480033C */  lui        $v1, %hi(D_80047D14)
/* 17C24 8002F424 147D638C */  lw         $v1, %lo(D_80047D14)($v1)
/* 17C28 8002F428 01000234 */  ori        $v0, $zero, 0x1
/* 17C2C 8002F42C 0580013C */  lui        $at, %hi(D_800546EC)
/* 17C30 8002F430 EC4622AC */  sw         $v0, %lo(D_800546EC)($at)
/* 17C34 8002F434 000067AC */  sw         $a3, 0x0($v1)
/* 17C38 8002F438 0800E003 */  jr         $ra
/* 17C3C 8002F43C 00000000 */   nop
