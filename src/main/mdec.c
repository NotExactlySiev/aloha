#include "mdec.h"

#ifdef VERSION_WORLD
// US: 8001E608
void mdec_init(int mode)
{
    static int D_80047E0C = 0; // is mdec initialized?
    if (mode == 0) {
        if (D_80047E0C == 0) {
            D_80047E0C = 1;
        } else {
            mode = 0;
        }
    }
    DecDCTReset(mode);
}
#endif
