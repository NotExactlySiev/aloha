#include "common.h"
#include <libapi.h>

// custom str functions because the BIOS ones are slow and libc2.a was not a
// thing yet. THESE ARE NOT COMPATIBLE WITH libc2.a! compare the signatures
// TODO: rename these to ram_memset or something so we don't override

void strcpy(char *src, char *dst)
{
    while (*src)
        *dst++ = *src++;
    *dst = 0;
}

void strcat(char *a, char *b, char *dst)
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
int strchr(char *str, char c)
{
    while (*str)
        if (*str++ == c)
            return 1;
    return 0;
}

void strupper(char *src, char *dst)
{
    char c;
    while ((c = *src++)) {
        if (c >= 'a' && c <= 'z')
            c &= ~0x20;
        *dst++ = c;
    }
    *dst = 0;
}

int strlen(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", get_path_leaf);

int memcmp(int n, u8 *a, u8 *b)
{
    for (int i = 0; i < n; i++) {
        if (*a++ != *b++)
            return 0;
    }
    return 1;
}

void memcpy(int n, u8 *src, u8 *dst)
{
    for (int i = 0; i < n; i++)
        dst[i] = src[i];
}

void memset(u8 *dst, int n, u8 c)
{
    for (int i = 0; i < n; i++)
        dst[i] = c;
}

// exactly the same as the other one. linking shenanigans?
// unused?
/*
int strlen2(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}
*/

// TODO: move to card.c?
void card_write(int port)
{
    _new_card();
    _card_write(port, 0x3F, 0);
}