#include <ints.h>
// #include <kernel.h>
#include <libapi.h>

// int get_widescreen(void);
// void set_widescreen(int arg0);
// void show_logo(void);
// void func_8001926C(void);
// void init_everything(void);
// void game_shutdown(void);
// int enable_vblank_event(void *);
// void disable_vblank_event(int);
// void nop(void);

// The Japanese version forgets to enter a critical section before flushing
// the cache. It doesn't have this function and calls FlushCache() directly.
#ifdef VERSION_WORLD
void flush_cache_safe(void);
#else
static inline void flush_cache_safe(void) { FlushCache(); }
#endif

void vblank_disable(void);
int vblank_enable(void);
int get_video_mode(void);
void read_version(void);
int get_region(void);
char *get_mc_file_name(void);
void game_init(void);
int get_engine_running(void);
u32 get_engine_version(void);
void set_next_exec(int);
int get_next_exec(void);
