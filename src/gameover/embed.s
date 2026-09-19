.include "macro.inc"

.section .rodata

/* US:800E000 JP:800E000 */
glabel D_800E0000
.incbin "sprtdata.bin"

/* US:800E0AEC JP:800E0AF4 */
glabel D_800E0AEC
.incbin "sprttiles.bin"

/* US:800EA96C JP:800EA9F4 */
glabel D_800EA96C
.incbin "clut0.bin"

/* US:800EAB6C JP:800EABF4 */
glabel D_800EAB6C
.incbin "clut1.bin"

/* US:800EAD6C JP:800EADF4 */
glabel D_800EAD6C
.incbin "clut2.bin"

/* US:800EAF6C JP:800EAFF4 */
glabel D_800EAF6C
.incbin "bunny.bin"
