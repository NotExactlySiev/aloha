#include <ints.h>
#include <shared.h>

// imported
void func_800E77A8(void*);
extern GlobalData *glob;
extern const char *D_800EB948[14];

// block checksum
u32 func_800E1514(SavedData *block)
{
    u8 *data = (u8 *) block;
    u32 ret = 0;
    for (int i = 0; i < 256 - 4; i++) {
        ret += data[i];
    }
    ret = (ret + 0x004b0940) ^ 0xb120e5a8;
    ret = (ret + 0x00000d6b) ^ 0x94fd367c;
    return ret;
}

int func_800E1570(SavedData *block)
{
    return block->checksum == func_800E1514(block);
}

void func_800E15A4(void *callback)
{
    jt.mc_set_callback_a(callback);
    jt.mc_set_callback_b(callback);
    func_800E77A8(callback);
}

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E15FC);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E189C);

INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1928);

int func_800E799C(int port, int slot, u8 *src, int len, char *suffix);

void func_800E4D40();

// The callback for clicking YES on the save dialog.
//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1A88);
void func_800E1A88(void)
{
    glob->curr.checksum = func_800E1514(&glob->curr);
    int completion = func_800E0FD0(glob->curr.unkE2);
    glob->curr.unkE4 = glob->world;
    func_800E15A4(func_800E4D40);
    func_800E4D40();
    func_800E4D40();
    int rc = func_800E799C(0, glob->unk50C, (u8 *) &glob->curr, sizeof(glob->curr), D_800EB948[completion]);
    printf("bruh %d\n", rc);
    func_800E15A4(NULL);
    func_800E15FC();
    if (rc == 1) {
        glob->saved[glob->unk50C] = glob->curr;
        func_800E0B54(0x2600);
    } else {
        func_800E0B54(0x2900);
        func_800E14A4(-rc);
    }
}


//INCLUDE_ASM("asm/title/nonmatchings/1120", func_800E1BCC);
void func_800E1BCC(void)
{
    func_800E0C24();
    jt.mc_format(0);
    jt.mc_select_slot(0);
}
