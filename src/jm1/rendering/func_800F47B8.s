.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# transforms and writes the vertices to the start of scratchpad

glabel func_800F47B8
/* 44FB8 800F47B8 */ lui    $t6, 0x1F80
/* 44FBC 800F47BC */ lw     $s1, 0x3A0($t6)         # address of vertices
/* 44FC0 800F47C0 */ mfc2   $t3, $2                 # put the offset vector in $t3,$t5
/* 44FC4 800F47C4 */ mfc2   $t5, $3
/* 44FC8 800F47C8 */ lw     $at, 0($a0)             # length of subset header (ranges)
/* 44FCC 800F47CC */ addiu  $t6, -12
/* 44FD0 800F47D0 */ lui    $t7, 0xff00             # screen position high bytes mask (overflow?)
/* 44FD4 800F47D4 */ ori    $t7, 0xff00
/* 44FD8 800F47D8 */ lui    $a3, 0xfffe
/* 44FDC 800F47DC */ ori    $a3, 0xffff
/* 44FE0 800F47E0 */ addiu  $a0, 4
/* 44FE4 800F47E4 */ addu   $at, $a0
/* 44FE8 800F47E8 */ lw     $v0, 0($a0)             # read first range
/* 44FEC 800F47EC */ li     $s4, 0x7fff             # INT16_MAX? used to find a min value?
/* 44FF0 800F47F0 */ srl    $s2, $v0, 0x10          # len
/* 44FF4 800F47F4 */ andi   $v0, 0xffff             # base offset
/* 44FF8 800F47F8 */ addu   $s0, $v0, $s1           # go to first vertex (base)
/* 44FFC 800F47FC */ lw     $t8, 0($s0)             # load vertex
/* 45000 800F4800 */ lw     $t9, 4($s0)             
/* 45004 800F4804 */ lui    $t2, 0xffff
/* 45008 800F4808 */ and    $t3, $a3                # add the vector in $t3,$t5
/* 4500C 800F480C */ and    $t8, $a3                # (offset vector)
/* 45010 800F4810 */ addu   $t8, $t3
/* 45014 800F4814 */ and    $t8, $a3
/* 45018 800F4818 */ addu   $t9, $t5
.L800F481C:
/* 4501C 800F481C */ mtc2   $t8, $0
/* 45020 800F4820 */ mtc2   $t9, $1
/* 45024 800F4824 */ addiu  $s0, 8                  # go to next vertex
/* 45028 800F4828 */ .word 0x4A180001               # perspective transform (rtps)
/* 4502C 800F482C */ bgtz   $s2, .L800F4854         # range still going?
/* 45030 800F4830 */ addiu  $s2, -1
/* 45034 800F4834 */ addiu  $a0, 4                  # go to next range
/* 45038 800F4838 */ beq    $a0, $at, .L800F487C    # no more ranges?
/* 4503C 800F483C */ nop
/* 45040 800F4840 */ lw     $v0, 0($a0)             # set base and len again
/* 45044 800F4844 */ nop 
/* 45048 800F4848 */ srl  $s2, $v0, 0x10
/* 4504C 800F484C */ andi $v0, 0xFFFF
/* 45050 800F4850 */ addu $s0, $v0, $s1
.L800F4854:
/* 45054 800F4854 */ lw     $t8, 0($s0)             # get next vertex
/* 45058 800F4858 */ lw     $t9, 4($s0)
/* 4505C 800F485C */ subu   $v0, $s4, $s3           # don't know what this is
/* 45060 800F4860 */ blez   $v0, .L800F486C         # finding some min?
/* 45064 800F4864 */ nop
/* 45068 800F4868 */ move   $s4, $s3
.L800F486C:
/* 4506C 800F486C */ and    $t8, $a3                # add the offset vector again
/* 45070 800F4870 */ addu   $t8, $t3
/* 45074 800F4874 */ and    $t8, $a3
/* 45078 800F4878 */ addu   $t9, $t5
.L800F487C:
/* 4507C 800F487C */ addiu  $t6, 12                 # go to next translated vector 
/* 45080 800F4880 */ cfc2   $zero, $31              # and write the results (raw and screen)
/* 45084 800F4884 */ swc2   $25, 0($t6)             # mac1
/* 45088 800F4888 */ mfc2   $v0, $26                # mac2
/* 4508C 800F488C */ mfc2   $s3, $27                # mac3
/* 45090 800F4890 */ mfc2   $t4, $8                 # depth cueing
/* 45094 800F4894 */ sh     $v0, 2($t6)
/* 45098 800F4898 */ sh     $s3, 6($t6)
/* 4509C 800F489C */ cfc2   $v1, $31
/* 450A0 800F48A0 */ mfc2   $t1, $14                # SXY2
/* 450A4 800F48A4 */ andi   $t4, 0x1fe0
/* 450A8 800F48A8 */ bltz   $v1, .L800F48D0         # not overflow?
/* 450AC 800F48AC */ and    $v0, $t1, $t7           # check high bytes of screen pos
/* 450B0 800F48B0 */ sw     $t1, 0x0008($t6)        # write screen pos
/* 450B4 800F48B4 */ bne    $v0, $zero, .L800F493C  # any high bytes set? (x or y > 255)
/* 450B8 800F48B8 */ andi   $t2, 0xffff
/* 450BC 800F48BC */ sh     $t4, 0x0004($t6)
/* 450C0 800F48C0 */ bne    $at, $a0, .L800F481C
/* 450C4 800F48C4 */ nop
/* 450C8 800F48C8 */ b      .L800F4984
/* 450CC 800F48CC */ nop
.L800F48D0:
/* 450D0 800F48D0 */ sw     $t1, 8($t6)        # write screen pos
/* 450D4 800F48D4 */ sll    $v0, $v1, 0xe # .word 0x00031380
/* 450D8 800F48D8 */ bltz   $v0, .L800F4968 # .word 0x04400023
/* 450DC 800F48DC */ ori   $t0, $zero, 0x8000 # .word 0x34088000
/* 450E0 800F48E0 */ .word 0x4808D800
/* 450E4 800F48E4 */ lui    $t1, 0x0004 # .word 0x3C090004
/* 450E8 800F48E8 */ .word 0x0128001A   # divu    $t1, $t0
/* 450EC 800F48EC */ mfc0   $v1, $12   # .word 0x40036000
/* 450F0 800F48F0 */ addiu   $v0, $zero, 0xfffe # .word 0x2402FFFE
/* 450F4 800F48F4 */ and    $v0, $v1 # .word 0x00431024
/* 450F8 800F48F8 */ .word 0x40826000
/* 450FC 800F48FC */ nop    # .word 0x00000000
/* 45100 800F4900 */ mflo   $v0 # .word 0x00001012
/* 45104 800F4904 */ mtc2   $v0, $8       #.word 0x48824000
/* 45108 800F4908 */ nop    # .word 0x00000000
/* 4510C 800F490C */ nop    # .word 0x00000000
/* 45110 800F4910 */ .word 0x4B98003D # invalid instruction
/* 45114 800F4914 */ .word 0x4840F800
/* 45118 800F4918 */ .word 0x4809C800
/* 4511C 800F491C */ .word 0x4802D000
/* 45120 800F4920 */ .word 0x25290080
/* 45124 800F4924 */ .word 0x24420080
/* 45128 800F4928 */ .word 0x40836000
/* 4512C 800F492C */ .word 0xA5C90008
/* 45130 800F4930 */ .word 0xA5C2000A
/* 45134 800F4934 */ .word 0x10000002
/* 45138 800F4938 */ nop

.L800F493C:     # screen x or y > 255
/* 4513C 800F493C */ .word 0x00091403
/* 45140 800F4940 */ .word 0x3129FF00
/* 45144 800F4944 */ .word 0x11200003
/* 45148 800F4948 */ .word 0x3042FF00
/* 4514C 800F494C */ .word 0x00094BC2
/* 45150 800F4950 */ .word 0x25290001
/* 45154 800F4954 */ .word 0x10400004
/* 45158 800F4958 */ .word 0x00094080
/* 4515C 800F495C */ .word 0x000213C2
/* 45160 800F4960 */ .word 0x24420001
/* 45164 800F4964 */ .word 0x01024021

.L800F4968:
/* 45168 800F4968 */ or     $t4, $t0 # .word 0x01886025
/* 4516C 800F496C */ sh     $t4, 0x0004($t6) # .word 0xA5CC0004
/* 45170 800F4970 */ or     $t2, $t0 # .word 0x01485025
/* 45174 800F4974 */ sll    $t0, 0x10 # .word 0x00084400
/* 45178 800F4978 */ ori    $t0, 0xffff # .word 0x3508FFFF
/* 4517C 800F497C */ bne    $at, $a0, .L800F481C # .word 0x1424FFA7
/* 45180 800F4980 */ and    $t2, $t0 # .word 0x01485024
.L800F4984:
/* 45184 800F4984 */ subu   $v0, $s4, $s3 # .word 0x02931023
/* 45188 800F4988 */ blez   $v0, .L800F4994 # .word 0x18400002
/* 4518C 800F498C */ nop     # .word 0x00000000
/* 45190 800F4990 */ .word 0x0260A021
.L800F4994:
/* 45194 800F4994 */ move   $v1, $s4 # .word 0x02801821
/* 45198 800F4998 */ jr     $ra # .word 0x03E00008
/* 4519C 800F499C */ move   $v0, $t2 # .word 0x01401021

