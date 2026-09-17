#include "common.h"
#include "jumptable.h"
#include <libapi.h>

u8 *func_8001E438(u32 sjis, int set);
void *func_8001E5BC(void *ptr, int set);

/* US:80047F5C JP:80044788 */ u8 (*font_ptr8)[128][8];
/* US:80047F64 JP:80044790 */ u8 (*font_ptr16)[94][32]; // I think?

// default fonts
#ifdef VERSION_WORLD
/* US:80031A14 */ extern u8 D_80031A14[94][15];
#endif
/* US:80032A4C JP:8002F164 */ extern u8 D_80032A4C[128][8];

// 4 font and type functions
// fnt_init
// US: 8001E38C
// JP: 8001D290
void fnt_init(void)
{
    jt_set(func_8001E438, 0xD0);
    jt_set(func_8001E5BC, 0xD1);
    font_ptr8 = 0;
    font_ptr16 = 0;
}

// I hope this is correct
// US: 8001E3D4
// JP: 8001D2D8
static u16 func_8001E3D4(u16 sjis)
{
    u16 lo = sjis & 0xFF;
    u16 hi = (sjis >> 8);

    hi = 2 * hi - (lo < 0x9F ? 0xE1 : 0xE0);

    if (lo < 0x7F)
        lo -= 0x1F;
    else if (lo < 0x9F)
        lo -= 0x20;
    else
        lo -= 0x7E;

    return ((hi & 0xFF) << 8) | (lo & 0xFF);
}

// fnt_get
// US: 8001E438
// JP: 8001D33C
u8 *func_8001E438(u32 c, int set)
{
    switch (set) {
    case 4:
        if (font_ptr8)
            return (*font_ptr8)[c & 0xFF];
        else
            return D_80032A4C[c & 0xFF];

    case 8: // japanese
        // TODO: this one might be wrong
        if (font_ptr16) {
            if (c - 0x8141 < 0x37E) {
                c = func_8001E3D4(c) - 0x2120;
                return (*font_ptr16)[(c >> 8) - 1][(c & 0xFF) + 93]; // HUH??
            }
        } else {
            if (c >> 8 == 0) {
                if (c > 0x60)
                    c += 1;
                c += 0x821F;
            }
        }
        u8 *ret = (u8 *)Krom2RawAdd(c);
        if (ret != (u8 *)-1)
            return ret;
        [[fallthrough]];

    default:
        return D_80032A4C['z'];

#ifdef VERSION_WORLD
    case 108: // ascii
        c -= 0x21;
        if (c > 93)
            return D_80032A4C['~'];
        else
            return D_80031A14[c];
#endif
    }
}

// fnt_set_tiles
// US: 8001E5BC
// JP: 8001D470
void *func_8001E5BC(void *ptr, int set)
{
    void *ret = (void *)-1;
    if (set == 4) {
        ret = font_ptr8;
        font_ptr8 = ptr;
    } else if (set == 8) {
        ret = font_ptr16;
        font_ptr16 = ptr;
    }
    return ret;
}
