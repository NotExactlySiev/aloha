#include "common.h"
#include "shared.h"
#include <libetc.h>
#include "sky.h"
#include "movie.h"

extern GlobalData *glob;

const char *D_800EB8F0[6][3] = {
    { "VAB\\W1_1.VAB", "VAB\\W1_2.VAB", "VAB\\W1_3.VAB" },
    { "VAB\\W2_1.VAB", "VAB\\W2_2.VAB", "VAB\\W2_3.VAB" },
    { "VAB\\W3_1.VAB", "VAB\\W3_2.VAB", "VAB\\W3_3.VAB" },
    { "VAB\\W4_1.VAB", "VAB\\W4_2.VAB", "VAB\\W4_3.VAB" },
    { "VAB\\W5_1.VAB", "VAB\\W5_2.VAB", "VAB\\W5_3.VAB" },
    { "VAB\\W6_1.VAB", "VAB\\W6_2.VAB", "VAB\\W6_3.VAB" },
};

// load level vab
void func_800E0920(void)
{
    u32 *buffer = (u32 *) 0x80060000;
    jt.iso_read(D_800EB8F0[glob->world][glob->stage], buffer, 0);
    while (buffer[0] != 0x56414270) {
        jt.iso_read(D_800EB8F0[glob->world][glob->stage], buffer, 0);
        printf("VAB file Reload\n");
    }
    jt.sfx_load_vab(1, buffer, 0);
}

#include <libgpu.h>

typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u_long ot[1];
    u8 unk[32];
} FGBuffer;

typedef struct {
    char unk[12];
    u16 arr[30][64];
    char unk2[72960];
    u_long prims[64*1024];
    u_long ot[5];
    void *next;
} BGBuffer;

extern int D_800F4CC8;  // fg buffer index
extern FGBuffer D_800F4F28[2];
extern FGBuffer *D_800F4E10;    // current

// swap both buffers
void func_800E09EC(void)
{
    func_800E5818();
    D_800F4CC8 = !D_800F4CC8;
    D_800F4E10 = &D_800F4F28[D_800F4CC8];
    jt.ClearOTag(D_800F4E10->ot, 1);
}

extern int D_800F4CF8;

// render fg
void func_800E0A60(void)
{
    jt.DrawSync(0);
    jt.VSync(0);
    if (D_800F4CF8++ == 2) {
        jt.SetDispMask(1);
        D_800F4CF8 = 2;
    }
    jt.PutDispEnv(&D_800F4E10->disp);
    jt.PutDrawEnv(&D_800F4E10->draw);
    func_800E6668();
    jt.DrawOTag(D_800F4E10->ot);
}

// sfx.c

short D_800F4CFC = 0; // sfx handle
int D_800F4D00 = -1; // sfx counter
short D_800F4D04 = -1; // sfx return code

// sfx_play
short func_800E0B54(u32 id)
{
    if (id == 0x2900) {
        if (D_800F4D00 > -1) {
            jt.sfx_release(D_800F4CFC);
        }
        D_800F4CFC = jt.sfx_play(id, 62, 100);
        D_800F4D00 = 0;
        D_800F4D04 = D_800F4CFC;
    } else {
        D_800F4D04 = jt.sfx_play(id, 62, 100);
    }
    return D_800F4D04;
}

void func_800E0C24(void)
{
    if (D_800F4D00 > -1) {
        jt.sfx_release(D_800F4CFC);
        D_800F4D00 = -1;
    }
}

// sfx_tick
void func_800E0C74(void)
{
    if (D_800F4D00 > -1) {
        if (++D_800F4D00 >= 32) {
            jt.sfx_release(D_800F4CFC);
            D_800F4D00 = -1;
        }
    }
}

// menu.c

// toggle_widescreen
void func_800E0CD8(void)
{
    if (jt.get_widescreen()) {
        jt.set_widescreen(0);
        glob->curr.unkEA = 0;
    } else {
        jt.set_widescreen(1);
        glob->curr.unkEA = 1;
    }
    func_800E0B54(0x2600);
}

char *D_800EB054[] = {
    "STOP",
    "FADE OUT",
    "TITLE",
    "SELECT",
    "POWER UP_1",
    "POWER UP_2",
    "POWER UP_3",
    "POWER UP_4",
    "POWER UP_5",
    "POWER UP_6",
    "LOST_1",
    "LOST_2",
    "LOST_3",
    "LOST_4",
    "LOST_5",
    "LOST_6",
    "GAME OVER_1",
    "GAME OVER_2",
    "GAME OVER_3",
    "GAME OVER_4",
    "GAME OVER_5",
    "GAME OVER_6",
    "CONTINUE_1",
    "CONTINUE_2",
    "CONTINUE_3",
    "CONTINUE_4",
    "CONTINUE_5",
    "CONTINUE_6",
    "STAGE CLR_1",
    "STAGE CLR_2",
    "STAGE CLR_3",
    "STAGE CLR_4",
    "STAGE CLR_5",
    "STAGE CLR_6",
    "ALLGET_1",
    "ALLGET_2",
    "ALLGET_3",
    "ALLGET_4",
    "ALLGET_5",
    "ALLGET_6",
    "BONUS_1",
    "BONUS_2",
    "BONUS_3",
    "BONUS_4",
    "BONUS_5",
    "BONUS_6",
    "STAGE 1-1",
    "STAGE 1-2",
    "STAGE 1-3",
    "STAGE 2-1",
    "STAGE 2-2",
    "STAGE 2-3",
    "STAGE 3-1",
    "STAGE 3-2",
    "STAGE 3-3",
    "STAGE 4-1",
    "STAGE 4-2",
    "STAGE 4-3",
    "STAGE 5-1",
    "STAGE 5-2",
    "STAGE 5-3",
    "STAGE 6-1",
    "STAGE 6-2",
    "STAGE 6-3",
    "ENDING",
    "DEAD",
    "DEAD-B",
    "GAMEOVER N.V.",
    "TITLE N.V.",
};

const char *D_800EB168[] = {
    "MOVIE\\OPEN.STR",

    "MOVIE\\W1ST.STR",
    "MOVIE\\W1ED.STR",
    "MOVIE\\W2ST.STR",
    "MOVIE\\W2ED.STR",
    "MOVIE\\W3ST.STR",
    "MOVIE\\W3ED.STR",
    "MOVIE\\W4ST.STR",
    "MOVIE\\W4ED.STR",
    "MOVIE\\W5ST.STR",
    "MOVIE\\W5ED.STR",
    "MOVIE\\W6ST1.STR",
    "MOVIE\\NL_END1.STR",
    "MOVIE\\NL_END2.STR",

    "MOVIE\\W1ST.STR",
    "MOVIE\\W1ED.STR",
    "MOVIE\\W2ST.STR",
    "MOVIE\\W2ED.STR",
    "MOVIE\\W3ST.STR",
    "MOVIE\\W3ED.STR",
    "MOVIE\\W4ST.STR",
    "MOVIE\\W4ED.STR",
    "MOVIE\\W5ST.STR",
    "MOVIE\\W5ED.STR",
    "MOVIE\\W6ST2.STR",
    "MOVIE\\EX_END1.STR",
    "MOVIE\\EX_END2.STR",
    "MOVIE\\EX_END3.STR",
};

#define NMOVIES (sizeof(D_800EB168)/sizeof(*D_800EB168))

const char *D_800EB1D8[] = {
    "OPENING",
    "W 1 ROBIT",
    "W 2 MU-MU-",
    "W 2 ROBIT",
    "W 3 MU-MU-",
    "W 3 ROBIT",
    "W 4 MU-MU-",
    "W 4 ROBIT",
    "W 5 MU-MU-",
    "W 5 ROBIT",
    "W 6 MU-MU-",
    "W 6 ALOHA",
    "END NORMAL1",
    "END NORMAL2",

    "E 1 ROBIT",
    "E 2 MU-MU-",
    "E 2 ROBIT",
    "E 3 MU-MU-",
    "E 3 ROBIT",
    "E 4 MU-MU-",
    "E 4 ROBIT",
    "E 5 MU-MU-",
    "E 5 ROBIT",
    "E 6 MU-MU-",
    "E 6 ALOHA",

    "END ALOHA1",
    "STAFF ROLL",
    "END ALOHA2",
};

extern int D_800F4E68; // movie_test_selected

// movie test prev/next/play
void func_800E0D78(void)
{
    if (--D_800F4E68 < 0)
        D_800F4E68 = NMOVIES - 1;
    func_800E0B54(0x2C00);
}

void func_800E0DB8(void)
{
    if (++D_800F4E68 > NMOVIES - 1)
        D_800F4E68 = 0;
    func_800E0B54(0x2C00);
}

//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0E04);
void func_800E0E04(void)
{
    printf("Now playing %s\n", D_800EB168[D_800F4E68]);
    // TODO
    //
}

// level math
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0FD0);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1044);

// extra mode prev/next
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E10B8);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E11D0);

// more menu stuff
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E12B4);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1384);

extern int D_801A0FA8;
extern int D_801A0FB0;

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1418);
// void func_800E1418(void)
// {
//     RECT r;
//     if (D_801A0FA8 == 1 && D_801A0FB0 != 1) {
//         func_800E6B90();
//         func_800E6940();
//     }
// }


INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E14A4);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E14CC);

// menu.c

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1C24);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1D48);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1DB8);

void toggle_view_ctrl(void)
{
    glob->curr.unkE3 = !glob->curr.unkE3;
    func_800E0B54(0x2600);
}

void toggle_pad_mode(void)
{
    glob->curr.unkE5 = !glob->curr.unkE5;
    func_800E0B54(0x2600);
}

void toggle_sp_item(void)
{
    glob->curr.unkE6 = !glob->curr.unkE6;
    func_800E0B54(0x2600);
}

void toggle_sound_type(void)
{
    glob->curr.unkE7 = !glob->curr.unkE7;
    jt.snd_set_stereo(glob->curr.unkE7);
    func_800E0B54(0x2600);
}

void toggle_movie(void)
{
    glob->curr.unkE8 = !glob->curr.unkE8;
    func_800E0B54(0x2600);
}

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1F60);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1FB8);

extern int D_800F4D14;
extern int D_800F4D18;
extern int D_800F4E70;
extern int D_800F4EC0;

// draw logo
void func_800E2234(int page_index)
{
    int brightness = (page_index >= 4 && page_index <= 6) ? 100 : 128;
    if (D_800F4E70 == 1) {
        // While animated
        func_800E5F58(D_800F4D14 - 6, D_800F4D18 - 10, D_800F4EC0);
    } else {
        // Static
        func_800E6300(D_800F4D14 - 6, D_800F4D18 - 10, D_800F4EC0, brightness);
    }

    // Copyright text
    func_800E5C00(-6, 200);
}

u8 text_set_attr(u8 attr);
void text_set_pos(int x, int y);
void text_clear(void);
void text_put_char(u16 c);
void text_put_str(char *str);

typedef struct {
    u8 flags; // and sfx. bitfield?
    u8 dest;
    u8 unk0;
    u8 unk1; // 1 = launch normal play, 2 = launch time trial
    // I think this is padding lol?
/*
    u8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
*/
    // probably another function, for pressing
    void (*click)(void);
    void (*press_left)(void);
    void (*press_right)(void);
} MenuItem;

typedef union {
    char *str;
    short sprite_id;
} MenuItemDisplay;

typedef struct {
    int items_type; // just type, dictates more than items
    RECT offset;    // where entries start
    u8 field2_0xc;
    u8 field3_0xd;
    u8 field4_0xe;
    u8 field5_0xf;
    u8 field6_0x10;
    u8 field7_0x11;
    u8 field8_0x12;
    u8 field9_0x13;
    RECT rect;
    int field11_0x1c; // starting select position
    int nselections;
    short panel_x;
    short panel_y;
    int panel_sprite_id;
    int panel_clut_thing;
    union {
        char **items_strings;
        short *items_sprites;
    };
    MenuItem items[];
} MenuPage;

enum {
    PAGE_MAIN = 0,
    PAGE_LOAD = 1,
    PAGE_SAVE = 2,
    PAGE_SETTINGS = 3,
    PAGE_CONFIRM_LOAD = 4,
    PAGE_CONFIRM_SAVE = 5,
    PAGE_YES_NO = 6,
    PAGE_SETTINGS_TEST = 7,
    PAGE_SETTINGS_WIDE = 8,
    PAGES_COUNT
};

void func_800E1928(void);
void func_800E1A88(void);
void func_800E11D0(void);
void func_800E10B8(void);
void func_800E15FC(void);
void func_800E1BCC(void);
void func_800E1C24(void);
void func_800E1D48(void);
void func_800E1DB8(void);

// TODO: move this back in when everything is decomped. the address is needed
MenuPage D_800EB468 = {
    .items_type = 3,
    .offset = { 9, 10, 21, 5 },
    .field8_0x12 = 8,
    .rect = { 0x30, 0x6E, 0xC8, 0x3C },
    .field11_0x1c = 0,
    .nselections = 5,
    .panel_x = 0,
    .panel_y = 0,
    .panel_sprite_id = -1,
    .panel_clut_thing = -1,
    .items_sprites = (short[]){
        8, 9, 10, 11, 12,
    },
    .items = {
        { 0x80, 0, 0xFE, 0x01, NULL, func_800E11D0, func_800E10B8 },
        { 0x80, 0, 0xFE, 0x02, NULL, NULL, NULL },
        { 0x43, PAGE_LOAD, 0xFE, 0x00, func_800E15FC, func_800E11D0, func_800E10B8 },
        { 0x43, PAGE_SAVE, 0xFE, 0x00, func_800E15FC, NULL, NULL },
        { 0x03, PAGE_SETTINGS_TEST, 0xFE, 0x00, NULL, NULL, NULL },
    },
};


MenuPage *D_800EB8CC[PAGES_COUNT] = {
    [PAGE_MAIN] = &D_800EB468,

    [PAGE_LOAD] = &(MenuPage){
        .items_type = 0,
        .offset = { 9, 11, 16, 5 },
        .field8_0x12 = 8,
        .rect = { 0x40, 0x60, 0xA0, 0x54 },
        .field11_0x1c = 0,
        .nselections = 5,
        .panel_x = 0x5D,
        .panel_y = 0x6C,
        .panel_sprite_id = 10,
        .panel_clut_thing = 2,
        .items_strings = (char*[]){
            "   DATA 1",
            "   DATA 2",
            "   DATA 3",
            "   NEW DATA",
            "   EXIT",
        },
        .items = {
            { 0x00, 4, 0, 0, NULL, NULL, NULL },
            { 0x00, 4, 0, 0, NULL, NULL, NULL },
            { 0x00, 4, 0, 0, NULL, NULL, NULL },
            { 0x01, 4, 0, 0, NULL, NULL, NULL },
            { 0x02, 0, 0, 0, NULL, NULL, NULL },
        },
    },

    [PAGE_SAVE] = &(MenuPage){
        .items_type = 0,
        .offset = { 9, 12, 16, 4 },
        .field8_0x12 = 8,
        .rect = { 0x40, 0x6C, 0xA0, 0x48 },
        .field11_0x1c = 0,
        .nselections = 4,
        .panel_x = 0x5C,
        .panel_y = 0x78,
        .panel_sprite_id = 11,
        .panel_clut_thing = 2,
        .items_strings = (char*[]){
            "   DATA 1",
            "   DATA 2",
            "   DATA 3",
            "   EXIT",
        },
        .items = {
            { 0x00, 5, 0, 0, NULL, NULL, NULL },
            { 0x00, 5, 0, 0, NULL, NULL, NULL },
            { 0x00, 5, 0, 0, NULL, NULL, NULL },
            { 0x02, 0, 0, 0, NULL, NULL, NULL },
        },
    },

    [PAGE_SETTINGS] = &(MenuPage){
        .items_type = 0,
        .offset = { 5, 10, 29, 6 },
        .field8_0x12 = 8,
        .rect = { 32, 0x60, 0xE8, 0x54 },
        .field11_0x1c = 0,
        .nselections = 6,
        .panel_x = 0x5B,
        .panel_y = 0x6C,
        .panel_sprite_id = 12,
        .panel_clut_thing = 2,
        .items_strings = (char*[]){
            "   VIEW CTRL",
            "   PAD MODE",
            "   SP.ITEM",
            "   SOUND TYPE",
            "   MOVIE",
            "   EXIT",
        },
        .items = {
            { 0x60, 0, 0, 0, toggle_view_ctrl, toggle_view_ctrl, toggle_view_ctrl },
            { 0x60, 0, 0, 0, toggle_pad_mode, toggle_pad_mode, toggle_pad_mode },
            { 0x60, 0, 0, 0, toggle_sp_item, toggle_sp_item, toggle_sp_item },
            { 0x60, 0, 0, 0, toggle_sound_type, toggle_sound_type, toggle_sound_type },
            { 0x60, 0, 0, 0, toggle_movie, toggle_movie, toggle_movie },
            { 0x02 },
        },
    },

    [PAGE_CONFIRM_LOAD] = &(MenuPage){
        .items_type = 1,
        .offset = { 13, 5, 8, 2 },
        .field8_0x12 = 8,
        .rect = { 0x28, 12, 0xD0, 0x3C },
        .field11_0x1c = 0,
        .nselections = 2,
        .panel_x = 0x5C,
        .panel_y = 0x18,
        .panel_sprite_id = 10,
        .panel_clut_thing = 2,
        .items_sprites = (short[]){
            16, 17
        },
        .items = {
            { 0x41, 0xFF, 0xFF, 0, func_800E1928, NULL, NULL },
            { 0x02, 0xFF, 0xFF, 0, NULL, NULL, NULL },
        },
    },

    [PAGE_CONFIRM_SAVE] = &(MenuPage){
        .items_type = 1,
        .offset = { 13, 5, 8, 2 },
        .field8_0x12 = 8,
        .rect = { 0x28, 12, 0xD0, 0x3C },
        .field11_0x1c = 0,
        .nselections = 2,
        .panel_x = 0x5C,
        .panel_y = 0x18,
        .panel_sprite_id = 11,
        .panel_clut_thing = 2,
        .items_sprites = (short[]){
            16, 17  // also reused with the other dialog
        },
        .items = {
            { 0x41, 0xFF, 0xFF, 0, func_800E1A88, NULL, NULL },
            { 0x02, 0xFF, 0xFF, 0, NULL, NULL, NULL },
        },
    },

    [PAGE_YES_NO] = &(MenuPage){
        .items_type = 1,
        .offset = { 13, 6, 31, 2 },
        .field8_0x12 = 8,
        .rect = { 16, 12, 256, 0x54 },
        .field11_0x1c = 0,
        .nselections = 2,
        .panel_x = 0x5C,
        .panel_y = 0x18,
        .panel_sprite_id = -1,
        .panel_clut_thing = -1,
        .items_sprites = (short[]){
            16, 17  // also reused with the other dialog
        },
        .items = {
            { 0x41, 0xFF, 0xFF, 0, func_800E1BCC, NULL, NULL },
            { 0x02, 0xFF, 0xFF, 0, NULL, NULL, NULL },
        },
    },

    [PAGE_SETTINGS_TEST] = &(MenuPage){
        .items_type = 0,
        .offset = { 5, 8, 29, 8 },
        .field8_0x12 = 8,
        .rect = { 32, 0x48, 0xE8, 0x6C },
        .field11_0x1c = 1,
        .nselections = 8,
        .panel_x = 0x5B,
        .panel_y = 0x54,
        .panel_sprite_id = 12,
        .panel_clut_thing = 2,
        .items_strings = (char*[]){
            "   MOVIE TEST",
            "   MUSIC TEST",
            "   VIEW CTRL",
            "   PAD MODE",
            "   SP.ITEM",
            "   SOUND TYPE",
            "   MOVIE",
            "   EXIT",
        },
        .items = {
            { 0x60, 0, 0, 0, func_800E0E04, func_800E0D78, func_800E0DB8 },
            { 0x60, 0, 0, 0, func_800E1C24, func_800E1D48, func_800E1DB8 },
            { 0x60, 0, 0, 0, toggle_view_ctrl, toggle_view_ctrl, toggle_view_ctrl },
            { 0x60, 0, 0, 0, toggle_pad_mode, toggle_pad_mode, toggle_pad_mode },
            { 0x60, 0, 0, 0, toggle_sp_item, toggle_sp_item, toggle_sp_item },
            { 0x60, 0, 0, 0, toggle_sound_type, toggle_sound_type, toggle_sound_type },
            { 0x60, 0, 0, 0, toggle_movie, toggle_movie, toggle_movie },
            { 0x02 },
        },
    },

    [PAGE_SETTINGS_WIDE] = &(MenuPage){
        .items_type = 0,
        .offset = { 5, 9, 29, 7 },
        .field8_0x12 = 8,
        .rect = { 32, 0x54, 0xE8, 0x60 },
        .field11_0x1c = 1,
        .nselections = 7,
        .panel_x = 0x5B,
        .panel_y = 0x60,
        .panel_sprite_id = 12,
        .panel_clut_thing = 2,
        .items_strings = (char*[]){
            "   TV   MODE",
            "   VIEW CTRL",
            "   PAD  MODE",
            "   SP.  ITEM",
            "   SOUNDTYPE",
            "   MOVIE",
            "   EXIT",
        },
        .items = {
            { 0x60, 0, 0, 0, func_800E0CD8, func_800E0CD8, func_800E0CD8 },
            { 0x60, 0, 0, 0, toggle_view_ctrl, toggle_view_ctrl, toggle_view_ctrl },
            { 0x60, 0, 0, 0, toggle_pad_mode, toggle_pad_mode, toggle_pad_mode },
            { 0x60, 0, 0, 0, toggle_sp_item, toggle_sp_item, toggle_sp_item },
            { 0x60, 0, 0, 0, toggle_sound_type, toggle_sound_type, toggle_sound_type },
            { 0x60, 0, 0, 0, toggle_movie, toggle_movie, toggle_movie },
            { 0x02 },
        },
    },
};

// Progress enum's strings in two encodings

// ASCII, for displaying in the menu
const char *D_800EB430[] = {
    "NEW GAME",
    "WORLD 1 ",
    "WORLD 2 ",
    "WORLD 3 ",
    "WORLD 4 ",
    "WORLD 5 ",
    "WORLD 6 ",
    "EXTRA 1 ",
    "EXTRA 2 ",
    "EXTRA 3 ",
    "EXTRA 4 ",
    "EXTRA 5 ",
    "EXTRA 6 ",
    "COMPLETE",
};

// TODO: These should be encoded as SHIFT-JIS. I'm not sure how to do that or
// if this is correct.
// Shift-JIS, for use in the save file display text
const char *D_800EB948[14] = {
    "\x82\x6D\x82\x85\x82\x97\x81\x40\x82\x66\x82\x81\x82\x8d\x82\x85", // "Ｎｅｗ　Ｇａｍｅ",
    "\x82\x76\x82\x8f\x82\x92\x82\x8c\x82\x84\x81\x40\x82\x50", // "Ｗｏｒｌｄ　１",
    "Ｗｏｒｌｄ　２",
    "Ｗｏｒｌｄ　３",
    "Ｗｏｒｌｄ　４",
    "Ｗｏｒｌｄ　５",
    "Ｗｏｒｌｄ　６",
    "Ｅｘｔｒａ　１",
    "Ｅｘｔｒａ　２",
    "Ｅｘｔｒａ　３",
    "Ｅｘｔｒａ　４",
    "Ｅｘｔｒａ　５",
    "Ｅｘｔｒａ　６",
    "Ｃｏｍｐｌｅｔｅ",
};

extern int D_800F4E30;
extern int D_800F4CC0;  // slot selected to overwrite
extern int D_800F4E68;
extern int D_800F4E38;

//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E22D8);
// draw menu box
void func_800E22D8(int idx)
{
    RECT *r = &D_800EB8CC[idx]->rect;
    if (D_800F4E38 == 0)
        return;

    short y = r->y;
    short h = r->h;
    // opening animation
    if (D_800F4E38 < 8) {
        y = (h/2 + y) - (h/2 * D_800F4E38) / 8;
        h = (h * D_800F4E38) / 8;
    }

    if (r->w != 0) {
        RECT rect = {
            .x = r->x + 2,
            .y = y + 4,
            .w = r->w + 12,
            .h = h + 16,
        };
        func_800E6940(&rect, 4*D_800F4E38);
    }
}

// unused
NOT_IMPL_FN(func_800E23C0)

// printf world status icon
void func_800E23C8(int c)
{
    switch (c) {
    case 1: text_put_char(0xB6); break;
    case 2: text_put_char(0xB5); break;
    case 3: text_put_char(0xB6); break;
    }
}

static inline void text_put_progress(SavedData *save)
{
    printf("level is %d\n", save->unkE2);
    text_put_str(D_800EB430[func_800E0FD0(save->unkE2)]);
    func_800E23C8(save->unkE9);
}

// draw_menu
void func_800E2438(int page_id, uint selected, u8 attr)
{
    MenuPage *page = D_800EB8CC[page_id];
    text_set_attr(attr);
    if (D_800F4E38 < 8)
        return;

    if (page->panel_sprite_id != -1)
        func_800E5BBC(page->panel_sprite_id, page->panel_x, page->panel_y, page->panel_clut_thing);

    if (page->items_type == 0) {
        // strings
        for (int i = 0; i < page->nselections; i++) {
            text_set_attr(selected == i);
            text_set_pos(page->offset.x, page->offset.y + i);
            text_put_str(page->items_strings[i]);
        }
    } else {
        // sprites
        for (int i = 0; i < page->nselections; i++) {
            int off = (i & 1) ? D_800F4E30 : -D_800F4E30;
            int x = page->offset.x * 8 + 20 + off;
            int y = 12*(page->offset.y + i) + 6;
            func_800E5BBC(page->items_sprites[i], x, y, selected == i);
        }
    }
    text_set_attr(0);

    switch (page_id) {
    case PAGE_MAIN:
        func_800E1418();
        func_800E12B4(selected == 0);
        break;

    case PAGE_LOAD:
        func_800E1384();
        text_set_pos(page->offset.x, page->offset.y - 1);
        text_set_attr(2);
        text_put_str("   NOW    ");
        text_put_progress(&glob->curr);

        for (int i = 0; i < 3; i++) {
            text_set_attr(selected == i);
            text_set_pos(page->offset.x + 10, page->offset.y + i);
            // TODO: fix this control flow
            if (glob->unk512 == 0) {
                if (glob->slot_state[i] == 0) {
                    text_put_str("NO FILE");
                    continue;
                } else if (glob->slot_state[i] != -1) {
                    text_put_progress(&glob->saved[i]);
                    continue;
                }
            }
            text_put_str("-------");
        }
        break;

    // full repeat of the one above
    case PAGE_SAVE:
        func_800E1384();
        text_set_pos(page->offset.x, page->offset.y - 1);
        text_set_attr(2);
        text_put_str("   NOW    ");
        text_put_progress(&glob->curr);

        for (int i = 0; i < 3; i++) {
            text_set_attr(selected == i);
            text_set_pos(page->offset.x + 10, page->offset.y + i);
            // TODO: fix this control flow
            if (glob->unk512 == 0) {
                if (glob->slot_state[i] == 0) {
                    text_put_str("NO FILE");
                    continue;
                } else if (glob->slot_state[i] != -1) {
                    text_put_progress(&glob->saved[i]);
                    continue;
                }
            }
            text_put_str("-------");
        }
        break;

    case PAGE_SETTINGS:
        text_set_attr(selected == 0);
        text_set_pos(page->offset.x + 15, page->offset.y);
        if (glob->curr.unkE3 == 0)
            text_put_str("REVERSE");
        else
            text_put_str("NORMAL");

        text_set_attr(selected == 1);
        text_set_pos(page->offset.x + 15, page->offset.y + 1);
        if (glob->curr.unkE5 == 0)
            text_put_str("\xB1 JUMP \xB3 SHOT");
        else
            text_put_str("\xB1 SHOT \xB3 JUMP");

        text_set_attr(selected == 2);
        text_set_pos(page->offset.x + 15, page->offset.y + 2);
        if (glob->curr.unkE6 == 0)
            text_put_char(0xB2);
        else
            text_put_char(0xB4);
        text_put_str(" SP. ITEM");

        text_set_attr(selected == 3);
        text_set_pos(page->offset.x + 15, page->offset.y + 3);
        if (glob->curr.unkE7 == 0)
            text_put_str("STEREO");
        else
            text_put_str("MONO");

        text_set_attr(selected == 4);
        text_set_pos(page->offset.x + 15, page->offset.y + 4);
        if (glob->curr.unkE8 == 0)
            text_put_str("ON");
        else
            text_put_str("OFF");
        break;

    case PAGE_CONFIRM_LOAD:
        text_set_pos(page->offset.x - 1, page->offset.y - 2);
        text_set_attr(2);
        text_put_progress(&glob->curr);
        text_put_str(" >");
        text_set_pos(page->offset.x + 6, page->offset.y - 1);
        text_put_progress(&glob->saved[D_800F4CC0]);
        break;

    // so much repeat AAAAH
    case PAGE_CONFIRM_SAVE:
        text_set_pos(page->offset.x - 1, page->offset.y - 2);
        text_set_attr(2);
        text_put_progress(&glob->curr);
        text_put_str(" >");
        text_set_pos(page->offset.x + 6, page->offset.y - 1);
        text_put_str("DATA ");
        text_put_char('1' + D_800F4CC0);
        break;

    case PAGE_YES_NO:
        func_800E6B90(&(RECT){
            .x = 0,
            .y = 0,
            .w = 240,
            .h = 16,
        }, page->rect.x + 16, page->rect.y + 12);
        func_800E6B90(&(RECT){
            .y = 16,
            .w = 240,
            .h = 16
        }, page->rect.x + 16, page->rect.y + 12);
        break;

    case PAGE_SETTINGS_TEST:
        text_set_attr(selected == 0);
        text_set_pos(page->offset.x + 15, page->offset.y);
        text_put_str(D_800EB1D8[D_800F4E68]);

        text_set_attr(selected == 1);
        text_set_pos(page->offset.x + 15, page->offset.y + 1);
        text_put_str(D_800EB054[glob->unk513]);

        text_set_attr(selected == 2);
        text_set_pos(page->offset.x + 15, page->offset.y + 2);
        if (glob->curr.unkE3 == 0)
            text_put_str("REVERSE");
        else
            text_put_str("NORMAL");

        text_set_attr(selected == 3);
        text_set_pos(page->offset.x + 15, page->offset.y + 3);
        if (glob->curr.unkE5 == 0)
            text_put_str("\xB1 JUMP \xB3 SHOT");
        else
            text_put_str("\xB1 SHOT \xB3 JUMP");

        text_set_attr(selected == 4);
        text_set_pos(page->offset.x + 15, page->offset.y + 4);
        if (glob->curr.unkE6 == 0)
            text_put_char(0xB2);
        else
            text_put_char(0xB4);
        text_put_str(" SP. ITEM");

        text_set_attr(selected == 5);
        text_set_pos(page->offset.x + 15, page->offset.y + 5);
        if (glob->curr.unkE7 == 0)
            text_put_str("STEREO");
        else
            text_put_str("MONO");

        text_set_attr(selected == 6);
        text_set_pos(page->offset.x + 15, page->offset.y + 6);
        if (glob->curr.unkE8 == 0)
            text_put_str("ON");
        else
            text_put_str("OFF");
        break;

    case PAGE_SETTINGS_WIDE:
        text_set_attr(selected == 0);
        text_set_pos(page->offset.x + 15, page->offset.y);
        if (jt.get_widescreen == 0)
            text_put_str("4:3");
        else
            text_put_str("16:9(WIDE)");

        text_set_attr(selected == 1);
        text_set_pos(page->offset.x + 15, page->offset.y + 1);
        if (glob->curr.unkE3 == 0)
            text_put_str("REVERSE");
        else
            text_put_str("NORMAL");

        text_set_attr(selected == 2);
        text_set_pos(page->offset.x + 15, page->offset.y + 2);
        if (glob->curr.unkE5 == 0)
            text_put_str("\xB1 JUMP \xB3 SHOT");
        else
            text_put_str("\xB1 SHOT \xB3 JUMP");

        text_set_attr(selected == 3);
        text_set_pos(page->offset.x + 15, page->offset.y + 3);
        if (glob->curr.unkE6 == 0)
            text_put_char(0xB2);
        else
            text_put_char(0xB4);
        text_put_str(" SP. ITEM");

        text_set_attr(selected == 4);
        text_set_pos(page->offset.x + 15, page->offset.y + 4);
        if (glob->curr.unkE7 == 0)
            text_put_str("STEREO");
        else
            text_put_str("MONO");

        text_set_attr(selected == 5);
        text_set_pos(page->offset.x + 15, page->offset.y + 5);
        if (glob->curr.unkE8 == 0)
            text_put_str("ON");
        else
            text_put_str("OFF");
        break;
    }
}

// robbit cursor anim
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3168);

int D_800F4CBC = 0;
int D_800F4CC0 = 0;
int D_800F4CC4 = 1;
int D_800F4CC8 = 0;
int D_800F4CEC = 0; // Write an executable index here to go to it
int D_800F4CF0 = 0;
int D_800F4CF4 = 8;
int D_800F4CF8 = 0;

int D_800F4E08 = 0;
int D_800F4E18 = 0;
int D_800F4E20 = 0;
int D_800F4E28 = 0;
int D_800F4E30 = 0;
int D_800F4E38 = 0;
int D_800F4E40 = 0;
int D_800F4E48 = 0;  // main menu selection (why is it separate?
int D_800F4E50 = 0;
int D_800F4E58 = 0;
int D_800F4E60 = 0;
int D_800F4E68 = 0;
int D_800F4E70 = 0;
int D_800F4E78 = 0;
int D_800F4E80 = 0;
//
/* 800F4ED0 */ BGBuffer *current_bgbuffer = NULL;

extern u32 D_800EB97C[4];
extern u32 D_800EB98C[4];


// menu logic
//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E32BC);
// 800E32BC
u32 func_800E32BC(u32 buttons, u32 page_idx, u32 selection)
{
    if (buttons == 0)
        return (selection << 16) | page_idx;

    MenuPage *page = D_800EB8CC[page_idx];

    if (buttons & Pad1Down) {
        if (++selection > page->nselections - 1) {
            selection = 0;
        }
        func_800E0B54(0x2C00);
    }

    if (buttons & Pad1Up) {
        if (selection < 1) {
            selection = page->nselections;
        }
        selection--;
        func_800E0B54(0x2C00);
    }

    if (page_idx == 0)
        D_800F4E48 = selection;

    if (buttons & Pad1Left) {
        if (page->items[selection].press_left)
            page->items[selection].press_left();
    }

    if (buttons & Pad1Right) {
        if (page->items[selection].press_right)
            page->items[selection].press_right();
    }

    if (buttons & BUTTONS_ACCEPT) {
        MenuItem *item = &page->items[selection];
        printf("flags is %02X\n", item->flags);
        printf("dest is %02x\n", item->dest);
        switch (item->flags & 0xF) {
        case 1: func_800E0B54(0x2600); break;
        case 2: func_800E0B54(0x2700); break;
        case 3: func_800E0B54(0x2D00); func_800E7478(); break;
        }

        if (page_idx == PAGE_CONFIRM_SAVE) {
            glob->unk50C = D_800F4CC0;
        }
        if (page_idx == PAGE_CONFIRM_LOAD) {
            glob->unk50D = D_800F4CC0;
        }

        if (page_idx == PAGE_LOAD && selection < 3) {
            if (glob->slot_state[selection] == 0 || glob->slot_state[selection] == 0xff) {
                switch (glob->unk512) {
                    case 1: func_800E14A4(1); break;
                    case 2: func_800E14A4(2); break;
                    default: func_800E14A4(3); break;
                }
                func_800E0B54(0x2900);
                func_800E7478();
                goto out;
            } else {
                func_800E0B54(0x2600);
                func_800E7478();
            }
        }

        if (page_idx == PAGE_SAVE && selection < 3) {
            if (glob->slot_state[selection] == 0xff) {
                switch (glob->unk512) {
                    case 1: func_800E14A4(1); break;
                    default: func_800E14A4(2); break;
                }
                func_800E0B54(0x2900);
                func_800E7478();
                page_idx = 2;
                goto out;
            } else {
                func_800E0B54(0x2600);
                func_800E7478();
            }
        }

        if (item->dest == 0xff) {
            func_800E7478();
            page_idx = D_800F4CBC;
            selection = D_800F4CC0;
            if (page_idx == PAGE_MAIN) {
                selection = D_800F4E48;
            }
        } else if ((item->flags & 0xa0) == 0) {
            D_800F4CBC = page_idx;
            D_800F4CC0 = selection;
            func_800E7478();
            page_idx = item->dest;
            selection = D_800EB8CC[page_idx]->field11_0x1c;
            if (page_idx == PAGE_SAVE) {
                selection = glob->unk50C; // last used save slot
            }
            if (page_idx == PAGE_LOAD) {
                selection = glob->unk50D; // last used load slot
            }
            if (page_idx == PAGE_MAIN) {
                selection = D_800F4E48; // last main menu location
            }
            if (page_idx <= 3 || page_idx >= 7) {
                D_800F4E38 = 1;
            }
        }

        if (item->flags & 0x80) {
            if (page_idx == 0 && selection == 1 && !glob->curr.unkE2) {
                // Can't go into time trial right now.
                func_800E0B54(0x2900);
                func_800E7478();
                return 0x10000;
            }
            jt.sound_fade_out(12, 0, 0);
            D_800F4CEC = item->unk1;
            func_800E8790();
            glob->curr.unkE4 = glob->world;
            glob->unk516 = 0;

            if (D_800F4E58 == 1) {
                glob->unk516 = 2;
                glob->stage = 0;
                if (D_800F4E60 == 0 && (glob->curr.unkE9 & 1)) {
                    glob->world = 0;
                } else {
                    glob->world = 7;
                }
            }

            // This code is strange. Maybe there used to be seperate executables
            // for these functions before they were all unified into TITLE.PEX
            // and this is trying to patch around that.
            if (D_800F4CEC == 1) {
                if (glob->world != 0) {
                    glob->world -= 1;
                    glob->stage = 0;
                }
            } else if (D_800F4CEC == 2) {
                glob->unk516 = 1;
                if (glob->curr.unkE0 == 0) {
                    glob->world = 0;
                    glob->stage = 0;
                } else {
                    glob->world = (glob->curr.unkE0 - 1) / 3;
                    glob->stage = (glob->curr.unkE0 - 1) % 3;
                }
            }
            D_800F4CEC = 1;
            func_800E0B54(0x2600);
        }

        printf("item->flags & 0x40 == %d\n", item->flags & 0x40);
        if (item->flags & 0x40) {
            if (item->click) {
                D_800F4E20 = page_idx;
                D_800F4E28 = selection;
                item->click();
            }
            if (page_idx == PAGE_LOAD || page_idx == PAGE_SAVE) {
                if (glob->unk512 == 2) {
                    selection = 3;
                    if (D_800F4CBC == 0) {
                        func_800E14A4(2);
                        func_800E0B54(0x2900);
                    }
                } else if (glob->unk512 == 1) {
                    if (D_800F4CBC == 0) {
                        func_800E0B54(0x2900);
                    }
                    selection = 0;
                    D_800F4E38 = 8;
                    page_idx = 6;
                    func_800E7478();
                }
            }
        }

        if (page_idx == PAGE_SETTINGS) {
            if (glob->debug_features == 2) {
                page_idx = PAGE_SETTINGS_TEST;
            } else {
                int region = jt.get_region();
                if (region == REGION_JAPAN || region == REGION_DEBUG) {
                    // Wait, what?? But the original Japanese version doesn't
                    // have the widescreen option. So the newer western version
                    // does show the widescreen option, but only if it's with
                    // it's region set to Japan. Which can never happen???
                    page_idx = PAGE_SETTINGS_WIDE;
                }
            }
        }
    }

    u32 new_selection;

    if (buttons & BUTTONS_CANCEL) {
        //
    } else {
        //
    }

    //
    //if (selection >= D_800EB8CC[page_idx]->nselections)

out:
    return (selection << 16) | page_idx;
}

// main menu tick
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3BBC);
//u32 func_800E3BBC(u32 state, u32 )

// 800E3C48
void bzero(void *buf, int n)
{
    u8 *p = buf;
    for (int i = 0; i < n; i++)
        p[i] = 0;
}

// init game data
void func_800E3C68(void)
{
    bzero(&glob->curr, sizeof(SavedData));
    bzero(&glob->saved[0], sizeof(SavedData));
    bzero(&glob->saved[1], sizeof(SavedData));
    bzero(&glob->saved[2], sizeof(SavedData));
    bzero(&glob->backup, sizeof(SavedData));
    bzero(&glob->slot_state, sizeof(glob->slot_state));
    glob->world = 0;
    glob->backup.unkE2 = 0;
    glob->curr.unkE4 = glob->world;
    ram_strcpy("JUMPFLSH", &glob->backup.signature);
    glob->backup.checksum = func_800E1514(&glob->backup);
    glob->curr = glob->backup;
}

// unused
//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3D9C);

void func_800E6D1C(char*, int, RECT*);

// draw_big_string
void func_800E3DF8(char *str, RECT *rect)
{
    RECT r = *rect;
    r.x += 1;
    func_800E6D1C(str, 0xF, &r);
    r.y += 1;
    func_800E6D1C(str, 0xF, &r);
    r.y -= 1;
    r.x -= 1;
    func_800E6D1C(str, 0xE, &r);
}

extern FGBuffer D_800F4F28[2];

// cache_big_strings
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3EA4);

// a ton of functions inside this one
// # main stuff
// glabel func_800E4250 main
// glabel func_800E4D40 _the_callback
// glabel func_800E4EE8 load_textures
// glabel func_800E561C

// # text stuff
// x text_set_pos
// x text_clear
// x text_put_char
// x text_put_str
// glabel func_800E5748 text_put_u8
// glabel func_800E5780 text_put_u16
// glabel func_800E57B4 text_put_u32
// text_put_u64

// # graphic stuff
// glabel func_800E5818 gbuffer_swap
// glabel func_800E58D4
// glabel func_800E58E4
// glabel func_800E5904 _draw_sprite
// glabel func_800E5BBC draw_sprite
// glabel func_800E5C00
// glabel func_800E5F58
// glabel func_800E6300
// glabel func_800E6658 set_brightness
// glabel func_800E6668
// glabel func_800E681C
// glabel func_800E6940
// glabel func_800E6B90
// glabel func_800E6D1C
// glabel __func_800E6E80
// glabel func_800E70F4
// glabel func_800E7174
// glabel func_800E7328
// glabel func_800E73CC
// glabel func_800E742C update cheat mode
// glabel func_800E7478 input das nonsense
// glabel func_800E74A8 input das nonsense

INCLUDE_ASM("asm/title/nonmatchings/1120", bigone);

// part of a data structure
extern int D_800F4CEC;
int D_800F4D74 = 0;

// main
int func_800E4250()
{
    func_800E7FD4();
    D_800F4E68 = 0;
    func_800E7FA4();
    func_800E87DC();
    jt.sfx_free_vab(1);
    jt.wait_for_vsync();
    jt.ResetGraph(0);
    func_800E8084();
    func_800E76D4();
    func_800E70F4();
    func_800E742C();
    glob = jt.globals();
    if (glob->intro_played == 0) {
        func_800E8640("MOVIE\\OPEN.STR", 485);
        glob->unk518 = 1U;
        if (glob->intro_played == 0) {
            func_800E3C68();
            glob->intro_played = 1U;
        }
    }

    // initialize level number if first time
    if ((glob->curr.unkE2 != 0) && (glob->curr.unkE4 == 0)) {
        glob->curr.unkE4 = 1U;
    }
    glob->world = (u8) glob->curr.unkE4;

    func_800E189C();
    jt.SetDefDispEnv(&D_800F4F28[0].disp, 0, 0, 0x140, 0xF0);
    jt.SetDefDispEnv(&D_800F4F28[1].disp, 0, 0x100, 0x140, 0xF0);
    jt.SetDefDrawEnv(&D_800F4F28[0].draw, 0, 0x100, 0x140, 0xF0);
    jt.SetDefDrawEnv(&D_800F4F28[1].draw, 0, 0, 0x140, 0xF0);

    D_800F4F28[0].disp.screen =
    D_800F4F28[1].disp.screen = (RECT){
        .x = 4,
        .y = 12,
        .w = 248,
        .h = 216,
    };

    for (int i = 0; i < 2; i++) {
        D_800F4F28[i].draw.isbg = 0;
        D_800F4F28[i].draw.r0 = 255;
        D_800F4F28[i].draw.g0 = 255;
        D_800F4F28[i].draw.b0 = 255;

        D_800F4F28[i].disp.pad0 = 0;
        if (jt.get_video_mode() == 1) {
            D_800F4F28[i].disp.screen.y += 24;
            D_800F4F28[i].disp.pad0 = 1;
        }
    }

    u32 buttons;
    int var_s1_2;
    while (1) {
        // loop 10
        var_s1_2 = 0;
        func_800E3EA4();    // setup_graph_env
        jt.music_set_repeat(0);
        jt.music_play(1);
        D_800F4E50 = 0;
        D_800F4E40 = 1;
        D_800F4E20 = 0;
        D_800F4E28 = 0;
        while (1) {
            // loop 11
            func_800E09EC();    // gbuffer_swap
            text_clear();
            func_800E0C74();    // tick
            func_800E14CC();    // tick
            if ((D_800F4E50 == 0) && (D_800F4CEC == 0) && !(jt.snd_status() & 8)) {
                jt.music_set_repeat(1);
                jt.music_play(0xF3);
                D_800F4E40 = 1;
                D_800F4E50 = 1;
            }
            if ((D_800F4E40 == 0) && (D_800F4E20 == 0) && (D_800F4CEC == 0)) {
                jt.music_set_repeat(1);
                jt.music_play(0xF3);
                D_800F4E50 = 1;
                D_800F4E40 = 1;
            }
            buttons = func_800E74A8(0);    // read_input
            //jt.printf("%08X\n", buttons);
            if (buttons != 0) {
                // reset timers
                D_800F4E70 = 0;
                D_800F4E38 = 8;
                var_s1_2 = 0;
                D_801A0FA8 = 0;
            }
            if (D_800F4E38 < 8) {
                // something about input?
                D_800F4E38 += 1;
                func_800E7478();
            }

            if (D_800F4E08 < var_s1_2) {
                if (glob->unk518 == 0)
                    break;

                D_800F4CEC = glob->unk518 + 19;
                jt.sound_fade_out(12, 0, 0);
                glob->world = D_800EB97C[glob->unk518];
                glob->stage = D_800EB98C[glob->unk518];
                glob->unk518 = (glob->unk518 + 1) & 3;    /* bitfield? */
                var_s1_2 = 0;
                glob->unk516 = 3U;
            }
            if ((D_800F4E30 > 0) && (D_800F4CEC == 0)) {
                D_800F4E30 -= D_800F4E18 * D_800F4CC4;
            }
            if (D_800F4E30 < 0) {
                D_800F4E30 = 0;
            }

            if (D_800F4CEC == 0) {
                // Normal mode

                // Are we still fading in? Speed it up if there's player input.
                if (D_800F4CF4 < 0x81) {
                    func_800E6658(D_800F4CF4);
                    D_800F4CF4 += 8;
                    if (buttons != 0) {
                        D_800F4E30 = 0;
                        D_800F4CF4 = 0x80;
                        func_800E6658(0x80);
                    }
                }

                // Process input
                u32 new_state = func_800E3BBC(buttons, D_800F4E20, D_800F4E28);
                D_800F4E28 = new_state >> 16;
                D_800F4E20 = new_state & 0xffff;
            } else {
                // Switching executable mode

                printf("switching\n");

                // Block user input during the transition
                func_800E3BBC(0, D_800F4E20, D_800F4E28);

                // Fade out the screen
                if (D_800F4CF4 >= 0) {
                    func_800E6658(D_800F4CF4);
                    D_800F4CF4 -= 8;
                }

                if (D_800F4E30 < 0x100) {
                    D_800F4E30 += D_800F4E18;
                }

                D_800F4D74 += 1;
                if (!(jt.snd_status() & 2) || (D_800F4D74 > 0x78)) {
                    // Transition complete. Clean up and launch the executable.
                    jt.DrawSync(0);
                    jt.cd_pause();
                    jt.cd_flush();
                    jt.snd_reset();
                    jt.execs_set_next(D_800F4CEC);
                    jt.wait_for_vsync();
                    jt.SetDispMask(0);
                    if (glob->unk516 == 3) {
                        func_800E0920();
                        func_800E8790();
                    }
                    return;
                }
            }

            // And then draw the screen.
            text_set_attr(0);
            // If the current page is a dialog screen, also show the previous
            // page.
            if (D_800F4E20 >= 4 && D_800F4E20 <= 6) {
                func_800E22D8(D_800F4CBC);
            }
            func_800E22D8(D_800F4E20);
            func_800E1FB8();
            func_800E2234(D_800F4E20);
            func_800E82A8();
            func_800E681C();
            func_800E0A60();
            jt.cd_run_block();
            if (D_800F4E20 == 0) {
                var_s1_2 += 1;
            }
        }

        // the right thing
        jt.sound_fade_out(12, 0, 0);
        int temp_v1 = D_800F4CF4;
        while (D_800F4CF4 >= 0) {
            D_800F4CF4 = temp_v1 - (D_800F4CC4 * 8);
            if (D_800F4E30 < 0x100) {
                D_800F4E30 += D_800F4E18 * D_800F4CC4;
            }
            func_800E4D40();    // _the_callback
        }
        func_800E8640("MOVIE\\OPEN.STR", 485);
        D_800F4CF4 = 8;
        glob->unk518 = (u8) (glob->unk518 + 1);
    }
}

extern RECT D_800F4D90;
extern u8 D_801A0FF0;   // brightness
extern int D_800F4EE0;

void _func_800E6B90(RECT *r, short x, short y)
{
    //D_801A0FF0
    SPRT *p = current_bgbuffer->next;
    func_800E58E4(2);
    setSprt(p);
    setClut(p, D_800F4EE0 << 4, 240);
    setWH(p, r->w, r->h);
    setUV0(p, r->x, r->y);
    setRGB0(p, D_801A0FF0, D_801A0FF0, D_801A0FF0);
    setXY0(p, x, y);
    // ????
    //addPrim(current_bgbuffer->ot, p)
    //
    //
    //

}

// draw_big_string_layer
void _func_800E6D1C(char*, int, RECT*)
{
    //
    //
    // It uses an empty jumptable function.
}

// draw sky polygons
void func_800E6E80(int cols, int rows, int step, uint u0, uint v0)
{
    u16 *depth = (u16 *) 0x1F800000;
    u32 *verts = (u32 *) 0x1F800154;
    POLY_FT4 *p = current_bgbuffer->next;
    u16 tpage = getTPage(0, 0, 640, 256);

    step /= 16;

    u8 u, v;
    v = v0;
    for (int j = 0; j < rows; j++) {
        v %= 128;
        u = u0;
        for (int i = 0; i < cols; i++) {
            setPolyFT4(p);
            setRGB0(p, D_801A0FF0, D_801A0FF0, D_801A0FF0);
            *((u32*)&p->x0) = verts[0];
            *((u32*)&p->x1) = verts[1];
            *((u32*)&p->x2) = verts[cols + 1];
            *((u32*)&p->x3) = verts[cols + 2];
            u16 fog_level = (depth[0] + depth[1] + depth[cols + 1] + depth[cols + 2])/4;
            fog_level >>= 6;
            u %= 128;
            v %= 128;
            setUVWH(p, u, v, step, step);
            setClut(p, 320, 480 + fog_level);
            p->tpage = tpage;

            addPrim(current_bgbuffer->ot[2], p);

            p += 1;
            u += step;
            verts++;
            depth++;
        }
        v += step;
        verts++;
        depth++;
    }
    current_bgbuffer->next = p;

    DR_MODE *q = current_bgbuffer->next;
    jt.SetDrawMode(q, 0, 0, tpage, &(RECT){ 0, 0, 128, 128 });
    addPrim(current_bgbuffer->ot[2], q);

    current_bgbuffer->next = q + 1;
}

extern char *D_800F4F20;

void func_800E76D4(void)
{
    switch (jt.get_region()) {
    default:
    case REGION_JAPAN:  D_800F4F20 = "BISCPS-10007EXACT02"; break;
    case REGION_USA:    D_800F4F20 = "BASCUS-94103EXACT01"; break;
    case REGION_EUROPE: D_800F4F20 = "BESCES-00003EXACT01"; break;
    case REGION_DEBUG:
        D_800F4F20 = "BISCPS-10007EXACT02";
        char *name = jt.get_mc_file_name();
        if (name)
            D_800F4F20 = name;
        break;
    }
}

extern void (*D_800F4DDC)(void);

void func_800E77A8(void (*cb)(void))
{
    D_800F4DDC = cb;
}

void func_800E77B8(void)
{
    if (D_800F4DDC)
        D_800F4DDC();
}

static inline make_filename(char *buffer, int slot)
{
    CLAMP(slot, 0, 2);
    ram_strcpy(D_800F4F20, buffer);
    int len = ram_strlen2(D_800F4F20);
    buffer[len] = '0' + slot;
    buffer[len + 1] = 0;
}

// func_800E77E4
int func_800E77E4(int port, char *filename)
{
    int x, y;
    DIRENTRY dirent, *p, *q;

    // Is this an unrolled loop or something? What on earth is going on
    x = 0;
    do {
        func_800E77B8();
        p = jt.mc_firstfile(port, "*", &dirent);
        y = x;
        if (p == &dirent) {
            do {
                x += dirent.size;
                q = jt.mc_nextfile(p);
            } while (p == q);
            func_800E77B8();
            q = jt.mc_firstfile(port, filename, p);
            y = x;
            while (p == q) {
                y -= dirent.size;
                p = jt.mc_nextfile(q);
            }
        }
        x = 0;
        func_800E77B8();
        p = jt.mc_firstfile(port, "*", &dirent);
        if (p == &dirent) {
            do {
                x += dirent.size;
                q = jt.mc_nextfile(p);
            } while (p == q);
            func_800E77B8();
            q = jt.mc_firstfile(port, filename, p);
            while (p == q) {
                x -= dirent.size;
                p = jt.mc_nextfile(q);
            }
        }
    } while (y != x);
    return 120 * 1024 - x;
}

const char *D_800F05B4[3] = {
    "\x82\x50\x81\x40", // "１　"
    "\x82\x51\x81\x40", // "２　"
    "\x82\x52\x81\x40", // "３　"
};

// TODO: The display name of the save block sometimes comes out mangled.
int func_800E799C(int port, int slot, u8 *src, int len, char *suffix)
{
    char filename[128];
    make_filename(filename, slot);
    int space = func_800E77E4(port, filename);
    if (space < 15 * 512) {
        return 0;
    }

    char buffer[128];
    char title[128];
    // "Ｊｕｍｐｉｎｇ\x3000Ｆｌａｓｈ！\x3000ＤＡＴＡ\x3000"
    char *sjis_string = "\x82\x69\x82\x95\x82\x8d\x82\x90\x82\x89\x82\x8e\x82\x87\x81\x40\x82\x65\x82\x8c\x82\x81\x82\x93\x82\x88\x81\x49\x81\x40\x82\x63\x82\x60\x82\x73\x82\x60\x81\x40";
    ram_strcat(sjis_string, D_800F05B4[slot], buffer);
    if (suffix) {
        ram_strcat(buffer, suffix, title);
    } else {
        ram_strcpy(buffer, title);
    }

    while (1) {
        int rc;
        while (1) {
            while ((rc = jt.mc_file_exists(port, filename)) == -1) {
                rc = jt.mc_file_exists(port, filename);
                if (rc == -1)
                    return -1;
            }
            if (rc > -1) break;
            // What the fuck is happening
label0:
            rc = jt.mc_file_exists(port, filename);
            if (rc == -2)
                return -2;
        }

        // I'm too tired to even wanna make sense of this control flow.
        if (rc != 0) {
            if (rc == 1) goto label1;
            goto label0;
        }
        rc = jt.mc_file_exists(port, filename);
        if (rc == 0) {
            rc = jt.mc_file_create(port, filename, 0x1e00, title);
            if (rc < 0)
                return 0;
label1:
            rc = jt.mc_file_write(port, filename, src, 0, len);
            return rc > 0;
        }
    }
}

// func_800E7BD8
int func_800E7BD8(int port, int slot, u8 *dst, int len)
{
    char filename[128];
    make_filename(filename, slot);
    int rc, rc2;
    // I have no idea what the hell is going on here.
    do {
        rc = jt.mc_file_read(port, filename, dst, 0, len);
        if (rc > 0) {
            return 1;
        }
        func_800E77B8();
        rc2 = jt.mc_file_read(port, filename, dst, 0, len);
    } while (rc2 > 0);
    return rc;
}

// func_800E7CD8
void func_800E7CD8(int port, int slot)
{
    char filename[128];
    make_filename(filename, slot);
    jt.mc_delete(port, filename);
}

extern u8 D_800F4D8E;
extern int D_800F4EE8;
extern int D_800F4EF0;
u16 D_800F7050[30][64];

// 800E4ED0
u8 text_set_attr(u8 attr)
{
    u8 old = D_800F4D8E;
    D_800F4D8E = attr;
    return old;
}

// 800E5634
void text_set_pos(int x, int y)
{
    D_800F4EE8 = x;
    D_800F4EF0 = y;
}

// 800E564C
void text_clear(void)
{
    u16 *p = D_800F7050;
    for (int i = 0; i < 30*64; i++)
        p[i] = 0;
    text_set_pos(0, 0);
}

// 800E568C
void text_put_char(u16 c)
{
    if (D_800F4EE8 >= 63) return;
    if (D_800F4EF0 >= 29) return;
    D_800F7050[D_800F4EF0][D_800F4EE8++] = (c & 0xFF) | (D_800F4D8E << 8);
}

// 800E56FC
void text_put_str(char *str)
{
    char c;
    while ((c = *str++))
        text_put_char(c);
}

// misc.c ?

void func_800E8790(void)
{
    GlobalData *g = jt.globals();
    g->unk500 = 0;
    g->unk508 = 1;
    g->unk509 = 0;
    g->unk50A = 0;
    g->unk50B = 0;
    g->unk504 = 3;
}

void func_800E87DC(void)
{
    for (int i = 0; i <= 88; i++) {
        jt.sfx_set_prog_attr(i << 8, 1);
    }

    for (int i = 57; i <= 86; i++) {
        jt.sfx_set_prog_attr(i << 8, 0);
    }

    jt.sfx_set_prog_attr(26 << 8, 0);
}
