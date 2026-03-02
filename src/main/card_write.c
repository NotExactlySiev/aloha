#include <libapi.h>

// This is not part of the shared string.c module. It only exists in main and
// honestly might be a standard library function.

// 80023110
void card_write(int port)
{
    _new_card();
    _card_write(port, 0x3F, 0);
}
