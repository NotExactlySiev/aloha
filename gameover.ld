__addr  = 0x800E0000;

SECTIONS
{
    __romPos = 0;
    _gp = 0x0;
    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header : AT(header_ROM_START) SUBALIGN(16)
    {
        header_DATA_START = .;
        header_s = .;
        build/src/header.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    None_ROM_START = __romPos;
    None_VRAM = ADDR(.None);
    .None 0x800E0000 : AT(None_ROM_START) SUBALIGN(16)
    {
        None_RODATA_START = .;
        build/asm/gameover/data/800.rodata.s.o(.rodata);
        None_RODATA_END = .;
        None_RODATA_SIZE = ABSOLUTE(None_RODATA_END - None_RODATA_START);
        None_TEXT_START = .;
        build/src/gameover/C094.c.o(.text*);
        None_TEXT_END = .;
        None_TEXT_SIZE = ABSOLUTE(None_TEXT_END - None_TEXT_START);
        None_DATA_START = .;
        DAB0_data__s = .;
        build/src/gameover/C094.c.o(.data*);
        build/asm/gameover/data/DAB0.data.s.o(.data);
        None_DATA_END = .;
        None_DATA_SIZE = ABSOLUTE(None_DATA_END - None_DATA_START);
    }
    __romPos += SIZEOF(.None);
    __romPos = ALIGN(__romPos, 16);

    /* the size that gets put in the header */
    __size = ((__romPos - None_ROM_START) & 0xFFFFF800) + 0x800;

    None_ROM_END = __romPos;
    None_VRAM_END = .;

    .bss (NOLOAD) : SUBALIGN(4)
    {
        *(.bss);
    }

    /DISCARD/ :
    {
        *(*);
    }
}
