#include <stdint.h>

// get the next control bit
#define NEXT    \
    (t = t ? t-1 : 7, c = t == 7 ? *src++ : c, (c >> t) & 1)

uint8_t* decomp(const uint8_t *src, uint8_t* dst)
{
    uint8_t t, c;    // control bits and their counter
    int off;
    int l;

    t = 0;
    while (1)
    {
        // every NEXT macro reads one bit from the control bit
        // 0 means simply copy a byte
        while (NEXT == 0) {
            *dst++ = *src++;
        }
        
        // 1 means repeated data. we're gonna copy from output
        // buffer.
        // next bit sets if the offset is gonna be 12 bit (the
        // next 4 control bits being the lower bits of the
        // offset)
        if (NEXT == 0) {
            off = 0xFFFFFF00 | *src++;
            if (off == -0x100) return dst;  // denotes EOS
        } else {
            off = 0xFFFFFF00 | *src++;
            off = (off << 1) | NEXT;
            off = (off << 1) | NEXT;
            off = (off << 1) | NEXT;
            off = (off << 1) | NEXT;
            off -= 255;
        }
    
        // now length
        l = 1;
        while (NEXT == 1)
            l = NEXT | (l << 1);

        while (l-- >= 0) {
            *dst = *(dst+off);
            dst += 1;
        }
    }
}

