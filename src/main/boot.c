#include "common.h"

// maybe this entire file is actually just handwritten assembly?

typedef void (*boot_f)(char*,char*);

//boot_f  k_boot;
void reboot(char*, char*);

extern u32 k_KER_DATE;
extern u32 k_CONSOLE_TYPE;
extern u8 kernelbuf[8];


char default_conf[10]   = "SYSTEM.CNF"; 
char demo_str[6]        = "PSDEMO";
char demo_exec[5]       = "PSEXE";
char demo_conf[10]      = "SYSTEM.CNF";
char main_exec[5]       = "PSEXE";
char main_conf[10]      = "SYSTEM.CNF";

char exec_prefix[6] = "cdrom:";
char exec_pstfix[2] = ";1";
char conf_prefix[6] = "cdrom:";
char conf_pstfix[2] = ";1";
char reboot_msg[39] = "def = %s conf = %s serial = %08x %08x\n";

__asm__(".section .text\n\t" 
        ".align\t2\n"
        "kern 0xA0, 0xA0, k_boot\n\t"
        ".set reorder\n\t" 
        ".set at\n");


// SAME SIZE with as
void reset(void) {
    k_strcpy(kernelbuf, demo_str);
    reboot(demo_exec, demo_conf);
}

// SAME SIZE with as
void reset2(void) {
    reboot(main_exec, main_conf);
}

// NONMATCHING (not even close)
void reboot(char* exec, char* conf) {
    char confAddr[20];
    char execAddr[20];

    if (conf[0] == 0) {
        conf = default_conf;
    }
    k_strcpy(execAddr, exec_prefix);
    k_strcat(execAddr, exec);
    k_strcat(execAddr, exec_pstfix);
    k_strcpy(confAddr, conf_prefix);
    k_strcat(confAddr, conf);
    k_strcat(confAddr, conf_pstfix);
    k_printf(reboot_msg, execAddr, confAddr, k_KER_DATE, k_CONSOLE_TYPE);
    k_EnterCriticalSection();
    if ((k_CONSOLE_TYPE == 0x2000) && (k_KER_DATE == 0x19940728)) {
        (*((boot_f) 0xbfc0e228))(confAddr, execAddr);
    } else {
        k_boot(confAddr, execAddr);
    }
}
