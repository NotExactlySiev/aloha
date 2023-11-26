.include "macro.inc"

.section .rodata

glabel D_800E0000
.incbin "sprtdata.bin"

glabel D_800E0AEC
.incbin "sprttiles.bin"

glabel D_800EA96C
.incbin "clut0.bin"

glabel D_800EAB6C
.incbin "clut1.bin"

glabel D_800EAD6C
.incbin "clut2.bin"

glabel D_800EAF6C
.incbin "bunny.bin"