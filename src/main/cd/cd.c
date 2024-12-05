#include "common.h"
#include <kernel.h>
#include <stdio.h>
#include <libcd.h>
#include "cd.h"
#include "../main.h"

static int cd_file_read_prv(int fast, char *filename, void *buf, int n);

int cd_fs_get_file(CdlFILE *file, char *filename) {
    char upper[128];
    char formatted[128];
    char *dst = formatted;

    // format the name
    strupper(filename, upper);
    if (upper[0] != '\\') {
        *dst++ = '\\';
    }
    
    if (strchr(upper, ';') == 0) {
        strcat(upper, ";1", dst);
    } else {
        strcpy(upper, dst);
    }
    
    // call the iso function
    for (int i = 0; i < 10; i++) {
        if (iso_get_file(file, formatted))
            return 1;
    }
    return 0;
}


NOT_IMPL(cd_fs_get_file_safe) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_get_file_safe);   // iso_get_file_loc
NOT_IMPL(cd_fs_get_file_size) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_get_file_size);   // iso_get_file_size

// helper functions for cd stuff
NOT_IMPL(cd_seek_safe) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_seek_safe);   // cd_seek_safe
NOT_IMPL(cd_seek_file) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_seek_file);   // cd_seek_file
NOT_IMPL(cd_read_full) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_read_full);   // cd_read_full


s32 func_8001C734(s32 mode, u8* result) {   // pause
    s32 ret;

    ret = cd_verify_read(mode, result);
    if (ret == 2) {
        try_CdControl(CdlPause, 0, 0);
        flush_cache_safe();
    }
    return ret;
}


// cd filesystem io
int cd_file_read(char *filename, u8 *buf, int n)
{
    return cd_file_read_prv(0, filename, buf, n);
}

// with rounding, fast. not used?
int cd_file_read_fast(char *filename, u8 *buf, int n)
{
    return cd_file_read_prv(1, filename, buf, n);
}

static int cd_file_read_prv(int fast, char *filename, void *buf, int n)
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


NOT_IMPL(cd_fs_load_exe) //INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_load_exe);

s32 execute_uncompressed(char* file, s32 param) {
    EXEC header;
    
    if (cd_fs_load_exe(file, param, &header) != 0)
        return -1;

    flush_cache_safe();
    set_next_exec(0);
    Exec(&header, 1, 0);
    return 0;
}