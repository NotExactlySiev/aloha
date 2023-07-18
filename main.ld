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
    .main 0x80018000 : AT(main_ROM_START) SUBALIGN(4)
    {
        main_RODATA_START = .;
        build/src/main/main.c.o(.rodata*);
        build/src/main/274C.c.o(.rodata*);
        build/asm/main/data/libpress.rodata.s.o(.rodata);
        build/asm/main/data/libgpu.rodata.s.o(.rodata);
        build/asm/main/data/libcd.rodata.s.o(.rodata);
        build/asm/main/data/libetc.rodata.s.o(.rodata);
        build/asm/main/data/libsnd.rodata.s.o(.rodata);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);
        main_TEXT_START = .;
        build/src/main/main.c.o(.text*);
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
        main_DATA_START = .;
        main_c = .;
        build/src/main/main.c.o(.data*);
        _1A214_data__s = .;
        build/asm/main/data/1A214.data.s.o(.data);
        boot_c = .;
        build/src/main/boot.c.o(.data);
        _1D530_data__s = .;
        build/asm/main/data/1D530.data.s.o(.data);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);
    }
    main_bss_VRAM = ADDR(.main_bss);
    .main_bss (NOLOAD) : SUBALIGN(4)
    {
        main_BSS_START = .;
        build/src/main/main.c.o(.bss);
        build/src/main/274C.c.o(.bss);
        build/asm/main/data/3066C.bss.s.o(.bss);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);
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
