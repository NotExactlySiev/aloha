#include "spu.h"
#include <stdio.h>

#ifdef VERSION_WORLD
    #define SPU_MALLOC_NUM 16
#else
    #define SPU_MALLOC_NUM 32
#endif

/* US:8004DCF8 JP:8004D674 */ static char rec[SPU_MALLOC_RECSIZ * (SPU_MALLOC_NUM + 1)];
/* US:80047E08 JP:800443B8 */ static int is_stereo = 0;

// US: 8001DD7C
// JP: 8001CCA0
void func_8001DD7C(void)
{
    /* US:80047E04 JP:800443B4 */ static int D_80047E04 = 0;
    if (D_80047E04 == 1)
        return;
    D_80047E04 = 1;

    SpuInit();
    SpuInitMalloc(SPU_MALLOC_NUM, rec);
    SpuSetIRQ(0);
    SpuSetTransferMode(0);
    func_8001DF14(5, 0x1800);
    SpuReserveReverbWorkArea(1);
    SpuClearReverbWorkArea(5);
    call_SpuSetCommonAttr(&(SpuCommonAttr) {
        .mask = 0x3C0F,
        .cd.mix = 1,
    });
    SpuSetVoiceAttr(&(SpuVoiceAttr) {
        .voice = SPU_ALLCH,
        .mask = 0xFF83,
        .a_mode = 1,
        .s_mode = 1,
        .r_mode = 3,
        .ar = 0x1F,
        .rr = 0x1F,
    });
    spu_set_key_off(SPU_ALLCH);
}

// spu_deinit
// US: 8001DE98
// JP: 8001CDBC
void func_8001DE98(void)
{
    call_SpuSetCommonAttr(&(SpuCommonAttr) {
        .mask = 3,
        .mvol.right = 0,
        .mvolmode.right = 0,
    });
    SpuQuit();
}

// US: 8001DED0
// JP: 8001CDF4
void call_SpuSetCommonAttr(SpuCommonAttr *attr)
{
    SpuSetCommonAttr(attr);
}

// unused?
/*
// US: 8001DEF0
// JP: 8001CE14
void func_8001DEF0(int val)
{
    SpuSetReverbVoice(val, 0xFFFFFF);
}
*/

// set_reverb
// US: 8001DF14
// JP: 8001CE38
void func_8001DF14(long mode, short depth)
{
    SpuReverbAttr attr = {
        .mask = 7,
        .mode = mode,
        .depth.left = depth,
        .depth.right = depth,
    };
    SpuSetReverb(0);
    SpuSetReverbModeParam(&attr);
    SpuSetReverb(0);
    SpuSetReverbDepth(&attr);
    SpuSetReverb(0);
    SpuClearReverbWorkArea(mode);
}

// US: 8001DF78
// JP: 8001CE9C
void spu_set_stereo(int val)
{
    is_stereo = val;
}

// US: 8001DF8C
// JP: 8001CEB0
long call_SpuMalloc(long size)
{
    return SpuMalloc(size);
}

// 8001DFAC
// JP:
long call_SpuMallocWithStartAddr(unsigned long addr, long size)
{
    return SpuMallocWithStartAddr(addr, size);
}

// 8001DFCC
// JP:
void call_SpuFree(unsigned long addr)
{
    SpuFree(addr);
}

// 8001DFEC
// JP:
long call_SpuIsTransferCompleted(long flag)
{
    return SpuIsTransferCompleted(flag);
}

// 8001E00C
// JP:
long call_SpuGetTransferMode(void)
{
    return SpuGetTransferMode();
}

// 8001E02C
// JP:
unsigned long call_SpuWrite(unsigned char *addr, unsigned long size)
{
    return SpuWrite(addr, size);
}

// 8001E04C
// JP:
unsigned long call_SpuSetTransferStartAddr(unsigned long addr)
{
    return SpuSetTransferStartAddr(addr);
}

// 8001E06C
// JP:
long call_SpuGetKeyStatus(unsigned long voice_bit)
{
    return SpuGetKeyStatus(voice_bit);
}

// 8001E08C
// JP:
void call_SpuGetAllKeysStatus(char *status)
{
    SpuGetAllKeysStatus(status);
}

// 8001E0AC
// JP:
void call_SpuSetVoiceAttr(SpuVoiceAttr *attr)
{
    SpuSetVoiceAttr(attr);
}

// US: 8001E0CC
// JP: 8001CFD0
void set_voice_attr(SpuVoiceAttr *arg)
{
    if (is_stereo == 1) {
        // make it mono
        SpuVoiceAttr attr = *arg;
        int left = attr.volume.left;
        int right = attr.volume.right;
        if (left < 0) {
            left = -left;
        }
        if (right < 0) {
            right = -right;
        }
        int val = (left + right) / 2;
        attr.volume.right = val;
        attr.volume.left = val;
        call_SpuSetVoiceAttr(&attr);
    } else {
        call_SpuSetVoiceAttr(arg);
    }
}

// this is almost exactly the same as the previous one
// 8001E17C
// JP:
NOT_IMPL_FN(func_8001E17C)

// US: 8001E22C
// JP: 8001D130
void spu_set_key_on(u32 mask)
{
    SpuSetKey(SPU_ON, mask);
}

// US: 8001E250
// JP: 8001D154
void spu_set_key_off(u32 mask)
{
    SpuSetKey(SPU_OFF, mask);
}

// US: 8001E274
// JP: 8001D178
NOT_IMPL_FN(func_8001E274)

// US: 8001E294
// JP: 8001D198
NOT_IMPL_FN(func_8001E294)

// US: 8001E2B4
// JP: 8001D1B8
NOT_IMPL_FN(func_8001E2B4)

// US: 8001E2D4
// JP: 8001D1D8
NOT_IMPL_FN(func_8001E2D4)

// US: 8001E2F4
// JP: 8001D1F8
void func_8001E2F4(void)
{
}

// US: 8001E2FC
// JP: 8001D200
NOT_IMPL_FN(func_8001E2FC)

// US: 8001E31C
// JP: 8001D220
void func_8001E31C(long n_clock)
{
    SpuSetNoiseClock(n_clock);
}
