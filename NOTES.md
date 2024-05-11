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

loads of UI code is reused between SELECT, GAMEOVER and (I think) TITLE.

## TODO
- asserts for panicking when something bad happens


## Rendering
rewriting func_800F443C (sort sets) causes the rendering code to break. the rewritten one in C destroys $a3, which
is not expected by func_800F4548 (draw_mesh)
this makes me quite certain that draw_mesh was written in assembly. because otherwise it would have saved $a3.
was sort_sets also written in assembly? who knows. it accesses the system status register (cop0r12) which is weird.

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


# Level Data

Each level's assets are in two EAR files.
xxx_DAT.EAR contains the level geometry, textures, objects, enemy spawners, collisions, etc.
xxx_ENE.EAR contains the entities used in that level.
They possibly have more stuff in them? But I haven't figured them out yet.

## xxx_DAT.EAR

- sky clut
- sky texture
- ground clut
- ground texture
- meshes and textures for level objects
- ... (if there's more than 1 sublevel)
- SEPERATOR
- level geometry file
- ... (if there's more than 1 sublevel)
- SEPERATOR
- unknown binary file (collision data perhaps? there's only one tho)


The level geometry file includes 4 binaries (followed by 1 seperator)

- section0
- section1
- section2
- section3
- SEPERATOR

**section0** is tiled but with a header


**section1** is a 32x32 array of 32 bit offsets into the file, followed
by the data at 0x1000 in this format:
```
{
    u16 count;
    {
        s16 x, y, z;
        u16 id;
    } objs[count];
} entries[];
```
There are as many of these as the non-zero offsets in the table. each offset points to the `count` field of each successive entry.

**section2** is a 64x64 array of 16 bit offsets into the file, followed
by the data at 0x2000 in this format:

```
{
    u16 count;
    {
        u16 id;
        s16 x, y, z;
    } objs[count];
} entries[];
```
There are as many of these as the non-zero offsets in the table. each offset points to the `count` field of each successive entry.

I'm not sure exactly what they are.


**section3** fuck knows. looks like a mesh but it's not.

## Permanently loaded assets

read entity data reads from 2,-1 up to some n,-1

COM_DAT.EAR
[   46.2970] I/TTY: 1 2	[2344]	-> 80150000
[   46.3157] I/TTY: 2 2	[3500]	-> 80150928
[   46.3835] I/TTY: 3 2	[7396]	-> 801516d4

common entities 5-9
[   46.5133] I/TTY: 2 	[15044]	-> 801533b8

[   46.6483] I/TTY: 2 	[21660]	-> 80156e7c

[   46.6830] I/TTY: 2 	[22132]	-> 8015c318

[   46.6979] I/TTY: 2 	[1900]	-> 8016198c

[   46.7673] I/TTY: 2 	[90348]	-> 801620f8



# SOU_DAT
## level objects models and meshes
[   47.8876] I/TTY: 2 	[92084]	-> 801781e4 main
[   47.9208] I/TTY: 3 	[46916]	-> 8018e998

[   48.0020] I/TTY: 2 	[2376]	-> 8019a0dc bonus

## level geometry sections 1 and 2
### level objects (but not collision)
[   48.0033] I/TTY: 7 1	[7144]	-> 8019aa24 section 1
[   48.0036] I/TTY: 8 1	[4360]	-> 8019c60c + bonus
### level collision data
[   48.0192] I/TTY: 7 2	[12208]	-> 8019d714 section 2
[   48.0198] I/TTY: 8 2	[8672]	-> 801a06c4 + bonus
###
[   48.0361] I/TTY: 3 	[13836]	-> 801a28a4 section 3
[   48.0363] I/TTY: 3 	[340]	-> 801a5eb0 + bonus
... and sections after that until the end
### entities and entity spawners (I think?)
[   48.0367] I/TTY: 0 	[5736]	-> 801a6004 section 0
[   48.0371] I/TTY: 0 	[4796]	-> 801a766c + bonus
# SOU_DAT final part (pretty sure it's the demo)
[   48.0523] I/TTY: 10 	[16388]	-> 801a8928
# SOU_ENE
[   48.3567] I/TTY: 2 	[20316]	-> 801ac92c
[   48.3712] I/TTY: 2 	[17172]	-> 801b1888
[   48.4030] I/TTY: 2 	[43432]	-> 801b5b9c
[   48.4367] I/TTY: 2 	[22372]	-> 801c0544
[   48.4541] I/TTY: 2 	[1932]	-> 801c5ca8
[   48.4555] I/TTY: 2 	[12684]	-> 801c6434
[   48.4696] I/TTY: 2 	[1068]	-> 801c95c0
[   48.4708] I/TTY: 2 	[1892]	-> 801c99ec

There's a permanent asset buffer and a temporary one for the assets that need to be loaded, processed and then are not needed anymore (textures go to vram, cluts get merged into the global clut)