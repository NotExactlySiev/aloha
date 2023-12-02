## Overall Direction of this Decompilation
Splat is a flexible tool capable of many different things.
I aim to use only a limited subset of its features. I think I'm
just gonna leave the nonmatching inside the repository, I'm not
worried about the legallity of that. The asset files should be
ripped from the original image anyway. So I think leaving the
original code is fine.
Splat therefore is good for generating the initial set of those
along with the initial C files. But after that I can't think
of much else it can be used for. It assumes your project to be
a matching decompilation (at least as far as I can tell), which
Aloha is not. And I don't see much upside to maintaining two
sets of symbol files, one for the linker and one for Splat. I'm
already trying to merge all of the linker scripts into a single
shared one anyway.

## Exectuables
SCUS_941.03     0x80018000, 0x30000     CODE: 0x800188C8 - 0x800EB004   = 215503 instructions   WITHOUT PSYQ: - 0x80023994  = 11315 instructions 
TITLE.PEX       0x800E0000, 0x15000     CODE: 0x800E0920 - 0x800EB004   = 10681  instructions
SELECT.PEX      0x800E0000, 0x5F000     CODE: 0x800E0254 - 0x800EAA04   = 10732  instructions   WITHOUT PSYQ: - 0x800E7FC0  = 8027  instructions
GAMEOVER.PEX    0x800E0000, 0xD800      CODE: 0x800EB894 - 0x800ED2B0   = 1671   instructions   NO PSYQ
MAIN.PEX        0x800B0000, 0x53000     CODE: 0x800B0A68 - 0x800FD400   = 78438  instructions   WITHOUT PSYQ: 70813 instructions

for now we're ignoring the MAIN.PEX files other than JM1.

UI drawing functions are shared between GAMEOVER and SELECT.
(and possibly TITLE too)
The loop of gbuffer_clear -> update_routine -> render_routine -> gbuffer_draw
is used in both and the first and last functions are identical.

## TODO
- asserts for panicking when something bad happens

## Compiler
*this part related to matching the binaries is no longer relevant*
I think the standard libraries are compiled using PSYQ-3.5 but the game code itself is compiled using gcc 2.8.1 from PSYQ-4.3


## 274C.c

Memory map of data sections:

80047d04    libspu vars
80047d44    main.c vars
80047d74    274C.c vars
80047e6c    main.c vars (but could belong to 274C too maybe)
80047e84    274C.c vars
uninitialized
80048000    274C.c vars
80048044    main.c vars
(big buffers in this part for 274C.c)
80052248    libgpu data
...         other standard lib data




## JM1/MAIN.PEX

It seems to have libgpu linked into it again. Since it's very likely that it's the same
version of the library as the one in main, it should be possible to find duplicates.
It still uses the LoadImage and DrawSync functions that are provided in the jmptable,
so I don't know what exactly is going on there. There is a good chunk of libgpu included
in it tho.

In addition to that it has something we haven't dealt with yet: libgte. This file actually
is going to be doing 3D rendering so things are about to get interesting.
The file map doesn't seem to be as tidy and organized as main. Gonna have to figure it out.

800B0000    .rodata     loads of switch case tables
800B0A68    game code       22591 instructions
800C6B64    crt0
800C6BD4    libgpu
800C98F8    libgte
800CC338    libetc (yay, the entire gang is back!)
800CD010    game code       484 instructions
800CD7A0    libgte AGAIN
800CE098    game code       17039 instructions 
800DEAD4    libgpu
800DF1B4    game code       8069 instructions
800E6FC8    libgte
800E7268    game code (weird func, custom coprocessor functions, rendering)     13652 instructions
800F47B8    core rendering code. assembly hellscape         2663 instructions
800F7154    level loading and some more entity functions    6315 instructions
800FD400    .data
\
801383F0    various lists of pointers (to entities, but maybe more)

80103000

80060000 is where COM_DAT.EAR is loaded by SELECT.PEX


## SELECT.PEX

800E0000    .rodata
800E0254    game code
800E7F98    crt0
800E7FC0    libgte
800EAA04    .data (mostly textures)
8011E6F4    .data (COM_DAT)
8013DEA4    .data (normal, random seed array)
8013DEF0    .data (libgte)  just gotta keep this in the same place
8013F000    .bss

## GAMEOVER.PEX

None of the embedded files are compressed

800E0000    sprite data
800E0AEC    sprite tiles
800EA96C    clut 0
800EAB6C    clut 1
800EAD6C    clut 2
800EAF6C    bunny image (with header)
800EB874    .rodata (one jump table)
800EB894    .text
800ED264    crt0
800ED2B0    .data