#include "common.h"
#include <libcd.h>
#include "cd/cd.h"

enum {
    MUSIC_TYPE_CDDA = 0,
    MUSIC_TYPE_STR  = 1,
};

typedef struct {
    u8 id;
    u8 type;
    u32 size;
    u32 unk0;
    u32 unk1;
    u8 file;     // CdlFILTER
    u8 chan;
    CdlLOC loc;
    char name[12];
} MusicTrack;

typedef struct {
    u16 count;
    u16 _pad;   // TODO: not needed?    
    MusicTrack tracks[];
} MusicList;

extern int music_state;

// private?
extern s32 bgm_paused;
extern s32 bgm_finished;