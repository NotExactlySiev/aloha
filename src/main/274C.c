#include "common.h"

void cd_ready_callback(s32 status, u32 *result);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80019F4C);

INCLUDE_ASM("asm/main/nonmatchings/274C", cd_ready_callback);

INCLUDE_ASM("asm/main/nonmatchings/274C", try_CdControl);

INCLUDE_ASM("asm/main/nonmatchings/274C", try_CdControlB);

INCLUDE_ASM("asm/main/nonmatchings/274C", try_CdGetSector);

INCLUDE_ASM("asm/main/nonmatchings/274C", try_CdRead);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A2C8);   

INCLUDE_ASM("asm/main/nonmatchings/274C", try_CdMix);

INCLUDE_ASM("asm/main/nonmatchings/274C", cd_get_status);

void cd_read_callback(void) {
}

int func_8001A378(void) {
    return 0;
}


// matching on 4.3 with -O1 and -fPIC
void func_8001A380(void) {
    CdReadyCallback(cd_ready_callback);
    CdReadCallback(cd_read_callback);
}


// jmptable setter 0x100-0x140
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A3B8);

// clears all cd callbacks
// matching on 4.3 with -O1
void func_8001A74C(void) {
    CdReadyCallback(0);
    CdReadCallback(0);
    CdSyncCallback(0);
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A77C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A8A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A934);

// these 2 are almost identical, only vars are different
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A978);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AA80);

// same for these 2
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AB88);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AD0C);

// and then we just have 12array stuff
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AE90);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AED8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AF28);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B020);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B0A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B8DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B94C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B9D8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BA50);

#define    BCD(x)    (((x / 10) << 4) + (x % 10))

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BB50);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BD00);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C03C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C20C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C2F4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C31C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C34C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C374);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C39C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C418);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C4F0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C564);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C5BC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C5F4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C670);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C734);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C780);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C7B4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C7E8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CA84);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CCC0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD0C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD30);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD68);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD90);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CDC8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CDF0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CE18);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CE28);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CE58);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CEA0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CEC8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CF38);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D0AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D104);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D13C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D248);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D288);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D29C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D2AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D398);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D414);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D440);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D67C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D6AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D740);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D780);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D840);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D8B0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DA00);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DB04);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DD7C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DE98);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DED0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DEF0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DF14);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DF78);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DF8C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DFAC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DFCC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DFEC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E00C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E02C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E04C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E06C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E08C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E0AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E0CC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E17C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E22C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E250);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E274);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E294);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E2B4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E2D4);

void func_8001E2F4(void) {
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E2FC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E31C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E33C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E36C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E38C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E3D4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E438);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E5BC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E608);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E654);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E744);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E790);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E7B0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E998);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001EEA4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001EFAC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F17C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F200);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F4F0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F578);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F5DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F610);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F64C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F8D4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F918);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F95C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F9A4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F9EC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FB38);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FB58);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FB78);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FBC0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FBE4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FC34);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FC5C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FCF4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FD8C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FDF4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FFC4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FFD4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020000);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020020);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800200C8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002011C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800201A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020208);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020228);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002026C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202FC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800203AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020414);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020434);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800205C4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020610);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020630);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800206E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020808);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002092C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020C8C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020D5C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020DC4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020DE8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E30);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E40);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E64);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E88);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020EB4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020EF0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020F48);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020F9C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FC0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FD0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021028);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800210D4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800210E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800211F0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800212FC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021310);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021320);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021490);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021600);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021740);

INCLUDE_ASM("asm/main/nonmatchings/274C", execute_compressed);

// 6 memory card functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800218A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800218B0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800218DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800219DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021BCC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021D08);

// jmptable setter 0x300-0x344
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021D54);

// 8 loading and playing video
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021EF4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021F7C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021FD0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022074);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022260);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002237C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800223EC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022474);

// indirect calls
INCLUDE_ASM("asm/main/nonmatchings/274C", call_StoreImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_MoveImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetDispEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawOffset);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawArea);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetGraphType);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDefDispEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDefDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawMode);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_ClearImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_LoadImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_CleaOTag);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_ClearOTagR);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_DrawOTag);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_PutDispEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_PutDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_DrawSync);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_ResetGraph);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_wait_one);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_VSync);

INCLUDE_ASM("asm/main/nonmatchings/274C", get_tim3_counter);

INCLUDE_ASM("asm/main/nonmatchings/274C", wait_one);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetGraphDebug);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDispMask);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_DrawPrim);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_LoadClut);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_LoadTPage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetVideoMode);       // call_SetVideoMode

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetVideoMode);       // call_GetVideoMode

// jmptable setter 0x180-0x19d
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022CF0); 


// standard str functions
INCLUDE_ASM("asm/main/nonmatchings/274C", strcpy);

INCLUDE_ASM("asm/main/nonmatchings/274C", strcat);

INCLUDE_ASM("asm/main/nonmatchings/274C", strnchr);

INCLUDE_ASM("asm/main/nonmatchings/274C", strupper);

INCLUDE_ASM("asm/main/nonmatchings/274C", strlen);

INCLUDE_ASM("asm/main/nonmatchings/274C", get_path_leaf);

INCLUDE_ASM("asm/main/nonmatchings/274C", strncmp);

INCLUDE_ASM("asm/main/nonmatchings/274C", memcpy);

INCLUDE_ASM("asm/main/nonmatchings/274C", memset);

INCLUDE_ASM("asm/main/nonmatchings/274C", strlen2);

INCLUDE_ASM("asm/main/nonmatchings/274C", card_write);

// 5 task queue functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80023144);   

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80023188);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800231CC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80023260);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800232C4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800232D4);
