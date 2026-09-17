#include "common.h"

// Custom string functions because the BIOS ones are slow and libc2.a was not a
// thing yet. THESE ARE NOT COMPATIBLE WITH libc2.a! Compare the signatures.

// This file is linked to multiple executables. The addresses here are from main
// but I should probably add their addresses from the other files too.

// US: 80022EE8
// JP: 80021B28
void ram_strcpy(char *src, char *dst)
{
    while (*src)
        *dst++ = *src++;
    *dst = 0;
}

// US: 80022F14
// JP: 80021B54
void ram_strcat(char *a, char *b, char *dst)
{
    char *src = a;
    while (*src)
        *dst++ = *src++;
    src = b;
    while (*src)
        *dst++ = *src++;
    *dst = 0;
}

// TODO: this is not actually strchr :P it returns a bool
// US: 80022F64
// JP: 80021BA4
int ram_strchr(char *str, char c)
{
    while (*str)
        if (*str++ == c)
            return 1;
    return 0;
}

// US: 80022F9C
// JP: 80021BDC
void ram_strupper(char *src, char *dst)
{
    char c;
    while ((c = *src++)) {
        if (c >= 'a' && c <= 'z')
            c &= ~0x20;
        *dst++ = c;
    }
    *dst = 0;
}

// US: 80022FDC
// JP: 80021C1C
int ram_strlen(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}

// US: 80023004
// JP: 80021C44
NOT_IMPL_FN(basename)

// US: 80023060
// JP: 80021CA0
int ram_memcmp(int n, u8 *a, u8 *b)
{
    for (int i = 0; i < n; i++) {
        if (*a++ != *b++)
            return 0;
    }
    return 1;
}

// US: 800230A0
// JP: 80021CE0
void ram_memcpy(int n, u8 *src, u8 *dst)
{
    for (int i = 0; i < n; i++)
        dst[i] = src[i];
}

// US: 800230C8
// JP: 80021D08
void ram_memset(u8 *dst, int n, u8 c)
{
    for (int i = 0; i < n; i++)
        dst[i] = c;
}

// Exactly the same as the other one. linking shenanigans?
// US: 800230E8
// JP: 80021D28
int ram_strlen2(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}
