
#include "common.h"
#include <libapi.h>
#include <libetc.h>
#include <sys/file.h>
#include <file.h>
#include <libmcrd.h>

// 3 event test functions
int D_80047FB4;
int D_80047FBC;
int D_80047FC4;
int D_80047FCC;
int D_80047FD4;

int D_80047FDC;
int D_80047FE4;
int D_80047FEC;
int D_80047FF4;
int D_80047FFC;

static char D_800521F8[32];
int (*_mc_callback)() = 0;

int func_8001FC5C(void)
{
    if (TestEvent(D_80047FB4) == 1) return 4;
    if (TestEvent(D_80047FBC) == 1) return 0x8000;
    if (TestEvent(D_80047FC4) == 1) return 0x100;
    if (TestEvent(D_80047FCC) == 1) return 0x2000;
    return (TestEvent(D_80047FD4) == 1) << 9;
}

int func_8001FCF4(void)
{
    if (TestEvent(D_80047FDC) == 1) return 4;
    if (TestEvent(D_80047FE4) == 1) return 0x8000;
    if (TestEvent(D_80047FEC) == 1) return 0x100;
    if (TestEvent(D_80047FF4) == 1) return 0x2000;
    return (TestEvent(D_80047FFC) == 1) << 9;
}

void func_8001FD8C(void)
{
    TestEvent(D_80047FDC);
    TestEvent(D_80047FE4);
    TestEvent(D_80047FEC);
    TestEvent(D_80047FF4);
    TestEvent(D_80047FFC);
}

// 1 big function related to memory card testing (uses 3 above)
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FDF4);


// 3 trivial memory card functions
extern int (*D_80047E1C)();

void func_8001FFC4(void *val)
{
    D_80047E1C = val;
}

void func_8001FFD4(void)
{
    if (D_80047E1C)
        D_80047E1C();
}

int func_80020000(int val)
{
    return func_8001FDF4(val);
}

// static?
int mc_addr_prefix(u32 mtidx, char* src, char* dst)
{
    int rc = func_80020000(mtidx);
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
int func_800200C8(int mtidx, char *filename)
{
    int rc = mc_addr_prefix(mtidx, filename, D_800521F8);
    if (rc != 1)
        return rc;

    struct DIRENTRY ent;
    struct DIRENTRY *p = firstfile2(D_800521F8, &ent);
    return p == &ent;
}

int mc_file_create(s32 mtidx, char* file, u32 size)
{
    s32 fd;

    if (1 != mc_addr_prefix(mtidx, file, D_800521F8))
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
    if (1 != mc_addr_prefix(mtidx, file, D_800521F8))
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
    if (1 != mc_addr_prefix(mtidx, file, D_800521F8))
        return 0;
    return erase(D_800521F8);
}

int func_8002026C(int fd, void *buf, int len)   // mc_write
{
    return write(fd, buf, (len + 127) & ~127);
}

int func_800202A0(int fd, void *buf, int len)   // mc_write_block
{
    int rounded = (len + 127) & ~127;
    while (write(fd, buf, rounded) != 0);
    return rounded;
}

// read with fine size
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202FC);   //

// read full?
int func_800203AC(long fd, void *buf, long len)
{
    while (read(fd, buf, (len + 127) & ~127) != 0);
    return len;
}

long func_80020414(long fd, long a, long b)
{
    return lseek(fd, a, b);
}

// frames write thing
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020434);   // 
//func_80020434

struct DIRENTRY *func_800205C4(int mtidx, char *filename, struct DirEntry *out)
{
    int rc = mc_addr_prefix(mtidx, filename, D_800521F8);
    if (rc != 1)
        return -1;

    return firstfile2(D_800521F8, out);
}

struct DIRENTRY *func_80020610(struct DIRENTRY *dir)
{
    return nextfile(dir);
}

extern int D_80047E18;
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020630);   // mc_format
int func_80020630(long mtidx)
{
    if (func_80020000(mtidx) == -2)
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
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800206E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020808);

// init memory card (events and jmptable)
INCLUDE_ASM("asm/main/nonmatchings/274C", mc_init);


// misc functions (part of misc_ maybe?)

// card read callback
void func_800218A0(void (*fn)(void))
{
    _mc_callback = fn;
}

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
    if (func_800200C8(mtidx, filename) == 0)
        return 0;
    
    int fd = mc_file_open(mtidx, filename, O_RDONLY | O_NOWAIT);
    if (fd == -1)
        return 0;
    
    func_80020414(fd, offset + 0x200, SEEK_SET);
    func_800203AC(fd, dst, len);
    int rc;
    while ((rc = func_8001FC5C()) == McErrNone) {
        sndqueue_exec();
        func_800218B0();
    }
    mc_file_close(fd);
    // huh??
    return len & -(uint) (rc == McErrNotFormat);
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

// write file
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_800219DC);
int func_800219DC(long mtidx, char *filename, void *src, int offset, int len, char *title)
{
    printf("write bu%d:/%s: %d bytes at %d\n", mtidx, filename, len, offset);
    if (func_800200C8(mtidx, filename) == 0)
        return 0;

    int fd = mc_file_open(mtidx, filename, O_RDWR | O_NOWAIT);
    if (fd == -1)
        return 0;
    
    McTitleFrame header;
    func_80020414(fd, 0, SEEK_SET);
    func_800203AC(fd, &header, 128);
    while (func_8001FC5C() == 0) {
        sndqueue_exec();
        func_800218B0();
    }

    int header_len = 0;
    if (header.magic[0] == 'S' && header.magic[1] == 'C') {
        header_len = 128 * ((header.iconflag & 0xF) + 1);
        if (title) {
            memset(header.title, 64, 0);
            strcpy(title, header.title);
            func_80020414(fd, 0, SEEK_SET);
            func_800202A0(fd, &header, 128);
            while (func_8001FC5C() == 0) {
                sndqueue_exec();
                func_800218B0();
            }
        }
    }
    offset += header_len;
    func_80020414(fd, offset, SEEK_SET);
    func_800202A0(fd, src, len);
    int rc;
    while ((rc = func_8001FC5C()) == 0) {
        sndqueue_exec();
        func_800218B0();
    }

    mc_file_close(fd);
    // huh??
    return len & -(uint) (rc == McErrNotFormat);
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021BCC);   // mc_init_file

// TODO: this might return void
// never called?
// mc_delete?
int func_80021D08(uint mtidx, char *filename)
{
    int rc = func_80020000(mtidx);
    if (rc != 1)
        rc = mc_file_delete(mtidx, filename);
    return rc;    
}

// close memory card events
void func_80020C8C(void)
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