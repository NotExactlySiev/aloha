#include "types.h"
#include <endian.h>

// TODO: errors could be ...?
// return 0 on success, -1 on error in general

// get the next control bit
#define NEXT    \
    (t = t ? t-1 : 7, c = t == 7 ? *src++ : c, (c >> t) & 1)

typedef struct {
    u32 uncompressed_size_be;   // big endian
    u8  data[];                 // compressed binary data
} ExactData;

u32 exact_get_decompressed_size(const void *compressed_data)
{
    const ExactData *exact = compressed_data;
    return be32toh(exact->uncompressed_size_be);
}

int exact_decompress(void *decompressed_data, const void *compressed_data)
{
    // TODO: get size of input and check if we overrun?
    const ExactData *exact = compressed_data;
    const u8 *src = exact->data;
    u8 *dst = decompressed_data;
    u8 t, c;    // control bits and their counter
    int off;
    int l;

    t = 0;
    while (1) {
        // every NEXT macro reads one bit from the control bit
        // 0 means simply copy a byte
        while (NEXT == 0) {
            *dst++ = *src++;
        }

        // 1 means repeated data. we're gonna copy from output
        // buffer.
        // next bit sets if the offset is gonna be 12 bit (the
        // next 4 control bits being the lower bits of the
        // offset) or 8 bit
        if (NEXT == 0) {
            off = 0xFFFFFF00 | *src++;
            if (off == -0x100) return 0;  // denotes EOS
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

#define min(a,b) \
   ({ __typeof__ (a) _a = (a); \
      __typeof__ (b) _b = (b); \
     _a < _b ? _a : _b; })

int exact_compress(void *compressed_data, const void *data, u32 size)
{
    ExactData *exact = compressed_data;
    const u8 *src = data;
    u8 *dst = exact->data;

    // TODO: should round up...?
    exact->uncompressed_size_be = htobe32(size);

    uint8_t b;
    int winoff;
    int win;    // window

    int candidate;  // where in window we're looking for matches

    int wpeak;      // window peaker
    int peak;       // data peaker
    int matchlen;
    int bestlen;
    int best;
    int off;
    int len;

    int tmp; // for rotating len
    int count;

#define PUT(x)  { dst[j++] = x; }
#define CTL(x)  { ctl = ((ctl << 1) | (x)); if (++ctlb > 7) { dst[ctlloc] = ctl; ctlloc = j++; ctlb = 0; }}

    uint8_t ctl = 0;     // control bit buffer
    int ctlb = 0;   // bit number in ctl (write when hits 8)
    int j = 1;      // output index
    int ctlloc = 0; // space left free for ctl
    for (int i = 0; i < size; i++) {
        b = src[i];
        // set window start
        winoff = min(i, 0x1100 - 1);
        win = i - winoff;
        // look through the window
        bestlen = 0;
        candidate = win;
        peak = i;

        while (candidate < i) {
            wpeak = candidate;
            peak = i;
            matchlen = 0;
            while (src[peak] == src[wpeak] && (peak < size)) {
                matchlen++; peak++; wpeak++;
            }
            if (matchlen >= bestlen) {
                bestlen = matchlen;
                best = candidate;
            }
            candidate += 1;
        }
        if (bestlen >= 2) {  // we want at least 2 otherwise it's not worth it
            off = best - i;

            if (off > -256) {
                CTL(1);
                PUT(256+off);
                CTL(0);
            } else {    // 12 bit offset
                off += 255;
                CTL(1);
                PUT((off >> 4)+256);
                CTL(1);
                CTL(!!(off & 8));
                CTL(!!(off & 4));
                CTL(!!(off & 2));
                CTL(!!(off & 1));
            }

            len = bestlen - 1;
            tmp = 0;
            count = 0;
            while (len > 1) {
                tmp = (tmp << 1) | (len & 1);
                len >>= 1;
                count++;
            }

            while (count--) {
                CTL(1);
                CTL(tmp & 1);
                tmp >>= 1;
            }
            CTL(0);
            i += bestlen - 1;
        } else {
            PUT(b);
            CTL(0);

        }
    }

    // TODO: this can be done better probably
    CTL(1);
    CTL(0);
    CTL(0);
    CTL(0);
    CTL(0);
    CTL(0);
    CTL(0);
    CTL(0);

    return j + 4;
}
