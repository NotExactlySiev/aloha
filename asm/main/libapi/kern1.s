.set noat
.set noreorder
.include    "macro.inc"

// TODO: get this one out of here
glabel func_800239A0
    jr         $ra
    nop

kern 0xB0, 0x09, k_CloseEvent
kern 0xB0, 0x51, k_Krom2RawAdd
sysc 1, k_EnterCriticalSection
kern 0xB0, 0x33, k_lseek
kern 0xB0, 0x36, k_close
kern 0xB0, 0x35, k_write
kern 0xB0, 0x0C, k_EnableEvent
kern 0xB0, 0x45, k_erase
kern 0xB0, 0x41, k_format