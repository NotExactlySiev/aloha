#include "common.h"
#include <stdio.h>
#include <string.h>
#include "cd.h"
#include "../util.h"

// 8001D67C
static int read_unaligned_int(u8 *p) {
    int ret = 0;
    for (int i = 0; i < sizeof(int); i++)
        ret |= p[i] << (i * 8);
    return ret;
}

// root sector loc is cached here
CdlLOC rootloc;
int pvd_is_cached;

// 8001D6AC
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

// 8001D740
NOT_IMPL_FN(func_8001D740)

// 8001D780
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

// 8001D840
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

typedef struct [[gnu::packed]] {
    u16 v;
    u16 _;
} BL16;

typedef struct [[gnu::packed]] {
    u32 v;
    u32 _;
} BL32;

typedef struct [[gnu::packed]] {
    u8 len;
    u8 other_len;
    BL32 lba;
    BL32 size;
    u8 time[7];    // struct
    u8 flags;
    u8 uint;
    u8 gap;
    BL16 volume;
    u8 name_len;
    char name[];
} DirRecord;

// 8001D8B0
static u8 find_entry(char *filename, void *buf, u32 max, CdlFILE* file) {
    for (DirRecord *p = buf; (int) p < (int)(buf + max); p = (DirRecord *) ((u8 *)p + p->len)) {
        if (p->len == 0) {
            u32 temp_a0 = ((u32) (((void *)p + 0x800) - buf) >> 0xB) << 0xB;
            if (temp_a0 >= max) break;
            p = buf + temp_a0;
        }
        if (p->name_len != ram_strlen(filename)) continue;
        if (ram_memcmp(p->name_len, filename, p->name) != 1) continue;
        for (int i = 0; i < p->name_len; i++) {
            file->name[i] = p->name[i];
        }
        // This is a mistake. Writing the null terminator to the iso structure
        // instead of the output.
        p->name[p->name_len] = 0;
        file->size = read_unaligned_int((u8 *) &p->size.v);
        CdIntToPos(read_unaligned_int((u8 *) &p->lba.v), &file->pos);
        return p->flags;
    }
    file->size = -1U;
    return 0xFFU;
}

extern int D_800548EC;
// 8001DA00
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

// 8001DB04
NOT_IMPL_FN(iso_never_called)
