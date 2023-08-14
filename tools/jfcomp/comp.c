#include <stddef.h>
#include <stdint.h>

#define min(a,b) \
   ({ __typeof__ (a) _a = (a); \
      __typeof__ (b) _b = (b); \
     _a < _b ? _a : _b; })

size_t comp(size_t size, uint8_t* src, uint8_t* dst)
{
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
#define CTL(x)  { ctl = ((ctl << 1) | x); if (++ctlb > 7) { dst[ctlloc] = ctl; ctlloc = j++; ctlb = 0; }}

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

    return j;
}
