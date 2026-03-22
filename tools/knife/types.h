#ifndef _SIEV_TYPES
#define _SIEV_TYPES

#include <stdbool.h>
#include <stdint.h>

// More convenient typedefs for main unsigned types
typedef unsigned char   uchar;
typedef unsigned short  ushort;
typedef unsigned int    uint;
typedef unsigned long   ulong;  // Mostly used in 16 bit code
// TODO: do I need a signed char typedef? I don't think I've
//       ever used that type.
// TODO: wchar?

typedef float           f32;
typedef double          f64;
// no long double, it's not always IEEE quad-precision

// Fixed width integers
typedef int8_t          i8;
typedef int16_t         i16;
typedef int32_t         i32;
typedef int64_t         i64;
typedef uint8_t         u8;
typedef uint16_t        u16;
typedef uint32_t        u32;
typedef uint64_t        u64;

// No other weird C99 intmax_least_t whatever stuff. I've never used them.

#endif
