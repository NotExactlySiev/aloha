#include "movie.h"
#include "sfx.h"
#include <libetc.h>
#include <libspu.h>
#include <movie_args.h>
#include <shared.h>

#define INT16_MAX ((1 << 15) - 1)

static int D_800F4E00 = 0; // movie state
static SpuVolume D_800F4E04 = { INT16_MAX, INT16_MAX }; // movie volume?

// static callback()
static int func_800E8474(void)
{
    u32 buttons = jt.PadRead(0);
    if ((buttons & BUTTONS_ACCEPT) && (D_800F4E00 == 0)) {
        D_800F4E00 = 1;
        return 0;
    }

    switch (D_800F4E00) {
    case 1:
        sfx_play(0x2600);
        jt.sound_fade_out(7, 0, 0);
        jt.cd_flush();
        D_800F4E00 = 2;
        return 0;

    case 2:
        int ret = jt.snd_status() & 2;
        if (ret == 0) {
            D_800F4E00 = 0;
            return 1;
        } else {
            return ret;
        }

    default:
        return 2;
    }
}

// static init_args()
static void func_800E857C(MovieArgs *as, int frame_count)
{
    as->frame_count = frame_count;
    as->ring_size = 0x40;
    as->buffers[0] = 0x80060000;
    as->buffers[1] = 0x80088000;
    as->data_addr = 0x800b0000;
    as->ring_addr = (u_long *)0x800b6000;
    as->mode = 0xc0;
    as->x1 = 0;
    as->y1 = 0;
    as->x2 = 0;
    as->y2 = 0x100;
    (as->rect).x = 0;
    (as->rect).y = 0x18;
    (as->rect).w = 0x100;
    (as->rect).h = 0xd0;
    as->channel = 0;
#ifdef VERSION_WORLD
    if (jt.get_video_mode() == MODE_PAL)
        as->rect.y += 0x18;
#endif
}

// play_movie
void func_800E8640(char *filename, int frame_count)
{
    MovieArgs args;

    D_800F4E00 = 0;
    func_800E857C(&args, frame_count);
    jt.snd_reset();
    jt.set_global_volume(&D_800F4E04);
    jt.snd_set_volume(0x3000);
    jt.play_movie(filename, &args, func_800E8474);
    jt.wait_for_vsync(); // argument? TODO
    jt.SetDispMask(0);
    jt.snd_reset();
    jt.ClearImage(
        &(RECT) {
            .x = 0,
            .y = 0,
            .w = 1024,
            .h = 512,
        },
        0, 0, 0
    );
    jt.DrawSync(0);
}
