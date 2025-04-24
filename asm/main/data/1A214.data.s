.include "macro.inc"

.section .data

/* weird */
glabel D_80031A14
.incbin "fontdata.bin"

/* the nice ascii font we can convert */
glabel D_80032A4C
.incbin "asciifont.bin"

/* memory card icons */
glabel D_80032E5C
.incbin "mcicon.bin"

/* intro image */
glabel D_80032FFC
.incbin "logo.prs.bin"
