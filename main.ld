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
        build/asm/main/header.s.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    .main 0x80018000 : AT(main_ROM_START) SUBALIGN(16)
    {
        main_DATA_START = .;
        _800_data__s = .;
        build/asm/main/data/800.data.s.o(.data);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);
        main_TEXT_START = .;
        build/src/main/main.c.o(.text);
        build/src/main/274C.c.o(.text);
        build/asm/main/decode.s.o(.text);
        build/asm/main/start.s.o(.text);
        build/src/main/boot.c.o(.text);
        build/asm/main/libapi/kern1.s.o(.text);
        build/src/main/libapi/rcnt.c.o(.text);
        build/asm/main/libapi/kern2.s.o(.text);
        build/src/main/libpress.c.o(.text);
        build/src/main/libgpu/core.c.o(.text);
        build/src/main/libgpu/prims.c.o(.text);
        build/src/main/libcd.c.o(.text);
        build/src/main/libetc.c.o(.text);
        build/src/main/libsnd.c.o(.text);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);
        main_RODATA_START = .;
        build/asm/main/data/1A0B8.rodata.s.o(.rodata);
        build/asm/main/decode.s.o(.rodata);
        build/asm/main/data/1D530.rodata.s.o(.rodata);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);
    }
    __romPos += SIZEOF(.main);
    __romPos = ALIGN(__romPos, 16);
    main_ROM_END = __romPos;
    main_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
