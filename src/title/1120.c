#include "common.h"
#include "shared.h"

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

// sfx stuff
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0B54);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0C24);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0C74);

// toggle_widescreen
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0CD8);

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

// movie test prev/next/play
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0D78);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0DB8);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0E04);

// level math
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E0FD0);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1044);

// extra mode prev/next
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E10B8);
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E11D0);

// more menu stuff
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E12B4);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1384);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1418);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E14A4);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E14CC);

// mc functions
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1514);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1570);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E15A4);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E15FC);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E189C);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1928);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1A88);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1BCC);

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

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E2234);
// draw logo
//void func_800E2234(void) {}

u8 text_set_attr(u8 attr);
void text_set_pos(int x, int y);
void text_clear(void);
void text_put_char(u16 c);
void text_put_str(char *str);

typedef struct {
    u8 flags;   // and sfx. bitfield?
    u8 dest;
    u8 unk0;
    u8 unk1;
    // I think this is padding lol?
/*
    u8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
*/
    // probably another function, for pressing
    void (*click)(void);
    void (*press_right)(void);
    void (*press_left)(void);
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
    int field11_0x1c;
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

int func_800E1928();
int func_800E1A88();
int func_800E11D0();
int func_800E10B8();
int func_800E15FC();
int func_800E1BCC();

int func_800E0E04();
int func_800E0D78();
int func_800E0DB8();
int func_800E1C24();
int func_800E1D48();
int func_800E1DB8();
int func_800E0CD8();

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
            { 0x43, 1, 0xFE, 0x00, func_800E15FC, func_800E11D0, func_800E10B8 },
            { 0x43, 2, 0xFE, 0x00, func_800E15FC, NULL, NULL },
            { 0x03, 3, 0xFE, 0x00, NULL, NULL, NULL },
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
        .items_strings = (short[]){
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
        .items_strings = (short[]){
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
        .items_strings = (short[]){
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

// progress enum's strings
const char *D_800EB430[] = {
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
//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E23C0);

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

// is this (and maybe the whole input module) the same one from gameover? 
#define BUTTONS_ACCEPT      (Pad1Start|Pad1sqr|Pad1crc)
#define BUTTONS_CANCEL      (Pad1x)

extern int D_800F4CF4;
extern int D_800F4CC4;
extern int D_800F4E18;
extern int D_800F4E48;  // main menu selection (why is it separate?
extern int D_800F4E50;
extern int D_800F4E40;
extern int D_800F4E20;
extern int D_800F4E28;
extern int D_800F4E70;
extern int D_801A0FA8;
extern int D_800F4E08;

extern u32 D_800EB97C[4];
extern u32 D_800EB98C[4];


#include <pad.h>
// menu logic
//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E32BC);
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
        switch (item->flags & 0xF) {
        case 1: func_800E0B54(0x2600); break;
        case 2: func_800E0B54(0x2700); break;
        case 3: func_800E0B54(0x2D00); func_800E7478(); break;
        }
        if (page_idx == 5) {
            glob->unk50C = D_800F4CC0;
        }
        if (page_idx == 4) {
            glob->unk50D = D_800F4CC0;
        }

        if (page_idx == 1 && selection < 3) {
            // load
            //
        }

        if (page_idx == 2 && selection < 3) {
            // save
            //
        }

        // dialog stuff
        //

        if (item->flags & 0x80) {
            //
        }

        if (item->flags & 0x40) {
            if (item->click) {
                D_800F4E20 = page_idx;
                D_800F4E28 = selection;
                item->click();
            }
            //
        }

        if (page_idx == 3) {
            if (glob->debug_features == 2) {
                page_idx = 7;
            } else {
                int region = jt.get_region();
                if (region == REGION_JAPAN || region == REGION_DEBUG) {
                    page_idx = 8;
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


    printf("new selection: %d\n", selection);
    return (selection << 16) | page_idx;
}

// main menu tick
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3BBC);

// bzero
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3C48);

// init game data
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E3C68);
/*
void func_800E3C68(void)
{
    bzero(&glob->curr, sizeof(SavedData));
    bzero(&glob->saved[0], sizeof(SavedData));
    bzero(&glob->saved[1], sizeof(SavedData));
    bzero(&glob->saved[2], sizeof(SavedData));
    bzero(&glob->backup, sizeof(SavedData));
    bzero(&glob->backup, sizeof(SavedData));
    //
}
*/

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
INCLUDE_ASM("asm/title/nonmatchings/1120", bigone);

void func_800E8640(char *filename, int frame_count);


// part of a data structure
extern int D_800F4CEC;

// main
int _func_800E4250()
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

    //
    //
    u32 buttons;
    int var_s1_2;
    while (1) {
        // loop 10
        var_s1_2 = 0;
        func_800E3EA4();    // setup_graph_env
        jt.audio_unk3(0);
        jt.audio_play_by_id(1);
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
            if ((D_800F4E50 == 0) && (D_800F4CEC == 0) && !(jt.unk_flags() & 8)) {
                jt.audio_unk3(1);
                jt.audio_play_by_id(0xF3);
                D_800F4E40 = 1;
                D_800F4E50 = 1;
            }
            if ((D_800F4E40 == 0) && (D_800F4E20 == 0) && (D_800F4CEC == 0)) {
                jt.audio_unk3(1);
                jt.audio_play_by_id(0xF3);
                D_800F4E50 = 1;
                D_800F4E40 = 1;
            }
            buttons = func_800E74A8(0);    // read_input
            jt.printf("%08X\n", buttons);
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

            //
        }

        // the right thing
        jt.sound_fade_out(12, 0, 0);
        int temp_v1 = D_800F4CF4;
        while (D_800F4CF4 >= 0) {
            D_800F4CF4 = temp_v1 - (D_800F4CC4 * 8);
            if (D_800F4E30 < 0x100) {
                D_800F4E30 += D_800F4E18 * D_800F4CC4;
            }
            func_800E4D40(D_800F4CC4, D_800F4E30);    // _the_callback
        }
        func_800E8640("MOVIE\\OPEN.STR", 485);
        D_800F4CF4 = 8;
        glob->unk518 = (u8) (glob->unk518 + 1);
        //goto loop_10;
    }
}

extern RECT D_800F4D90;
extern BGBuffer *current_bgbuffer;
extern u8 D_801A0FF0;   // brightness

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

extern u8 D_800F4D8E;
extern int D_800F4EE8;
extern int D_800F4EF0; 
u16 D_800F7050[30][64];


u8 text_set_attr(u8 attr)
{
    u8 old = D_800F4D8E;
    D_800F4D8E = attr;
    return old;
}

void text_set_pos(int x, int y)
{
    D_800F4EE8 = x;
    D_800F4EF0 = y;
}

void text_clear(void)
{
    u16 *p = D_800F7050;
    for (int i = 0; i < 30*64; i++)
        p[i] = 0;
    text_set_pos(0, 0);
}

void text_put_char(u16 c)
{
    if (D_800F4EE8 >= 63) return;
    if (D_800F4EF0 >= 29) return;
    D_800F7050[D_800F4EF0][D_800F4EE8++] = (c & 0xFF) | (D_800F4D8E << 8);
}

void text_put_str(char *str)
{
    char c;
    while ((c = *str++))
        text_put_char(c);
}

#include <libgte.h>
#include <libetc.h>

extern int D_800F4DE4;
extern int D_800F4DE8;
extern int D_800F4DEC;

extern VECTOR D_800F05E0;
extern SVECTOR D_800F4DF0;

// bg_init
void func_800E8084(void)
{
    InitGeom();
    SetGeomScreen(0x80);
    SetGeomOffset(0xA0, 0x78);
    SetFogFar(0x1A00, 0x80);
    func_800E7FEC(&D_800F4DF0, &D_800F05E0);
    if (jt.get_video_mode() == MODE_PAL) {
        D_800F4DE4 = 0x1333;
        D_800F4DE8 = 0x1333;
        D_800F4DEC = 0x13330;
    }
}

void func_800E83BC(u32 XZ, u32 WL, int Y, int step);

void func_800E8124(int height, int b, int c)
{
    // TODO: combine into an inline. have it deal with the invariants
    func_800E83BC(0xE0000E00, 0x20001E00, height, 0x800);
    func_800E6E80(8, 2, 0x800, b, c + 0x60);

    func_800E83BC(0xF0000600, 0x10000E00, height, 0x200);
    func_800E6E80(16, 4, 0x200, b, c + 0x40);

    func_800E83BC(0xFA000400, 0x06000600, height, 0x80);
    func_800E6E80(24, 4, 0x80, b + 0x20, c + 0x20);

    func_800E83BC(0xFC000200, 0x04000400, height, 0x80);
    func_800E6E80(16, 4, 0x80, b + 0x40, c);

}

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E8238);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E8278);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E82A8);

// assembly function, rendering
//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E83BC);

// movie.c

// static callback
INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E8474);

#include "movie_args.h"
// static init_args
void func_800E857C(MovieArgs *as, int frame_count)
{  
    as->frame_count = frame_count;
    as->ring_size = 0x40;
    as->buffers[0] = 0x80060000;
    as->buffers[1] = 0x80088000;
    as->data_addr = 0x800b0000;
    as->ring_addr = 0x800b6000;
    as->mode = 0xc0;
    as->x1 = 0;
    as->y1 = 0;
    as->x2 = 0;
    as->y2 = 0x100;
    (as->rect).x = 0;
    (as->rect).y = 0x18;
    (as->rect).w = 0x100;
    (as->rect).h = 0xd0;
    as->channel = 0;
    if (jt.get_video_mode() == MODE_PAL)
        as->rect.y += 0x18;
}

int func_800E8474();
extern int D_800F4E00;
extern SpuVolume D_800F4E04;
// play_movie
void func_800E8640(char *filename, int frame_count)
{
    MovieArgs args;
    
    D_800F4E00 = 0;
    func_800E857C(&args, frame_count);
    jt.snd_reset();
    jt.set_global_volume(&D_800F4E04);
    jt.snd_set_volume(0x3000);
    jt.play_movie(filename,&args,func_800E8474);
    jt.wait_for_vsync();    // argument? TODO
    jt.SetDispMask(0);
    jt.snd_reset();
    jt.ClearImage(&(RECT){
        .x = 0,
        .y = 0,
        .w = 1024,
        .h = 512,
    }, 0, 0, 0);
    jt.DrawSync(0);
}

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E8790);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E87DC);
