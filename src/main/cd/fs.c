#include "../main.h"
#include "common.h"
#include "priv.h"
#include <kernel.h>
#include <util.h>

static int iso_read_prv(int fast, char *filename, void *buf, int n);

// US: 8001C418
// JP: 8001B690
int cd_fs_get_file(CdlFILE *file, char *filename)
{
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
NOT_IMPL_FN(cd_fs_get_file_safe)

// 8001C564
NOT_IMPL_FN(iso_file_size)

// 8001C5BC
NOT_IMPL_FN(cd_seek_safe)

// US: 8001C5F4
// JP: 8001B86C
NOT_IMPL_FN(iso_seek, char *file, uint offset)

// US: 8001C670
// JP: 8001B8E8
NOT_IMPL_FN(cd_read_full)

// 8001C734
int func_8001C734(s32 mode, u8 *result) // pause, cancel?
{
    int ret = cd_verify_read(mode, result);
    if (ret == 2) {
        try_CdControl(CdlPause, 0, 0);
        flush_cache_safe();
    }
    return ret;
}

// US: 8001C780
// JP: 8001B9F8
int iso_read(char *filename, u8 *buf, int n)
{
    return iso_read_prv(0, filename, buf, n);
}

// with rounding, fast. not used?
// US: 8001C7B4
// JP: 8001BA2C
int iso_read_fast(char *filename, u8 *buf, int n)
{
    return iso_read_prv(1, filename, buf, n);
}

// US: 8001C7E8
// JP: 8001BA60
static int iso_read_prv(int fast, char *filename, void *buf, int n)
{
    u32 *dst = buf;

    cd_check_disc_presence();
    if (func_8001B94C() == -1)
        return -1;

    // This function is entirely broken in the Japanese version, and doesn't
    // work properly with new Psy-Q. We bypass our own code and use the high
    // level functions provided by this version of Psy-Q.
#if !defined(VERSION_WORLD) && defined(PSYQ47_FIXES)
    {
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

        int rc = CdReadFile(formatted, buf, n);
        CdReadSync(0, NULL);
        return rc;
    }
#endif

    CdlFILE file;
    if (cd_fs_get_file(&file, filename) == 0) {
#ifdef VERSION_WORLD
        return -2;
#else
        return -1;
#endif
    }

    if (n == 0 || n > file.size)
        n = file.size;

#ifndef VERSION_WORLD
    try_CdControl(CdlSetloc, &file.pos, NULL);
#endif

    if (fast) {
#ifndef VERSION_WORLD
        if (fast != 1) {
            return n;
        }
#endif

#ifdef VERSION_WORLD
        try_CdControl(CdlSetloc, &file.pos, NULL);
#endif
        // round up to sector, no error checking (I don't think this is used ever)
        try_CdRead((n + SECTOR_BYTES - 1) / SECTOR_BYTES, buf, 0x80);
    } else {
        int sectors = n / SECTOR_BYTES;
        int fine = n % SECTOR_BYTES;

        if (sectors) {
            // #ifdef VERSION_WORLD
            //             try_CdControl(CdlSetloc, &file.pos, NULL);
            // #endif
            //             try_CdRead(sectors, dst, 0x80);
            //             if (cd_verify_read(0, NULL) == -1) {
            //                 // second time's the charm!
            // #ifdef VERSION_WORLD
            //                 try_CdControl(CdlSetloc, &file.pos, NULL);
            // #endif
            //                 try_CdRead(sectors, dst, 0x80);
            //                 if (cd_verify_read(0, NULL) == -1)
            //                     return -1;
            //             }
            if (try_reading_twice(sectors, dst, &file.pos) == -1)
                return -1;

            dst += sectors * SECTOR_SIZE;
        }

        if (fine) {
            u32 tmpbuf[SECTOR_SIZE];
            CdlLOC last_sector;
#ifdef VERSION_WORLD
            int file_start = CdPosToInt(&file.pos);
            CdIntToPos(file_start + sectors, &last_sector);
            // try_CdControl(CdlSetloc, &last_sector, NULL);
#endif

            //             try_CdRead(1, tmpbuf, 0x80);
            //             if (cd_verify_read(0, NULL) == -1) {
            //                 // this time it's gonna work I pwomise ^_^
            // #ifdef VERSION_WORLD
            //                 try_CdControl(CdlSetloc, &last_sector, NULL);
            // #endif
            //                 try_CdRead(1, tmpbuf, 0x80);
            //                 if (cd_verify_read(0, NULL) == -1)
            //                     return -1;
            //             }

            if (try_reading_twice(1, tmpbuf, &last_sector))
                return -1;

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

// US: 8001CA84
// JP: 8001BC8C
static int load_exe(char *filename, u32 stack, EXEC *header)
{
    cd_check_disc_presence();
    if (func_8001B94C() == -1)
        return -1;

#if !defined(VERSION_WORLD) && defined(PSYQ47_FIXES)
    {
        char upper[128];
        char formatted[128];
        char *dst = formatted;

        ram_strupper(filename, upper);
        if (upper[0] != '\\') {
            *dst++ = '\\';
        }

        if (ram_strchr(upper, ';') == 0) {
            ram_strcat(upper, ";1", dst);
        } else {
            ram_strcpy(upper, dst);
        }

        EXEC *rc = CdReadExec(formatted);
        CdReadSync(0, NULL);

        *header = *rc;
        header->s_addr = stack;
        flush_cache_safe();

        return 0;
    }
#endif

    CdlFILE file;
    if (cd_fs_get_file(&file, filename) == 0) {
#ifdef VERSION_WORLD
        return -2;
#else
        return -1;
#endif
    }

    while (1) {
        try_CdControl(CdlSetloc, &file.pos, NULL);

        // Read the first sector.
        u8 firstSector[SECTOR_BYTES];
        // try_CdRead(1, firstSector, CdlModeSpeed);
        // if (cd_verify_read(0, NULL) != -1)
        //     goto read_done;

        // try_CdRead(1, firstSector, CdlModeSpeed);
        // if (cd_verify_read(0, NULL) == -1)
        //     goto read_done;

        // return -1;
        if (try_reading_twice(1, firstSector, &file.pos) == -1)
            return -1;

        __builtin_memcpy(header, &firstSector[16], sizeof(EXEC));
        header->s_addr = stack;

        // Minus one so we don't count the first sector.
        size_t nsectors = (file.size - 1) / SECTOR_BYTES;
        void *addr = (void *)header->t_addr;

        // try_CdRead(nsectors, addr, CdlModeSpeed);
        // if (cd_verify_read(0, NULL) != -1)
        //     goto read_done2;

        // try_CdRead(nsectors, addr, CdlModeSpeed);
        // if (cd_verify_read(0, NULL) == -1)
        //     goto read_done2;

        //     return -1;
        // read_done2:

        if (try_reading_twice(nsectors, addr, &file.pos) == -1)
            return -1;

        u32 *p = (u32 *)firstSector;
        if (p[0] == 0x582D5350 && p[1] != 0x45584520)
            break;
    }

    flush_cache_safe();
    return 0;
}

// US: 8001CCC0
// JP: 8001BE6C
int cd_fs_exec(char *file, u32 stack)
{
    EXEC header;

    if (load_exe(file, stack, &header) != 0)
        return -1;

#ifdef VERSION_WORLD
    flush_cache_safe();
#endif

    set_next_exec(0);
    Exec(&header, 1, 0);
    return 0;
}
