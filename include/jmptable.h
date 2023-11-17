#ifndef _JMPTABLE_H
#define _JMPTABLE_H

#include "common.h"

#define UNK(a,b)    void* unk##a[b - a + 1]
extern struct {
    void    (*nop)(void);
    void    (*jt_set)(void*, s32);
    s32     (*is_game_running)(void);
    void    (*execs_set_next)(s32);
    s32     (*execs_get_next)(void);
    void*   (*shared_data_ptr)(void);       // TODO: this should be a struct
    char*   (*execs_get_path)(s32);
    s32     (*get_tv_system)(void);
    s32     (*get_region)(void);
    UNK(9, 10);
    char*   (*get_version_string)(void);
    UNK(12, 191);
    void    (*decompress_rle)(u32,void* src,void* dst);
    void    (*decompress_lz1)(void* src,void* dst);
    UNK(194, 223);
    //routine_task_add
    //routine_task_remove
    UNK(226, 1023);
} jt;

#endif