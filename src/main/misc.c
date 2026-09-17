#include "card.h"
#include "decode.h"
#include "jumptable.h"
#include "main.h"
#include "music.h"
#include "sfx.h"
#include "sound.h"
#include <libapi.h>
#include <sys/file.h>
#include <util.h>

/* US:80047E58 JP:80044404 */ static void (*mc_callback_b)(void) = 0;

// US: 80021808
// JP: 800206A4
void execute_compressed(void *addr, u32 stack)
{
    EXEC header;
    __builtin_memcpy(&header, addr + 16, sizeof(EXEC));
    decode_lz1(addr + 0x804, (void *)header.t_addr);
    header.s_addr = stack;
    flush_cache_safe();
    Exec(&header, 1, 0);
}

// US: 800218A0
// JP: 8002073C
void mc_set_callback_b(void (*fn)(void))
{
    mc_callback_b = fn;
}

// US: 800218B0
// JP: 8002074C
static void do_callback_b(void)
{
    if (mc_callback_b != 0) {
        (*mc_callback_b)();
    }
}

// US: 800218DC
// JP: 80020778
int mc_file_read(int slot, char *filename, void *dst, int offset, int len)
{
    // printf("read bu%d:/%s: %d bytes at %d\n", slot, filename, len, offset);
    if (mc_file_exists(slot, filename) == 0)
        return 0;

    int fd = mc_open(slot, filename, O_RDONLY | O_NOWAIT);
    if (fd == -1)
        return 0;

    // skip over the header and icons
    mc_seek(fd, offset + 0x200, SEEK_SET);
    mc_read_block(fd, dst, len);
    int rc;
    while ((rc = mc_get_event()) == 0) {
        cd_run_block();
        do_callback_b();
    }
    mc_close(fd);
    // huh??
    return len & -(uint)(rc == EvSpIOE);
}

// US: 800219DC
// JP: 80020878
int mc_file_write(int slot, char *filename, void *src, int offset, int len, char *title)
{
    // printf("write bu%d:/%s: %d bytes at %d\n", slot, filename, len, offset);
    if (mc_file_exists(slot, filename) == 0)
        return 0;

    int fd = mc_open(slot, filename, O_RDWR | O_NOWAIT);
    if (fd == -1)
        return 0;

    McTitleFrame header;
    mc_seek(fd, 0, SEEK_SET);
    mc_read_block(fd, &header, 128);
    while (mc_get_event() == 0) {
        cd_run_block();
        do_callback_b();
    }

    int header_len = 0;
    if (header.magic[0] == 'S' && header.magic[1] == 'C') {
        header_len = 128 * ((header.iconflag & 0xF) + 1);
        if (title) {
            ram_memset(header.title, 64, 0);
            ram_strcpy(title, header.title);
            mc_seek(fd, 0, SEEK_SET);
            mc_write_block(fd, &header, 128);
            while (mc_get_event() == 0) {
                cd_run_block();
                do_callback_b();
            }
        }
    }
    offset += header_len;
    mc_seek(fd, offset, SEEK_SET);
    mc_write_block(fd, src, len);
    int rc;
    while ((rc = mc_get_event()) == 0) {
        cd_run_block();
        do_callback_b();
    }

    mc_close(fd);
    // huh??
    return len & -(uint)(rc == EvSpIOE);
}

extern struct {
    u8 frames[3][128];
    u16 palette[16];
} D_80032E5C;

// US: 80021BCC
// JP: 80020A68
int mc_file_create(int slot, char *filename, int len, char *title)
{
    int rc = mc_select_slot(slot);
    if (rc != 1)
        return rc;

    // low level create
    int fd = mc_create(slot, filename, len + sizeof(McFileHeader));
    if (fd == 0)
        return -3;

    fd = mc_open(slot, filename, O_RDWR | O_NOWAIT);
    if (fd < -1)
        return -3;

    McFileHeader header;
    mc_seek(fd, 0, SEEK_SET);
    // TODO: #define number of frames = 3
    func_80020434(&header, 0x10 + 3, len + sizeof(McFileHeader), title, D_80032E5C.palette, D_80032E5C.frames[0], D_80032E5C.frames[1], D_80032E5C.frames[2]);
    mc_write_block(fd, &header, sizeof(McFileHeader));
    while (mc_get_event() == 0) {
        cd_run_block();
        do_callback_b();
    }
    mc_close(fd);
    return len;
}

// TODO: this might return void
// never called?
// US: 80021D08
// JP: 80020BA4
int mc_file_delete(int slot, char *filename)
{
    int rc = mc_select_slot(slot);
    if (rc != 1)
        rc = mc_delete(slot, filename);
    return rc;
}

// US: 80021D54
// JP: 80020BF0
void misc_init(void)
{
    mc_callback_b = 0;
    jt_set(sfx_load_vab, 0x300);
    jt_set(sfx_free_vab, 0x301);
    jt_set(snd_set_stereo, 0x302);
    jt_set(snd_get_stereo, 0x303);
    jt_set(sfx_kill_all, 0x304);
    jt_set(snd_set_volume, 0x305);
    jt_set(snd_set_reverb, 0x307);
    jt_set(snd_set_vol_to_min, 0x308);
    jt_set(snd_set_vol_to_max, 0x309);
    jt_set(snd_fade_out, 0x30A);
    jt_set(snd_fade_in, 0x30B);
    jt_set(snd_status, 0x30C);
    jt_set(snd_fade_pause, 0x30D);
    jt_set(snd_fade_unpause, 0x30E);
    jt_set(snd_reset, 0x30F);
    jt_set(execute_compressed, 0x320);
    jt_set(music_set_list, 0x330);
    jt_set(music_play, 0x331);
    jt_set(music_set_repeat, 0x332);
    jt_set(mc_file_read, 0x340);
    jt_set(mc_file_write, 0x341);
    jt_set(mc_file_create, 0x342);
    jt_set(mc_file_delete, 0x343);
    jt_set(mc_set_callback_b, 0x344); // THERE ARE TWO CALLBACKS WTF
}
