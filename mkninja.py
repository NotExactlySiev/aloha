import os
import sys

import ninja as Ninja

LINKER_SHARED = "linker/shared.ld"

if len(sys.argv) != 2:
    print("Usage: mkninja.py <version>")
    print("\tversion: one of us, eu, or jp")
    sys.exit(1)

# "us", "eu", or "jp"
version = sys.argv[1]


class SourceFile:
    def __init__(self, name, path):
        self.name = name
        self.path = path

    @property
    def obj_name(self):
        return f"{self.path.removeprefix('src/')}.o"


class Executable:
    def __init__(self, final_name, name, is_comped, libs, common_objects=[]):
        self.name = name
        self.final_name = final_name
        self.is_comped = is_comped
        self.source = []
        self.header = []
        self.libs = libs
        self.data = []
        self.common_objects = common_objects + ["header.o"]

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
        all_deps = ["build/" + cobj for cobj in self.common_objects]
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
            Ninja.build("comp", self.final_path, [exe_name], ["$knife"])
        else:
            Ninja.build("objcopy", self.final_path, [elf_path])

    @property
    def build_dir(self):
        return "build/"

    @property
    def final_path(self):
        return f"build/disc_{version}/{self.final_name}"


match version:
    case "us":
        versionFlag = " -DVERSION_WORLD"
        mainExeName = "SCUS_941.03"

    case "eu":
        versionFlag = " -DVERSION_WORLD"
        mainExeName = "SCES_000.03"

    case "jp":
        versionFlag = " -DVERSION_JAPAN"
        mainExeName = "PSX.EXE"

    case _:
        print(f"Version {version} is unknown.")

# Setup
executables = [
    Executable(
        mainExeName,
        "main",
        False,
        [
            "libpress",
            "libcd",
            "libds",
            "libcard",
            "libgpu",
            "libspu",
            "libetc",
            "libc",
            "libapi",
        ],
        ["util.o"],
    ),
    # Executable(
    #     "TITLE.PEX", "title", True, ["libgte", "libc", "libapi"], ["util.o", "start.o"]
    # ),
    # Executable("JM1/MAIN.PEX", "jm1", True, ["libgte", "libetc", "libc", "libapi"]),
    # Executable("SELECT.PEX", "select", True, ["libc"]),
    # Executable("GAMEOVER.PEX", "gameover", True, []),
]

# Ninja setup
Ninja.set("version", version)
Ninja.set("cross", "mipsel-unknown-none-elf-")
Ninja.set("knifedir", "tools/knife")
Ninja.set("knife", "build/knife")
Ninja.set("makeiso", "mkpsxiso")
Ninja.set("dumpiso", "dumpsxiso")
Ninja.set(
    "cflags",
    " ".join(
        [
            "-Wall",
            "-Iinclude",
            "-Ipsyq/include",
            "-Iassets",
            "-O1",
            "-G0",
            "-DLANGUAGE_C",
            "-fno-zero-initialized-in-bss",
            "-msoft-float",
            "-mips1",
            "-march=mips1",
            "-mabi=32",
            "-EL",
            "-mno-abicalls",
            "-fno-stack-protector",
            "-Wa,--no-pad-sections",
            "-fno-builtin",
            "-fno-pic",
            "-DPSYQ47_FIXES",
        ]
    ),
)
Ninja.set("ldflags", "--no-check-sections -nostdlib -s")
Ninja.set("cflagsnat", "-O2")

Ninja.rule("ccnat", "gcc $cflagsnative $in -o $out")
Ninja.rule("cc", "${cross}gcc $cflags -Iassets/$modid -c $in -o $out " + versionFlag)
Ninja.rule(
    "link",
    "${cross}ld $ldflags -Map=build/$modid.map -T linker/symbols.$modid.ld -T "
    + LINKER_SHARED
    + " $in -o $out",
)
Ninja.rule("objcopy", "${cross}objcopy -O binary $in $out")
Ninja.rule("copy", "cp $in $out")
Ninja.rule("decomp", "$knife decomp $in $out")
Ninja.rule("comp", "$knife pex compress $in $out")
Ninja.param("description", "Compressing $out")
Ninja.rule("mkiso", "$makeiso -y $in -o $out")
Ninja.param("description", "Generating Disc Image")
Ninja.rule("REGENERATE", "python $in $version")
Ninja.param("description", "Updating build.ninja")
Ninja.param("generator", "1")

# Build tools
Ninja.build("phony", "tools", ["$knife"])
Ninja.build(
    "ccnat",
    "$knife",
    [
        "$knifedir/main.c",
        "$knifedir/ear.c",
        "$knifedir/pex.c",
        "$knifedir/utility.c",
        "$knifedir/press.c",
    ],
)

# Common objects
Ninja.build("cc", "build/header.o", ["src/header.s"])
Ninja.build("cc", "build/start.o", ["src/start.s"])
Ninja.build("cc", "build/util.o", ["src/util.c"])

extra_deps = []
exe_paths = []
for exe in executables:
    exe.generate()
    exe_paths.append(exe.final_path)

if version in ["us", "eu"]:
    Ninja.rule("mkcountry", "python mkcountry.py $version")
    Ninja.build("cc", "build/disc_world/COUNTRY.TXT", ["src/header.s"])
    extra_deps.append("build/disc_world/COUNTRY.TXT")

Ninja.build(
    "mkiso", f"build/aloha_{version}.bin", [f"{version}.xml"], exe_paths + extra_deps
)
Ninja.build("REGENERATE", "build.ninja", ["mkninja.py"], ["ninja.py"])
Ninja.write_to_file("build.ninja")
