import "io" for File, Directory
import "./ninja" for Ninja

var LINKER_SHARED = "linker/shared.ld"

// all paths are relative to the main project directory
// TODO: add INCLUDE_ASM dependencies
// TODO: include header dependencies
// TODO: move out the Ninja and other classes to a
//       separate file
class SourceFile {
    construct new(name, path) {
        _name = name
        _path = path
    }

    name { _name }
    path { _path }
    objName { _name + ".o" }
    // finalName finalPath? finalPath goes in build/
}

class Executable {
    construct new(fname, name, isComped, libs) {
        _name = name
        _finalName = fname
        _isComped = isComped
        _source = []
        _header = []
        _libs = libs
        _data = []

        scanDir("src/" + _name)
        scanDir("asm/" + _name + "/data")
    }

    addFile(name, path) {
        if (path.endsWith(".c") || path.endsWith(".s")) {
            _source.add(SourceFile.new(name, path))
        } else if (path.endsWith(".h")) {
            _header.add(path)
        } else {
            System.print("# don't know: " + path)
        }
    }

    scanDir(path) {
        if (!Directory.exists(path)) return
        var lst = Directory.list(path)
        for (ent in lst) {
            var p = path + "/" + ent
            if (Directory.exists(p)) {
                scanDir(p)
            } else {
                addFile(ent, p)
            }
        }
    }

    generate() {
        var allDeps = []
        allDeps.add("build/header.o")
        for (f in _source) {
            Ninja.build("cc", buildDir + f.objName, [f.path], [])
            Ninja.param("modid", _name)
            allDeps.add(buildDir + f.objName)
        }
        for (f in _libs) {
            allDeps.add("psyq/libs/" + f + ".a")
        }
        var elfPath = "build/" + _name + ".elf"
        var symbolsFile = "linker/symbols." + _name + ".ld"
        Ninja.build("link", elfPath, allDeps, [LINKER_SHARED, symbolsFile])
        Ninja.param("modid", _name)
        var exeName = "build/" + _name + ".exe"

        if (_isComped) {
            Ninja.build("objcopy", exeName, [elfPath])
            Ninja.build("comp", finalPath, [exeName], ["$jfcomp"])
        } else {
            Ninja.build("objcopy", finalPath, [elfPath])
        }
    }

    buildDir { "build/" + _name + "/" }
    finalPath { "build/disc/" + _finalName }
    name { _name }
    source { _source }
    header { _header }
}

var execs = [
    Executable.new("SCUS_941.03", "main", false,
        ["libpress", "libcd", "libds", "libcard", "libgpu", "libspu", "libetc", "libc", "libapi"]),
    //Executable.new("JM1/MAIN.PEX", "jm1", true, []),
    //Executable.new("SELECT.PEX", "select", true, ["libc"]),
    //Executable.new("GAMEOVER.PEX", "gameover", true, []),
    //Executable.new("TITLE.PEX", "title", true, ["libgte", "libc", "libapi"]),
]

// TODO: check for the compiler
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
Ninja.rule("link", "${cross}ld $ldflagas -Map=build/$modid.map -T linker/symbols.$modid.ld -T " + LINKER_SHARED + " $in -o $out")
Ninja.rule("objcopy", "${cross}objcopy -O binary $in $out")
Ninja.rule("copy", "cp $in $out")
Ninja.rule("decomp", "$jfcomp decomp $in $out")
Ninja.rule("comp", "$jfcomp comp $in $out")
Ninja.param("description", "Compressing $out")
Ninja.rule("mkiso", "$makeiso -y $in -o $out")
Ninja.param("description", "Generating Disc Image")
Ninja.rule("REGENERATE", "wren_cli $in > $out")
Ninja.param("description", "Updating build.ninja")
Ninja.param("generator", "1")

Ninja.build("phony", "tools", ["$jfcomp"])
Ninja.build("ccnat", "$jfcomp", [
    "$jfdir/main.c",
    "$jfdir/comp.c",
    "$jfdir/decomp.c",
])
Ninja.build("cc", "build/header.o", ["src/header.s"])

var exePaths = []
for (exe in execs) {
    exe.generate()
    exePaths.add(exe.finalPath)
}

Ninja.build("mkiso", "build/aloha.bin", ["us.xml"], exePaths)
Ninja.build("REGENERATE", "build.ninja", ["mkninja.wren"], ["ninja.wren"])
