
#include "common.h"
#include <libapi.h>
#include <libetc.h>
#include <sys/file.h>
#include <file.h>
#include <libmcrd.h>

static void do_callback_a(void);

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

void (*_mc_callback_a)(void) = 0;
void (*_mc_callback_b)(void) = 0;

int mc_get_event(void)
{
    if (TestEvent(event_sw_ioe) == 1) return EvSpIOE;
    if (TestEvent(event_sw_err) == 1) return EvSpERROR;
    if (TestEvent(event_sw_tim) == 1) return EvSpTIMOUT;
    if (TestEvent(event_sw_new) == 1) return EvSpNEW;
    if (TestEvent(event_sw_unk) == 1) return EvSpUNKNOWN;
    return 0;
}

int mc_get_event_hw(void)
{
    if (TestEvent(event_hw_ioe) == 1) return EvSpIOE;
    if (TestEvent(event_hw_err) == 1) return EvSpERROR;
    if (TestEvent(event_hw_tim) == 1) return EvSpTIMOUT;
    if (TestEvent(event_hw_new) == 1) return EvSpNEW;
    if (TestEvent(event_hw_unk) == 1) return EvSpUNKNOWN;
    return 0;
}

void mc_clear_hw_events(void)
{
    TestEvent(event_hw_ioe);
    TestEvent(event_hw_err);
    TestEvent(event_hw_tim);
    TestEvent(event_hw_new);
    TestEvent(event_hw_unk);
}

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
        [[fallthrough]]
    
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

void mc_set_callback_a(void (*fn)(void))
{
    _mc_callback_a = fn;
}

static void do_callback_a(void)
{
    if (_mc_callback_a)
        _mc_callback_a();
}

int mc_select_slot(int slot)
{
    return select_slot(slot);
}

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
    strcpy(src, dst+5);
    return 1;
}

// this is actually just mc_file_exists
int mc_file_exists(int slot, char *filename)
{
    int rc = prefix_address(slot, filename, D_800521F8);
    if (rc != 1)
        return rc;

    struct DIRENTRY ent;
    struct DIRENTRY *p = firstfile2(D_800521F8, &ent);
    return p == &ent;
}

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

int mc_open(s32 slot, char *file, u32 mode)
{
    if (1 != prefix_address(slot, file, D_800521F8))
        return -1;
    //printf("opening %s\n", D_800521F8);
    return open(D_800521F8, mode);
}

int mc_close(s32 fd)
{
    return close(fd);
}

int mc_delete(u32 slot, char *file)
{
    if (1 != prefix_address(slot, file, D_800521F8))
        return 0;
    return erase(D_800521F8);
}

int mc_write(int fd, void *buf, int len)
{
    return write(fd, buf, (len + 127) & ~127);
}

int mc_write_block(int fd, void *buf, int len)
{
    int rounded = (len + 127) & ~127;
    while (write(fd, buf, rounded) != 0);
    return rounded;
}

// mc_read, read with fine size
NOT_IMPL_FN(func_800202FC) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202FC);

int mc_read_block(long fd, void *buf, long len)
{
    while (read(fd, buf, (len + 127) & ~127) != 0);
    return len;
}

long mc_seek(long fd, long a, long b)
{
    return lseek(fd, a, b);
}

typedef struct {
    u8 magic[2];
    u8 iconflag;
    u8 blocksize;
    u8 title[64];
    u8 reserved[12];
    u8 pocketstation[16];
    u16 palette[16];
} McTitleFrame;

typedef struct {
    McTitleFrame titleframe;
    u8 frames[3][128];
} McFileHeader;

// make the header. static
int func_80020434();
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020434);   // 
//func_80020434
/*
int func_80020434(McFileHeader *header, u8 iconflag, int size, char *title, u16 *palette, u8 frame0[128], u8 frame1[128], u8 frame2[128])
{
    //
    // so much of this is redundent lol
    int totalsize = 0x80;
    if (iconflag == 0x11)
        totalsize = 
}
*/

struct DIRENTRY *mc_firstfile(int slot, char *filename, struct DIRENTRY *out)
{
    int rc = prefix_address(slot, filename, D_800521F8);
    if (rc != 1)
        return -1;

    return firstfile2(D_800521F8, out);
}

struct DIRENTRY *mc_nextfile(struct DIRENTRY *dir)
{
    return nextfile(dir);
}

extern int D_80047E18;
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
NOT_IMPL_FN(func_800206E4) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_800206E4);

NOT_IMPL_FN(func_80020808) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020808);

void mc_init(void)
{
    InitCARD2(1);
    StartCARD2();
    _bu_init();
    _card_auto(0);
    _mc_callback_a = 0;
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

// higher level functions. set in misc_

void mc_set_callback_b(void (*fn)(void))
{
    _mc_callback_b = fn;
}

static void do_callback_b(void)
{
    if (_mc_callback_b != 0) {
        (*_mc_callback_b)();
    }
}

int mc_file_read(int slot, char *filename, void *dst, int offset, int len)
{
    printf("read bu%d:/%s: %d bytes at %d\n", slot, filename, len, offset);
    if (mc_file_exists(slot, filename) == 0)
        return 0;
    
    int fd = mc_open(slot, filename, O_RDONLY | O_NOWAIT);
    if (fd == -1)
        return 0;
    
    // skip over the header and icons
    mc_seek(fd, offset + 0x200, SEEK_SET);
    mc_read_block(fd, dst, len);
    int rc;
    while ((rc = mc_get_event()) == 0) {
        cd_run_block();
        do_callback_b();
    }
    mc_close(fd);
    // huh??
    return len & -(uint) (rc == EvSpIOE);
}

int mc_file_write(int slot, char *filename, void *src, int offset, int len, char *title)
{
    printf("write bu%d:/%s: %d bytes at %d\n", slot, filename, len, offset);
    if (mc_file_exists(slot, filename) == 0)
        return 0;

    int fd = mc_open(slot, filename, O_RDWR | O_NOWAIT);
    if (fd == -1)
        return 0;
    
    McTitleFrame header;
    mc_seek(fd, 0, SEEK_SET);
    mc_read_block(fd, &header, 128);
    while (mc_get_event() == 0) {
        cd_run_block();
        do_callback_b();
    }

    int header_len = 0;
    if (header.magic[0] == 'S' && header.magic[1] == 'C') {
        header_len = 128 * ((header.iconflag & 0xF) + 1);
        if (title) {
            memset(header.title, 64, 0);
            strcpy(title, header.title);
            mc_seek(fd, 0, SEEK_SET);
            mc_write_block(fd, &header, 128);
            while (mc_get_event() == 0) {
                cd_run_block();
                do_callback_b();
            }
        }
    }
    offset += header_len;
    mc_seek(fd, offset, SEEK_SET);
    mc_write_block(fd, src, len);
    int rc;
    while ((rc = mc_get_event()) == 0) {
        cd_run_block();
        do_callback_b();
    }

    mc_close(fd);
    // huh??
    return len & -(uint) (rc == EvSpIOE);
}

extern u8 D_80032E5C[3][128];   // frames
extern u16 D_80032FDC[];        // palette

int mc_file_create(int slot, char *filename, int len, char *title)
{
    int rc = mc_select_slot(slot);
    if (rc != 1)
        return rc;
    
    // low level create
    int fd = mc_create(slot, filename, len + sizeof(McFileHeader));
    if (fd == 0)
        return -3;
    
    fd = mc_open(slot, filename, O_RDWR | O_NOWAIT);
    if (fd < -1)
        return -3;
    
    McFileHeader header;
    mc_seek(fd, 0, SEEK_SET);
    // TODO: #define number of frames = 3
    func_80020434(&header, 0x10 + 3, len + sizeof(McFileHeader), title, D_80032FDC, D_80032E5C[0], D_80032E5C[1], D_80032E5C[2]);
    mc_write_block(fd, &header, sizeof(McFileHeader));
    while (mc_get_event() == 0) {
        cd_run_block();
        do_callback_b();
    }
    mc_close(fd);
    return len;
}

// TODO: this might return void
// never called?
int mc_file_delete(int slot, char *filename)
{
    int rc = mc_select_slot(slot);
    if (rc != 1)
        rc = mc_delete(slot, filename);
    return rc;    
}

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