#include "common.h"
#include <libapi.h>

// Custom string functions because the BIOS ones are slow and libc2.a was not a
// thing yet. THESE ARE NOT COMPATIBLE WITH libc2.a! Compare the signatures.
// TODO: Rename these to ram_memset or something so we don't override.

// 80022EE8
void ram_strcpy(char *src, char *dst)
{
    while (*src)
        *dst++ = *src++;
    *dst = 0;
}

// 80022F14
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
// 80022F64
int ram_strchr(char *str, char c)
{
    while (*str)
        if (*str++ == c)
            return 1;
    return 0;
}

// 80022F9C
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

// 80022FDC
int ram_strlen(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}

// 80023004
NOT_IMPL_FN(basename)

// 80023060
int ram_memcmp(int n, u8 *a, u8 *b)
{
    for (int i = 0; i < n; i++) {
        if (*a++ != *b++)
            return 0;
    }
    return 1;
}

// 800230A0
void ram_memcpy(int n, u8 *src, u8 *dst)
{
    for (int i = 0; i < n; i++)
        dst[i] = src[i];
}

// 800230C8
void ram_memset(u8 *dst, int n, u8 c)
{
    for (int i = 0; i < n; i++)
        dst[i] = c;
}

// exactly the same as the other one. linking shenanigans?
// unused?
/*
// 800230E8
int ram_strlen2(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}
*/

// TODO: move to card.c?
// 80023110
void card_write(int port)
{
    _new_card();
    _card_write(port, 0x3F, 0);
}
