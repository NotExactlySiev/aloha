#include "common.h"
#include <libspu.h>
#include <libgpu.h>

// stuff from main executable. TODO move these to a header, all execs need them
#define RANGE(a,b)    char _## a ##_## b [b-a+1]

// maybe this isn't just game config, but all vars shared between files?
typedef struct {
    //char raw[0x500];
    RANGE(0, 0x4FF);
    // game over screen vars
    s32 unk500;
    s32 unk504;
    u8  unk508;
    u8  unk509;
    u8  unk50A;
    u8  unk50B;
    RANGE(0x50C, 2047);    // TODO: figure out how large this whole thing really is
} config_t;

typedef int(*fnp)();
typedef union {
    fnp list[1024];
    // TODO: funcs struct (from the decomp file for main)
} jt_t;

extern jt_t jmptable;



// data from here
typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u32    ot[4];
    u32*   next;
    u32    prims[0x8000];
} graph_buffer_t;

// the uv field is encoded in 16 bits and needs to be unwrapped
// u has 5 sigbits, v has 7
#define U(s)   (((s).uv & 0x1F) << 3)
#define V(s)   ((((s).uv & 0x0FFF) >> 5) << 3)
typedef struct {
    s8  dx;
    s8  dy;
    u16 uv;
} sprt_t;

typedef struct {
    u32    count;
    sprt_t sprts[];
} sprt_group_t;

extern sprt_group_t* sprt_data[64];

// these might be not s32 but paired as structs?
s32* intarrs[3] = {
    { 13, 1, -1, 0 },
    { 0, 4, 1, 4, 2, 4, 3, 4, 8, 10, 9, 10, 10, 10, 11, 10, 12, 10, 13, 10, -1, 18 },
    { 16, 8, 17, 8, -1, 0},
};
s32* seq = 0;
s32 seq_val = 0;
s32 seq_wait = 0;

int D_800ED354[7] = { 32, 33, 34, 35, 36, 37, 32 };
SpuVolume D_800ED370 = { 0x7FFF, 0x7FFF };
s32 D_800ED374 = 0xFFFFDC00;

// this might be a struct
s32 D_800ED388 = 0;
s32 D_800ED38C = 0;
s32 D_800ED390 = 40;

s32 D_800ED394 = 0;
s32 D_800ED3B4 = 0;
s32 D_800ED3BC = 0;
s32 D_800ED3C4 = 0;
s32 D_800ED3CC = 0;
s32 D_800ED3D4 = 0;
s32 D_800ED3DC = 0;     // selected
s32 D_800ED3E4 = 0;
s32 D_800ED3EC = 0;
s32 D_800ED3F4 = 0;
s32 seq_idx = 0;
s32 seq_timer = 0;
jt_t *jtptr = &jmptable;

s32 D_800ED340[5] = { 40, 42, 41, 42, -1 };

// these change with tv standard
s32 D_800ED384 = 1200;
s32 D_800ED424 = 0;
s32 D_800ED42C = 0; // max sprite index (sprite count)

s32 current_buffer_idx;               // current buffer id
graph_buffer_t  graph_buffers[2];    // buffers
graph_buffer_t *current_buffer;       // current

u16 D_8012DF64[6];      // global cluts for this file

#define JTFUNC(id)  (*jtptr->list[id])

// decls

u32 func_800ED09C(void);


// functions

void func_800EB894(void)
{
    D_800ED3CC = 0;
    D_800ED3D4 = 0;
    D_800ED3EC = 0;
    D_800ED3F4 = 0;
}

void func_800EB8C0(s32 arg)
{
    JTFUNC(0x311)(arg, 0x3e, 100);
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EB8F8);

void func_800EBA08(void)
{
    D_800ED3B4 = 0x00005F00;
    D_800ED3BC = 0;
}

void func_800EBA20(void)
{
    D_800ED374 = 0x00005F00;
    D_800ED3BC = 0;
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBA40);

void func_800EBCE0(void)
{
    D_800ED3C4 = 0;
}

void func_800EBCF0(void)
{
    func_800EBD10(0);
}

void func_800EBD10(int idx)
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
        load_gbuffer(1, seq_val, 0x78, 0x78, D_800ED3CC, 0);
        return;
    }

    // don't know what this part does
    temp_v1_2 = (s32) D_800ED374 >> 8;
    if (temp_v1_2 > 0x77) {
        D_800ED3F4 = -1;
        return;
    }

    func_800ECBB4(0x60, temp_v1_2 + 0x10, 0x30, 0x77 - temp_v1_2, D_800ED3CC);
}

void func_800EBEA8(void)
{
    D_800ED3DC = 0;
}

void func_800EBEB8(void)
{
    load_gbuffer(2, 0x20, 0x44, 0x90, D_800ED3CC, 0);
    load_gbuffer(2, 0x21, 0x44, 0xA0, D_800ED3CC, D_800ED3DC == 0);
    load_gbuffer(2, 0x22, 0x44, 0xB0, D_800ED3CC, D_800ED3DC == 1);
}

INCLUDE_ASM("asm/gameover/nonmatchings/C094", func_800EBF58);

void func_800EC098(void)
{
    func_800EBA08();
    func_800EBCE0();
    func_800EB894();
    func_800EBEA8();
    D_800ED3E4 = 0x2D;

    if (JTFUNC(7)() == TV_PAL) {
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

    tmp = D_800ED3DC == 1 ? 0xAB : 0x9B;
    load_gbuffer(2, D_800ED390, 0x44, tmp, D_800ED3CC, 0);
}

void func_800EC23C(s32 arg)
{
    func_800EB8F8();
    func_800EBF58(arg);
}

// not sure about this one. might be wrong, but doesn't seem really broken.
// seems to repeat and action for diagonal lines 128 pixels apart in both directions
void func_800EC268(void)
{
    int i,j;

    D_800ED394 = (D_800ED394 + 1) & 0x7F;
    for (i = 0; i < 4; i++)
        for (j = 0; j < 4; j++)
            load_gbuffer(0, 0x30, 
                ((i << 7) - D_800ED394) - 0x40, 
                ((j << 7) + D_800ED394) - 0x40, 
                D_800ED3CC / 2, 2);
}


void func_800EC318(void)
{
    func_800EBA40();
    func_800EBEB8();
    func_800EBD5C();
    func_800EC268();
    func_800EC14C();
}

// closely matching with 4.1 -O1
void func_800EC358(void)
{
    config_t* conf;
    conf = JTFUNC(0x14)();
    
    conf->unk500 = 0;
    conf->unk508 = 1;
    conf->unk509 = 0;
    conf->unk50A = 0;
    conf->unk50B = 0;
    conf->unk504 = 3;
}


int main(void)
{
    u32 temp_s0;
    s32 var_a0;
    s32 var_v0;
    u8 temp_v0;
    u8* temp_s2;
    int choice;
    
    func_800ED268();    // deliver events
    func_800ECDA8();    // set up graphics env
    func_800EC098();    // set up some constants
    
    JTFUNC(0x30F)();
    
    func_800ED01C();
    temp_s2 = JTFUNC(0x14)();   // get shared data
    JTFUNC(0x129)(&D_800ED370); // set global vol void(SpuVolume*)
    JTFUNC(0x305)(0x3000);
    JTFUNC(0x332)(0);    // mc_set_some_var

    // play some audio thing
    temp_v0 = temp_s2[0x514];
    if (temp_v0 > 5) temp_v0 = 5;
    JTFUNC(0x331)(D_800ED354[temp_v0]); // int(int)
    // cycle through both buffers once
    func_800EC608();    // clear
    func_800EC684();    // draw
    func_800EC608();    // clear
    func_800EC684();    // draw
    JTFUNC(0x181)(0);    // call_wait_frame
    JTFUNC(0x183)(1);    // call_SetDispMask
    
    func_800EBD10(1);
    
    do {
        temp_s0 = func_800ED09C();  // read input
        func_800EC608();            // swap and clear
        func_800EC23C(temp_s0);     // logic i'm guessing?
        func_800EC318();            // 
        func_800EC684();
    } while (D_800ED3D4 != 4);
    
    JTFUNC(0xC3C)();

    choice = 0;
    
    if (D_800ED3DC == 0) {
        temp_s2[0x515] = 0;
        func_800EC358();
        choice = 1;
    }
    JTFUNC(0xC)(choice);
}


void func_800EC608(void)
{
    // swap buffer
    current_buffer_idx = !current_buffer_idx;
    current_buffer = &graph_buffers[current_buffer_idx];
    // clear ot and reset prim buffer
    JTFUNC(0x187)(current_buffer->ot, 4);
    current_buffer->next = current_buffer->prims;
}

void func_800EC684(void)
{
    JTFUNC(0x102)();
    JTFUNC(0x18C)(0);
    JTFUNC(0x191)(0);
    // put env and draw
    JTFUNC(0x185)(current_buffer->disp);
    JTFUNC(0x186)(current_buffer->draw);
    // draw ot
    JTFUNC(0x189)(current_buffer->ot);
}

// load sprite data
void load_sprites(u32* raw)
{
    s32 i;
    sprt_group_t** gp;
    // first byte is the number of groups
    D_800ED42C = *raw++;
    gp = sprt_data;
    for (i = 0; i < D_800ED42C; i++) {
        *gp++ = raw;
        // skip past to the next group (count entries and 1 size byte)
        raw += (*gp)->count + 1;
    }
}

// put loaded sprite data into ots
void _load_gbuffer(u16 *cluts, s32 arg, s32 idx, s32 offx, s32 offy, u8 col, s32 clutidx)
{
    SPRT_8 *p;
    sprt_group_t *group;
    sprt_t *s;
    s32 i;
    s16 x,y;
    //u32 count;

    if (idx > D_800ED42C) return;
    
    p = current_buffer->next;
    group = sprt_data[idx];
    for (i = 0; i <= group->count; i++) {
        s = &group->sprts[i];
        x = offx + s->dx;
        y = offy + s->dy;
        // TODO: take out the magic numbers
        if (!((x < 0xfd) && (x > -9) && (y < 0xe5) && (y > -9))) continue;
        setSprt8(p);
        setUV0(p, U(*s), V(*s));
        setRGB0(p, col, col, col);
        setXY0(p, x, y);
        p->clut = cluts[clutidx];       
        addPrim(current_buffer->ot[arg], p);
        current_buffer->next += 1;
    }

    // rest of it remains??? what about draw env
}

void load_gbuffer(s32 arg, s32 idx, s32 offx, s32 offy, u8 col, s32 clutidx)
{
    _load_gbuffer(D_8012DF64, arg, idx, offx, offy, col, clutidx);
}

// cluts
extern u16 D_800EA96C[256];
extern u16 D_800EAB6C[256];
extern u16 D_800EAD6C[256];
// image (background?)
extern u16 D_800EAF74[1152];

// or maybe this load the background?
void func_800EC9AC(u32 raw, s16 x, s16 y)
{
    s32 i,j;
    RECT rect = {
        .w = 4,
        .h = 8,
        .x = x,
        .y = y,
    };

    // I'm not sure what this part is loading, but the cluts are after this
    for (i = 0; i < 32; i++) {
        for (j = 0; j < 32; j++) {
            JTFUNC(0x18A)(&rect, raw);  // LoadImage
            JTFUNC(0x18C)(0);           // DrawSync
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
    JTFUNC(0x18A)(&rect, D_800EA96C);
    JTFUNC(0x18C)(0);

    rect.y = 240;
    JTFUNC(0x18A)(&rect, D_800EAB6C);
    JTFUNC(0x18C)(0);

    rect.y = 240;
    JTFUNC(0x18A)(&rect, D_800EAD6C);
    JTFUNC(0x18C)(0);

    // load the bunny image
    rect.x = 256;
    rect.y = 256;
    rect.w = 24;
    rect.h = 48;
    JTFUNC(0x18A)(&rect, D_800EAD6C);
    JTFUNC(0x18C)(0);
}

extern RECT D_800ED398;

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
    p->tpage = JTFUNC(400)() ? 0x224 : 0x94;    // GetGraphType
    p->clut  = 0x3c00;
    addPrim(current_buffer->ot[1], p);

    tpage = JTFUNC(400)() ? 0x224 : 0x94;
    q = nextPrim(p);
    JTFUNC(0x18D)(q, 0, 0, tpage, &D_800ED398); // SetDrawEnv
    addPrim(current_buffer->ot[1], q);

    current_buffer->next = nextPrim(q);
}

extern u32 D_800E0000[];    // sprite metadata (pos and uv)
extern u32 D_800E0AEC[];    // background? please be background

void func_800ECD18(void)
{
    load_sprites(D_800E0000);
    D_8012DF64[2] = JTFUNC(400)() ? 0x204 : 0x84;
    D_8012DF64[3] = 0x3c00; 
    D_8012DF64[4] = 0x3c40;
    D_8012DF64[5] = 0x3c80;
    func_800EC9AC(D_800E0AEC, 256, 0);
}

// set up graphics env
void func_800ECDA8(void)
{
    int i;
    int tv_standard;
    DRAWENV *draw;
    DISPENV *disp;

    JTFUNC(0x181)();    // wait_frame
    JTFUNC(0x183)(0);   // SetDispMask
    current_buffer_idx = 0;
    func_800EC608();    // clear
    func_800ECD18();
    JTFUNC(0x18E)(graph_buffers[0].disp, 0, 0, 256, 240);
    JTFUNC(0x18E)(graph_buffers[1].disp, 0, 256, 256, 240);
    JTFUNC(0x18F)(graph_buffers[0].draw, 0, 256, 256, 240);
    JTFUNC(0x18F)(graph_buffers[1].draw, 0, 0, 256, 240);
    
    for (i = 0; i < 2; i++) {
        draw = &graph_buffers[i].draw;
        disp = &graph_buffers[i].disp;
        draw->r0 = 0;
        draw->g0 = 0;
        draw->b0 = 0;
        draw->tw = D_800ED398;
        draw->dtd = 0;
        draw->dfe = 0;

        tv_standard = JTFUNC(7)();

        disp->screen.x = 4;
        disp->screen.y = tv_standard == 1 ? 12 : 36;
        disp->screen.w = 248;
        disp->screen.h = 216;
        disp->pad0 = tv_standard == 1 ? 0 : 1;
    }
}

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
// input_das_setup
void func_800ED01C(void)
{
    if (JTFUNC(7)() == TV_PAL) {
        initial_delay = 8;
        repeat_delay = 3;
    } else {
        initial_delay = 12;
        repeat_delay = 5;
    }
    face_wait = initial_delay;
    nav_wait = initial_delay;
}

// input_das_read
u32 func_800ED09C(void)
{
    u32 raw;
    u32 face_raw;
    u32 nav_raw;

    u32 face;
    u32 nav;

    raw = JTFUNC(0xF0)();
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

// This has more functions in it, and I have removed main, that's why it's still here
INCLUDE_ASM("asm/gameover/nonmatchings/C094", misc);