#include "common.h"

// LIBAPI perhaps?
// 6 kernel functions which I removed

// 5 timer functions
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023A38);    // SetRCnt

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023AD4);    // GetRCnt

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023B0C);    // StartRCnt

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023B40);    // StopRCnt

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023B74);    // ResetRCnt

// 24 or so kernel functions
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023BA8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023BB8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023BC8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023BD8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023BE8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023BF8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C08);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C18);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C28);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C38);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C48);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C58);

INCLUDE_ASM("asm/nonmatchings/C1B8", k_strcat);

INCLUDE_ASM("asm/nonmatchings/C1B8", k_printf);

INCLUDE_ASM("asm/nonmatchings/C1B8", k_strcpy);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023C98);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023CA8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023CB8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023CC8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023CD8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023CE8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023CF8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023D08);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023D18);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023D28);

// LIBPRESS
// 9 pretty simple functions
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023D38);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023D70);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023D7C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023DC0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023E3C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023E5C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023E7C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023E9C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023EC0);

// 6 MDEC DMA functions
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023EE4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80023FEC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024080);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024110);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800241A8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024240);

// 1 kernel function exit()
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024374);

// 2 more MDEC stuff I think
INCLUDE_ASM("asm/nonmatchings/C1B8", func_800245D4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800249BC);

// LIBGPU
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024BD0);    // ResetGraph

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024DA0);    // SetGraphReverse

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024EB0);    // SetGraphDebug

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024F18);    // SetGraphQueue

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024FB4);    // GetGraphType

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024FC4);    // GetGraphDebug

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80024FD4);    // DrawSyncCallback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025030);    // SetDispMask

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800250A8);    // DrawSync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025114);    // checkRECT

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002522C);    // ClearImage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800252C0);    // LoadImage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025324);    // StoreImage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025388);    // MoveImage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002542C);    // ClearOTag

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800254D8);    // ClearOTagR

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025558);    // DrawPrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800255B8);    // DrawOTag

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025628);    // PutDrawEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025720);    // GetDrawEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025780);    // PutDispEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025BC8);    // GetDispEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025C2C);    // GetODE

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025C60);    // SetTexWindow

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025C9C);    // SetDrawArea

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025D20);    // SetDrawOffset

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025D64);    // SetPriority

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025D8C);    // SetDrawMode

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80025DE4);    // SetDrawEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002609C);    // get_mode

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800260EC);    // get_cs

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800261B8);    // get_ce

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026284);    // get_ofs

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800262C0);    // get_tw

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026344);    // get_dx

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002641C);    // _status

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026434);    // _otc

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002651C);    // _clr

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026768);    // _dws

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800269F4);    // _drs

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026CC4);    // _ctl

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026CFC);    // _getctl

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026D1C);    // _cwb

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026D6C);    // _cwc

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026DB8);    // _param

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026DE8);    // _addque

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80026E0C);    // _addque2

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027074);    // _exeque

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027374);    // _reset

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800274F0);    // _sync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800276DC);    // set_alarm

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027710);    // get_alarm

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800278A8);    // memset

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800278D4);    // k_GPU_cw

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800278E4);    // GetTPage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002797C);    // GetClut

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027994);    // DumpTPage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027A30);    // DumpClut

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027A70);    // NextPrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027A8C);    // IsEndPrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027AA8);    // AddPrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027AE4);    // AddPrims

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027B20);    // CatPrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027B44);    // TermPrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027B5C);    // SetSemiTrans

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027B84);    // SetShadeTex

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027BAC);    // SetPoly(3,4)(F,FT,G,GT)
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027BC0);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027BD4);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027BE8);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027BFC);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C10);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C24);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C38);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C4C);    // SetSprt8,16,
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C60);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C74);


INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C88);    // SetTile1,8,16,
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027C9C);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027CB0);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027CC4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027CD8);    // SetBlockFill

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027CEC);    // SetLine(2-4)(F,G)
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027D00);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027D14);   
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027D34);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027D54);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027D74);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027D94);    // MargePrim

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027DC8);    // DumpDrawEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027F18);    // DumpDispEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80027FC4);    // LoadTPage

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800280B0);    // LoadClut

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028118);    // SetDefDrawEnv

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800281A8);    // SetDefDispEnv

// LIBCD

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800281E4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028204);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028224);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028244);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002825C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028294);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800282CC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800282E4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800282FC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028314);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028450);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028580);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800286C8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800286EC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028710);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028734);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028754);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028774);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800287F4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028A14);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028B18);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028B98);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80028FC0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800291E4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800293F4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800297AC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002985C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80029A00);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80029A9C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80029CAC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80029E30);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80029F68);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A048);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A124);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A25C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A438);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A448);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A51C);    // CdInit

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A5AC);    // cbsync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A5D4);    // cbready

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A5FC);    // cbread

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A624);    // k_DeliverEvent

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A634);    // StSetRing

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A68C);    // StClearRing

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A6DC);    // StUnSetRing

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A734);    // data_ready_callback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A7BC);    // StSetStream

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A824);    // StSetEmulate

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A898);    // StFreeRing

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A954);    // init_ring_status

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002A994);    // StGetNext

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002AA48);    // StSetMask

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002AA68);    // StCdInterrupt

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B518);    // dma_execute

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B6C8);    // mem2mem

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B6FC);    // StSetChannel

// LIBETC
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B720);    // ResetCallback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B750);    // InterruptCallback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B780);    // DMACallback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B7B0);    // VSyncCallbacks

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B7E0);    // StopCallback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B810);    // CheckCallback

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B824);    // GetIntrMask

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B83C);    // SetIntrMask

// 4 weird ones
//ResetEntryInt
//trapIntr
//stopIntr
//restartIntr
//startIntr
//setIntr

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B858);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002B918);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BB0C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BC34);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BC9C);    // memclr

// 5 kernel functions
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BCC8);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BCD8);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BCE8);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BCF8);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BD08);


INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BD18);    // startIntrDMA

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BD7C);    // stopIntrDMA

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BDC4);    // trapIntrDMA

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002BF28);    // setIntrDMA

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C030);    // memclr


INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C05C);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C0BC);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C0EC);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C10C);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C13C);
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C154);


INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C164);    // startIntrVSync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C1DC);    // stopIntrVSync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C214);    // trapIntrVSync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C260);    // setIntrVSync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C298);    // memclr


INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C2C4);    // VSync

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C40C);    // v_wait

// these have to be LIBSND
INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C4A8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002C4D0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002CBCC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002CC60);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002CD54);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002CEAC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002D3C0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002D6C0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002D730);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002D9FC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002DD58);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E008);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E078);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E0F0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E16C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E21C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E2E4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E3AC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E42C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E49C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002E53C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002EAC8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002EAFC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002EB28);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002EB90);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002EED4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002EF00);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002F020);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002F288);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002F38C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002F440);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002FE24);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8002FFA8);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030478);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030810);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8003093C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8003095C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030978);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8003099C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800309C0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800309F4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030A44);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030A98);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030B00);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80030E94);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031064);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031074);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8003109C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_8003111C);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031184);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031254);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031308);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031334);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031344);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800313A0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800314FC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031550);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800315B4);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031614);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800316BC);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800316F0);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031770);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_80031798);

INCLUDE_ASM("asm/nonmatchings/C1B8", func_800317E8);
