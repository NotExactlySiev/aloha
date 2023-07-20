#include "common.h"

typedef void (*boot_f)(char*,char*);

void reboot(char*, char*);

extern u32 k_KER_DATE;
extern u32 k_CONSOLE_TYPE;
extern u8 kernelbuf[8];

__asm__(".section .text\n\t" 
        ".align\t2\n"
        "kern 0xA0, 0xA0, k_boot\n\t"
        ".set reorder\n\t" 
        ".set at\n");

void reset(void)
{
    k_strcpy(kernelbuf, "PSDEMO");
    reboot("PSEXE", "SYSTEM.CNF");
}

void reset2(void)
{
    reboot("PSEXE", "SYSTEM.CNF");
}

void reboot(char* exec, char* conf)
{
    char confAddr[20];
    char execAddr[20];

    if (conf[0] == 0) {
        conf = "SYSTEM.CNF";
    }
    
    k_strcpy(execAddr, "cdrom:");
    k_strcat(execAddr, exec);
    k_strcat(execAddr, ";1");
    k_strcpy(confAddr, "cdrom:");
    k_strcat(confAddr, conf);
    k_strcat(confAddr, ";1");
    k_printf("def = %s conf = %s serial = %08x %08x\n", execAddr, confAddr, k_KER_DATE, k_CONSOLE_TYPE);
    k_EnterCriticalSection();

    if ((k_CONSOLE_TYPE == 0x2000) && (k_KER_DATE == 0x19940728)) {
        (*((boot_f) 0xbfc0e228))(confAddr, execAddr);
    } else {
        k_boot(confAddr, execAddr);
    }
}