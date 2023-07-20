SECTIONS
{
    __romPos = 0;
    header_ROM_START = __romPos;
    .header : AT(header_ROM_START) SUBALIGN(16)
    {
        build/src/main/header.s.o(.data);
    }
    __romPos += SIZEOF(.header);

    main_ROM_START = __romPos;
    .main 0x80018000 : AT(main_ROM_START) SUBALIGN(4)
    {
        *(.rodata*);
        build/asm/main/data/libpress.rodata.s.o(.rodata);
        build/asm/main/data/libcd.rodata.s.o(.rodata);
        build/asm/main/data/libetc.rodata.s.o(.rodata);
        build/asm/main/data/libsnd.rodata.s.o(.rodata);
        build/asm/main/data/libgpu.rodata.s.o(.rodata);
        
        *(.text*);
        
        *(.data*);
        build/asm/main/data/1A214.data.s.o(.data);
        build/asm/main/data/1D530.data.s.o(.data);
    }
    __romPos += SIZEOF(.main);

    /* the size that gets put in the header */
    __size = (__romPos & 0xFFFFF800) + 0x800;

    .bss (NOLOAD) : SUBALIGN(4)
    {
        *(.bss);
        build/asm/main/data/3066C.bss.s.o(.bss);
    }

    /DISCARD/ :
    {
        *(*);
    }
}
