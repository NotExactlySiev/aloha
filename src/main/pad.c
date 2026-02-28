#include "pad.h"
#include "jumptable.h"
#include <libetc.h>

u32 call_PadRead(s32 id);

// 8001E33C
void pad_init(void)
{
    PadInit(0);
    jt_set(call_PadRead, 0xf0);
}

// 8001E36C
u32 call_PadRead(s32 id)
{
    return PadRead(id);
}
