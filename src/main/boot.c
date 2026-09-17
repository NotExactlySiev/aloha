// I don't think this module was written by Exact. I believe the file was simply
// given to them by Sony along with a "put this in there and don't worry about
// it". Which explains its complete lack of coupling with anything else and why
// it sniffs around undocumented kernel memory.

#include <ints.h>
#include <stdio.h>
#include <string.h>

typedef void (*boot_f)(char *, char *);

void reboot(char *conf, char *exec);
void _boot(char *conf, char *exec);
void EnterCriticalSection(void);

typedef struct {
    u32 kernel_date;
    u32 console_type;
} BiosHeader;

#define BIOS_HEADER (*(BiosHeader *)0xBFC00100)

// This _boot is not the _boot in libapi. It's _96_boot or something. That's
// why we haven't included libapi.h

// US: 80023800
// JP: 80022440
__asm__(".section .text\n"
        ".align 2\n"
        ".set noreorder\n"
        ".set noat\n"
        ".global _boot\n"
        "_boot:\n"
        "addiu      $t2, $zero, 0xA0\n"
        "jr         $t2\n"
        "addiu      $t1, $zero, 0xA0\n"
        "nop\n"
        ".set reorder\n"
        ".set at\n");

// US: 80023810
// JP: 80022450
void reset(void)
{
    u8 *kernelbuf = (u8 *)0xA000DF00;
    strcpy(kernelbuf, "PSDEMO");
    reboot("PSEXE", "SYSTEM.CNF");
}

// US: 80023850
// JP: 80022490
void reset2(void)
{
    reboot("PSEXE", "SYSTEM.CNF");
}

// US: 8002387C
// JP: 800224BC
void reboot(char *exec, char *conf)
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

    if ((BIOS_HEADER.console_type == 0x2000) && (BIOS_HEADER.kernel_date == 0x19940728)) {
        (*((boot_f)0xbfc0e228))(confAddr, execAddr);
    } else {
        _boot(confAddr, execAddr);
    }
}
