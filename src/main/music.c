#include "music.h"
#include "cd/cd.h"

/* US:80047E4C JP: */ static int D_80047E4C = 0; // music should repeat?
/* US:80047E50 JP: */ static MusicList *D_80047E50 = NULL; // bgm_list_ptr

// 80020FC0
void music_set_list(MusicList *val)
{
    D_80047E50 = val;
}

// 80020FD0
static MusicTrack *get_track_by_id(u8 id)
{
    u16 count = D_80047E50->count;
    MusicTrack *p = &D_80047E50->tracks[0];
    while (count--) {
        if (p->id == id)
            return p;
        p = (MusicTrack *)&p->name[p->size - 22]; // why is the next one there?
    }
    return NULL;
}

// 80021028
int music_play(u8 id)
{
    if (D_80047E50 == NULL)
        return 0;

    MusicTrack *t = get_track_by_id(id);
    if (t == NULL)
        return 0;

    switch (t->type) {
    case MUSIC_TYPE_CDDA:
        music_play_cdda(t->file, D_80047E4C);
        return 1;

    case MUSIC_TYPE_STR:
        music_play_str(t->name, t->file, t->chan, &t->loc, t->loc.track, D_80047E4C);
        return 1;

    default:
        return 0;
    }
}

// 800210D4
void music_set_repeat(int val)
{
    D_80047E4C = val;
}
