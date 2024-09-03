#include "common.h"
#include "cd.h"
#include <libcd.h>
#include <memory.h>

#define CACHE_ENTRIES   10

typedef struct {
    u32    last_access;
    CdlLOC loc;
    u8     data[SECTOR_BYTES];
} cache_entry_t;

u32 cache_epoch;
cache_entry_t cache_entries[CACHE_ENTRIES];

static void access_entry(cache_entry_t *block)
{
    if (cache_epoch++ > 0x100000) {
        // adjust the main counter and all the counters for all
        // the blocks
        for (int i = 0; i < CACHE_ENTRIES; i++) {
            cache_entries[i].last_access >>= 1;
            cache_entries[i].last_access++;
        }
        cache_epoch >>= 1;
    }
    block->last_access = cache_epoch;
}

void sector_cache_clear(void)
{
    for (int i = 0; i < CACHE_ENTRIES; i++)
        cache_entries[i].last_access = 0;
}

int sector_cache_get(CdlLOC *loc, u8 *data)
{
    int i;  
    u32 oldest_access;
    cache_entry_t *entry;
    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].last_access
         && memcmp(3, loc, &cache_entries[i].loc)) {
            // found it!
            entry = &cache_entries[i];
            memcpy(0x800, &cache_entries[i].data, data);
            goto done;
        }
    }

    // it's not cached, load from disc
    CdSync(0, 0);
    do {
        try_CdControl(2, &loc->minute, 0);
        try_CdRead(1, (u_long*) data, 0x80);
    } while (func_8001A2C8(0, 0) == -1);
    try_CdControl(9, 0, 0); //pause

    // and then try to cache it. first look for an empty entry
    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].last_access == 0) {
            entry = &cache_entries[i];
            goto found;
        }
    }
    
    // if not found, replace the least recently accessed sector
    oldest_access = -1;
    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].last_access < oldest_access) {
            oldest_access = cache_entries[i].last_access;
            entry = &cache_entries[i];
        }
    }

found:
    memcpy(0x800, data, entry->data);
    entry->loc = *loc;

done:
    access_entry(entry);
    return 1;
}