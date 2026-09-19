#pragma once

#include <libpress.h>

// Safe MDEC initializer. Doesn't exist on the Japanese version, which calls the
// `DecDCTReset` function directly and unconditionally.

#ifdef VERSION_WORLD
void mdec_init(int mode);
#else
static inline void mdec_init(int mode) { DecDCTReset(mode); }
#endif
