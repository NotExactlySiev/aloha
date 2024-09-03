#include "common.h"
#include <libcd.h>
#include <libspu.h>

// what's the header situattion?
#define SNQ_FINISHED    -1
#define SNQ_SET_FE       -2  //  arg0
#define SNQ_SET_FULL       -3
#define SNQ_SET_SCALED  -4
#define SNQ_FADE_OUT       -5
#define SNQ_FADE_IN       -6
#define SNQ_SET_REVERB  -7
#define SNQ_FUNC8       -8
#define SNQ_FUNC9       -9
#define SNQ_FUNC10      -10

typedef struct {
    u8     com;
    u32    arg0;
    u32    arg1;
} snd_task_t;


snd_task_t _sndqueue[256];
s8 D_80047EC4[8];

s8 sndqueue_com = SNQ_FINISHED;
s8 D_80047D94 = SNQ_FINISHED;
s32 _sndqueue_empty = 0;
s32 _sndqueue_busy = 0;
u16 _sndqueue_next;
u16 _sndqueue_size;
s32 sndqueue_is_running;      // execution is in process

s32 D_80047E94;      // this one just gets 0 written to it
u16 D_80047F34;      // index of the task being executed

s32 D_80047DD8 = 1;  // this is still a mystery. probably enum. gets set in the first function here
s32 D_80047DE0 = 0;  // step? no idea. maybe a state machine
s32 D_80047DEC = 0;

// this is a mess
extern s32 cd_busy;   // step1
extern void* cd_arg;     // param
extern void* cd_result;     // result
extern u8 D_80047EDC;
extern int D_80047EE4;
extern s32 D_800548EC;
extern s32 fade_out_active;
extern s32 fading_out;
extern s32 fade_in_active;
extern s32 fading_in;
extern s32 fade_in_step;
extern s32 fade_out_step;
extern s32 fade_out_dest;
extern s32 fade_in_dest;
extern s32 D_80047D78;
extern SpuVolume D_80047D8C;
extern s32 fade_out_task;
extern s32 fade_in_task;
extern int (*fade_out_callback)();
extern int (*fade_in_callback)();
extern s32 fe_value;
extern s32 vol_scale;
extern s32 D_80047EA4;
extern s32 fade_paused;


void sndqueue_reset(void) {
    _sndqueue_next = 0;
    D_80047F34 = 0;
    D_80047E94 = 0;
    D_80047DD8 = 1;
    _sndqueue_empty = 1;
    D_80047DE0 = 0;
    _sndqueue[0].com = -1;
    _sndqueue_size = 0;
}

s32 sndqueue_add(u8 arg0, u32 arg1, u32 arg2)
{
    u8 tmp;
    snd_task_t* task;

    task = &_sndqueue[_sndqueue_next];

    if (_sndqueue_busy == 1 || _sndqueue_size > 192) return 0;

    _sndqueue_busy = 1;
    _sndqueue[(_sndqueue_next+1)%256].com = -1;
    task->com = arg0;
    task->arg0 = arg1;
    task->arg1 = arg2;

    _sndqueue_size++;
    _sndqueue_next = (_sndqueue_next + 1) & 0xff;
    _sndqueue_empty = 0;
    _sndqueue_busy = 0;
    return 1;
}

void sndqueue_add_try(u8 arg0, u32 arg1, u32 arg2)
{
    if (sndqueue_is_running == 0) {
        while (_sndqueue_size > 192)
            sndqueue_exec();
    }
    sndqueue_add(arg0, arg1, arg2);
}

//NCLUDE_ASM("asm/main/nonmatchings/274C", sndqueue_exec);
// execute one block of command
s32 sndqueue_exec()
{
    s32 rc;

    if (sndqueue_is_running == 1) return 0;
    sndqueue_is_running = 1;

#if 0
    printf("RUN %d: ", D_80047F34);
    snd_task_t *p = &_sndqueue[D_80047F34];
    for (int i = 0; i < 6; i++) {
        printf("%X\t", p->com);
        if (p->com == 0xFF) break;
        p++;
    }
    printf("\n");
#endif

    // try again
    if (cd_busy == 1) {
        rc = CdControl(sndqueue_com, cd_arg, cd_result);
        if (rc != 1) {
            cd_busy = 1;
            sndqueue_is_running = 0;
            return 0;
        }
        cd_busy = 0;
        D_80047DE0 = 1;
        goto flush_and_flee;
    }

    //return;
    // ...
    // check_fe:
    CdSync(1, 0);
    func_80019F4C(rc, 0);   // rc doesn't exist yet lolololol
    if (2 == fe_value && func_8001CE18()) {
        fe_value = 0;
        set_vol_scaled(&D_80047D8C, 0x400);
        if (1 == D_80047D78) {
            sndqueue_add(CdlPause, 0, 0);   // TODO: arguments
            sndqueue_add(CdlSetmode, D_80047EC4, 0);
            sndqueue_add(CdlSetfilter, 0, 0);
            sndqueue_add(CdlSeekL, 0, 0);
            sndqueue_add(CdlPause, 0, 0);
            sndqueue_add(CdlReadS, 0, 0);
            sndqueue_add(SNQ_SET_SCALED, 0, 0);
            sndqueue_add(SNQ_FUNC9, 0, 0);
            sndqueue_add(SNQ_SET_FE, 2, 0);
        } else {
            sndqueue_add(CdlPause, 0, 0);
            D_800548EC = 0;
        }
    }
    // ... more shit
    CdSync(0, 0);
    rc = cd_get_status(&D_80047EDC);
    if (rc == 1) {
        if (D_80047EDC & 0x10) {
            cd_busy = 1;
flush_and_flee:
            D_80047EE4 = 0;
            func_8001D414();
            sndqueue_is_running = 0;
            return 0;
        }
        if (D_80047EDC & 0x40) {
            sndqueue_is_running = 0;
            return 0;
        }
    }

    // and then the actual queue
    snd_task_t* t;
    u32 next = 0xDEADBEEF;

    while (1) { // i think I can break instead of return
        t = &_sndqueue[D_80047F34];
        if (t->com == 0xFF) {
            D_80047DD8 = 0;
            sndqueue_com = CdlNop;
            cd_arg = 0;
            cd_result = &D_80047EDC;
            cd_busy = (1 != cd_get_status(&D_80047EDC));
            _sndqueue_empty = 1;
            break;
        }

        sndqueue_com = t->com;
        D_80047D94 = t->com;
        if (sndqueue_com == SNQ_SET_FE) {   // done
            s32 newval = t->arg0;
            if (fe_value == 5 && newval != 5)
                func_8001A380(); // activate ready and read callbacks
            if (newval != 2)
                func_8001D104();
            fe_value = newval;
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_SET_FULL) {
            set_vol_full(t->arg0);
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_SET_SCALED) {
            set_vol_scaled(t->arg0, vol_scale);
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FADE_OUT) {     // done
            fade_out_active = t->arg0;
            fading_out = t->arg0;
            if (fade_out_active == 1) {
                // turn fadeout on
                if (fade_in_active == 1) {
                    regular_clear_tmps(fade_in_task);
                    fade_in_active = 0;
                    fading_in = 0;
                    if (fade_in_callback != 0) (*fade_in_callback)();
                    fade_in_callback = 0;
                }
            } else {
                // turn fadeout off
                if (-1 < fade_out_task) regular_clear_tmps(fade_out_task);
                vol_scale = 1024;
                fade_paused = 0;
            }
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FADE_IN) {      // done
            fade_in_active = t->arg0;
            fading_in = t->arg0;
            if (fade_in_active == 1) {
                // turn fadein on
                if (fade_out_active == 1) {
                    regular_clear_tmps(fade_out_task);
                    fade_out_active = 0;
                    fading_out = 0;
                    if (fade_out_callback != 0) (*fade_out_callback)();
                    fade_out_callback = 0;
                }
            } else {
                // turn fadein off
                if (-1 < fade_in_task) regular_clear_tmps(fade_in_task);
                vol_scale = 1024;
                fade_paused = 0;
            }
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_SET_REVERB) {   // done
            SpuCommonAttr attr;
            attr.mask = 0x100;
            attr.cd.reverb = t->arg0;
            SpuSetCommonAttr(&attr);
            D_80047EA4 = t->arg0;
            func_8001FBE4();
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FUNC8) {    // done
            if (fade_out_active == 1 || fade_in_active == 1) break;
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FUNC9) {    // done
            func_8001D0AC(t->arg0);
            next = D_80047F34 + 1;
        } else      
        if (sndqueue_com == SNQ_FUNC10) {   // done
            D_80047DEC = t->arg0;
            next = D_80047F34 + 1;
        } else {   // done
            // normal cd control functions
            D_80047DD8 = 0;

            cd_arg = t->arg0;
            cd_result = t->arg1;
            rc = CdControl(sndqueue_com, cd_arg, cd_result);
            if (rc == 1) {
                cd_busy = 0;
                D_80047E94 = 0;
                D_80047F34 = (D_80047F34 + 1) & 0xff;
                _sndqueue_size -= 1;
            } else {
                cd_busy = 1;
            }
            break;
        }
        _sndqueue_size -= 1;
        D_80047F34 = next & 0xff;
    }

    sndqueue_is_running = 0;
    return 0;
}



// TODO: sound lol
int sndqueue_exec_all(void)
{
    s32 ret = 0;
    if (_sndqueue_empty == 0) do {
        ret = sndqueue_exec();
    } while (_sndqueue_empty == 0 && ret != -1);
    CdSync(0, 0);
    return ret;
}


// endof queue.c