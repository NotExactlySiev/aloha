__addr = 0x800E0000;

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
        build/header.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    None_ROM_START = __romPos;
    None_VRAM = ADDR(.None);
    .None 0x800E0000 : AT(None_ROM_START) SUBALIGN(4)
    {
        None_RODATA_START = .;
        build/select/800.rodata.o(.rodata);
        *(.rodata*);
        None_RODATA_END = .;
        None_RODATA_SIZE = ABSOLUTE(None_RODATA_END - None_RODATA_START);
        None_TEXT_START = .;
        build/select/A54.o(.text);
        build/select/start.o(.text);
        build/select/libgte.o(.text);
        None_TEXT_END = .;
        None_TEXT_SIZE = ABSOLUTE(None_TEXT_END - None_TEXT_START);
        None_DATA_START = .;
        B204_data__s = .;
        build/select/B204.data.o(.data);
        comdat_data__s = .;
        build/select/comdat.data.o(.data);
        _5E6A4_data__s = .;
        build/select/5E6A4.data.o(.data);
        None_DATA_END = .;
        None_DATA_SIZE = ABSOLUTE(None_DATA_END - None_DATA_START);

        *(.bss);
    }
    __romPos += SIZEOF(.None);
    __romPos = ALIGN(__romPos, 16);

    __size = __romPos - None_ROM_START;

    None_ROM_END = __romPos;
    None_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
