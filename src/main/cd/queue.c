#include "../tasks.h"
#include "common.h"
#include "priv.h"
#include <libcd.h>
#include <libspu.h>

// TODO: these don't belong here
extern int D_80047EEC; // SpuVolume ptr?
extern CdlFILTER D_80047ECC;
extern CdlFILE D_8004D0E0;

typedef struct {
    u8 com;
    u32 arg0;
    u32 arg1;
} QueueEntry;

/* US:80047EC4 JP: */ s8 D_80047EC4[8];
/* US:80047D94 JP:8004434C */ u8 D_80047D94 = SNQ_FINISHED;
/* US:80047DB4 JP:8004436C */ int fade_out_active = 0;
/* US:80047DB8 JP:80044370 */ int fading_out = 0;
/* US:80047DBC JP:80044374 */ int fade_in_active = 0;
/* US:80047DC0 JP:80044378 */ int fading_in = 0;
/* US:80047DC4 JP:8004437C */ int fade_in_step = 0;
/* US:80047DC8 JP:80044380 */ int fade_out_step = 0;
/* US:80047DCC JP:80044384 */ int fade_out_dest = 0;
/* US:80047DD0 JP:80044388 */ int fade_in_dest = 1024;
/* US:80047DD8 JP:80044390 */ s32 D_80047DD8 = 1; // this is still a mystery. probably enum. gets set in the first function here
/* US:80047DDC JP:80044394 */ int cd_queue_is_empty = 0;
/* US:80047DE0 JP:80044398 */ s32 D_80047DE0 = 0; // cd_disc_busy
/* US:80047DEC JP:800443A4 */ s32 bgm_paused = 0;
/* US:80047E94 JP:800446C0 */ int D_80047E94;
/* US:80047EF4 JP:80044720 */ int cd_queue_is_running;

/* US:80047D93 JP:8004434B */ static u8 curr_command = SNQ_FINISHED;
/* US:80047DA8 JP:80044360 */ static int try_again = 0;
/* US:80047DF4 JP:800443AC */ static int queue_lock = 0;
/* US:80047EB4 JP:800446E0 */ static void *curr_param = NULL;
/* US:80047EBC JP:800446E8 */ static void *curr_result = NULL;
/* US:80047F2C JP:80044758 */ static u16 queue_tail;
/* US:80047F34 JP:80044760 */ static u16 queue_head;
/* US:80047F3C JP:80044768 */ static u16 queue_size;

/* US:8004D0F8 JP:8004CA74 */ static QueueEntry queue[256];

#ifdef VERSION_WORLD
/* US:80047DF8 */ char D_80047DF8[] = "cdrom:\\"; // unused
#endif

extern s32 fade_out_task;
extern s32 fade_in_task;
extern int (*fade_out_callback)();
extern int (*fade_in_callback)();
extern s32 vol_scale;
extern s32 D_80047EA4;

/* US:80047D78 */ int D_80047D78 = 0; // music_repeat
/* US:80047D7C */ int D_80047D7C = 0;
/* US:80047D80 */ int D_80047D80 = 1; // music_cdda_idx_bcd
/* US:80047D84 */ int D_80047D84 = 1; // music_cdda_idx
/* US:80047D88 */ s32 is_mono = 0;
/* US:80047D8C */ SpuVolume D_80047D8C = { 0 };

// US: 8001AED8
// JP: 8001A20C
void cd_clear_queue(void)
{
    queue_tail = 0;
    queue_head = 0;
    D_80047E94 = 0;
    D_80047DD8 = 1;
    cd_queue_is_empty = 1;
    D_80047DE0 = 0;
    queue[0].com = -1;
    queue_size = 0;
}

// US: 8001AF28
// JP: 8001A25C
static int queue_add(u8 arg0, u32 arg1, u32 arg2)
{
    QueueEntry *task;

    task = &queue[queue_tail];

    if (queue_lock == 1 || queue_size > 192)
        return 0;

    queue_lock = 1;
    queue[(queue_tail + 1) % 256].com = -1;
    task->com = arg0;
    task->arg0 = arg1;
    task->arg1 = arg2;

    queue_size++;
    queue_tail = (queue_tail + 1) & 0xff;
    cd_queue_is_empty = 0;
    queue_lock = 0;
    return 1;
}

// US: 8001B020
// JP: 8001A354
void cd_command(u8 arg0, void *arg1, void *arg2)
{
    if (cd_queue_is_running == 0) {
        while (queue_size > 192)
            cd_run_block();
    }
    queue_add(arg0, (u32)arg1, (u32)arg2);
}

// US: 8001B0A0
// JP: 8001A3D4
int cd_run_block(void)
{
    int rc;

    if (cd_queue_is_running == 1)
        return 0;
    cd_queue_is_running = 1;

#ifdef VERSION_WORLD
    if (try_again == 1) {
        rc = CdControl(curr_command, curr_param, curr_result);
        if (rc != 1) {
            try_again = 1;
            cd_queue_is_running = 0;
            return 0;
        }
        try_again = 0;
        D_80047DE0 = 1; // just did a try again
        goto flush_cache;
    }
#endif

    if (D_80047DE0 == 1) {
        music_state = 0;
        D_800548EC = 0;
        CdControl(0, NULL, &cd_last_status);
        while (cd_get_status(&cd_last_status) != 1);
        if (cd_last_status & CdlStatShellOpen)
#ifdef VERSION_WORLD
            goto flush_cache;
#else
            goto done;
#endif
        set_vol_scaled(&D_80047D8C, 0x400);
        rc = D_80047F24;
        D_80047DE0 = 0;
#ifndef VERSION_WORLD
        pvd_is_cached = 0;
        sector_cache_clear();
#endif
        // TODO: what is this control flow
        if (D_80047F24 == 1) {
            music_play_cdda(D_80047D84, D_80047D78);
            // D_80047F24 = 1;
        } else if (D_80047F24 == 2) {
            func_8001BA50();
            // D_80047F24 = rc;
        }
#if VERSION_WORLD
        else {
            goto skip_out;
        }
        D_800548EC = 1;
#endif
    }

#ifndef VERSION_WORLD
    if (try_again == 1) {
        rc = CdControl(curr_command, curr_param, curr_result);
        if (rc != 1) {
            try_again = 1;
        } else {
            try_again = 0;
        }
        goto done;
    }
#endif

skip_out:
    rc = CdSync(1, 0);
    func_80019F4C(rc);
    if (2 == music_state && (1 == func_8001CE18())) {
        music_state = 0;
        set_vol_scaled(&D_80047D8C, 0x400);
        if (1 == D_80047D78) {
            // THIS RESTARTS THE BACKGROUND MUSIC YOU MORON!
            // a ton of duplicated calls from func_8001BA50
            queue_add(CdlPause, 0, 0);
            queue_add(CdlSetmode, &D_80047EC4, 0);
            queue_add(CdlSetfilter, &D_80047ECC, 0);
            queue_add(CdlSeekL, &D_8004D0E0, 0);
            queue_add(CdlPause, NULL, 0);
            queue_add(CdlReadS, &D_8004D0E0, 0);
            queue_add(SNQ_SET_SCALED, &vol_full, 0);
            queue_add(SNQ_FUNC9, D_80047EEC, 0);
            queue_add(SNQ_SET_FE, 2, 0);
        } else {
            queue_add(CdlPause, 0, 0);
            D_800548EC = 0;
        }
    }

    if (D_80047DD8 != 1) {
#if VERSION_WORLD
        cd_queue_is_running = 0;
        if (D_80047DD8 == 2) {
            try_again = 1;
        }
        return 0;
#else
        int ret = 0;
        if (D_80047DD8 == 2) {
            int rc = cd_get_status(&cd_last_status);
            if (rc == 1 && (cd_last_status & CdlStatShellOpen)) {
                D_80047DE0 = 1;
            }

            if (D_80047E94 < 32) {
                D_80047DD8 = 0;
                int rc = CdControl(curr_command, curr_param, curr_result);
                try_again = rc != 1;
                D_80047E94 += 1;
                ret = 1;
            } else {
                D_80047DE0 = 1;
                D_80047D78 = 0;
                cd_queue_is_running = 0;
                ret = -1;
            }
        }

        cd_queue_is_running = 0;
        return ret;
#endif
    }

    CdSync(0, 0);
    rc = cd_get_status(&cd_last_status);
    if (rc == 1) {
        if (cd_last_status & CdlStatShellOpen) {
            D_80047DE0 = 1;
#ifdef VERSION_WORLD
            goto flush_cache;
#else
            goto done;
#endif
        }
        if (cd_last_status & CdlStatSeek) {
            goto done;
        }
    }

    // and then the actual queue
    QueueEntry *t;
    u32 next = 0xDEADBEEF;

    while (1) {
        t = &queue[queue_head];
        if (t->com == 0xFF) {
            D_80047DD8 = 0;
            curr_command = CdlNop;
            curr_param = 0;
            curr_result = &cd_last_status;
            try_again = (1 != cd_get_status(&cd_last_status));
            cd_queue_is_empty = 1;
            goto done;
        }

        curr_command = t->com;
        D_80047D94 = t->com;
        if (curr_command == SNQ_SET_FE) {
            // this has to do with the background track being played
            s32 newval = t->arg0;
            printf("setting FE to %d\n", newval);
            if (music_state == 5 && newval != 5)
                func_8001A380(); // activate ready and read callbacks
            if (newval != 2)
                func_8001D104();
            music_state = newval;
            next = queue_head + 1;
        } else if (curr_command == SNQ_SET_FULL) {
            cd_set_vol(t->arg0);
            next = queue_head + 1;
        } else if (curr_command == SNQ_SET_SCALED) {
            set_vol_scaled(t->arg0, vol_scale);
            next = queue_head + 1;
        } else if (curr_command == SNQ_FADE_OUT) {
            fade_out_active = t->arg0;
            fading_out = t->arg0;
            if (fade_out_active == 1) {
                // turn fadeout on
                if (fade_in_active == 1) {
                    tasks_remove_reserved(fade_in_task);
                    fade_in_active = 0;
                    fading_in = 0;
                    if (fade_in_callback != 0)
                        (*fade_in_callback)();
                    fade_in_callback = 0;
                }
            } else {
                // turn fadeout off
                if (-1 < fade_out_task)
                    tasks_remove_reserved(fade_out_task);
                vol_scale = 1024;
                fade_paused = 0;
            }
            next = queue_head + 1;
        } else if (curr_command == SNQ_FADE_IN) {
            fade_in_active = t->arg0;
            fading_in = t->arg0;
            if (fade_in_active == 1) {
                // turn fadein on
                if (fade_out_active == 1) {
                    tasks_remove_reserved(fade_out_task);
                    fade_out_active = 0;
                    fading_out = 0;
                    if (fade_out_callback != 0)
                        (*fade_out_callback)();
                    fade_out_callback = 0;
                }
            } else {
                // turn fadein off
                if (-1 < fade_in_task)
                    tasks_remove_reserved(fade_in_task);
                vol_scale = 1024;
                fade_paused = 0;
            }
            next = queue_head + 1;
        } else if (curr_command == SNQ_SET_REVERB) {
            SpuCommonAttr attr;
            attr.mask = 0x100;
            attr.cd.reverb = t->arg0;
            SpuSetCommonAttr(&attr);
            D_80047EA4 = t->arg0;
            func_8001FBE4();
            next = queue_head + 1;
        } else if (curr_command == SNQ_FUNC8) {
            if (fade_out_active == 1 || fade_in_active == 1)
                goto done;
            next = queue_head + 1;
        } else if (curr_command == SNQ_FUNC9) {
            func_8001D0AC(t->arg0);
            next = queue_head + 1;
        } else if (curr_command == SNQ_SET_PAUSED) {
            bgm_paused = t->arg0;
            next = queue_head + 1;
        } else {
            // normal cd control functions
            D_80047DD8 = 0;

            curr_param = t->arg0;
            curr_result = t->arg1;
            rc = CdControl(curr_command, curr_param, curr_result);
            if (rc == 1) {
                try_again = 0;
                D_80047E94 = 0;
                queue_head = (queue_head + 1) & 0xff;
                queue_size -= 1;
            } else {
                try_again = 1;
            }
            goto done;
        }
        queue_size -= 1;
        queue_head = next & 0xff;
    }

flush_cache:
    pvd_is_cached = 0;
    sector_cache_clear();
done:
    cd_queue_is_running = 0;
    return 0;
}

// US: 8001B8DC
// JP: 8001ACB8
int cd_flush(void)
{
    int ret = 0;
    if (cd_queue_is_empty == 0)
        do {
            ret = cd_run_block();
        } while (cd_queue_is_empty == 0 && ret != -1);
    CdSync(0, 0);
    return ret;
}
