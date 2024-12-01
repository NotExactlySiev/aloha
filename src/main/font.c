#include "common.h"

u8 *func_8001E438(u32 sjis, int set);
void *func_8001E5BC(void *ptr, int set);
extern u8 (*font_ptr8)[128][8];
extern u8 *font_ptr16;
// default fonts
extern u8 D_80031A14[94][15];
extern u8 D_80032A4C[128][8];

// 4 font and type functions
// fnt_init
void func_8001E38C(void) {
    jt_set(func_8001E438, 0xD0);
    jt_set(func_8001E5BC, 0xD1);
    font_ptr8 = 0;
    font_ptr16 = 0;
}

// I hope this is correct
static u16 func_8001E3D4(u16 sjis)
{
    u16 lo = sjis & 0xFF;
    u16 hi = (sjis >> 8);    
    
    hi = 2*hi - (lo < 0x9F ? 0xE1 : 0xE0);

    if (lo < 0x7F)
        lo -= 0x1F;
    else if (lo < 0x9F)
        lo -= 0x20;
    else
        lo -= 0x7E;
    
    return ((hi & 0xFF) << 8) | (lo & 0xFF);
}

// fnt_get
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E438);
u8 *func_8001E438(u32 c, int set)
{
    // TODO: this should be a switch?
    if (set == 8) {
        // japanese
        // TODO
    } else if (set < 9) {
        if (set == 4) {
            if (font_ptr8) {
                return (*font_ptr8)[c & 0xFF];
            } else {
                return D_80032A4C[c & 0xFF];
            }
        }
    } else {
        // ascii
        if (set == 108) {
            c -= 0x21;
            if (c > 93) {
                return D_80032A4C[0x7E];
            } else {
                return D_80031A14[c];
            }
        }
    }
}

// fnt_set_tiles
void *func_8001E5BC(void *ptr, int set)
{
    printf("setting the font!!!!! %p\n", ptr);
    void *ret = -1;
    if (set == 4) {
        ret = font_ptr8;
        font_ptr8 = ptr;
    } else if (set == 8) {
        ret = font_ptr16;
        font_ptr16 = ptr;
    }
    return ret;
}