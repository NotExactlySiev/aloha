#include "common.h"
#include <stdio.h>
// TODO: why don't I have libapi.h?
// because _boot is not the _boot in libapi. it's _96_boot or something
//#include <libapi.h>
#include <string.h>

typedef void (*boot_f)(char*,char*);

void reboot(char *conf, char *exec);
void _boot(char *conf, char *exec);
void EnterCriticalSection(void);

typedef struct {
    u32 kernel_date;
    u32 console_type;
} BiosHeader;

#define BIOS_HEADER   (*(BiosHeader *) 0xBFC00100)

__asm__(".section .text\n\t" 
        ".align\t2\n"
        "kern 0xA0, 0xA0, _boot\n\t"
        ".set reorder\n\t"
        ".set at\n");

void reset(void)
{
    u8 *kernelbuf = (u8 *) 0xA000DF00;
    strcpy(kernelbuf, "PSDEMO");
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
    
    strcpy(execAddr, "cdrom:");
    strcat(execAddr, exec);
    strcat(execAddr, ";1");
    strcpy(confAddr, "cdrom:");
    strcat(confAddr, conf);
    strcat(confAddr, ";1");
    printf("def = %s conf = %s serial = %08x %08x\n", execAddr, confAddr, BIOS_HEADER.kernel_date, BIOS_HEADER.console_type);
    EnterCriticalSection();

    if ((BIOS_HEADER.console_type) && (BIOS_HEADER.kernel_date == 0x19940728)) {
        (*((boot_f) 0xbfc0e228))(confAddr, execAddr);
    } else {
        _boot(confAddr, execAddr);
    }
}