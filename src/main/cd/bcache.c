#include "cd.h"
#include <memory.h>
#include <util.h>

#ifdef VERSION_WORLD
    #define CACHE_ENTRIES 10
#else
    #define CACHE_ENTRIES 16
#endif

typedef struct {
    u32 last_access;
    CdlLOC loc;
    u8 data[SECTOR_BYTES];
} cache_entry_t;

u32 cache_epoch;
cache_entry_t cache_entries[CACHE_ENTRIES];

// US: 8001D398
// JP: 8001C504
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

// US: 8001D414
// JP: 8001C588
void sector_cache_clear(void)
{
    for (int i = 0; i < CACHE_ENTRIES; i++)
        cache_entries[i].last_access = 0;
}

// US: 8001D440
// JP: 8001C5B8
int sector_cache_get(CdlLOC *loc, void *data)
{
    int i;
    u32 oldest_access;
    cache_entry_t *entry;
    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].last_access
            && ram_memcmp(3, loc, &cache_entries[i].loc)) {
            // found it!
            entry = &cache_entries[i];
            ram_memcpy(0x800, &cache_entries[i].data, data);
            goto done;
        }
    }

    // it's not cached, load from disc
    CdSync(0, 0);
#ifdef VERSION_WORLD
    do {
        try_CdControl(2, &loc->minute, 0);
        try_CdRead(1, (u_long *)data, 0x80);
    } while (cd_verify_read(0, 0) == -1);
#else

    try_CdControl(CdlSetloc, loc, 0);

    if (try_reading_twice(1, data, loc) == -1)
        return 0;
#endif

    try_CdControl(9, 0, 0); // pause

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
    ram_memcpy(0x800, data, entry->data);
    entry->loc = *loc;

done:
    access_entry(entry);
    return 1;
}
