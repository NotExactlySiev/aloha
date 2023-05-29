
CPP_FLAGS	+= -Iinclude
#CC_FLAGS	+= -O1 -quiet -mcpu=3000 -G8 -fverbose-asm -fgnu-linker -fcommon -mgas -msoft-float
CC_FLAGS	+= -w -O2 -G0 -funsigned-char -fpeephole -ffunction-cse -fpcc-struct-return -fcommon -fverbose-asm -msoft-float

AS_FLAGS	+= -Iinclude -mno-shared -msoft-float -march=r3000 -mtune=r3000 -no-pad-sections
ARCH_FLAGS	= -march=mips1 -mabi=32 -EL -fno-pic -mno-shared -mno-abicalls
ARCH_FLAGS	+= -mfp32 -fno-stack-protector -nostdlib -ffreestanding

CROSS	:= mipsel-linux-gnu-

CPP	:= $(CROSS)cpp 
#CC	:= ./cc1-psx-26
#CC	:= wine CC1PSX.EXE
#CC	:= dosemu -quiet -dumb -K . -E "CC1PSX.EXE ${CC_FLAGS}"
CC	:= $(CROSS)gcc
AS	:= mipsel-linux-gnu-as 
#AS	:= wine ASPSX.EXE
LD	:= $(CROSS)ld
COPY	:= $(CROSS)objcopy


BUILD_DIR	:= build

MAIN_S_FILES	:=	$(wildcard asm/main/data/*.s) \
			$(wildcard asm/main/libapi/*.s) \
			$(wildcard asm/main/*.s) 
MAIN_C_FILES	:= $(wildcard src/main/*.c) $(wildcard src/main/**/*.c)
MAIN_O_FILES	:= $(foreach file,$(MAIN_C_FILES),$(BUILD_DIR)/$(file).o) \
			$(foreach file,$(MAIN_S_FILES),$(BUILD_DIR)/$(file).o)

$(BUILD_DIR)/asm/main:
	mkdir -p $(BUILD_DIR)/asm/main

$(BUILD_DIR)/src/main:
	mkdir -p $(BUILD_DIR)/src/main

$(BUILD_DIR)/src/main/%.s: src/main/%.c $(BUILD_DIR)/src/main
	$(CPP) $(CPP_FLAGS) $< | $(CC) $(CC_FLAGS) $(ARCH_FLAGS) -o $@ -S -xc -

$(BUILD_DIR)/asm/main/%.s.o: asm/main/%.s $(BUILD_DIR)/asm/main
	$(AS) $(AS_FLAGS) -o $@ $<
#	psyq-obj-parser $@bj -o $@
#	rm $@bj

$(BUILD_DIR)/src/main/%.c.o: $(BUILD_DIR)/src/main/%.s $(BUILD_DIR)/src/main
	$(AS) $(AS_FLAGS) -o $@ $<
	#$(AS) -o $@bj $<
	#psyq-obj-parser $@bj -o $@
	#rm $@bj

split:
	tools/n64splat/split.py splat.main.yaml


$(BUILD_DIR)/main.elf: $(MAIN_O_FILES)
	$(LD) -o $@ \
	-Map=$(BUILD_DIR).map \
	-T main.ld \
	-T symbols.ld \
	-T undefined_syms_auto.txt \
	--no-check-sections \
	-nostdlib \
	-s

#-T undefined_funcs_auto.txt \

$(BUILD_DIR)/main.exe: $(BUILD_DIR)/main.elf
	$(COPY) -O binary $< $@	

clean:
	git clean -fdx asm/
	git clean -fdx build/
