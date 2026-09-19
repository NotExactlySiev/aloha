#pragma once

#include <ints.h>
#include <libcd.h>

enum {
    MUSIC_TYPE_CDDA = 0,
    MUSIC_TYPE_STR = 1,
};

typedef struct {
    u8 id;
    u8 type;
    u32 size;
    u32 unk0;
    u32 unk1;
    u8 file; // CdlFILTER
    u8 chan;
    CdlLOC loc;
    char name[12];
} MusicTrack;

typedef struct {
    u16 count;
    u16 _pad; // TODO: not needed?
    MusicTrack tracks[];
} MusicList;

void music_set_list(MusicList *val);
int music_play(u8 id);
void music_set_repeat(int val);
