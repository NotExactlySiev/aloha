#include <ints.h>

typedef struct {
    u8 magic[2];
    u8 iconflag;
    u8 blocksize;
    char title[64];
    u8 reserved[12];
    u8 pocketstation[16];
    u16 palette[16];
} McTitleFrame;

typedef struct {
    McTitleFrame titleframe;
    u8 frames[3][128];
} McFileHeader;

int mc_get_event(void);
int mc_select_slot(int slot);
int mc_file_exists(int slot, char *filename);
int mc_create(int slot, char *filename, u32 size);
int mc_open(int slot, char *filename, u32 mode);
int mc_close(int fd);
int mc_delete(u32 slot, char *file);
int mc_write(int fd, void *buf, int len);
int mc_write_block(int fd, void *buf, int len);
int mc_read_block(int fd, void *buf, long len);
long mc_seek(int fd, long a, long b);
int func_80020434(McFileHeader *header, u8 iconflag, int size, char *title, u16 *palette, u8 frame0[128], u8 frame1[128], u8 frame2[128]);
int mc_format(long slot);
void mc_init(void);
void mc_deinit(void);
