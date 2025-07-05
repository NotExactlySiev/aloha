import os
import ninja as Ninja

LINKER_SHARED = "linker/shared.ld"

class SourceFile:
    def __init__(self, name, path):
        self.name = name
        self.path = path

    @property
    def obj_name(self):
        return f"{self.name}.o"

class Executable:
    def __init__(self, final_name, name, is_comped, libs):
        self.name = name
        self.final_name = final_name
        self.is_comped = is_comped
        self.source = []
        self.header = []
        self.libs = libs
        self.data = []

        self.scan_dir(f"src/{self.name}")
        self.scan_dir(f"asm/{self.name}/data")

    def add_file(self, name, path):
        if path.endswith(".c") or path.endswith(".s"):
            self.source.append(SourceFile(name, path))
        elif path.endswith(".h"):
            self.header.append(path)
        else:
            print(f"# don't know: {path}")

    def scan_dir(self, path):
        if not os.path.exists(path):
            return
        for entry in os.listdir(path):
            full_path = os.path.join(path, entry)
            if os.path.isdir(full_path):
                self.scan_dir(full_path)
            else:
                self.add_file(entry, full_path)

    def generate(self):
        all_deps = ["build/header.o"]
        for f in self.source:
            Ninja.build("cc", self.build_dir + f.obj_name, [f.path], [])
            Ninja.param("modid", self.name)
            all_deps.append(self.build_dir + f.obj_name)
        for lib in self.libs:
            all_deps.append(f"psyq/libs/{lib}.a")

        elf_path = f"build/{self.name}.elf"
        symbols_file = f"linker/symbols.{self.name}.ld"
        Ninja.build("link", elf_path, all_deps, [LINKER_SHARED, symbols_file])
        Ninja.param("modid", self.name)

        exe_name = f"build/{self.name}.exe"
        if self.is_comped:
            Ninja.build("objcopy", exe_name, [elf_path])
            Ninja.build("comp", self.final_path, [exe_name], ["$jfcomp"])
        else:
            Ninja.build("objcopy", self.final_path, [elf_path])

    @property
    def build_dir(self):
        return f"build/{self.name}/"

    @property
    def final_path(self):
        return f"build/disc/{self.final_name}"

# Setup
executables = [
    Executable("SCUS_941.03", "main", False,
               ["libpress", "libcd", "libds", "libcard", "libgpu", "libspu", "libetc", "libc", "libapi"]),
    Executable("TITLE.PEX", "title", True, ["libgte", "libc", "libapi"]),
    # Executable("JM1/MAIN.PEX", "jm1", True, []),
    # Executable("SELECT.PEX", "select", True, ["libc"]),
    # Executable("GAMEOVER.PEX", "gameover", True, []),
]

# Ninja setup
Ninja.set("cross", "mipsel-unknown-none-elf-")
Ninja.set("jfdir", "tools/jfcomp")
Ninja.set("jfcomp", "$jfdir/jfcomp")
Ninja.set("makeiso", "mkpsxiso")
Ninja.set("dumpiso", "dumpsxiso")
Ninja.set("cflags", "-Wall -Iinclude -Ipsyq/include -Iassets -O1 -G0 -fno-zero-initialized-in-bss -msoft-float -mips1 -march=mips1 -mabi=32 -EL -mno-abicalls -fno-stack-protector -Wa,--no-pad-sections -fno-builtin -fno-pic")
Ninja.set("ldflags", "--no-check-sections -nostdlib -s")
Ninja.set("cflagsnat", "-O2")

Ninja.rule("ccnat", "gcc $cflagsnative $in -o $out")
Ninja.rule("cc", "${cross}gcc $cflags -Iassets/$modid -c $in -o $out")
Ninja.rule("link", "${cross}ld $ldflags -Map=build/$modid.map -T linker/symbols.$modid.ld -T " + LINKER_SHARED + " $in -o $out")
Ninja.rule("objcopy", "${cross}objcopy -O binary $in $out")
Ninja.rule("copy", "cp $in $out")
Ninja.rule("decomp", "$jfcomp decomp $in $out")
Ninja.rule("comp", "$jfcomp comp $in $out")
Ninja.param("description", "Compressing $out")
Ninja.rule("mkiso", "$makeiso -y $in -o $out")
Ninja.param("description", "Generating Disc Image")
Ninja.rule("REGENERATE", "python $in")
Ninja.param("description", "Updating build.ninja")
Ninja.param("generator", "1")

# Build tools
Ninja.build("phony", "tools", ["$jfcomp"])
Ninja.build("ccnat", "$jfcomp", [
    "$jfdir/main.c",
    "$jfdir/comp.c",
    "$jfdir/decomp.c",
])
Ninja.build("cc", "build/header.o", ["src/header.s"])

exe_paths = []
for exe in executables:
    exe.generate()
    exe_paths.append(exe.final_path)

Ninja.build("mkiso", "build/aloha.bin", ["us.xml"], exe_paths)
Ninja.build("REGENERATE", "build.ninja", ["mkninja.py"], ["ninja.py"])
Ninja.write_to_file("build.ninja")
