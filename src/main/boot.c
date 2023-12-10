#include "common.h"
#include <stdio.h>
// TODO: why don't I have libapi.h?
//#include <libapi.h>

typedef void (*boot_f)(char*,char*);

void reboot(char *conf, char *exec);

// libapi.h stuff
void _boot(char *conf, char *exec);
char *k_strcat (char *, char *);
char *k_strcpy (/* char *, char * */);	/* To avoid conflicting */
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
    printf("def = %s conf = %s serial = %08x %08x\n", execAddr, confAddr, KER_DATE, CONSOLE_TYPE);
    EnterCriticalSection();

    if ((CONSOLE_TYPE == 0x2000) && (KER_DATE == 0x19940728)) {
        (*((boot_f) 0xbfc0e228))(confAddr, execAddr);
    } else {
        _boot(confAddr, execAddr);
    }
}