#include "common.h"
#include <stdio.h>
// TODO: why don't I have libapi.h?
//#include <libapi.h>

typedef void (*boot_f)(char*,char*);

void reboot(char *conf, char *exec);

// libapi.h stuff
void _boot(char *conf, char *exec);
//char *k_strcat (char *, char *);
//char *k_strcpy (/* char *, char * */);	/* To avoid conflicting */
void EnterCriticalSection(void);

extern u32 KER_DATE;
extern u32 CONSOLE_TYPE;
extern u8 kernelbuf[8];

__asm__(".section .text\n\t" 
        ".align\t2\n"
        "kern 0xA0, 0xA0, _boot\n\t"
        ".set reorder\n\t"
        ".set at\n");

void reset(void)
{
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
    printf("def = %s conf = %s serial = %08x %08x\n", execAddr, confAddr, KER_DATE, CONSOLE_TYPE);
    EnterCriticalSection();

    if ((CONSOLE_TYPE == 0x2000) && (KER_DATE == 0x19940728)) {
        (*((boot_f) 0xbfc0e228))(confAddr, execAddr);
    } else {
        _boot(confAddr, execAddr);
    }
}