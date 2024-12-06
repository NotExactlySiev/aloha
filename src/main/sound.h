#include "common.h"
#include <libspu.h>

void snd_reset(void);
int snd_set_stereo(int mono);
int snd_get_stereo(void);
void func_80020E40(void);
void func_80020E64(void);
void snd_set_vol_to_min(void);
void snd_set_vol_to_max(void);
int snd_set_volume(short val);
void snd_set_reverb(long mode, short depth);
int snd_fade_out(int step, int target, void *cb);
int snd_fade_in(int step, int target, void *cb);
void snd_fade_pause(void);
void snd_fade_unpause(void);
u32 snd_status(void);
