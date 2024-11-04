
#include "common.h"
#include <libapi.h>
#include <libetc.h>
#include <sys/file.h>

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

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020630);   // mc_format

// 2 big almost identical functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800206E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020808);

// init memory card (events and jmptable)
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002092C);

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