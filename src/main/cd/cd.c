#include "common.h"
#include <kernel.h>
#include <libcd.h>
#include "cd.h"
#include "../util.h"
#include "../main.h"

static int iso_read_prv(int fast, char *filename, void *buf, int n);

// 8001C418
int cd_fs_get_file(CdlFILE *file, char *filename) {
    char upper[128];
    char formatted[128];
    char *dst = formatted;

    // format the name
    ram_strupper(filename, upper);
    if (upper[0] != '\\') {
        *dst++ = '\\';
    }

    if (ram_strchr(upper, ';') == 0) {
        ram_strcat(upper, ";1", dst);
    } else {
        ram_strcpy(upper, dst);
    }

    // call the iso function
    for (int i = 0; i < 10; i++) {
        if (iso_get_file(file, formatted))
            return 1;
    }
    return 0;
}

// 8001C4F0
NOT_IMPL_FN(cd_fs_get_file_safe) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_get_file_safe);   // iso_get_file_loc

// 8001C564
NOT_IMPL_FN(iso_file_size) //INCLUDE_ASM("asm/main/nonmatchings/274C", iso_file_size);   // iso_get_file_size

// helper functions for cd stuff
// 8001C5BC
NOT_IMPL_FN(cd_seek_safe) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_seek_safe);   // cd_seek_safe

// 8001C5F4
NOT_IMPL_FN(iso_seek) //INCLUDE_ASM("asm/main/nonmatchings/274C", iso_seek);   // iso_seek

// 8001C670
NOT_IMPL_FN(cd_read_full) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_read_full);   // cd_read_full

// 8001C734
s32 func_8001C734(s32 mode, u8* result) // pause
{
    s32 ret;

    ret = cd_verify_read(mode, result);
    if (ret == 2) {
        try_CdControl(CdlPause, 0, 0);
        flush_cache_safe();
    }
    return ret;
}


// cd filesystem io
// 8001C780
int iso_read(char *filename, u8 *buf, int n)
{
    return iso_read_prv(0, filename, buf, n);
}

// with rounding, fast. not used?
// 8001C7B4
int iso_read_fast(char *filename, u8 *buf, int n)
{
    return iso_read_prv(1, filename, buf, n);
}

// 8001C7E8
static int iso_read_prv(int fast, char *filename, void *buf, int n)
{
    // what even is this function...
    u32 *dst = buf;

    func_8001A77C();
    if (func_8001B94C() == -1)
        return -1;

    CdlFILE file;
    if (cd_fs_get_file(&file, filename) == 0)
        return -2;

    if (n == 0 || n > file.size)
        n = file.size;

    if (fast) {
        // round up to sector, no error checking (I don't think this is used ever)
        try_CdControl(CdlSetloc, &file.pos, NULL);
        try_CdRead((n + SECTOR_BYTES - 1) / SECTOR_BYTES, buf, 0x80);
    } else {
        int sectors = n / SECTOR_BYTES;
        int fine = n % SECTOR_BYTES;

        if (sectors) {
            try_CdControl(CdlSetloc, &file.pos, NULL);
            try_CdRead(sectors, dst, 0x80);
            if (cd_verify_read(0, NULL) == -1) {
                // second time's the charm!
                try_CdControl(CdlSetloc, &file.pos, NULL);
                try_CdRead(sectors, dst, 0x80);
                if (cd_verify_read(0, NULL) == -1)
                    return -1;
            }
            dst += sectors * SECTOR_SIZE;
        }

        if (fine) {
            int file_start = CdPosToInt(&file.pos);
            CdlLOC last_sector;
            CdIntToPos(file_start + sectors, &last_sector);

            u32 tmpbuf[SECTOR_SIZE];
            try_CdControl(CdlSetloc, &last_sector, NULL);
            try_CdRead(1, tmpbuf, 0x80);
            if (cd_verify_read(0, NULL) == -1) {
                // this time it's gonna work I pwomise ^_^
                try_CdControl(CdlSetloc, &last_sector, NULL);
                try_CdRead(1, tmpbuf, 0x80);
                if (cd_verify_read(0, NULL) == -1)
                    return -1;
            }

            for (int i = 0; i < fine; i++) {
                dst[i] = tmpbuf[i];
            }
        }

        try_CdControl(CdlPause, NULL, NULL);
        CdSync(0, NULL);
        flush_cache_safe();
    }

    return n;
}

// 8001CA84
NOT_IMPL_FN(cd_fs_load_exe) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_load_exe);

// 8001CCC0
s32 iso_exec(char* file, s32 param) {
    EXEC header;

    if (cd_fs_load_exe(file, param, &header) != 0)
        return -1;

    flush_cache_safe();
    set_next_exec(0);
    Exec(&header, 1, 0);
    return 0;
}
