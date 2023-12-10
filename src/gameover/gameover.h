// data from here
typedef struct {
    DISPENV disp;
    DRAWENV draw;
    u32     ot[4];   // layers
    void    *next;
    u32     prims[0x8000];
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



// function decls

void func_800EB894(void);
void play_effect(s32 arg);
// ASM ONE HERE
int func_800EB8F8();
// bounce animation
void func_800EBA08(void);   // set state to
void func_800EBA20(void);   // set state to
void func_800EBA40(void);   // update
// unused?
void func_800EBCE0(void);   // 
// robbit animation
void func_800EBCF0(void);   // set to
void seq_select(int idx);   // play anim
void func_800EBD5C(void);   // update and draw
// menu
void func_800EBEA8(void);   // reset/init
void func_800EBEB8(void);   // menu draw
void func_800EBF58(u32 buttons);    // 
void func_800EC098(void);
void func_800EC128(void);
void func_800EC14C(void);
void func_800EC23C(s32 arg);    // update from input (one of 4)
// background
void func_800EC268(void);   // update and draw
// main stuff
void render_routine(void);
void func_800EC358(void);
int main(void);
// gbuffer
void gbuffer_swap(void);
void gbuffer_render(void);
// sprites
void load_sprites(u32* data);
void _load_gbuffer(u16 *cluts, s32 z, s32 id, s32 x, s32 y, u8 col, s32 clutidx);
void load_gbuffer(s32 z, s32 idx, s32 offx, s32 offy, u8 col, s32 clutidx);
// textures
void func_800EC9AC(u32 *raw, s16 x, s16 y);
void func_800ECBB4(s16 x, s16 y, s16 w, s16 h, u8 col);
void func_800ECD18(void);   // init sprite system
void func_800ECDA8(void);   // init graph/gbuffer
// input stuff
void input_das_setup(void);
u32 input_das_read(void);

// weird event function
int func_800ED268(void);