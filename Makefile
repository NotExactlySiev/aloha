
CPP	:= mipsel-linux-gnu-cpp 
CC	:= wine CC1PSX.EXE 
AS	:= mipsel-linux-gnu-as 

CPP_FLAGS	+= -Iinclude
CC_FLAGS	+= -mcpu=3000 -quiet -G0 -w -O2 -funsigned-char -fpeephole -ffunction-cse -fpcc-struct-return -fcommon -fverbose-asm -fgnu-linker -mgas -msoft-float
AS_FLAGS	+= -Isrc -Iinclude -march=r3000 -mtune=r3000 -no-pad-sections -O1 -G0

BUILD_DIR	:= build

$(BUILD_DIR)/asm/main:
	mkdir -p $(BUILD_DIR)/asm/main

$(BUILD_DIR)/src/main:
	mkdir -p $(BUILD_DIR)/src/main

$(BUILD_DIR)/asm/main/%.s.o: asm/main/%.s $(BUILD_DIR)/asm/main
	$(AS) $(AS_FLAGS) -o $@ $<

$(BUILD_DIR)/src/main/%.c.o: src/main/%.c $(BUILD_DIR)/src/main
	$(CPP) $(CPP_FLAGS) $< | $(CC) $(CC_FLAGS) | $(AS) $(AS_FLAGS) -o $@
