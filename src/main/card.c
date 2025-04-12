
#include "common.h"
#include <libapi.h>
#include <libetc.h>
#include <sys/file.h>
#include <file.h>
#include <libmcrd.h>

static void do_callback(void);

// 3 event test functions
static int D_80047FB4;
static int D_80047FBC;
static int D_80047FC4;
static int D_80047FCC;
static int D_80047FD4;

static int D_80047FDC;
static int D_80047FE4;
static int D_80047FEC;
static int D_80047FF4;
static int D_80047FFC;

static char D_800521F8[32];
int (*_mc_callback)() = 0;

int mc_get_event_sw(void)
{
    if (TestEvent(D_80047FB4) == 1) return EvSpIOE;
    if (TestEvent(D_80047FBC) == 1) return EvSpERROR;
    if (TestEvent(D_80047FC4) == 1) return EvSpTIMOUT;
    if (TestEvent(D_80047FCC) == 1) return EvSpNEW;
    if (TestEvent(D_80047FD4) == 1) return EvSpUNKNOWN;
    return 0;
}

int mc_get_event_hw(void)
{
    if (TestEvent(D_80047FDC) == 1) return EvSpIOE;
    if (TestEvent(D_80047FE4) == 1) return EvSpERROR;
    if (TestEvent(D_80047FEC) == 1) return EvSpTIMOUT;
    if (TestEvent(D_80047FF4) == 1) return EvSpNEW;
    if (TestEvent(D_80047FFC) == 1) return EvSpUNKNOWN;
    return 0;
}

void mc_clear_hw_events(void)
{
    TestEvent(D_80047FDC);
    TestEvent(D_80047FE4);
    TestEvent(D_80047FEC);
    TestEvent(D_80047FF4);
    TestEvent(D_80047FFC);
}

extern int D_80047E18;

// test and setup card
static int select_slot(int chan)
{
    const int timeout = 1000;
    int ev;
    // TODO: inline this
    for (int i = 0; i < timeout; i++) {
        int info_tries = 0;
        for (info_tries = 0; info_tries < timeout; info_tries++) {
            if (_card_info(chan)) 
                break;
        }

        if (info_tries == timeout) {
            D_80047E18 = 1;
            return -2;
        }

        while (1) {
            ev = mc_get_event_sw();
            if (ev)
                break;
            // do other shit while we wait
            cd_run_block();
            do_callback();
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
        card_write(chan);
        while (mc_get_event_hw() == 0);
        int ev2;
        for (int i = 0; i < timeout; i++) {
            int load_tries = 0;
            for (load_tries = 0; load_tries < timeout; load_tries++) {
                if (_card_load(chan)) 
                    break;
            }

            if (load_tries == timeout) {
                D_80047E18 = 1;
                return -2;
            }

            while (1) {
                ev2 = mc_get_event_sw();
                if (ev2)
                    break;
                // do other shit while we wait
                cd_run_block();
                do_callback();
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


// 3 trivial memory card functions
extern int (*D_80047E1C)();

void mc_set_callback_a(void *val)
{
    D_80047E1C = val;
}

static void do_callback(void)
{
    if (D_80047E1C)
        D_80047E1C();
}

int mc_select_slot(int val)
{
    return select_slot(val);
}

static int prefix_address(u32 mtidx, char* src, char* dst)
{
    int rc = mc_select_slot(mtidx);
    if (1 != rc) return rc;
    
    dst[0] = 'b';
    dst[1] = 'u';
    dst[2] = '0' + ((mtidx >> 8) & 1);
    
    char c = mtidx & 0xf;
    c += c > 9 ? 'W' : '0';
    dst[3] = c;
    dst[4] = ':';
    strcpy(src, dst+5);
    return 1;
}

// this is actually just mc_file_exists
int mc_file_exists(int mtidx, char *filename)
{
    int rc = prefix_address(mtidx, filename, D_800521F8);
    if (rc != 1)
        return rc;

    struct DIRENTRY ent;
    struct DIRENTRY *p = firstfile2(D_800521F8, &ent);
    return p == &ent;
}

int mc_file_create(s32 mtidx, char* file, u32 size)
{
    s32 fd;

    if (1 != prefix_address(mtidx, file, D_800521F8))
        return 0;
    size += 0x2000 - 1;
    if (size < 0) size += 0x2000 - 1 + 0x2000 - 1;
    size >>= 13;
    fd = open(D_800521F8, (size << 16) | O_CREAT);
    if (fd == -1) return 0;
    close(fd);
    return 1;
}

int mc_file_open(s32 mtidx, char* file, u32 mode)
{
    if (1 != prefix_address(mtidx, file, D_800521F8))
        return -1;
    //printf("opening %s\n", D_800521F8);
    return open(D_800521F8, mode);
}

int mc_file_close(s32 fd)
{
    return close(fd);
}

int mc_file_delete(u32 mtidx, char* file)
{
    if (1 != prefix_address(mtidx, file, D_800521F8))
        return 0;
    return erase(D_800521F8);
}

int mc_write(int fd, void *buf, int len)   // mc_write
{
    return write(fd, buf, (len + 127) & ~127);
}

int mc_write_block(int fd, void *buf, int len)   // mc_write_block
{
    int rounded = (len + 127) & ~127;
    while (write(fd, buf, rounded) != 0);
    return rounded;
}

// read with fine size
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

struct DIRENTRY *mc_firstfile(int mtidx, char *filename, struct DIRENTRY *out)
{
    int rc = prefix_address(mtidx, filename, D_800521F8);
    if (rc != 1)
        return -1;

    return firstfile2(D_800521F8, out);
}

struct DIRENTRY *mc_nextfile(struct DIRENTRY *dir)
{
    return nextfile(dir);
}

extern int D_80047E18;
int mc_format(long mtidx)
{
    if (mc_select_slot(mtidx) == -2)
        return -1;
    
    char c = (mtidx & 0xF);
    if (c > 9)
        c += 'a' - '9' - 1;

    D_800521F8[0] = 'b';
    D_800521F8[1] = 'u';
    D_800521F8[2] = '0' + ((mtidx >> 8) & 1);
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
    D_80047E1C = 0;
    EnterCriticalSection();
    D_80047FB4 = OpenEvent(SwCARD, EvSpIOE    , EvMdNOINTR, NULL);
    D_80047FBC = OpenEvent(SwCARD, EvSpERROR  , EvMdNOINTR, NULL);
    D_80047FC4 = OpenEvent(SwCARD, EvSpTIMOUT , EvMdNOINTR, NULL);
    D_80047FCC = OpenEvent(SwCARD, EvSpNEW    , EvMdNOINTR, NULL);
    D_80047FD4 = OpenEvent(SwCARD, EvSpUNKNOWN, EvMdNOINTR, NULL);
    D_80047FDC = OpenEvent(HwCARD, EvSpIOE    , EvMdNOINTR, NULL);
    D_80047FE4 = OpenEvent(HwCARD, EvSpERROR  , EvMdNOINTR, NULL);
    D_80047FEC = OpenEvent(HwCARD, EvSpTIMOUT , EvMdNOINTR, NULL);
    D_80047FF4 = OpenEvent(HwCARD, EvSpNEW    , EvMdNOINTR, NULL);
    D_80047FFC = OpenEvent(HwCARD, EvSpUNKNOWN, EvMdNOINTR, NULL);
    EnableEvent(D_80047FB4);
    EnableEvent(D_80047FBC);
    EnableEvent(D_80047FC4);
    EnableEvent(D_80047FCC);
    EnableEvent(D_80047FD4);
    EnableEvent(D_80047FDC);
    EnableEvent(D_80047FE4);
    EnableEvent(D_80047FEC);
    EnableEvent(D_80047FF4);
    EnableEvent(D_80047FFC);
    ExitCriticalSection();
    jt_set(mc_get_event_sw, 0x280);
    jt_set(mc_select_slot, 0x281);
    jt_set(mc_file_exists, 0x282);
    jt_set(func_80020434, 0x283);
    jt_set(func_80020808, 0x284);   // not used
    jt_set(func_800206E4, 0x285);   // not used
    jt_set(mc_set_callback_a, 0x286);
    jt_set(mc_file_create, 0x290);
    jt_set(mc_file_open, 0x291);
    jt_set(mc_file_close, 0x292);
    jt_set(func_800202FC, 0x293);   // not used
    jt_set(mc_write, 0x294);
    jt_set(mc_seek, 0x295);
    jt_set(mc_file_delete, 0x296);
    jt_set(mc_firstfile, 0x297);
    jt_set(mc_nextfile, 0x298);
    jt_set(mc_format, 0x299);
    jt_set(mc_read_block, 0x2A0);
    jt_set(mc_write_block, 0x2A1);
}

// misc functions (part of misc_ maybe?)

// card read callback
void mc_set_callback_b(void (*fn)(void))
{
    _mc_callback = fn;
}

// static
void func_800218B0(void)
{
    if (_mc_callback != 0) {
        (*_mc_callback)();
    }
}

// read file
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_800218DC);
int func_800218DC(long mtidx, char *filename, void *dst, int offset, int len)
{
    printf("read bu%d:/%s: %d bytes at %d\n", mtidx, filename, len, offset);
    if (mc_file_exists(mtidx, filename) == 0)
        return 0;
    
    int fd = mc_file_open(mtidx, filename, O_RDONLY | O_NOWAIT);
    if (fd == -1)
        return 0;
    
    // skip over the header and icons
    mc_seek(fd, offset + 0x200, SEEK_SET);
    mc_read_block(fd, dst, len);
    int rc;
    while ((rc = mc_get_event_sw()) == McErrNone) {
        cd_run_block();
        func_800218B0();
    }
    mc_file_close(fd);
    // huh??
    return len & -(uint) (rc == McErrNotFormat);
}

// write file
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_800219DC);
int func_800219DC(long mtidx, char *filename, void *src, int offset, int len, char *title)
{
    printf("write bu%d:/%s: %d bytes at %d\n", mtidx, filename, len, offset);
    if (mc_file_exists(mtidx, filename) == 0)
        return 0;

    int fd = mc_file_open(mtidx, filename, O_RDWR | O_NOWAIT);
    if (fd == -1)
        return 0;
    
    McTitleFrame header;
    mc_seek(fd, 0, SEEK_SET);
    mc_read_block(fd, &header, 128);
    while (mc_get_event_sw() == 0) {
        cd_run_block();
        func_800218B0();
    }

    int header_len = 0;
    if (header.magic[0] == 'S' && header.magic[1] == 'C') {
        header_len = 128 * ((header.iconflag & 0xF) + 1);
        if (title) {
            memset(header.title, 64, 0);
            strcpy(title, header.title);
            mc_seek(fd, 0, SEEK_SET);
            mc_write_block(fd, &header, 128);
            while (mc_get_event_sw() == 0) {
                cd_run_block();
                func_800218B0();
            }
        }
    }
    offset += header_len;
    mc_seek(fd, offset, SEEK_SET);
    mc_write_block(fd, src, len);
    int rc;
    while ((rc = mc_get_event_sw()) == 0) {
        cd_run_block();
        func_800218B0();
    }

    mc_file_close(fd);
    // huh??
    return len & -(uint) (rc == McErrNotFormat);
}

extern u8 D_80032E5C[3][128];   // frames
extern u16 D_80032FDC[];        // palette

// high level create
int mc_format_file(uint mtidx, char *filename, int len, char *title)
{
    int rc = mc_select_slot(mtidx);
    if (rc != 1)
        return rc;
    
    // low level create
    int fd = mc_file_create(mtidx, filename, len + sizeof(McFileHeader));
    if (fd == 0)
        return -3;
    
    fd = mc_file_open(mtidx, filename, O_RDWR | O_NOWAIT);
    if (fd < -1)
        return -3;
    
    McFileHeader header;
    mc_seek(fd, 0, SEEK_SET);
    // TODO: #define number of frames = 3
    func_80020434(&header, 0x10 + 3, len + sizeof(McFileHeader), title, D_80032FDC, D_80032E5C[0], D_80032E5C[1], D_80032E5C[2]);
    mc_write_block(fd, &header, sizeof(McFileHeader));
    while (mc_get_event_sw() == 0) {
        cd_run_block();
        func_800218B0();
    }
    mc_file_close(fd);
    return len;
}

// TODO: this might return void
// never called?
// mc_delete?
int func_80021D08(uint mtidx, char *filename)
{
    int rc = mc_select_slot(mtidx);
    if (rc != 1)
        rc = mc_file_delete(mtidx, filename);
    return rc;    
}

// close memory card events
void mc_deinit(void)
{
    EnterCriticalSection();
    CloseEvent(D_80047FB4);
    CloseEvent(D_80047FBC);
    CloseEvent(D_80047FC4);
    CloseEvent(D_80047FCC);
    CloseEvent(D_80047FD4);
    CloseEvent(D_80047FDC);
    CloseEvent(D_80047FE4);
    CloseEvent(D_80047FEC);
    CloseEvent(D_80047FF4);
    CloseEvent(D_80047FFC);
    ExitCriticalSection();
    StopCARD2();
}