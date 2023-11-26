#include "common.h"
#include <libspu.h>
#include <libgpu.h>

#include "shared.h"

// is this how they did it?

// data from here
typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u32    ot[4];
    u32*   next;
    u32    prims[0x8000];
} GBuffer;

typedef struct {
    s8  dx;
    s8  dy;
    u16 uv;     // tile index 0-255
} SpriteThing;  // SpriteTile

typedef struct {
    u32    count;
    SpriteThing sprts[];
} Sprite;

Sprite* sprt_data[64];

// these might be not s32 but paired as structs?
// these are animations for sprites,
//s32* intarrs[3] = {
s32 intarrs[3][22] = {
    { 13, 1, -1, 0 },
    { 0, 4, 1, 4, 2, 4, 3, 4, 8, 10, 9, 10, 10, 10, 11, 10, 12, 10, 13, 10, -1, 18 },
    { 16, 8, 17, 8, -1, 0 },
};
s32* seq = 0;
s32 seq_val = 0;
s32 seq_wait = 0;

int D_800ED354[7] = { 32, 33, 34, 35, 36, 37, 32 };
SpuVolume D_800ED370 = { 0x7FFF, 0x7FFF };
s32 bounce_y = -0x2400;       // y
s32 bounce_dy = 0x600;         // dy
s32 bounce_anim_counter = 60;            // initial counter
s32 bounce_anim_state = 0;     // bounce animation state

s32 D_800ED380 = 0; // the shut the fuck up counter


// this might be a struct
s32 D_800ED388 = 0;
s32 D_800ED38C = 0;
s32 D_800ED390 = 40;

s32 D_800ED394 = 0;
s32 D_800ED3B4 = 0;
s32 D_800ED3C4 = 0;
s32 screen_brightness = 0;     // color for something (screen fading?)
s32 stage = 0;          // stage of the entire sequence of this file. from fadein to fadeout
s32 selected = 0;       // selected
s32 D_800ED3E4 = 0;
s32 D_800ED3EC = 0;
s32 D_800ED3F4 = 0;
s32 seq_idx = 0;
s32 seq_timer = 0;

s32 D_800ED340[5] = { 40, 42, 41, 42, -1 };

RECT D_800ED398 = { .w = 0xFF, .h = 0xFF };


// these change with tv standard
s32 D_800ED384 = 1200;
s32 D_800ED424 = 0;
s32 D_800ED42C = 0; // max sprite index (sprite count)

s32 current_buffer_idx;               // current buffer id
GBuffer  graph_buffers[2];    // buffers
GBuffer *current_buffer;       // current

u16 D_8012DF64[6];      // global cluts for this file


// decls
u32 input_das_read(void);


// functions

void func_800EB894(void)
{
    screen_brightness = 0;
    stage = 0;
    D_800ED3EC = 0;
    D_800ED3F4 = 0;
}

// plays some sound effect
void play_effect(s32 arg)
{
    jt.audio_unk0(arg, 0x3e, 100);
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB8F8);

void func_800EBA08(void)
{
    D_800ED3B4 = 0x00005F00;
    bounce_anim_state = 0;
}

void func_800EBA20(void)
{
    bounce_y = 0x00005F00;
    bounce_anim_state = 5;
}

// bounce animation
void func_800EBA40(void)
{
    printf("STATE %d\n", bounce_anim_state);
    switch (bounce_anim_state) {
    case 0: // wait
        bounce_anim_counter -= 1;
        if (bounce_anim_counter < 0) bounce_anim_state = 1;
        break;
    case 1:
        bounce_dy += 128;   // half?
        bounce_y += bounce_dy;
        if (bounce_y > 95 << 8) {
            bounce_anim_state = 3;
            bounce_y = 95 << 8;
            seq_select(0);
            play_effect(0xB00);
            bounce_dy = -8 << 8;
        }
        break;
    case 2: // final drop if NO is selected
        if (D_800ED3F4 == 1) {
            bounce_dy += 0x20;
            bounce_y += bounce_dy;
        }
        if (D_800ED3F4 == -1) bounce_anim_state = 7;
        break;
    case 3: // just like 1
        bounce_dy += 128;   // half?
        bounce_y += bounce_dy;
        if (bounce_y > 95 << 8) {
            bounce_anim_state = 4;
            bounce_y = 95 << 8;
            seq_select(0);
            play_effect(0xB00);
            bounce_dy = -4 << 8;
        }
        break;
    case 4: // just like 1
        bounce_dy += 128;   // half?
        bounce_y += bounce_dy;
        if (bounce_y > (95 << 8)) {
            bounce_anim_state = 5;
            bounce_y = 95 << 8;
            seq_select(0);
            play_effect(0xB00);
        }
        break;
    case 5: // start bunny animation
    // TODO: the animation plays wrong, stops on the wrong frame
        D_800ED3EC = 1;
        D_800ED380 += 1;
        if (D_800ED380 > D_800ED384) {
            play_effect(0x5300);
            D_800ED380 = 0;
        }
        break;
    case 6: // selected YES
        bounce_y += -0x800;
        if (bounce_y <= -0x2000) bounce_anim_state = 7;
        break;
    }
    load_gbuffer(3, 0x18, 124, bounce_y >> 8, screen_brightness, 0);
}

void func_800EBCE0(void)
{
    D_800ED3C4 = 0;
}

void func_800EBCF0(void)
{
    seq_select(0);
}

// bunny animation
void seq_select(int idx)
{
    seq = intarrs[idx];
    seq_idx = 0;
    seq_timer = 0;
    seq_val = seq[0];
    seq_wait = seq[1];
}

// TODO: make sequence steps into a struct
void func_800EBD5C(void)
{
    s32 temp_v1_2;

    // sequence mode
    if (D_800ED3F4 == 0) {
        // update timer, go to next step if this one is over
        seq_timer += 1;
        if (seq_wait < seq_timer) {
            // increment index
            seq_idx += 2;
            seq_timer = 0;
            // if the sequence is over, roll over to step idx determined by the last value
            if (seq[seq_idx] == -1) {
                seq_idx = seq[seq_idx+1] * 2;
            }
            // and get the new values
            seq_val = seq[seq_idx];
            seq_wait = seq[seq_idx+1];
        }

        // whether the values have changed or not, call the function
        load_gbuffer(1, seq_val, 0x78, 0x78, screen_brightness, 0);
        return;
    }

    // don't know what this part does
    temp_v1_2 = (s32) bounce_y >> 8;
    if (temp_v1_2 > 0x77) {
        D_800ED3F4 = -1;
        return;
    }

    func_800ECBB4(0x60, temp_v1_2 + 0x10, 0x30, 0x77 - temp_v1_2, screen_brightness);
}

void func_800EBEA8(void)
{
    selected = 0;
}

#define LAYER_BG    0
#define LAYER_SEQ   1 // don't know what this one is
#define LAYER_MENU  2

// This probably draw the menu options? With the color of the buttons changing based on the selection
void func_800EBEB8(void)
{
    load_gbuffer(2, 32, 68, 144, screen_brightness, 0);
    load_gbuffer(2, 33, 68, 160, screen_brightness, selected == 0);
    load_gbuffer(2, 34, 68, 176, screen_brightness, selected == 1);
}

// TODO: where the fuck is lib pad? :/ I need macros for input
#define BUTTONS_NAVIGATE    0xF000
#define BUTTONS_ACCEPT      0x08A0
#define BUTTON_UP           0x1000
#define BUTTON_DOWN         0x4000

void func_800EBF58(u32 buttons)
{
    // stage 1 is when the menu is shown and we receive input
    if (buttons == 0 || stage != 1) return;

    if (buttons & (BUTTONS_ACCEPT | BUTTONS_NAVIGATE)) D_800ED380 = 0;

    if (buttons & BUTTONS_ACCEPT) {
        play_effect(0x2600);
        stage = 2;
        jt.sound_fade_out(12, 0, 0);    // add something to sndqueue idfk
        if (selected == 0) {
            // selected YES
            seq_select(2);
            bounce_anim_state = 6;
            play_effect(0x4A00);
        } else {
            // selected NO
            D_800ED3F4 = 1;
            bounce_dy = 0; // no change in speed anymore
            bounce_anim_state = 2;
        }
    }

    if ((buttons & BUTTON_UP) && selected == 1) {
        selected = 0;
        play_effect(0x2c00);
    }

    if ((buttons & BUTTON_DOWN) && selected == 0) {
        selected = 1;
        play_effect(0x2c00);
    }
}


void func_800EC098(void)
{
    func_800EBA08();
    func_800EBCE0();
    func_800EB894();
    func_800EBEA8();
    D_800ED3E4 = 0x2D;

    if (jt.get_tv_system() == TV_PAL) {
        D_800ED424 = 9;
        D_800ED384 = 1000;
    } else {
        D_800ED424 = 11;
    }
}

void func_800EC128(void)
{
    D_800ED388 = 0;
    D_800ED38C = 0;
    D_800ED390 = 40;
}

void func_800EC14C(void)
{
    s32 tmp;

    D_800ED388 += 1;
    if (D_800ED388 >= D_800ED424) {
        D_800ED38C += 1;
        D_800ED388 = 0;
        if (D_800ED340[D_800ED38C] == -1) {
            D_800ED38C = 0;
        }
        D_800ED390 = D_800ED340[D_800ED38C];
    }

    tmp = selected == 1 ? 0xAB : 0x9B;
    load_gbuffer(2, D_800ED390, 0x44, tmp, screen_brightness, 0);
}

void func_800EC23C(s32 arg)
{
    func_800EB8F8(arg);
    func_800EBF58(arg);
}

// not sure about this one. might be wrong, but doesn't seem really broken.
// seems to repeat and action for diagonal lines 128 pixels apart in both directions
// I think this does the background scroll
void func_800EC268(void)
{
    int i,j;

    D_800ED394 = (D_800ED394 + 1) & 0x7F;
    for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
            load_gbuffer(0, 0x30, 
                ((i << 7) - D_800ED394) - 0x40, 
                ((j << 7) + D_800ED394) - 0x40, 
                screen_brightness / 2, 2);
}


void render_routine(void)
{
    func_800EBA40();
    func_800EBEB8();
    func_800EBD5C();
    func_800EC268();    // background scroll
    func_800EC14C();
}

void func_800EC358(void)
{
    GlobalData* global = jt.global_ptr();
    
    global->unk500 = 0;
    global->unk504 = 3;
    global->unk508 = 1;
    global->unk509 = 0;
    global->unk50A = 0;
    global->unk50B = 0;
    
}


int main(void)
{
    u32 temp_s0;
    s32 var_a0;
    s32 var_v0;
    int choice;

    // TEST: let's disable all audio shit
    func_800ED268();    // deliver events
    func_800ECDA8();    // set up graphics env
    func_800EC098();    // set up some constants
    
    //jt.audio_unk2();
    
    input_das_setup();
    GlobalData* global = jt.global_ptr();   // get shared data
    //jt.set_global_volume(&D_800ED370); // set global vol void(SpuVolume*)
    //jt.audio_unk_volume(0x3000);
    //jt.audio_unk3(0);    // mc_set_some_var

    // play some audio thing
    u8 world = global->world;
    if (world > 5) world = 5;
    //jt.audio_play_by_id(D_800ED354[world]);
    
    // cycle through both buffers once
    gbuffer_swap();    // clear
    gbuffer_render();    // draw
    gbuffer_swap();    // clear
    gbuffer_render();    // draw
    jt.wait_for_vsync();    // needs 0? TODO
    jt.SetDispMask(1);

    seq_select(1);

    do {
        temp_s0 = input_das_read();  // read input
        gbuffer_swap();            // swap and clear
        func_800EC23C(temp_s0);     // process input
        render_routine();            // update graphics
        gbuffer_render();            // render graphics
    } while (stage != 4);
    
    printf("and out!\n");

    jt.audio_unk2();

    choice = 0;
    
    if (selected == 0) {
        global->world = 0;
        func_800EC358();
        choice = 1;
    }
    jt.execs_set_next(choice);
}

// ### GRAPHICS FUNCTIONS
void gbuffer_swap(void)
{
    // swap buffer
    current_buffer_idx = !current_buffer_idx;
    current_buffer = &graph_buffers[current_buffer_idx];
    // clear ots and reset prim buffer
    jt.ClearOTag(current_buffer->ot, 4);
    current_buffer->next = current_buffer->prims;
}

void gbuffer_render(void)
{
    jt.snd_queue_exec();
    jt.DrawSync(0);
    jt.VSync(0);
    // put env and draw
    jt.PutDispEnv(&current_buffer->disp);
    jt.PutDrawEnv(&current_buffer->draw);
    // draw ot
    jt.DrawOTag(current_buffer->ot);
}

// load sprite heads
void load_sprites(u32* data)
{
    s32 i;
    // first byte is the number of groups
    D_800ED42C = *data++;
    for (int i = 0; i < D_800ED42C; i++) {
        sprt_data[i] = data++;
        data += sprt_data[i]->count;
    }
}

// put loaded sprite data into ots
// rather, put a specific metasprite into ots, using its metadata
void _load_gbuffer(u16 *cluts, s32 z, s32 id, s32 x, s32 y, u8 col, s32 clutidx)
{
    Sprite *group;
    SpriteThing *s;
    SPRT_8* p;

    if (id > D_800ED42C) return;
    
    group = sprt_data[id];
    for (int i = 0; i < group->count; i++) {
        p = current_buffer->next;
        s = &group->sprts[i];
        // TODO: take out the magic numbers
        if (!((x+s->dx < 0xfd) && (x+s->dx > -9) && (y+s->dy < 0xe5) && (y+s->dy > -9))) continue;
        setSprt8(p);
        setUV0(p, 8*(s->uv % 32), 8*(s->uv / 32));
        setRGB0(p, col, col, col);
        setXY0(p, x+s->dx, y+s->dy);
        p->clut = cluts[clutidx+3];
        addPrim(&current_buffer->ot[z], p);
        current_buffer->next = p + 1;
    }
    
    DR_MODE* q = current_buffer->next;

    jt.SetDrawMode(q, 0, 0, cluts[2], &D_800ED398);
    addPrim(&current_buffer->ot[z], q);
    current_buffer->next = q + 1;    
}

// draws something into the buffer's ot
void load_gbuffer(s32 z, s32 idx, s32 offx, s32 offy, u8 col, s32 clutidx)
{
    _load_gbuffer(D_8012DF64, z, idx, offx, offy, col, clutidx);
}

// # LOADING TEXTURES

// tiles
extern u32 D_800E0000[];    // sprite metadata (pos and uv)
extern u32 D_800E0AEC[];    // big texture of tiles 256x256
// cluts
extern u16 D_800EA96C[256];
extern u16 D_800EAB6C[256];
extern u16 D_800EAD6C[256];
// image (background?)
// TODO: struct this:
extern u16 D_800EAF6C[1156];

// or maybe this load the background?
void func_800EC9AC(u32 *raw, s16 x, s16 y)
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


void func_800ECBB4(s16 x, s16 y, s16 w, s16 h, u8 col)
{
    POLY_FT4 *p;
    DR_MODE *q;
    u32 tpage;
    p = current_buffer->next;
    setPolyFT4(p);
    setRGB0(p, col, col, col);
    setUV4(p, 0, 0, 0, 0, 0, 24, 0, 24);
    setXY4(p, x, y, x+w, y, x, y+h, x+w, y+h);
    p->tpage = getTPage(1, 0, 256, 256);
    p->clut  = getClut(0, 240);
    addPrim(current_buffer->ot[1], p);

    tpage = getTPage(1, 0, 256, 256);
    q = nextPrim(p);
    jt.SetDrawMode(q, 0, 0, tpage, &D_800ED398);
    addPrim(current_buffer->ot[1], q);

    current_buffer->next = nextPrim(q);
}

void func_800ECD18(void)
{
    load_sprites(D_800E0000);
    D_8012DF64[2] = getTPage(1, 0, 256, 0);
    //D_8012DF64[2] = 0x204; //GetGraphType() ? 0x204 : 0x84;
    D_8012DF64[3] = getClut(0, 240);
    D_8012DF64[4] = getClut(0, 241);
    D_8012DF64[5] = getClut(0, 242);
    func_800EC9AC(D_800E0AEC, 256, 0);
}

// set up graphics env
void func_800ECDA8(void)
{
    int i;
    int tv_standard;
    DRAWENV *draw;
    DISPENV *disp;

    jt.wait_for_vsync();    // wait_frame
    jt.SetDispMask(0);   // SetDispMask
    current_buffer_idx = 0;
    gbuffer_swap();    // clear
    func_800ECD18();
    jt.SetDefDispEnv(&graph_buffers[0].disp, 0, 0, 256, 240);
    jt.SetDefDispEnv(&graph_buffers[1].disp, 0, 256, 256, 240);
    jt.SetDefDrawEnv(&graph_buffers[0].draw, 0, 256, 256, 240);
    jt.SetDefDrawEnv(&graph_buffers[1].draw, 0, 0, 256, 240);
    
    for (i = 0; i < 2; i++) {
        draw = &graph_buffers[i].draw;
        disp = &graph_buffers[i].disp;
        draw->isbg = 1;
        draw->r0 = 0;
        draw->g0 = 0;
        draw->b0 = 0;
        draw->tw = D_800ED398;
        draw->dtd = 0;
        draw->dfe = 0;

        tv_standard = jt.get_tv_system;

        disp->screen.x = 4;
        disp->screen.y = tv_standard == TV_PAL ? 12 : 36;
        disp->screen.w = 248;
        disp->screen.h = 216;
        disp->pad0 = tv_standard == TV_PAL ? 0 : 1;
    }
}


// ### DAS INPUT FUNCTIONS
s32 initial_delay = 0;
s32 repeat_delay = 0;
s32 face_wait = 0;
s32 nav_wait = 0;
s32 face_timer = 0;
s32 nav_timer = 0;

u32 face_prev = 0;
u32 nav_prev = 0;

s32 das_state = -1;

// set up DAS times based on framerate
void input_das_setup(void)
{
    if (jt.get_tv_system() == TV_PAL) {
        initial_delay = 8;
        repeat_delay = 3;
    } else {
        initial_delay = 12;
        repeat_delay = 5;
    }
    face_wait = initial_delay;
    nav_wait = initial_delay;
}

u32 input_das_read(void)
{
    u32 raw;
    u32 face_raw;
    u32 nav_raw;

    u32 face;
    u32 nav;

    raw = jt.PadRead();
    face_raw = raw & 0xF000;
    nav_raw  = raw & 0x08E0;
    face = 0;
    nav = 0;

    // state -1, no button is pressed
    if ((face_raw | nav_raw) == 0) das_state = -1;

    // positive edge, trigger input and start initial delay timer
    if (das_state == -1) {
        if (face_raw) {
            face_timer = 0;
            face_wait = initial_delay;
            face = face_raw;
            das_state = 0;
        }
        if (nav_raw) {
            nav_timer = 0;
            nav_wait = initial_delay;
            das_state = 1;
        }
    }

    // now we can decide if input should be triggered
    //   I changed the syntax a bit, I feel like this is more readable
    //   even if not as pretty
    // trigger if enough time has passed, and switch to the shorter interval
    if (das_state == 0) {
        if ((face_raw & face_prev) && (++face_timer > face_wait)) {
            face = face_raw;
            face_timer = 0;
            face_wait = repeat_delay;
        }
    } else
    if (das_state == 1) {
        if ((nav_raw & nav_prev) && (++nav_timer > nav_wait)) {
            nav = nav_raw;
            nav_timer = 0;
            nav_wait = repeat_delay;
        }
    }

    face_prev = face_raw;
    nav_prev = nav_raw;

    return face | nav;
}

// TODO: put das stuff in a seperate file, make variables static