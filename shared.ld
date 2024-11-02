SECTIONS
{
    __romPos = 0;
    _gp = 0x0;
    .header : AT(__romPos) SUBALIGN(16)
    {
        build/header.o(.data);
    }
    __romPos += SIZEOF(.header);

    __exec_start = __romPos;

    .None __addr : AT(__romPos) SUBALIGN(4)
    {
        *(.rodata*);
        
        *(.rdata*);     /* wait why is this different for libgpu.a? */

        *(.text*);
        *(.data*);
        . = ALIGN(0x800);
    }
    
    __romPos += SIZEOF(.None);
    /*__romPos = ALIGN(__romPos, 16);*/

    __size = __romPos - __exec_start;

    .bss (NOLOAD) : SUBALIGN(4)
    {
        *(.bss*);
    }


    /DISCARD/ :
    {
        *(*);
    }
}