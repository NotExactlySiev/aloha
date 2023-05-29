
CPP_FLAGS	+= -Iinclude
#CC_FLAGS	+= -O1 -quiet -mcpu=3000 -G8 -fverbose-asm -fgnu-linker -fcommon -mgas -msoft-float
CC_FLAGS	+= -mcpu=3000 -quiet -w -O1 -mno-gpopt -funsigned-char -fpeephole -ffunction-cse -fpcc-struct-return -fcommon -fverbose-asm -fgnu-linker -mgas -msoft-float

AS_FLAGS	+= -Iinclude -mno-shared -march=r3000 -mtune=r3000 -no-pad-sections

CPP	:= mipsel-linux-gnu-cpp 
#CC	:= ./cc1-psx-26
CC	:= wine CC1PSX.EXE
#CC	:= dosemu -quiet -dumb -K . -E "CC1PSX.EXE ${CC_FLAGS}"
#AS	:= mipsel-linux-gnu-as 
AS	:= wine ASPSX.EXE


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
	$(CPP) $(CPP_FLAGS) $< | $(CC) $(CC_FLAGS) -o $@

$(BUILD_DIR)/asm/main/%.s.o: asm/main/%.s $(BUILD_DIR)/asm/main
	$(AS) $(AS_FLAGS) -o $@ $<
#	psyq-obj-parser $@bj -o $@
#	rm $@bj

$(BUILD_DIR)/src/main/%.c.o: $(BUILD_DIR)/src/main/%.s $(BUILD_DIR)/src/main
	#$(AS) $(AS_FLAGS) -o $@ $<
	$(AS) -o $@bj $<
	psyq-obj-parser $@bj -o $@
	rm $@bj

split:
	tools/n64splat/split.py splat.main.yaml


main: $(MAIN_O_FILES)

clean:
	git clean -fdx asm/
	git clean -fdx build/
