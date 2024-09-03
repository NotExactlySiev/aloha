#include "common.h"
#include "cd.h"

s32 func_8001D67C(u8* arg0) {
    s32 ret;
    s32 shift;
    ret = 0;
    for (shift = 0; shift < 32; shift += 8) {
        ret |= *arg0++ << shift;
    }
    return ret;
}

// root sector loc is cached here
CdlLOC D_80047E84;
int D_80047EE4;

int func_8001D6AC(CdlLOC *loc)
{
    int rc;
    u8 buf[0x800];
    if (D_80047EE4 == 0) {
        rc = func_8001D440(&pvd_loc, buf);   // bread
        if (rc != 1)
            return 0;
        D_80047EE4 = rc;
        CdIntToPos(func_8001D67C(buf + 0x9E), &D_80047E84);
    }

    *loc = D_80047E84;
    return 1;
}

// never called
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D740);

// static read_sectors
int func_8001D780(CdlLOC *loc, u8 *buf, u32 nsectors) {
    CdlLOC sp10;
    s32 off;
    s32 var_s2_2;
    s32 var_s3;
    u32 max;
    u32 var_s2;
    u8* dst;

    off = CdPosToInt(loc);
    if (func_8001D440(loc, buf) == 0)
        return 0;
    
    max = func_8001D67C(&buf[10]) / SECTOR_SIZE;
    dst = buf + 0x800;
    if (max < nsectors) {
        nsectors = max;
    }

    while (--nsectors > 0) {
        CdIntToPos(++off, &sp10);
        if (func_8001D440(&sp10, dst) == 0) return 0;
        dst += 0x800;
    }
    return dst - buf;
}

// get the top directory in path
// static get_dir
int get_path_root(char *path, char *dir) {
    int ret;
    char c;

    ret = 1;
    if (*path++ != '\\')
        return 0;
    
    while (c = *path++) {
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


// static find_entry
u8 func_8001D8B0(char *filename, u8* buf, u32 max, CdlFILE* file) {
    s32 i;
    s8* expected_name;
    u32 temp_a0;
    u8 expected_len;
    u8 temp_v0;
    u8* real_name;
    u8* np;
    u8* p;

    // TODO: make dir entries in iso a struct instead of having magic offsets here for p
    for (p = buf; (int) p < (int)(buf + max); p += *p) {
        if (*p == 0) {
            temp_a0 = ((u32) ((p + 0x800) - buf) >> 0xB) << 0xB;
            if (temp_a0 >= max) break;
            p = buf + temp_a0;
        }
        expected_len = p[0x20];
        if (expected_len != strlen(filename)) continue;
        real_name = p + 0x21;
        expected_name = file->name;
        if (strncmp(p[0x20], (s32) filename, real_name) != 1) continue;
        np = real_name;
        for (i = 0; i < (s32) p[0x20]; i++) {
            *expected_name++ = *np++;
            //expected_name[i] = np[i];
        }
        *np = 0;
        
        file->size = func_8001D67C(&p[10]);
        CdIntToPos(func_8001D67C(&p[2]), &file->pos);
        return p[0x19];
    }
    file->size = -1U;
    return 0xFFU;
}


extern int D_800548EC;
// iso_get_file
int func_8001DA00(CdlFILE *file, char *filename)
{
    char buf[4 * SECTOR_SIZE];
    char path[128];
    char *p = path;

    D_800548EC = 0;
    int levels = get_path_root(filename, path);
    if (levels == 0) return 0;
    
    CdlLOC dirloc;
    if (0 == func_8001D6AC(&dirloc)) return 0;

    while (levels > 0) {
        int curr = func_8001D780(&dirloc, buf, 4);
        if (curr == 0) return 0;
        int flags = func_8001D8B0(p, buf, curr, file);
        if (file->size == -1U) return 0;
        dirloc = file->pos;
        if ((levels != 1) && ((flags & 2) == 0)) return 0;
        while (*p++);
        levels -= 1;
    }

    return 1;
}

// does this also belong to iso.c? calls some of the functions there
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DB04);   // what's the deal with this functions?