__addr = 0x80018000;

SECTIONS
{
    __romPos = 0;
    header_ROM_START = __romPos;
    .header : AT(header_ROM_START) SUBALIGN(16)
    {
        build/header.o(.data);
    }
    __romPos += SIZEOF(.header);

    main_ROM_START = __romPos;
    .main 0x80018000 : AT(main_ROM_START) SUBALIGN(4)
    {
        *(.rodata*);
        build/main/libpress.rodata.o(.rodata);
        build/main/libcd.rodata.o(.rodata);
        build/main/libetc.rodata.o(.rodata);
        build/main/libsnd.rodata.o(.rodata);
        build/main/libgpu.rodata.o(.rodata);
        
        *(.text*);
        
        *(.data*);
        build/main/1A214.data.o(.data);
        build/main/1D530.data.o(.data);
    }
    __romPos += SIZEOF(.main);

    /* the size that gets put in the header */
    __size = (__romPos & 0xFFFFF800) + 0x800;

    .bss (NOLOAD) : SUBALIGN(4)
    {
        *(.bss);
        build/main/3066C.bss.o(.bss);
    }

    /DISCARD/ :
    {
        *(*);
    }
}
