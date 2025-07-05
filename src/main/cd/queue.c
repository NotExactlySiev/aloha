#include "common.h"
#include <libcd.h>
#include <libspu.h>
#include "cd.h"

// TODO: these don't belong here
extern SpuVolume vol_full;
extern int D_80047EEC; // SpuVolume ptr?
extern CdlFILTER D_80047ECC;
extern CdlFILE D_8004D0E0;
extern int pvd_is_cached;
extern s32 D_800548EC;
extern int D_80047F24;

typedef struct {
    u8     com;
    u32    arg0;
    u32    arg1;
} QueueEntry;

static QueueEntry queue[256];

s8 D_80047EC4[8];
u8 D_80047D94 = SNQ_FINISHED;



s32 D_80047E94;      // this one just gets 0 written to it

s32 D_80047DD8 = 1;  // this is still a mystery. probably enum. gets set in the first function here
s32 D_80047DE0 = 0;  // step? no idea. maybe a state machine
s32 bgm_paused = 0;

int cd_queue_is_empty = 0;
int cd_queue_is_running;
static u16 queue_head;
static u16 queue_tail;
static u16 queue_size;
static int queue_lock = 0;
static int try_again = 0;
static u8 curr_command = SNQ_FINISHED;
static void *curr_param = NULL;
static void *curr_result = NULL;

int fade_out_active = 0;
int fading_out = 0;
int fade_in_active = 0;
int fading_in = 0;
int fade_in_step = 0;
int fade_out_step = 0;
int fade_out_dest = 0;
int fade_in_dest = 1024;

char D_80047DF8[] = "cdrom:\\";     // unused

extern SpuVolume D_80047D8C;
extern s32 fade_out_task;
extern s32 fade_in_task;
extern int (*fade_out_callback)();
extern int (*fade_in_callback)();
extern int music_state;
extern s32 vol_scale;
extern s32 D_80047EA4;
extern s32 fade_paused;

extern int D_80047D78; // music_repeat
extern int D_80047D80; // music_cdda_idx_bcd
extern int D_80047D84; // music_cdda_idx

void cd_clear_queue(void) {
    queue_tail = 0;
    queue_head = 0;
    D_80047E94 = 0;
    D_80047DD8 = 1;
    cd_queue_is_empty = 1;
    D_80047DE0 = 0;
    queue[0].com = -1;
    queue_size = 0;
}

static int queue_add(u8 arg0, u32 arg1, u32 arg2)
{
    QueueEntry *task;

    task = &queue[queue_tail];

    if (queue_lock == 1 || queue_size > 192) return 0;

    queue_lock = 1;
    queue[(queue_tail+1)%256].com = -1;
    task->com = arg0;
    task->arg0 = arg1;
    task->arg1 = arg2;

    queue_size++;
    queue_tail = (queue_tail + 1) & 0xff;
    cd_queue_is_empty = 0;
    queue_lock = 0;
    return 1;
}

void cd_command(u8 arg0, u32 arg1, u32 arg2)
{
    if (cd_queue_is_running == 0) {
        while (queue_size > 192)
            cd_run_block();
    }
    queue_add(arg0, arg1, arg2);
}

int cd_run_block(void)
{
    int rc;

    if (cd_queue_is_running == 1) return 0;
    cd_queue_is_running = 1;

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

    if (D_80047DE0 == 1) {
        music_state = 0;
        D_800548EC = 0;
        CdControl(0, NULL, &cd_last_status);
        while (cd_get_status(&cd_last_status) != 1);
        if (cd_last_status & CdlStatShellOpen)
            goto flush_cache;
        set_vol_scaled(&D_80047D8C, 0x400);
        rc = D_80047F24;
        D_80047DE0 = 0;
        // TODO: what is this control flow
        if (D_80047F24 == 1) {
            music_play_cdda(D_80047D84, D_80047D78);
            D_80047F24 = 1;
        } else if (D_80047F24 == 2) {
            func_8001BA50();
            D_80047F24 = rc;
        } else goto skip_out;
        D_800548EC = 1;
    }
skip_out:
    rc = CdSync(1, 0);
    func_80019F4C(rc, 0);
    if (2 == music_state && func_8001CE18()) {
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
    // ... more shit
    CdSync(0, 0);
    rc = cd_get_status(&cd_last_status);
    if (rc == 1) {
        if (cd_last_status & CdlStatShellOpen) {
            try_again = 1;
            goto flush_cache;
        }
        if (cd_last_status & CdlStatSeek)
            goto done;
    }

    // and then the actual queue
    QueueEntry* t;
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
        if (curr_command == SNQ_SET_FE) {   // done
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
        } else if (curr_command == SNQ_FADE_OUT) {     // done
            fade_out_active = t->arg0;
            fading_out = t->arg0;
            if (fade_out_active == 1) {
                // turn fadeout on
                if (fade_in_active == 1) {
                    tasks_remove_reserved(fade_in_task);
                    fade_in_active = 0;
                    fading_in = 0;
                    if (fade_in_callback != 0) (*fade_in_callback)();
                    fade_in_callback = 0;
                }
            } else {
                // turn fadeout off
                if (-1 < fade_out_task) tasks_remove_reserved(fade_out_task);
                vol_scale = 1024;
                fade_paused = 0;
            }
            next = queue_head + 1;
        } else if (curr_command == SNQ_FADE_IN) {      // done
            fade_in_active = t->arg0;
            fading_in = t->arg0;
            if (fade_in_active == 1) {
                // turn fadein on
                if (fade_out_active == 1) {
                    tasks_remove_reserved(fade_out_task);
                    fade_out_active = 0;
                    fading_out = 0;
                    if (fade_out_callback != 0) (*fade_out_callback)();
                    fade_out_callback = 0;
                }
            } else {
                // turn fadein off
                if (-1 < fade_in_task) tasks_remove_reserved(fade_in_task);
                vol_scale = 1024;
                fade_paused = 0;
            }
            next = queue_head + 1;
        } else if (curr_command == SNQ_SET_REVERB) {   // done
            SpuCommonAttr attr;
            attr.mask = 0x100;
            attr.cd.reverb = t->arg0;
            SpuSetCommonAttr(&attr);
            D_80047EA4 = t->arg0;
            func_8001FBE4();
            next = queue_head + 1;
        } else if (curr_command == SNQ_FUNC8) {    // done
            if (fade_out_active == 1 || fade_in_active == 1) goto done;
            next = queue_head + 1;
        } else if (curr_command == SNQ_FUNC9) {    // done
            func_8001D0AC(t->arg0);
            next = queue_head + 1;
        } else if (curr_command == SNQ_SET_PAUSED) {   // done
            bgm_paused = t->arg0;
            next = queue_head + 1;
        } else {   // done
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

int cd_flush(void)
{
    int ret = 0;
    if (cd_queue_is_empty == 0) do {
        ret = cd_run_block();
    } while (cd_queue_is_empty == 0 && ret != -1);
    CdSync(0, 0);
    return ret;
}