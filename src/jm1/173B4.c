#include "common.h"
#include <libgpu.h>
#include <libetc.h>
#include "gbuffer.h"
#include "entity.h"
#include "mesh.h"

#include "shared.h"

// todo: the OT in this one is wrong. also it's just another gbuffer
typedef struct {
    s16         count;
    u32         ot[2];
    SPRT_8     *nextfree;
    u32         prims[2048];
    DR_MODE     draw_mode;
} TextOT;

typedef struct {
    u8 u, v;
    short pad;
} TextUV;

extern Entity player_entity;

// entity lists

typedef struct {
        LinkedList head;
        LinkedList tail;
} List;

List entity_list_0 = {};
List entity_list_1 = {};
List entity_list_2 = {};
List entity_list_free = {};

// fast sin and cos from our own LUT
#define sinf(a)     (sin_lut[(a) & 0xFFF])
#define cosf(a)     (sin_lut[((a)+0x400) & 0xFFF])

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6BB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6BC4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6DA4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6EB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6F1C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6FB8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6FC8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C6FD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7034);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C70AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7118);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7230);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C72C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7328);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C738C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7430);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C74DC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C755C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C75BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C762C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7724);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7784);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7BCC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7C30);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7C64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7CA0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7D24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7D68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7D90);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C7DE8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C80A0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C80F0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C81BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8288);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C82C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8348);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8420);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8438);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8520);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C876C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C89F8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8CC8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8D00);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8D20);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8D70);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8DBC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8DEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C8E10);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9078);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9378);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C94F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C96E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9714);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C98AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C98D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9960);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C99B0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9A00);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9A88);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9B10);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9B6C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9BE0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9CA8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9D70);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9DF4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9E88);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9F14);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800C9F94);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA00C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA058);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA1B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA2C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA3A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA4B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA5C0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA6A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA7B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA808);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA864);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA9C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CA9F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAA18);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAB3C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAC60);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAC90);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CACC0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CACF0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAD10);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CADB0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAE50);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAE98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAEE0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAF28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAF54);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAFA8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAFD0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CAFF8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB01C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB044);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB06C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB088);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB0C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB0E8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB110);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB138);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB154);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB190);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB1B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB1FC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB21C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB260);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB288);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB2AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB2D0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB2E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB300);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB310);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB334);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB344);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB39C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB3F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB418);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB590);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB710);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB888);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CB9FC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CBB70);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CBCE4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CBD34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CBDEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CBEC0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC268);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC338);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC368);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC398);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC3C8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC3F8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC428);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC43C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC454);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC470);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC530);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC724);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC84C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC8B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC8E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC8F0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC910);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC9B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CC9FC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCB60);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCC68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCC94);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCCAC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCCBC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCD34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCD6C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCDB8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCDF0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCE1C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CCF74);

// ^ these are standard lib functions 

// custom math functions. math.c?

extern s32 D_801028F4;  // rng
extern s32 D_801028FC;  // prng

// seed arrs
extern s8 D_8010154C[64];   // seed
extern s8 D_8010158C[16];   // buttons

// working arrs
extern s8 D_80106D28[64];
extern s8 D_80106D68[64];

//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD010);
void func_800CD010(void)
{
    D_801028F4 = 0;
    D_801028FC = 0;
    for (int i = 0; i < 64; i++) {
        D_80106D28[i] = D_8010154C[i];
        D_80106D68[i] = D_8010154C[i];
    }
}

s16 sin_lut[4096];

void make_sin_lut(void)
{
    for (int i = 0; i < 4096; i++) {
        sin_lut[i] = func_800CBCE4(i);   // rsin
    }
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD0BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD158);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD1C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD2C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD3BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD444);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD4D4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD550);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD684);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD6B0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD6BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD780);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD7A0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CD920);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDA40);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDAE0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDBA4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDCD0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDD68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDDD4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDF28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CDFC4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE098);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE0E4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE0F8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE108);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE158);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE168);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE2E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE304);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE324);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE3A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE3F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE484);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE658);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE668);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE69C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE6AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE6FC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE77C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE820);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE8A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE8D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE9A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE9B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEA14);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEA48);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEA7C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEAAC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEADC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEB2C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEB6C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEC30);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CECB8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CED54);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEDBC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEE24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEE34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEE44);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEE9C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEF24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF010);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF064);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF08C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF0EC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF19C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF1E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CF308);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CFD78);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CFE28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CFFB0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0100);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0138);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0224);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0370);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0428);

extern s32 entity_free_count;
extern Entity  entity_array[128]; // entity array
extern Entity *entity_ptrs[128]; // entity pointers
extern s32 D_801029A4;


LinkedList *get_list1_head(void)
{
    return &entity_list_1.head;
}

LinkedList *get_list1_tail(void)
{
    return &entity_list_1.tail;
}

LinkedList *get_list2_head(void)
{
    return &entity_list_2.head;
}

LinkedList *get_list2_tail(void)
{
    return &entity_list_2.tail;
}

LinkedList *get_list0_head(void)
{
    return &entity_list_0.head;
}

LinkedList *get_list0_tail(void)
{
    return &entity_list_0.tail;
}

// shouldn't it be list_insert_before?
void entity_insert_before(LinkedList *list, LinkedList *node)
{
    LinkedList *oldprev = list->prev;
    list->prev = node;
    node->next = list;
    node->prev = oldprev;
    oldprev->next = node;
}

void entity_insert_after(LinkedList *list, LinkedList *node)
{
    LinkedList *oldnext = list->next;
    list->next = node;
    node->prev = list;
    node->next = oldnext;
    oldnext->prev = node;
}

void entity_detach_from_list(LinkedList *node)
{
    node->prev->next = node->next;
    node->next->prev = node->prev;
}

// TODO: better names for these two? new and free? alloc?
Entity *entity_create(void)
{
    if (entity_free_count == 0) return 0;
    entity_free_count -= 1;

    Entity *ret = entity_list_free.head.next;
    entity_detach_from_list(ret);
    ret->unk1 = 0;

    return ret;
}

void entity_destroy(Entity *e)
{
    e->unk2 = 0;
    entity_detach_from_list(e);
    entity_insert_after(&entity_list_free.head, e);
    entity_free_count += 1;
}


INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D058C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D05F0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0764);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0784);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D07A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D07C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0808);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0824);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0840);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D08E8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D09EC);

// level_entity_ctors
extern void (*D_8011EE78[64])(Entity*, Spirit*);

// entity call constructor
//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0AA4);
void func_800D0AA4(Entity *e, Spirit *spirit)
{
    u32 type = spirit->type & 0x7F;

    if (type < 0x40) {
        void (*ctor)(Entity*, Spirit*);
        ctor = D_8011EE78[type];
        if (ctor == 0)
            entity_destroy(e);
        else
            ctor(e, spirit);
    } else
    // isn't level specific
    switch (type) {
    case 0x40:  // jetpod
    func_800D2618(e, spirit);
        break;
    case 0x41:
    func_800D2A8C(e, spirit);
        break;
    case 0x42:
    func_800D3D28(e, spirit);
        break;
    case 0x43:
    func_800D45C4(e, spirit);
        break;
    case 0x44:
    func_800D2184(e, spirit);
        break;
    default:
    entity_destroy(e);
        break;
    }
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0B98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0C08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0C28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0C48);

//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0C5C);
// entity lists init
void func_800D0C5C(void)
{
    func_800D0C48(&entity_list_0.head, &entity_list_0.tail);
    func_800D0C48(&entity_list_2.head, &entity_list_2.tail);
    func_800D0C48(&entity_list_1.head, &entity_list_1.tail);
    entity_free_count = 128;

    // TODO: entity size should be correct 
    // initialize all entities as free

    entity_list_free.head.prev = 0;
    LinkedList *last = &entity_list_free.head;
    for (int i = 0; i < 128; i++) {
        Entity *e = &entity_array[i];
        entity_ptrs[i] = e;
        e->unk0 = i;    // id
        e->unk1 = 0;    // active
        LinkedList *node = (LinkedList*) e;
        // connect to tail
        entity_list_free.tail.prev = node;
        // connect to last element
        last->next = node;
        node->prev = last;
        
        last = node;
    }
    last->next = &entity_list_free.tail;
    entity_list_free.tail.next = 0;

    Entity *e = entity_create();
    func_800D0C08(0, 0, 0);
    func_800D0C28(0, 0, 0);
    func_800D058C();
    D_801029A4 = 1;
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0D70);
/*void func_800D0D70(Entity* e, u32 offset)
{
    Component* comp;
    Entity* p = e->next;
    offset = (offset-8)/sizeof(Component);
    while (p->next != 0) {
        comp = &p->comp0 + offset; // this is dumb but game does it like this
        if ((comp->disabled == 0) && (comp->func != 0)) comp->func(p, comp);
        p = p->next;
    }
}*/

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0DEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0E24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0E5C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0E8C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0EB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0EEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0F24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0F4C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0F74);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0F9C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0FC4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D0FEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1014);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1050);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1080);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1180);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D11A0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D11C0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D11E4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D13EC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1484);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1494);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D14A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D154C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D156C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1798);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D17CC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1800);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1834);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1868);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D19D0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1A68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1B78);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1CBC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D1F90);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D207C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D2184);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D22B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D239C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D24C0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D2618);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D277C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D27B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D2824);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D29C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D2A8C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D2B74);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D2F58);

// actually mesh metadata struct TODOs
extern u32 D_8011EFB8;

//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D30E4);
// entity_coin_render
// TODO: this isn't complete
void func_800D30E4(Entity *e)
{
    SVECTOR *cam = SCRTCHPAD(0x3CA);
    SVECTOR pos;
    SVECTOR rot;
    int meshid;
    // TODO: make the coin type in union
    if (e->sub.unk[0] < 0) return;  // lifetime?
    
    // is visible? these are flags I think TODO
    e->unk5 |= 0x8000;
    if (e->unk5 & 1) return;


    pos.vx = e->pos_x >> 12;
    pos.vy = e->pos_y >> 12;
    pos.vz = e->pos_z >> 12;

    rot.vx = -e->angle_x;
    rot.vy = e->angle_y;
    rot.vz = e->angle_z;

    meshid = e->model[1] + D_8011EFB8;

    // bouncing animation and... something else?
    pos.vy += (6 * sinf(e->angle_x) - (e->range_y / 2) * cosf(e->angle_x)) >> 12;

    func_800E5E60(&pos, &rot, meshid);

    pos.vy = e->max_y + 2;
    if (cam->vy >= pos.vy || e->max_y > 0) return;
    
    // draw shadow
    // TODO: make sin_lut lookup a macro?
    s32 tmp = (e->range_y / 2) * sin_lut[e->angle_x & 0xFFF];
    tmp /= ONE;

    s32 offz = tmp * sin_lut[(e->angle_y + 0xC00) & 0xFFF];
    s32 offx = tmp * sin_lut[(e->angle_y + 0x800) & 0xFFF];

    pos.vx += offx / ONE;
    pos.vz += offz / ONE;

    func_800E5E60(&pos, &rot, meshid | 0x4000);

}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3378);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D35A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3700);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D37C0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3818);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D38B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3904);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3C08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3D28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3E8C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3EC4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3F64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D3F90);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4018);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D42E8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4480);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D45C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D46CC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D484C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4870);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4880);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D48C0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4928);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4A60);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4A74);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4A84);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4A94);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4AA4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4AC4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4BA4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4BB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4BD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4BFC);

extern s16 menu_item_positions[3][4];
extern u32 menu_selection;
extern u32 menu_is_visible;
extern u32 menu_animation_timer;
// menu_render
//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4CC8);
void func_800D4CC8(void)
{
    s16* pos;
    s32 text_sprite;
    s32 icon_frame;
    if (menu_is_visible) {
        icon_frame = menu_animation_timer >> 3;
        if (icon_frame == 3) icon_frame = 1;
        for (int i = 0; i < 3; i++) {
            pos = menu_item_positions[i];
            text_sprite = 0x120+i*2;
            if (i == menu_selection) {
                ui_draw_menu_sprite(pos[2]+124, pos[1]+116, icon_frame+0x119, 0x808080, 0);
                text_sprite += 1;
            }
            // draw text
            ui_draw_menu_sprite(pos[0]+124, pos[1]+116, text_sprite, 0x808080, 0);
        }
        // draw box
        ui_draw_menu_sprite(124, 116, 0x118, 0x2808080, 0);
        ui_draw_menu_sprite(124, 116, 0x118, 0x2808080, 0);
    }
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4E30);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4E64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D4E9C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D500C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5038);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5190);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D54B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D56BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5778);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5A48);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5B7C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5CC8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D5D68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D60C8);

// render robbit. is acting really weird so I'm gonna disable it for now
//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6190);
func_800D6190() {}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D62F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6450);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6668);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D66F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D67E4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6804);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6944);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D69D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6A58);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6AA0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6AB8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6B60);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C18);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C40);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C50);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C80);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6C90);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6CA0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6CB0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6CDC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6D08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6D18);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6E74);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6EEC);

//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D6F14);
func_800D6F14() {}  // FIXME !!!

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D71A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7310);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D73A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D79C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7A64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7AC0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7B3C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7BDC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7C70);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D7FD4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D81D4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8374);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8514);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D861C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D86E4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8720);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8730);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8788);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D88B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8CEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D8F40);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9150);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9354);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D95E8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D96B0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D973C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D99C8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D99E8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9A00);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9CF8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9DD4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9E40);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9EAC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9F2C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800D9F98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA018);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA03C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA060);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA07C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA0D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA134);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA144);

u32 *D_80102ACC;    // section1 base
s32  D_80102ADC;    // render_range_thing
SVECTOR D_80122EE8[32][32];    // objs, or whatever it is. center of tiles?
extern s32   D_80102AE4;    // area side len
extern s32   D_80102AD4;    // object id offset

extern s32 D_80142D48; // render distance vertical
extern s32 D_80141460; // render distance horizontal

extern u16 D_80121CE8[];
extern SVECTOR D_80121EE8[];    // position offsets
extern SVECTOR D_801226E8[];   // rotation vectors

// load level objects (section1)
// this has to do with culling outside of camera objects
// dunno how it works :/
void func_800DA154(void *data)
{
    SVECTOR *vecmin = SCRTCHPAD(0);
    SVECTOR *vecmax = SCRTCHPAD(8);
    u32 (*offsets)[32][32] = data;

    D_80102ACC = data;

    for (int i = 0; i < 32; i++)
        for (int j = 0; j < 32; j++) {
            u32 offset = (*offsets)[i][j];
            if (offset == 0) continue;
            u16 *entries = data + offset;
            u16 count = *entries;
            SVECTOR *objs = entries + 1;

            // tile position (its center I think. or bound?)
            *vecmax = *vecmin = (SVECTOR) {
                0x400 | (0x800 * (i - 16)),
                0,
                0x400 | (0x800 * (j - 16))
            };

            for (int k = 0; k < count; k++) {
                SVECTOR *obj = &objs[k];
                u16 meshid = D_80102AD4 + obj->pad;
                int range = func_800E62F0(meshid);

                if (vecmin->vx > (obj->vx - range)) vecmin->vx = obj->vx - range;
                if (vecmax->vx < (obj->vx + range)) vecmax->vx = obj->vx + range;

                if (vecmin->vy > (obj->vy - range)) vecmin->vy = obj->vy - range;
                if (vecmax->vy < (obj->vy + range)) vecmax->vy = obj->vy + range;

                if (vecmin->vz > (obj->vz - range)) vecmin->vz = obj->vz - range;
                if (vecmax->vz < (obj->vz + range)) vecmax->vz = obj->vz + range;
            }

            D_80122EE8[i][j].vx = (vecmin->vx + vecmax->vx) / 2;
            D_80122EE8[i][j].vy = (vecmin->vy + vecmax->vy) / 2;
            D_80122EE8[i][j].vz = (vecmin->vz + vecmax->vz) / 2;
            s32 len_x = (vecmax->vx - vecmin->vx) / 2;
            s32 len_y = (vecmax->vy - vecmin->vy) / 2;
            s32 len_z = (vecmax->vz - vecmin->vz) / 2;
            s32 maxlen = len_x;
            if (len_y > maxlen) maxlen = len_y;
            if (len_z > maxlen) maxlen = len_z;
            D_80122EE8[i][j].pad = (5792*maxlen) >> 12;     // sqrt(2)
        }
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA46C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA498);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA4A8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA4C8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA4D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA4E8);
// FOR NOW
// render level objects
void _func_800DA4E8(void)
{
    return;
    SVECTOR *tmp = 0x1F800000;
    SVECTOR *cam = 0x1F8003C8;
    Mesh *mesh = 0x1F800010;

    // top left corner of the chunks we're gonna draw
    s32 player_chunk_x = (2*cam->vx - D_80102ADC*ONE + 16*ONE) >> 12;
    s32 player_chunk_z = (2*cam->vz - D_80102ADC*ONE + 16*ONE) >> 12;

    // TODO: when this is turned on the entities get weird. memory corruption?
    /*for (int i = 0; i < D_80102AE4; i++) {
        for (int j = 0; j < D_80102AE4; j++) {
            s32 chunk = (player_chunk_x+i)*32 + (player_chunk_z+j);
            u32 sect_off = D_80102ACC[chunk];
            SVECTOR *thing = &D_80122EE8[chunk];
            if (sect_off == 0) continue;
            // TODO: rotation stuff
            tmp->vx = thing->vx - cam->vx;
            tmp->vy = thing->vy - cam->vy;
            tmp->vz = thing->vz - cam->vz;
            mesh->a = mesh->b = thing->pad;

            s32 mag = func_800F4354(tmp, tmp, mesh);
            if (mag < 0) continue;

            u16 *sect = D_80102ACC + sect_off/4;
            u16 count = *sect;
            SVECTOR *pos = sect + 1;
            for (int k = 0; k < count; k++) {
                s16 dx = cam->vx - pos->vx;
                s16 dy = cam->vy - pos->vy;
                s16 dz = cam->vz - pos->vz;
                u16 id = D_80121CE8[pos->pad];
                if (-D_80141460 <= dx && dx <= D_80141460
                 && -D_80142D48 <= dy && dy <= D_80142D48
                 && -D_80141460 <= dz && dz <= D_80141460) {
                    if (id & 0x8000) {
                        tmp->vx = pos->vx + D_80121EE8[pos->pad].vx;
                        tmp->vy = pos->vy + D_80121EE8[pos->pad].vy;
                        tmp->vz = pos->vz + D_80121EE8[pos->pad].vz;
                        func_800E5E60(tmp, &D_801226E8[pos->pad], D_80102AD4 + (id & 0x7FFF) + 0x10000);
                    } else {
                        //jt.printf("ID %d, %d, %d\n", id, pos->vx, pos->vy);
                        func_800E5E60(pos, 0, D_80102AD4 + id + 0x10000);
                    }
                }
                pos += 1;
            }
        }
    }*/


    /*for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            SVECTOR pos = {
                -512*i, 0, -512*j, 0
            };
            func_800E5E60(&pos, 0, D_80102AD4 + 1 + 0x10000);
        }
    }*/
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA85C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA910);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DA998);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DAA60);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DAAA4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DAAB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DAAFC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DAB0C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DABF8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DACD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DAD10);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DADD0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DADE0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB018);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB164);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB21C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB2B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB338);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB348);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB394);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB400);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB580);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB65C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB66C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB6B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB798);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB800);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB838);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB87C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB890);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB8A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB8B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB8D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB8F8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB928);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB994);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB9A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB9BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DB9EC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBA08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBA18);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBBE4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBBF4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC04);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC14);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC44);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC54);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC78);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC88);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBC98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBD0C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBD1C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBD2C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DBDB0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DC00C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DC0CC);

extern int D_80102BFC;  // peak height?

extern int D_80102C34;

extern int D_80102724; // auto lookdown dangle
extern int D_80102738;

extern int D_80102C0C;  // jumps count
extern int D_80102C14;  // airjump window
extern int D_80102C1C;  // strafing thingy
extern int D_80102C4C;
extern int D_80102C5C;
extern int D_80102C6C;
extern int D_80102C8C;  // winning animation is playing
extern int D_80102C9C;

extern int D_80102710;  // jump force
extern int D_80102718;  // jump timer?

void func_800E5458(s16, s16, s16);

// handle player movement
// main player movement state machine. has 4 main states:
// grounded, jump, air jump, falling. but also code for transitioning into each
// state and states that run briefly before the actual state
// the control flow is fucked
void func_800DC4C4(void)
{
    //jt.printf("%d\n", player_entity.comp1.state);
    switch (player_entity.comp1.state) {

make_0: // landing
    D_80102C6C = 0;
    D_80102C4C = 0x800;
    player_entity.vel_y = 0;
    func_800DC9EC(&player_entity);  // land
    D_80102BFC = player_entity.max_y;
    player_entity.comp1.state = 0;
    case 0: // grounded
        if (D_80102C9C > 0) {
            D_80102C9C = 0;
        }
        D_80102C6C = 0;
        D_80102724 = 0;
        D_80102BFC = player_entity.max_y;
        // this and ground jump are more related than I thought. both cases
        // of make_1 are contained here and can be put in a single if
        if (player_entity.on_air == 0 || player_entity.vel_y < 0) {
            // we're suddenly not on ground anymore. react approprietly
            D_80102724 = -16;
            D_80102C0C = 0;
            D_80102C14 = 0;
            if (D_80102C9C > 0) {   // do we actually need this?
                D_80102C9C = 0;
            }
            player_entity.unk7 = D_80102718;
            if (player_entity.vel_y >= 0) goto make_5;

            // bouncing (off an enemy, or maybe something else)
            D_80102C6C = 0x300;
            D_80102724 = -32;
            player_entity.comp1.unk0 = 1;
            player_entity.comp1.state = 1;
            func_800CE304(0x500, 0x50, 0x3F);
        } else {
            D_80102C5C = func_800D9E40(&player_entity);
            if (func_800D9F2C(&player_entity) 
             || func_800D9DD4(&player_entity) 
             || (D_80102C34 & D_80102738) == 0) break;
            
            func_800CE304(0x300, 0x50, 0x3F);
            D_80102C9C = 0;
            D_80102C6C = 0x300;
            D_80102724 = 0; // don't think we need this here?
            D_80102C0C = 0;
            D_80102C14 = 0;
            player_entity.comp1.unk0 = 24;
            player_entity.comp1.state = 1;
            player_entity.vel_y = -D_80102710;
            player_entity.unk7 = D_80102718;  // gravity? ddy
        }

    case 1: // jump (just)
        if (D_80102C34 & D_80102738 == 0 || --player_entity.comp1.unk0 == 0) {
            player_entity.comp1.state = 2;
            player_entity.unk7 = (player_entity.comp1.unk0 + 2) * 0x300 + D_80102718;
        }
    case 2: // jump
        player_entity.on_air = 0;
        if (player_entity.vel_y > 0) goto make_5;   // going down

        D_80102C14 = 0;
        if (func_800DCB50()) goto make_3;

        break;


make_3:
    func_800CE304(0x400, 0x5A, 0x3F);
    D_80102C6C = 0x300;
    D_80102C1C = 0;
    D_80102724 = -16;
    D_80102C9C = 0;
    player_entity.comp1.unk0 = 24;
    player_entity.comp1.state = 3;
    player_entity.vel_y = -D_80102710;
    player_entity.unk7 = D_80102718; 
    case 3: // air jump (just)
        if (D_80102C34 & D_80102738 == 0 || --player_entity.comp1.unk0 == 0) {
            player_entity.unk7 = player_entity.comp1.unk0 * 0x300 + D_80102718;
            player_entity.comp1.state = 4;
            player_entity.comp1.unk0 = 0;
        }
    case 4: // air jump
        player_entity.on_air = 0;
        if (player_entity.comp1.unk0 == 0 && func_800DCB50()) goto make_3;
        if (player_entity.vel_y > 0) {
            D_80102724 = -32;
            goto make_5;
        }
        break;


make_5:
    player_entity.comp1.state = 5;
    case 5: // falling
        D_80102C6C = 0;
        //jt.printf("timer: %d\n", D_80102C14);
        if (func_800DCB50()) goto make_3;

        if (player_entity.vel_y <= 0)
            player_entity.unk7 = D_80102718;
        if (player_entity.on_air != 0) goto make_0;

        break;
    }

    // state machine is determined. do the actual physics now

    func_800DD968();                    // manual vertical look?
    func_800DD994(&player_entity);      // strafe?

    func_800DD158(&player_entity);      // 4 looking and rotation stuff
    func_800DD794(&player_entity);
    func_800DD534(&player_entity);
    func_800DD750(&player_entity);

    func_800DCEE0(&player_entity);      // forward (set actual vel vector)
    func_800DCFD0(&player_entity);      // gravity (update dy)
    func_800DCCB0(&player_entity);      // movement (update position)

    // and set the camera too

    // off from looking up and down
    int offy = sinf(player_entity.angle_x) >> 6;
    if (offy > 0) offy = 0;
    if (D_80102C8C == 0)
    {
        //
        offy -= func_800DDB58() + 0x90;
        func_800E543C(player_entity.pos_x >> 12, (player_entity.pos_y >> 12) + offy, player_entity.pos_z >> 12);
        func_800E5458(-player_entity.angle_y, -player_entity.angle_x, 0);
        func_800D0C08(player_entity.pos_x, player_entity.pos_y, player_entity.pos_z);
    }
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DC9EC);

// is there a jump action?
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DCB50);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DCCB0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DCEE0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DCFD0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD0DC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD158);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD534);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD654);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD6D0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD750);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD794);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD968);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DD994);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DDA30);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DDB58);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DDC04);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DDC6C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DDDE4);

void debug_print_decimal(s32 num)
{
    char sign = ' ';
    if (num < 0) {
        sign = '-';
        num = -num;
    }
    debug_print_char(sign);
    debug_print_decimal_unsigned(num, 5);
}


u32 D_80102794 = 0;
extern s32 D_80102BF4;
extern SVECTOR D_80141448;  // camera rotation?

void func_800DDF04(void)
{
    // print debug info
    if (D_80102794) {
        // TODO: player position here

        //
        debug_set_pos(1, 14);
        debug_print_str("RENDERING IS FUCKING OFF");
        debug_set_pos(1, 15);
        debug_print_str("NO MODEL RENDERING");
        debug_set_pos(1, 16);
        debug_print_str("GROUND=");
        debug_print_decimal(player_entity.max_y);
        
        debug_set_pos(1, 23);
        debug_print_str("X=");
        debug_print_decimal(player_entity.pos_x >> 12);
        debug_set_pos(1, 24);
        debug_print_str("Y=");
        debug_print_decimal(player_entity.pos_y >> 12);
        debug_set_pos(1, 25);
        debug_print_str("Z=");
        debug_print_decimal(player_entity.pos_z >> 12);
        debug_set_pos(10, 22);
        //
        debug_set_pos(10, 23);
        debug_print_str("ZX=");
        debug_print_hex16(player_entity.angle_y);   // wait what
        debug_set_pos(10, 24);
        debug_print_str("AREA=");
        //
        debug_set_pos(10, 25);
        debug_print_str("LAND=");
        //

    }
    // THEN PLAYER ENTITY STUFF
    // TODO: draw feet too

    // player shadow
    s16 x,y,z;
    if (player_entity.on_air == 0 && player_entity.max_y <= 0) {
        func_800E5E60(
            &(SVECTOR) { 
                player_entity.pos_x >> 12, 
                player_entity.max_y,
                player_entity.pos_z >> 12
            },
            &(SVECTOR) { 
                .vy = player_entity.angle_y + 0x800,
            },
            D_80102BF4 + 1
        );
    }
    
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DE244);

u16 debug_font_color[4] = { 1, 1, 0x7FFF, 0 };

//INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DE384);
//load debug font clut
void func_800DE384(u16 x, u16 y)
{
    RECT rect = {
        .x = x,
        .y = y,
        .w = 4,
        .h = 1,
    };
    LoadImage(&rect, debug_font_color);
    DrawSync(0);
}



//extern void func_800DED4C(void* p, s32 v);   // SetSemiTrans                   /* extern */

s32 debug_char_x = 0;
s32 debug_char_y = 0;

u32 debug_text_transparent = 0;    // debug_font_trans
u32 debug_font_index = 0;
RECT debug_text_texture = { 0, 0, 255, 255 };
u32 debug_font_x = 960;
u32 debug_font_y = 256;
u32 D_80102788 = 224;

s16 debug_ot_index = 0;
TextOT debug_text_ot[3];
extern TextUV debug_char_uvs[128];

void debug_print_char(char c)
{
    s32* last;
    SPRT_8* p;
    
    if (debug_text_ot[debug_ot_index].count < 512) {
        debug_text_ot[debug_ot_index].count += 1;
        p = debug_text_ot[debug_ot_index].nextfree;
        debug_text_ot[debug_ot_index].nextfree = p + 1;
        func_800DED4C(p, debug_text_transparent);
        p->x0 = debug_char_x * 8;
        p->y0 = debug_char_y * 8;
        p->u0 = debug_char_uvs[c].u;
        p->v0 = debug_char_uvs[c].v;
        last = &debug_text_ot[debug_ot_index].ot[0];
        debug_char_x += 1;
        addPrim(last, p);
    }
}

void debug_print_str(char* str)
{
    while (*str) debug_print_char(*str++);
}

void debug_print_decimal_unsigned(u32 num, u32 pad)
{
    u32 digit;
    u32 place = 1000000000;
    u32 skip = 10;
    if (pad < 10) skip = 10 - pad;

    while (place) {
        digit = num/place;
        num -= digit*place;
        // skip leading zeros
        if (!(skip > 0 && digit == 0 && place != 1))
            debug_print_char(digit + '0');
        place /= 10;
        skip -= 1;
    }
}

void debug_print_hex8(u8 byte)
{
    u8 nybble;

    nybble = byte >> 4;
    if (nybble > 9) nybble += 7;
    debug_print_char('0' + nybble);

    nybble = byte & 0xF;
    if (nybble > 9) nybble += 7;
    debug_print_char('0' + nybble);
}

void debug_print_hex32(u32 word)
{
    debug_print_hex8(word >> 24);
    debug_print_hex8(word >> 16);
    debug_print_hex8(word >> 8);
    debug_print_hex8(word);
}

void debug_print_hex16(u16 half)
{
    debug_print_hex8(half >> 8);
    debug_print_hex8(half);
}

void debug_set_pos(u32 x, u32 y)
{
    debug_char_x = x;
    debug_char_y = y;
}

// draw and swap
void debug_text_draw(void)
{
    DR_MODE* p;
    void* last;
    u16 tpage;

    p = &debug_text_ot[debug_ot_index].draw_mode;
    tpage = func_800DEAD4(0,debug_font_index, debug_font_x, debug_font_y);
    func_800C7D90(p, 0, 0, tpage, &debug_text_texture);
    last = &debug_text_ot[debug_ot_index].ot[0];
    addPrim(last, p);
    func_800E9818(last);
    debug_ot_index += 1;
    if (debug_ot_index > 2) debug_ot_index = 0;
    debug_text_ot[debug_ot_index].nextfree = &debug_text_ot[debug_ot_index].prims[0];
    debug_text_ot[debug_ot_index].count = 0;
    // re-initialize an empty one
    func_800E8B5C(&debug_text_ot[debug_ot_index].ot[0], 2);
}

void func_800DE8B0(u32 x, u32 y)
{
    debug_font_x = x & 0x3c0;
    debug_font_y = y & 0x100;
    D_80102788 = y & 0xff;
    
}

void func_800DE8DC(u16 r, u16 g, u16 b)
{
    debug_text_transparent = ((r | g | b) & 0x8000) != 0;
    debug_font_color[0] = r;
    debug_font_color[1] = g;
    debug_font_color[2] = b;
}


INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DE920);   // Set index

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DE930);   // debug_text_init


// this is all libgpu stuff, probably all for debug.c

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEAD4);   // GetTPage

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEB6C);   // GetClut

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEB84);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEC20);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEC60);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEC7C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEC98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DECD4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DED10);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DED34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DED4C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DED74);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DED9C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEDB0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEDC4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEDD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEDEC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE00);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE14);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE3C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE50);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE78);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEE8C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEEA0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEEB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEEC8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEEDC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEEF0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEF04);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEF24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEF44);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEF64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEF84);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DEFB8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF108);


// more real functions

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF1B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF1C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF1D4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF1E4);   // level_setup

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF454);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF474);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF690);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF6FC);   // debug stuff

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DF884);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DFC78);   // logic_routine

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800DFE18);   // render_routine

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", .L800E0140);  // main


// 2 functions, for sale, never called
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0810);
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E08FC);   // LoadClut

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", SetDefDrawEnv);
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", SetDefDispEnv);

void* data_buffer_start = 0x80060000;
extern void* data_buffer_ptr;

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0A30);

void* data_buffer_get_ptr(void)
{
    return data_buffer_ptr;
}

void data_buffer_alloc(u32 n)
{
    data_buffer_ptr += (n + 3) & (~3);
}

void data_buffer_dealloc(u32 n)
{
    data_buffer_ptr -= (n + 3) & (~3);
}

void data_buffer_reset(void)
{
    data_buffer_ptr = data_buffer_start;
}

void func_800E0ABC(DISPENV* disp)
{
    if (func_800E95A0() != MODE_NTSC) {
        disp->pad0 = 1;
        disp->screen.y += 24;
    }
}

extern u16 gbuffer_draw_pos[3][2];
extern u16 gbuffer_disp_pos[3][2];

void gbuffer_reset(GBuffer* gbuf, int idx)
{
    gbuf = &gbuf[idx];
    SetDefDispEnv(&gbuf->disp, gbuffer_disp_pos[idx][0], gbuffer_disp_pos[idx][1], 256, 240);
    gbuf->disp.screen.x = 4;
    gbuf->disp.screen.y = 14;
    gbuf->disp.screen.w = 250;
    gbuf->disp.screen.h = 216;
    // update tv mode
    func_800E0ABC(&gbuf->disp);
    SetDefDrawEnv(&gbuf->draw, gbuffer_draw_pos[idx][0], gbuffer_draw_pos[idx][1], 248, 216);
    gbuf->draw.isbg = 1;
    gbuf->draw.r0 = 0;
    gbuf->draw.g0 = 0;
    gbuf->draw.b0 = 0;
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0BD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0C14);


// vram inspector and color stuff
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0D44);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0D54);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0D68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0D9C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0DAC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0E34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0EA4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0F2C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0F4C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E0F84);

#define OT_SIZE 567

// this actually holds the primitive data
typedef struct {
    u32 ot[OT_SIZE];
    u32 prims[40960];
} PrimBuffer;


PrimBuffer *gbuffer_prim_buffers = 0x80060000;
s32 D_80102D3C = 0;  // primbuffer_index

GBuffer gbuffers[3];
s32 gbuffer_current_index;


extern s32 D_80102DBC;

GBuffer* gbuffer_get_current(void)
{
    return &gbuffers[gbuffer_current_index];
}

u32 *gbuffer_get_next_ot(void)
{
    return gbuffer_prim_buffers[D_80102D3C + 1].ot;
}

void gbuffer_swap(void)
{
    if (++gbuffer_current_index > 2)
        gbuffer_current_index = 0;
    if (++D_80102D3C > 1)
        D_80102D3C = 0;
    
    PrimBuffer *pb = gbuffer_prim_buffers + D_80102D3C;
    gbuffers[gbuffer_current_index].ot = pb->ot;
    gbuffers[gbuffer_current_index].nextfree = pb->prims;
    func_800E8B5C(pb->ot, OT_SIZE);
    D_80102DBC = 0;
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E10F8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1144);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1164);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1190);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E11A0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E169C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E16AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E16BC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E16CC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E16DC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1710);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1738);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E17D0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1838);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1894);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E18A4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1914);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1C34);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1D8C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E1E28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E20A0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E20C4);

// ## level loading functions

// ear read section offset
u32 func_800E20E8(u32 *header, s32 section)
{
    // should be converted from big endian
    union { u8 b[4]; u32 i; } be;
    be.i = header[section];
    u32 le = (be.b[0] << 24) 
           | (be.b[1] << 16) 
           | (be.b[2] << 8) 
           | (be.b[3] << 0);
    return le;
}

// ear decompress section
u32 func_800E2124(void *src, s32 section, s32 subsection, void* dst)
{
    // navigate to section
    u32 offset = func_800E20E8(src, section);
    src = src + offset;

    // and subsection, if specified
    if (subsection >= 0) {
        offset = func_800E20E8(src, subsection);
        src = src + offset;
    }

    return decompress_lz1_c(src + 4, dst);
    //return jt.decompress_lz1(src + 4, dst);
}

// decompress section to permanent buffer
void *func_800E2184(void *src, s32 section, s32 subsection)
{
    void *buffer = func_800E3E64();
    u32 size = func_800E2124(src, section, subsection, buffer);
    size = (size + 3) & ~3;     // align to 4
    func_800E3E54(buffer + size);
    jt.printf("%d %d\t[%d]\t-> %p\n", section, subsection, size, buffer);
    return buffer;
}

// load entity
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E21F0);


INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E271C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E2BD8);

// load level (main function)
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E2C00);

// load map data
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3568);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3A58);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3B24);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3B98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3BA8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3BF8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3C08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3C58);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3C98);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3CD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3D20);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3D38);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3D78);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3D88);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3D9C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3DAC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3DE8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3E08);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3E54);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3E64);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3E74);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3E94);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3EF0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E3F5C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4064);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E41D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4208);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E422C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4338);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4448);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E446C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4484);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E44E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4510);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E46EC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4828);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4890);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E48E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4914);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E493C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4974);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4ADC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4B4C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4BC0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4BE0);

extern u32 D_8013CC28; // mesh_array_count
extern Mesh mesh_array[1024];
extern u16 D_801381F8[256]; // I think it would be 256? no idea tbh
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4C34);
// load_mesh_from_vo2
/*u32 _func_800E4C34(u32* data, u32 mesh_palette, u32 texture_palette, u32 texture_id)
{
    u32 ret = D_8013CC28;
    Mesh* m;

    u32 count;
    u32 fcount, gcount;
    u32 head;
    // loads up the mesh palette and sets conversion
    func_800E3F5C(mesh_palette);
    count = *data++;
    //jt.printf("LOADING %d MESHES\n", count);
    for (u32 i = 0; i < count && D_8013CC28 <= 1024; i++) {
        m = &mesh_array[D_8013CC28++];
        head = *data++;
        m->a = head;
        m->b = head;
        if (head == 0) continue;
        m->verts = data;
        data += 1;
        // skip this section
        data = ((SVECTOR*) data) + m->verts->count + 1;
        //jt.printf("\tMESH %d: %d, %d VERTS\n", D_8013CC28-1, head, m->verts->count);
        m->unk1 = data;
        data += 1;
        data += m->unk1->count + 1;
        m->unk2 = data;
        // this part gets fucky
        // at p2
        fcount = *data + 1;
        u16* header = data+1;

        // skip header
        data += fcount + 1;
        if (fcount > 2) {
                //jt.printf("BIG ONE!\n");
        }
        for (int j = 0; j < fcount; j++) {
            //jt.printf("\t\tSET VOFF: %d\tFOFF: %d\n", header[2*j], header[2*j+1]);
            gcount = *data++ + 1;
            for (int k = 0; k < gcount; k++) {
                
                //skip the bytes
                data += (*data)/4 + 1;
                u32 size = *data++;
                Face* face = data;
                //jt.printf("\t\t\tSUBSET %d FACES\n", size/sizeof(Face));
                data += size/4;
                for (size; size > 0; size -= sizeof(Face)) {
                    //jt.printf("FACES %X %X\n", faces->flags0, faces->flags1);
                    if (face->flags1 & 0x8000 == 0) {
                        // texture stuff. TODO
                    }
                    else if (face->flags0 & 0xFFFC != 0) {
                        face->flags0 &= 3;
                        face->flags0 |= D_801381F8[face->flags0 >> 2] << 2;
                    }
                    face += 1;
                }
            }
        }
    }
}*/

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4FB8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4FC8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4FD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4FE8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E4FF8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5014);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5024);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5098);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5114);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E53B8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E53EC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E53FC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E541C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E542C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E543C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5458);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5478);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E563C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5668);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5818);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E58D0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E599C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E59D4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E59FC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5A28);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5B68);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5B88);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5BA8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5CC0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5D30);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5D90);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5DA0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5DD8);


// main function called for rendering models. disabled for now
// because the model rendering code is a nightmare and has to
// be fully disassembled and understood otherwise everything
// breaks. because spimdasm is dfor nowumb and loads of symbols are
// lost.
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E5E60);
//__asm__(".section .text\n" "\t.align\t2\n" "\t.globl\t" "_func_800E5E60" "\n" "\t.ent\t" "_func_800E5E60" "\n" "_func_800E5E60" ":\n" ".include \"" "asm/jm1/nonmatchings/173B4" "/" "func_800E5E60" ".s\"\n" "\t.set reorder\n" "\t.set at\n" "\t.end\t" "_func_800E5E60");



extern s32 D_801380B0;  // lod_distance
extern u16 D_8013EC48[1024]; // added flags and stuff
extern s16 D_80141468[1024];    // z offsets

SVECTOR* camera_pos = 0x1F8003C8;
/*void func_800E5E60(SVECTOR *pos, SVECTOR *angle, u32 id)
{
    //if ((id & 0xFFFF) == 406) 
    //_func_800E5E60(pos, angle, id);
        //jt.printf("DRAWING %X\n", id);

}*/

// draw_model
/*void func_800E5E60(SVECTOR* pos, SVECTOR* angle, u32 id)
{
    if (id < 0) return;

    // LET's only do the frog for now
    //if (id != 0x196) return;

    SVECTOR *dir = 0x1F800000;
    SVECTOR *tmp = 0x1F800024;
    Mesh* mesh = &mesh_array[id & 0x3FF];
    //jt.printf("DRAW %d\n", id);
    //jt.printf("\tat\t%d %d %d\n", pos->vx, pos->vy, pos->vz);
    //jt.printf("\trot\t%d %d %d\n", angle->vx, angle->vy, angle->vz);
    
    
    dir->vx = pos->vx - camera_pos->vx;
    dir->vy = pos->vy - camera_pos->vy;
    dir->vz = pos->vz - camera_pos->vz;
    s32 mag2 = func_800F4354(dir, tmp, mesh);
    //jt.printf("DRAW: MAG2 %d\t\n", mag2);
    //s32 mag  = func_800C9D70(mag2);
    // is in frame?
    if (mag2 <= -1) return;

    if (mag2 >= D_801380B0/4) {
        //jt.printf("FAR");
    }

    if (mag2 >= D_801380B0) {
        //jt.printf(", VERY FAR");
    }

    id |= D_8013EC48[id & 0x3FF] & 0xFC00;
    //jt.printf(" ADDED FLAGS: %X\n", D_8013EC48[id & 0x3FF] & 0xFC00);

    // for now assume no 0x800
    s32 mag = func_800C9D70(mag2) + D_80141468[id & 0x3FF];
    mag = mag >> 4;
    s32 diff = mag;
    if (mag < 1) diff = 1;
    if (mag > 511) diff = 511;
    //jt.printf("MAG %d\t", mag);
    mag = 558 - diff;
    //jt.printf("-> %d\n", mag);

    // let's assume angle == NULL
    // just use the basic matrices
    func_800E8838(0x1F8003E4, 0x1F800010);
    func_800E8838(0x1F8003D0, 0x1F800024);

    // SetLightMatrix
    func_800CAC90(0x1F800024);
    
    // double matrix
    func_800E87B8(0x1F800010);
    // SetRotMatrix
    func_800CAC60(0x1F800010);
    // SetTransMatrix
    func_800CACF0(0x1F800010);

    //mag = 4;

    GBuffer* gbuf = gbuffer_get_current();
    jt.printf("LAYER %d\n", mag);
    jt.printf("%p\t", gbuf->nextfree);
    gbuf->nextfree = func_800F4548(mesh, gbuf->nextfree, gbuf->ot + mag, 0);
    jt.printf("-> %p\n", gbuf->nextfree);

    //for (;;);
}*/

// ground collision is also lost and you just fall.
// but the ground texture bug is gone too. so that one's also
// somewhere in that mess.


INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E62F0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6310);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6328);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6360);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6398);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6554);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6584);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E65B4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E65C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E65F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6604);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E664C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6658);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6668);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6684);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E68E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6DB4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6FC8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6FD8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6FE8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E6FF8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7018);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7024);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7038);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E704C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7058);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7078);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7098);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E70AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E70C4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E70D8);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E70EC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7100);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E710C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7124);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7130);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E713C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7148);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7154);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7160);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7174);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7180);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7194);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E71AC);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E71C0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E71D4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E71E0);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E71F4);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7224);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7230);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E723C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E725C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E7268);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E736C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E749C);

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800E75B0);
