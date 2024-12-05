#include "common.h"

typedef struct VabRealHeader VabRealHeader; 

int sfx_set_both(u32 handle, u16 pan, u16 vol);
void sfx_set_prog_attr(u32 id, int arg2);
int snd_set_reverb(int val);
int sfx_set_pan(u32 handle, u16 pan);
int sfx_set_vol(u32 handle, u16 vol);
int sfx_get_pan(uint handle);
int sfx_get_vol(uint handle);
int sfx_is_valid(u32 handle);
void sfx_play_simple(int id);
void sfx_play(int id, short pan, short vol);
int sfx_play_modulated(u32 id, s32 pan, s16 vol, s16 arg3, u16 arg4, s32 prio);
void sfx_kill(u32 handle);
void sfx_release(u32 handle);
void sfx_release_voices(u32 mask);
void func_8001FBE4(void);
int sfx_is_active(u32 handle);
int sfx_load_vab(short index, VabRealHeader *header, void *data);
int sfx_free_vab(s16 idx);
