
CPP_FLAGS	+= -Iinclude -Ipsyq
CC_FLAGS	+= -w -O1 -G0 -fno-zero-initialized-in-bss -fpeephole -ffunction-cse -fpcc-struct-return -msoft-float
AS_FLAGS	+= -Iinclude -mno-shared -msoft-float -march=r3000 -mtune=r3000 -no-pad-sections
ARCH_FLAGS	+= -march=mips1 -mabi=32 -EL -fno-pic -mno-shared -mno-abicalls
ARCH_FLAGS	+= -mfp32 -fno-stack-protector -nostdlib -ffreestanding

CROSS	:= mipsel-linux-gnu-

CPP		:= $(CROSS)cpp 
CC		:= $(CROSS)gcc
AS		:= $(CROSS)as 
LD		:= $(CROSS)ld
COPY	:= $(CROSS)objcopy

COMP	:= tools/jfcomp

BUILD_DIR	:= build

MAIN_S_FILES	:=	$(wildcard asm/main/data/*.s) \
					$(wildcard src/main/*.s)	\
					$(wildcard src/main/libapi/*.s) \
					
MAIN_C_FILES	:=  $(wildcard src/main/*.c) $(wildcard src/main/**/*.c)
MAIN_O_FILES	:=  $(foreach file,$(MAIN_C_FILES),$(BUILD_DIR)/$(file).o) \
					$(foreach file,$(MAIN_S_FILES),$(BUILD_DIR)/$(file).o) \
					$(BUILD_DIR)/src/header.o

GAMEOVER_S_FILES :=	$(wildcard asm/gameover/data/*.s) \
					$(wildcard src/gameover/*.s)
GAMEOVER_C_FILES := $(wildcard src/gameover/*.c)	
GAMEOVER_O_FILES := $(foreach file,$(GAMEOVER_C_FILES),$(BUILD_DIR)/$(file).o) \
					$(foreach file,$(GAMEOVER_S_FILES),$(BUILD_DIR)/$(file).o) \
					$(BUILD_DIR)/src/header.o

$(BUILD_DIR)/src/header.o:	src/header.s
	$(AS) $(AS_FLAGS) -o $@ $<

$(BUILD_DIR)/%.s.o:	%.s
	$(AS) $(AS_FLAGS) -o $@ $<

$(BUILD_DIR)/%.c.o:	%.c
	$(CC) $(CPP_FLAGS) $(CC_FLAGS) $(ARCH_FLAGS) -o $@ -c -xc $<

$(BUILD_DIR)/main.elf: $(MAIN_O_FILES)
	$(LD) -o $@ \
	-Map=$(BUILD_DIR)/main.map \
	-T main.ld \
	-T symbols.main.ld \
	--no-check-sections \
	-nostdlib \
	-s $^

$(BUILD_DIR)/gameover.elf: $(GAMEOVER_O_FILES)
	$(LD) -o $@ \
	-Map=$(BUILD_DIR)/gameover.map \
	-T gameover.ld \
	-T symbols.gameover.ld \
	--no-check-sections \
	-nostdlib \
	-s $^

%.exe: %.elf
	$(COPY) -O binary $< $@	

%.pex: %.exe
	$(COMP) comp $< $@

clean:
	git clean -fdx asm/
	git clean -fdx build/
