
extern RECT D_800ED398;
extern s32  D_800ED3F4;
extern s32  screen_brightness;
extern s32  bounce_y;
// function decls

void func_800EB894(void);
void play_effect(s32 arg);
// ASM ONE HERE
void func_800EB8F8(u32 buttons);
// bounce animation
void func_800EBA08(void);   // set state to
void bigtext_anim_play_drop(void);   // set state to
void func_800EBA40(void);   // update
// unused?
void func_800EBCE0(void);   // 

// robbit animation

// menu
void func_800EBEA8(void);   // reset/init
void func_800EBEB8(void);   // menu_render
void func_800EC098(void);
void func_800EC128(void);
void func_800EC14C(void);
void update_routine(u32 buttons);    // update from input (one of 4)
// background
void func_800EC268(void);   // update and draw

// main stuff
//void update_routine(u32 buttons);    // 
void render_routine(void);
void func_800EC358(void);
int main(void);

// textures
void func_800ECBB4(s16 x, s16 y, s16 w, s16 h, u8 col);

// input stuff (no need for seperate header)
void input_das_setup(void);
u32 input_das_read(void);

// weird event function
int func_800ED268(void);