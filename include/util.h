#include <ints.h>

void ram_strcpy(char *src, char *dst);
void ram_strcat(char *a, char *b, char *dst);
int ram_strchr(char *str, char c);
void ram_strupper(char *src, char *dst);
int ram_strlen(char *str);
int ram_memcmp(int n, void *a, void *b);
void ram_memcpy(int n, void *src, void *dst);
void ram_memset(void *dst, int n, u8 c);
