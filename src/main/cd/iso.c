#include "common.h"
#include <stdio.h>
#include <string.h>
#include "cd.h"

static int read_unaligned_int(u8 *p) {
    int ret = 0;
    for (int i = 0; i < sizeof(int); i++)
        ret |= p[i] << (i * 8);
    return ret;
}


// root sector loc is cached here
CdlLOC rootloc;
int pvd_is_cached;

static int get_root_loc(CdlLOC *loc)
{
    int rc;
    u8 buf[0x800];
    if (pvd_is_cached == 0) {
        rc = sector_cache_get(&pvd_loc, buf);
        if (rc != 1)    // impossible
            return 0;
        pvd_is_cached = rc;
        CdIntToPos(read_unaligned_int(buf + 0x9E), &rootloc);
    }

    *loc = rootloc;
    return 1;
}


// never called
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D740);
NOT_IMPL(func_8001D740)


static int read_sectors(CdlLOC *loc, u8 *buf, u32 nsectors) {
    CdlLOC sp10;
    s32 off;
    u32 max;
    u8* dst;

    off = CdPosToInt(loc);
    if (sector_cache_get(loc, buf) == 0)
        return 0;
    
    max = read_unaligned_int(&buf[10]) / SECTOR_BYTES;
    dst = buf + 0x800;
    if (max < nsectors) {
        nsectors = max;
    }

    while (--nsectors > 0) {
        CdIntToPos(++off, &sp10);
        if (sector_cache_get(&sp10, dst) == 0) return 0;
        dst += 0x800;
    }
    return dst - buf;
}


static int get_dir(char *path, char *dir) {
    int ret;
    char c;

    ret = 1;
    if (*path++ != '\\')
        return 0;
    
    while ((c = *path++)) {
        if (c == '\\') {
            *dir++ = 0;
            ret += 1;
        } else {
            *dir++ = c;
        }
    }
    *dir = 0;
    return ret;
}


static u8 find_entry(char *filename, u8 *buf, u32 max, CdlFILE* file) {
    char *expected_name;
    u8 expected_len;
    char *real_name;
    char *np;
    u8 *p;

    // TODO: make dir entries in iso a struct instead of having magic offsets here for p
    for (p = buf; (int) p < (int)(buf + max); p += *p) {
        if (*p == 0) {
            u32 temp_a0 = ((u32) ((p + 0x800) - buf) >> 0xB) << 0xB;
            if (temp_a0 >= max) break;
            p = buf + temp_a0;
        }
        expected_len = p[0x20];
        if (expected_len != strlen(filename)) continue;
        real_name = (char*) p + 0x21;
        expected_name = file->name;
        if (memcmp(p[0x20], (s32) filename, real_name) != 1) continue;
        np = real_name;
        for (int i = 0; i < (s32) p[0x20]; i++) {
            *expected_name++ = *np++;
            //expected_name[i] = np[i];
        }
        *np = 0;
        
        file->size = read_unaligned_int(&p[10]);
        CdIntToPos(read_unaligned_int(&p[2]), &file->pos);
        return p[0x19];
    }
    file->size = -1U;
    return 0xFFU;
}


extern int D_800548EC;
int iso_get_file(CdlFILE *file, char *filename)
{
    u8 buf[4 * SECTOR_BYTES];
    char path[128];
    char *p = path;

    D_800548EC = 0;
    int levels = get_dir(filename, path);
    if (levels == 0) return 0;
    
    CdlLOC dirloc;
    if (0 == get_root_loc(&dirloc)) return 0;

    while (levels > 0) {
        int curr = read_sectors(&dirloc, buf, 4);
        if (curr == 0) return 0;
        int flags = find_entry(p, buf, curr, file);
        if (file->size == -1U) return 0;
        dirloc = file->pos;
        if ((levels != 1) && ((flags & 2) == 0)) return 0;
        while (*p++);
        levels -= 1;
    }

    return 1;
}


// TODO: I don't think this is ever called. keeping around for now
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DB04);
NOT_IMPL(func_8001DB04)