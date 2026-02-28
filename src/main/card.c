
#include "common.h"
#include <libapi.h>
#include <libetc.h>
#include <sys/file.h>
#include <file.h>
#include <libmcrd.h>
#include "card.h"
#include "jumptable.h"
#include "util.h"
#include "cd/cd.h"

static void do_callback_a(void);

static void (*mc_callback_a)(void) = 0;
static int event_sw_ioe;
static int event_sw_err;
static int event_sw_tim;
static int event_sw_new;
static int event_sw_unk;
static int event_hw_ioe;
static int event_hw_err;
static int event_hw_tim;
static int event_hw_new;
static int event_hw_unk;

static char D_800521F8[32];
static int D_80047E18 = 1;  // card not available

// 8001FC5C
int mc_get_event(void)
{
    if (TestEvent(event_sw_ioe) == 1) return EvSpIOE;
    if (TestEvent(event_sw_err) == 1) return EvSpERROR;
    if (TestEvent(event_sw_tim) == 1) return EvSpTIMOUT;
    if (TestEvent(event_sw_new) == 1) return EvSpNEW;
    if (TestEvent(event_sw_unk) == 1) return EvSpUNKNOWN;
    return 0;
}

// 8001FCF4
int mc_get_event_hw(void)
{
    if (TestEvent(event_hw_ioe) == 1) return EvSpIOE;
    if (TestEvent(event_hw_err) == 1) return EvSpERROR;
    if (TestEvent(event_hw_tim) == 1) return EvSpTIMOUT;
    if (TestEvent(event_hw_new) == 1) return EvSpNEW;
    if (TestEvent(event_hw_unk) == 1) return EvSpUNKNOWN;
    return 0;
}

// 8001FD8C
void mc_clear_hw_events(void)
{
    TestEvent(event_hw_ioe);
    TestEvent(event_hw_err);
    TestEvent(event_hw_tim);
    TestEvent(event_hw_new);
    TestEvent(event_hw_unk);
}

// 8001FDF4
static int select_slot(int slot)
{
    const int timeout = 1000;
    int ev;
    // TODO: inline this
    for (int i = 0; i < timeout; i++) {
        int info_tries = 0;
        for (info_tries = 0; info_tries < timeout; info_tries++) {
            if (_card_info(slot))
                break;
        }

        if (info_tries == timeout) {
            D_80047E18 = 1;
            return -2;
        }

        while ((ev = mc_get_event()) == 0) {
            cd_run_block();
            do_callback_a();
        }

        if (ev != EvSpERROR && ev != EvSpUNKNOWN)
            break;
    }

    switch (ev) {
    case EvSpIOE:
        if (D_80047E18 != 1) break;
        [[fallthrough]];

    case EvSpNEW:
        mc_clear_hw_events();
        card_write(slot);
        while (mc_get_event_hw() == 0);
        int ev2;
        for (int i = 0; i < timeout; i++) {
            int load_tries = 0;
            for (load_tries = 0; load_tries < timeout; load_tries++) {
                if (_card_load(slot))
                    break;
            }

            if (load_tries == timeout) {
                D_80047E18 = 1;
                return -2;
            }

            while ((ev2 = mc_get_event()) == 0) {
                cd_run_block();
                do_callback_a();
            }

            if (ev2 != EvSpERROR && ev2 != EvSpUNKNOWN)
                break;
        }
        if (ev2 == EvSpIOE) {
            ev = EvSpIOE;
        } else if (ev2 == EvSpNEW) {
            D_80047E18 = 1;
            return -1;
        }
        break;

    default:
        D_80047E18 = 1;
        return -2;
    }

    if (ev == EvSpIOE) {
        D_80047E18 = 0;
        return 1;
    } else {
        D_80047E18 = 1;
        return -2;
    }
}

// 8001FFC4
void mc_set_callback_a(void (*fn)(void))
{
    mc_callback_a = fn;
}

// 8001FFD4
static void do_callback_a(void)
{
    if (mc_callback_a)
        mc_callback_a();
}

// 80020000
int mc_select_slot(int slot)
{
    return select_slot(slot);
}

// 80020020
static int prefix_address(u32 slot, char* src, char* dst)
{
    int rc = mc_select_slot(slot);
    if (1 != rc) return rc;

    dst[0] = 'b';
    dst[1] = 'u';
    dst[2] = '0' + ((slot >> 8) & 1);

    char c = slot & 0xf;
    c += c > 9 ? 'W' : '0';
    dst[3] = c;
    dst[4] = ':';
    ram_strcpy(src, dst+5);
    return 1;
}

// this is actually just mc_file_exists
// 800200C8
int mc_file_exists(int slot, char *filename)
{
    int rc = prefix_address(slot, filename, D_800521F8);
    if (rc != 1)
        return rc;

    struct DIRENTRY ent;
    struct DIRENTRY *p = firstfile2(D_800521F8, &ent);
    return p == &ent;
}

// 8002011C
int mc_create(s32 slot, char* file, u32 size)
{
    s32 fd;

    if (1 != prefix_address(slot, file, D_800521F8))
        return 0;
    size += 0x2000 - 1;
    if (size < 0) size += 0x2000 - 1 + 0x2000 - 1;
    size >>= 13;
    fd = open(D_800521F8, (size << 16) | O_CREAT);
    if (fd == -1) return 0;
    close(fd);
    return 1;
}

// 800201A0
int mc_open(s32 slot, char *file, u32 mode)
{
    if (1 != prefix_address(slot, file, D_800521F8))
        return -1;
    //printf("opening %s\n", D_800521F8);
    return open(D_800521F8, mode);
}

// 80020208
int mc_close(s32 fd)
{
    return close(fd);
}

// 80020228
int mc_delete(u32 slot, char *file)
{
    if (1 != prefix_address(slot, file, D_800521F8))
        return 0;
    return erase(D_800521F8);
}

// 8002026C
int mc_write(int fd, void *buf, int len)
{
    return write(fd, buf, (len + 127) & ~127);
}

// 800202A0
int mc_write_block(int fd, void *buf, int len)
{
    int rounded = (len + 127) & ~127;
    while (write(fd, buf, rounded) != 0);
    return rounded;
}

// mc_read, read with fine size
// 800202FC
NOT_IMPL_FN(func_800202FC) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202FC);

// 800203AC
int mc_read_block(int fd, void *buf, long len)
{
    while (read(fd, buf, (len + 127) & ~127) != 0);
    return len;
}

// 80020414
long mc_seek(int fd, long a, long b)
{
    return lseek(fd, a, b);
}

// make the header
// 80020434
int func_80020434(McFileHeader *header, u8 iconflag, int size, char *title, u16 *palette, u8 frame0[128], u8 frame1[128], u8 frame2[128])
{
    // so much of this is redundent lol
    // size in words
    int totalsize = 0x80;
    if (iconflag == 0x11)
        totalsize = 0x40;   // 2 blocks

    if (iconflag == 0x12)
        totalsize = 0x60;   // 3 blocks

    if (iconflag == 0x13)
        totalsize = 0x80;   // 4 blocks

    u32 *p = (u32 *) header;
    for (int i = 0; i < totalsize; i++) {
        p[i] = 0;
    }

    header->titleframe.magic[0] = 'S';
    header->titleframe.magic[1] = 'C';
    header->titleframe.iconflag = iconflag;
    header->titleframe.blocksize = size / 8192;
    ram_strcpy(title, header->titleframe.title);

    for (int i = 0; i < 16; i++) {
        header->titleframe.palette[i] = palette[i];
    }

    p = (u32 *) frame0;
    u32 *dst = (u32 *) header->frames[0];
    for (int i = 0; i < 32; i++) {
        dst[i] = p[i];
    }

    if (iconflag > 0x11) {
        p = (u32 *) frame1;
        dst = (u32 *) header->frames[1];
        for (int i = 0; i < 32; i++) {
            dst[i] = p[i];
        }
    }

    if (iconflag == 0x13) {
        p = (u32 *) frame2;
        dst = (u32 *) header->frames[2];
        for (int i = 0; i < 32; i++) {
            dst[i] = p[i];
        }
    }

    return totalsize * sizeof(u32);
}

// 800205C4
struct DIRENTRY *mc_firstfile(int slot, char *filename, struct DIRENTRY *out)
{
    int rc = prefix_address(slot, filename, D_800521F8);
    if (rc != 1)
        return -1;

    return firstfile2(D_800521F8, out);
}

// 80020610
struct DIRENTRY *mc_nextfile(struct DIRENTRY *dir)
{
    return nextfile(dir);
}

extern int D_80047E18;
// 80020630
int mc_format(long slot)
{
    if (mc_select_slot(slot) == -2)
        return -1;

    char c = (slot & 0xF);
    if (c > 9)
        c += 'a' - '9' - 1;

    D_800521F8[0] = 'b';
    D_800521F8[1] = 'u';
    D_800521F8[2] = '0' + ((slot >> 8) & 1);
    D_800521F8[3] = '0' + c;
    D_800521F8[4] = ':';
    D_800521F8[5] = 0;
    D_80047E18 = 1;
    return _card_format(D_800521F8);
}

// 2 big almost identical functions
// 800206E4
NOT_IMPL_FN(func_800206E4) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_800206E4);

// 80020808
NOT_IMPL_FN(func_80020808) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020808);

// 8002092C
void mc_init(void)
{
    InitCARD2(1);
    StartCARD2();
    _bu_init();
    _card_auto(0);
    mc_callback_a = 0;
    EnterCriticalSection();
    event_sw_ioe = OpenEvent(SwCARD, EvSpIOE    , EvMdNOINTR, NULL);
    event_sw_err = OpenEvent(SwCARD, EvSpERROR  , EvMdNOINTR, NULL);
    event_sw_tim = OpenEvent(SwCARD, EvSpTIMOUT , EvMdNOINTR, NULL);
    event_sw_new = OpenEvent(SwCARD, EvSpNEW    , EvMdNOINTR, NULL);
    event_sw_unk = OpenEvent(SwCARD, EvSpUNKNOWN, EvMdNOINTR, NULL);
    event_hw_ioe = OpenEvent(HwCARD, EvSpIOE    , EvMdNOINTR, NULL);
    event_hw_err = OpenEvent(HwCARD, EvSpERROR  , EvMdNOINTR, NULL);
    event_hw_tim = OpenEvent(HwCARD, EvSpTIMOUT , EvMdNOINTR, NULL);
    event_hw_new = OpenEvent(HwCARD, EvSpNEW    , EvMdNOINTR, NULL);
    event_hw_unk = OpenEvent(HwCARD, EvSpUNKNOWN, EvMdNOINTR, NULL);
    EnableEvent(event_sw_ioe);
    EnableEvent(event_sw_err);
    EnableEvent(event_sw_tim);
    EnableEvent(event_sw_new);
    EnableEvent(event_sw_unk);
    EnableEvent(event_hw_ioe);
    EnableEvent(event_hw_err);
    EnableEvent(event_hw_tim);
    EnableEvent(event_hw_new);
    EnableEvent(event_hw_unk);
    ExitCriticalSection();
    jt_set(mc_get_event, 0x280);
    jt_set(mc_select_slot, 0x281);
    jt_set(mc_file_exists, 0x282);
    jt_set(func_80020434, 0x283);   // make header
    jt_set(func_80020808, 0x284);   // not used
    jt_set(func_800206E4, 0x285);   // not used
    jt_set(mc_set_callback_a, 0x286);
    jt_set(mc_create, 0x290);
    jt_set(mc_open, 0x291);
    jt_set(mc_close, 0x292);
    jt_set(func_800202FC, 0x293);   // mc_read, not used
    jt_set(mc_write, 0x294);
    jt_set(mc_seek, 0x295);
    jt_set(mc_delete, 0x296);
    jt_set(mc_firstfile, 0x297);
    jt_set(mc_nextfile, 0x298);
    jt_set(mc_format, 0x299);
    jt_set(mc_read_block, 0x2A0);
    jt_set(mc_write_block, 0x2A1);
}

// 80020C8C
void mc_deinit(void)
{
    EnterCriticalSection();
    CloseEvent(event_sw_ioe);
    CloseEvent(event_sw_err);
    CloseEvent(event_sw_tim);
    CloseEvent(event_sw_new);
    CloseEvent(event_sw_unk);
    CloseEvent(event_hw_ioe);
    CloseEvent(event_hw_err);
    CloseEvent(event_hw_tim);
    CloseEvent(event_hw_new);
    CloseEvent(event_hw_unk);
    ExitCriticalSection();
    StopCARD2();
}
