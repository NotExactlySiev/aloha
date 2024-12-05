#include "common.h"
#include <libspu.h>

void func_8001DD7C(void);
// snd_mute
void func_8001DE98(void);
long call_SpuSetCommonAttr(SpuCommonAttr *attr);
void func_8001DF14(long mode, short depth);
void func_8001DF78(int val);
long call_SpuMalloc(long size);
long call_SpuMallocWithStartAddr(unsigned long addr, long size);
void call_SpuFree(unsigned long addr);
long call_SpuIsTransferCompleted(long flag);
long call_SpuGetTransferMode(void);
unsigned long call_SpuWrite(unsigned char *addr, unsigned long size);
unsigned long call_SpuSetTransferStartAddr(unsigned long addr);
long call_SpuGetKeyStatus(unsigned long voice_bit);
void call_SpuGetAllKeysStatus(char *status);
void call_SpuSetVoiceAttr(SpuVoiceAttr *attr);
void set_voice_attr(SpuVoiceAttr *arg);
void spu_set_key_on(u32 mask);
void spu_set_key_off(u32 mask);
void func_8001E31C(long n_clock);