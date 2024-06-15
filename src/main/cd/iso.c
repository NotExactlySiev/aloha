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

// load_sectors
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D780);   // static read_sectors

// get the first directory in path
INCLUDE_ASM("asm/main/nonmatchings/274C", get_path_root);   // static get_dir

// iso_get_file
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D8B0);   // iso_get_file

// static
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DA00);   // static get_file

// does this also belong to iso.c? calls some of the functions there
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DB04);   // what's the deal with this functions?