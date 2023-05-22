
CPP	:= mipsel-linux-gnu-cpp 
CC	:= wine CC1PSX.EXE 
AS	:= mipsel-linux-gnu-as 

CPP_FLAGS	+= -Iinclude
CC_FLAGS	+= -O2 -G0 -quiet -fverbose-asm -fgnu-linker -fcommon -mgas -msoft-float
AS_FLAGS	+= -Isrc -Iinclude -march=r3000 -mtune=r3000 -mabi=32 -no-pad-sections -O1 -G0

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

$(BUILD_DIR)/asm/main/%.s.o: asm/main/%.s $(BUILD_DIR)/asm/main
	$(AS) $(AS_FLAGS) -o $@ $<

$(BUILD_DIR)/src/main/%.c.o: src/main/%.c $(BUILD_DIR)/src/main
	$(CPP) $(CPP_FLAGS) $< | $(CC) $(CC_FLAGS) | $(AS) $(AS_FLAGS) -o $@

split:
	tools/n64splat/split.py splat.main.yaml


main: $(MAIN_O_FILES)

clean:
	git clean -fdx asm/
	git clean -fdx build/
