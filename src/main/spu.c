#include "spu.h"

#define SPU_MALLOC_NUM  16

static char rec[SPU_MALLOC_RECSIZ * (SPU_MALLOC_NUM + 1)];

void func_8001DD7C(void)
{
    static int D_80047E04 = 0;
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
    call_SpuSetCommonAttr(&(SpuCommonAttr){
        .mask = 0x3C0F,
        .cd.mix = 1,
    });
    SpuSetVoiceAttr(&(SpuVoiceAttr){
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

// snd_mute
void func_8001DE98(void)
{
    call_SpuSetCommonAttr(&(SpuCommonAttr){
        .mask = 3,
        .mvol.right = 0,
        .mvolmode.right = 0,
    });
    SpuQuit();
}

long call_SpuSetCommonAttr(SpuCommonAttr *attr)
{
    SpuSetCommonAttr(attr);
}

// unused?
/*
void func_8001DEF0(int val)
{
    SpuSetReverbVoice(val, 0xFFFFFF);
}
*/

// set_reverb
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

extern int D_80047E08;

void spu_set_stereo(int val)
{
    D_80047E08 = val;
}

long call_SpuMalloc(long size)
{
    return SpuMalloc(size);
}

long call_SpuMallocWithStartAddr(unsigned long addr, long size)
{
    return SpuMallocWithStartAddr(addr, size);
}

void call_SpuFree(unsigned long addr)
{
    SpuFree(addr);
}

long call_SpuIsTransferCompleted(long flag)
{
    return SpuIsTransferCompleted(flag);
}

long call_SpuGetTransferMode(void)
{
    return SpuGetTransferMode();
}

unsigned long call_SpuWrite(unsigned char *addr, unsigned long size)
{
    return SpuWrite(addr, size);
}

unsigned long call_SpuSetTransferStartAddr(unsigned long addr)
{
    return SpuSetTransferStartAddr(addr);
}

long call_SpuGetKeyStatus(unsigned long voice_bit)
{
    return SpuGetKeyStatus(voice_bit);
}

void call_SpuGetAllKeysStatus(char *status)
{
    SpuGetAllKeysStatus(status);
}

void call_SpuSetVoiceAttr(SpuVoiceAttr *attr) {
    SpuSetVoiceAttr(attr);
}

void set_voice_attr(SpuVoiceAttr *arg) {
    if (D_80047E08 == 1) {
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
    }
    else {
        call_SpuSetVoiceAttr(arg);
    }
}

// this is almost exactly the same as the previous one
NOT_IMPL_FN(func_8001E17C) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E17C);

// the rest are trivial again
void spu_set_key_on(u32 mask) {
    SpuSetKey(SPU_ON, mask);
}

void spu_set_key_off(u32 mask) {
    SpuSetKey(SPU_OFF, mask);
}

void func_8001E2F4(void) {
}

void func_8001E31C(long n_clock)
{
    SpuSetNoiseClock(n_clock);
}