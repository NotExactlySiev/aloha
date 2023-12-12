#include "common.h"
#include "shared.h"
#include <libgpu.h>

#include "gameover.h"
#include "gbuffer.h"

#include "sprite.h"

// I think this exact module is also used in SELECT?

// tiles
extern u32 D_800E0000[];    // sprite metadata (pos and uv)
extern u32 D_800E0AEC[];    // big texture of tiles 256x256
// cluts
extern u16 D_800EA96C[256];
extern u16 D_800EAB6C[256];
extern u16 D_800EAD6C[256];
// TODO: struct this:
extern u16 D_800EAF6C[1156];

Sprite* sprt_data[64];
s32 D_800ED42C = 0; // max sprite index (sprite count)

SpriteSet D_8012DF64;      // sprite cluts and tpage

void sprite_init(void)
{
    sprite_load_data(D_800E0000);      // load sprites
    // TODO: this should be a struct. but why? context? palette?
    D_8012DF64.tpage = getTPage(1, 0, 256, 0);
    D_8012DF64.cluts[0] = getClut(0, 240);
    D_8012DF64.cluts[1] = getClut(0, 241);
    D_8012DF64.cluts[2] = getClut(0, 242);
    sprite_load_tiles(D_800E0AEC, 256, 0);  // load tiles into vram
}

// load sprite heads
void sprite_load_data(u32* raw)
{
    s32 i;
    // first byte is the number of groups
    D_800ED42C = *raw++;
    for (int i = 0; i < D_800ED42C; i++) {
        sprt_data[i] = (Sprite*) raw++;
        raw += sprt_data[i]->count;
    }
}

// put loaded sprite data into ots
// rather, put a specific metasprite into ots, using its metadata
void _sprite_render(SpriteSet *set, s32 z, s32 id, s32 x, s32 y, u8 col, s32 clutidx)
{
    Sprite *group;
    SpriteThing *s;
    SPRT_8* p;

    if (id > D_800ED42C) return;
    
    group = sprt_data[id];
    for (int i = 0; i < group->count; i++) {
        p = gbuffer_current->next;
        s = &group->sprts[i];
        // TODO: take out the magic numbers
        if (!((x+s->dx < 0xfd) && (x+s->dx > -9) && (y+s->dy < 0xe5) && (y+s->dy > -9))) continue;
        setSprt8(p);
        setUV0(p, 8*(s->uv % 32), 8*(s->uv / 32));
        setRGB0(p, col, col, col);
        setXY0(p, x+s->dx, y+s->dy);
        p->clut = set->cluts[clutidx];
        addPrim(&gbuffer_current->ot[z], p);
        gbuffer_current->next = p + 1;
    }

    
    DR_MODE* q = gbuffer_current->next;

    jt.SetDrawMode(q, 0, 0, set->tpage, &D_800ED398);
    addPrim(&gbuffer_current->ot[z], q);
    gbuffer_current->next = q + 1;    
}

void sprite_render(s32 z, s32 idx, s32 offx, s32 offy, u8 col, s32 clutidx)
{
    _sprite_render(&D_8012DF64, z, idx, offx, offy, col, clutidx);
}

void sprite_load_tiles(u32 *raw, s16 x, s16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 4,
        .h = 8,
    };

    // loading the tiles for sprites
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 32; j++) {
            jt.LoadImage(&rect, raw);  // LoadImage
            jt.DrawSync(0);           // DrawSync
            raw += 16;
            rect.x += rect.w;
        }
        rect.x = x;
        rect.y += rect.h;
    }

    // load the three cluts
    rect.x = 0;
    rect.w = 256;
    rect.h = 1;

    rect.y = 240;
    jt.LoadImage(&rect, D_800EA96C);
    jt.DrawSync(0);

    rect.y = 241;
    jt.LoadImage(&rect, D_800EAB6C);
    jt.DrawSync(0);

    rect.y = 242;
    jt.LoadImage(&rect, D_800EAD6C);
    jt.DrawSync(0);

    // load the bunny image
    rect.x = 256;
    rect.y = 256;
    rect.w = 24;
    rect.h = 48;
    jt.LoadImage(&rect, D_800EAF6C + 4);
    jt.DrawSync(0);
}


