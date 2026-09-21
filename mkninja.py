import os
import sys
from typing import override

import ninja as Ninja

LINKER_SHARED = "linker/shared.ld"

if len(sys.argv) != 2:
    print("Usage: mkninja.py <version>")
    print("\tversion: one of us, eu, or jp")
    sys.exit(1)

# "us", "eu", or "jp"
version: str = sys.argv[1]


class SourceFile:
    def __init__(self, name, path):
        self.name: str = name
        self.path: str = path

    @property
    def obj_name(self):
        return f"{self.path.removeprefix('src/')}.o"


class Artifact:
    def generate(self): ...

    @property
    def final_path(self) -> str: ...


class PsyqLibrary(Artifact):
    def __init__(self, name: str):
        self.name: str = name

    @property
    @override
    def final_path(self) -> str:
        return f"psyq/libs/{self.name}.a"


class Executable(Artifact):
    def __init__(
        self,
        final_name: str,
        name: str,
        is_comped: bool,
        # libs: list[str] = [],
        libs: list[Artifact] = [],
        objs: list[str] = [],
        assets: list[Artifact] = [],
    ):
        self.name: str = name
        self.final_name: str = final_name
        self.is_comped: bool = is_comped

        # Explicit dependencies
        self.common_objects: list[str] = objs + ["header.o"]
        self.libs: list[Artifact] = libs
        self.assets: list[Artifact] = assets

        # Discovered dependencies
        self.source: list[SourceFile] = []
        self.header: list[str] = []
        self.scan_dir(f"src/{self.name}")
        self.scan_dir(f"asm/{self.name}/data")

    def add_file(self, name: str, path: str):
        if path.endswith((".c", ".s")):
            self.source.append(SourceFile(name, path))
        elif path.endswith(".h"):
            self.header.append(path)
        else:
            print(f"# don't know: {path}")

    def scan_dir(self, path: str):
        if not os.path.exists(path):
            return
        for entry in os.listdir(path):
            full_path = os.path.join(path, entry)
            if os.path.isdir(full_path):
                self.scan_dir(full_path)
            else:
                self.add_file(entry, full_path)

    @property
    def build_dir(self):
        return "build/"

    def generate_decompress(self):
        Ninja.build(
            "decomp",
            f"execs/{version}_{self.name}.exe",
            [f"execs/{version}_{self.name}.pex"],
            ["$knife"],
        )

    @override
    def generate(self):
        all_deps = ["build/" + cobj for cobj in self.common_objects]
        for f in self.source:
            Ninja.build("cc", self.build_dir + f.obj_name, [f.path], [])
            Ninja.param("modid", self.name)
            all_deps.append(self.build_dir + f.obj_name)
        for lib in self.libs:
            lib.generate()
            all_deps.append(lib.final_path)
            # all_deps.append(f"psyq/libs/{lib}.a")

        # Assets

        # If there are assets that need to be extracted, make sure this file
        # gets decompressed if needed.
        if len(self.assets) > 0 and self.is_comped:
            self.generate_decompress()

        for asset in self.assets:
            asset.generate()
            all_deps.append(asset.final_path)

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
    @override
    def final_path(self) -> str:
        return f"build/disc_{version}/{self.final_name}"


# Location of a binary asset embedded inside an executable.
class AssetLocation:
    def __init__(self, offset: int, size: int):
        self.offset: int = offset + 0x800
        self.size: int = size


class Asset(Artifact):
    def __init__(
        self, name: str, exec: str, locJp: AssetLocation, locUs: AssetLocation
    ):
        self.name: str = name
        self.exec: str = exec
        # TODO: Other versions are not supported.
        self.loc: AssetLocation = locJp if version == "jp" else locUs

    @property
    def bin_path(self) -> str:
        return f"assets/{self.exec}/{self.name}.bin"

    @property
    def elf_path(self) -> str:
        return f"build/{self.exec}/assets/{self.name}.elf"

    def generate_extract(self):
        Ninja.build("extract", self.bin_path, [f"execs/{version}_{self.exec}.exe"])
        Ninja.param("offset", self.loc.offset)
        Ninja.param("size", self.loc.size)

    # Generate the build command to turn the extracted .bin file into a linkable
    # .elf file.
    def generate_embed(self):
        Ninja.build("embed", self.elf_path, [self.bin_path])

    # Generate all the required build commands for this asset.
    def generate(self):
        self.generate_extract()
        self.generate_embed()

    @property
    def final_path(self) -> str:
        return self.elf_path


match version:
    case "us":
        versionFlag = " -DVERSION_WORLD"
        mainExeName = "SCUS_941.03"
        selectIsCompressed = True

    case "eu":
        versionFlag = " -DVERSION_WORLD"
        mainExeName = "SCES_000.03"
        selectIsCompressed = True

    case "jp":
        versionFlag = " -DVERSION_JAPAN"
        mainExeName = "PSX.EXE"
        selectIsCompressed = False

    case _:
        print(f"Version {version} is unknown.")
        sys.exit(1)

selectExeName = "SELECT." + "PEX" if selectIsCompressed else "EXE"

# Setup
executables = [
    Executable(
        mainExeName,
        "main",
        False,
        libs=[
            PsyqLibrary("libpress"),
            PsyqLibrary("libcd"),
            PsyqLibrary("libds"),
            PsyqLibrary("libcard"),
            PsyqLibrary("libgpu"),
            PsyqLibrary("libspu"),
            PsyqLibrary("libetc"),
            PsyqLibrary("libc"),
            PsyqLibrary("libapi"),
        ],
        objs=["util.o"],
        assets=[
            # TODO: Use this list to bring in the assets for this file. They are
            # currently hardcoded in the dump_us.sh script.
        ],
    ),
    Executable(
        "TITLE.PEX",
        "title",
        True,
        [PsyqLibrary("libgte"), PsyqLibrary("libc"), PsyqLibrary("libapi")],
        ["util.o", "start.o"],
    ),
    Executable(
        "JM1/MAIN.PEX",
        "jm1",
        True,
        [
            PsyqLibrary("libgte"),
            PsyqLibrary("libetc"),
            PsyqLibrary("libc"),
            PsyqLibrary("libapi"),
        ],
    ),
    # TODO: Should be SELECT.EXE and not compressed for Japan.
    # Executable(selectExeName, "select", selectIsCompressed, ["libc"]),
    Executable(
        "GAMEOVER.PEX",
        "gameover",
        True,
        objs=["start.o"],
        assets=[
            Asset(
                "sprtdata",
                "gameover",
                AssetLocation(0x0, 0xAF4),
                AssetLocation(0x0, 0xAEC),
            ),
            Asset(
                "sprttiles",
                "gameover",
                AssetLocation(0xAF4, 40704),
                AssetLocation(0xAEC, 40576),
            ),
            Asset(
                "clut0",
                "gameover",
                AssetLocation(0xA9F4, 512),
                AssetLocation(0xA96C, 512),
            ),
            Asset(
                "clut1",
                "gameover",
                AssetLocation(0xABF4, 512),
                AssetLocation(0xAB6C, 512),
            ),
            Asset(
                "clut2",
                "gameover",
                AssetLocation(0xADF4, 512),
                AssetLocation(0xAD6C, 512),
            ),
            Asset(
                "bunny",
                "gameover",
                AssetLocation(0xAFF4, 2312),
                AssetLocation(0xAF6C, 2312),
            ),
        ],
    ),
]

compileFlags = [
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
    "-DEXTRA_DEBUG_LOGS",
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
    " ".join(compileFlags),
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
Ninja.rule("decomp", "$knife pex decompress $in $out")
Ninja.rule("comp", "$knife pex compress $in $out")
Ninja.param("description", "Compressing $out")

Ninja.rule("mkiso", "$makeiso -y $in -o $out")
Ninja.param("description", "Generating Disc Image")
Ninja.rule("REGENERATE", "python $in $version")
Ninja.param("description", "Updating build.ninja")
Ninja.param("generator", "1")

# Asset extractions and embedding rules

Ninja.rule("extract", "dd if=$in of=$out bs=1 skip=$offset count=$size")
Ninja.param("description", "Extracting asset $out")

Ninja.rule("embed", "${cross}objcopy -I binary -O elf32-littlemips $in $out")
Ninja.param("description", "Turning binary file $in into embeddable elf")

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

extra_deps: list[str] = []
exe_paths: list[str] = []
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
