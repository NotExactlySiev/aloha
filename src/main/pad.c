#include "pad.h"
#include "jumptable.h"
#include <libetc.h>

u32 call_PadRead(s32 id);

// US: 8001E33C
// JP: 8001D240
void pad_init(void)
{
    PadInit(0);
    jt_set(call_PadRead, 0xf0);
}

// US: 8001E36C
// JP: 8001D270
u32 call_PadRead(s32 id)
{
    return PadRead(id);
}
