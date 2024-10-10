import "io" for File, Directory

// all paths are relative to the main project directory
// TODO: add INCLUDE_ASM dependencies
// TODO: include header dependencies
// TODO: move out the Ninja and other classes to a
//       separate file

class Ninja {
    static put(s) {
        // TODO: write to a buffer?
        System.write(s)
    }

    static nl() {
        put("\n")
    }

    static build(rule, target, direct, indirect) {
        put("build " + target + ": " + rule)
        for (src in direct) {
            put(" " + src)
        }
        if (indirect.count > 0){
            put(" |")
            for (src in indirect) {
                put(" " + src)
            }
        }
        nl()
    }
    
    static build(rule, target, direct) {
        build(rule, target, direct, [])
    }

    static set(varName, val) {
        put(varName + " = " + val)
        nl()
    }

    static param(varName, val) {
        set("    " + varName, val)
    }

    static rule(name, cmd) {
        put("rule " + name + "\n    command = " + cmd)
        nl()
    }
}

class SourceFile {
    construct new(name, path) {
        _name = name
        _path = path
    }

    name { _name }
    path { _path }
    objName { _name[0..-2] + "o" }
    objPath { _path[0..-2] + "o" }
}

class Executable {
    construct new(fname, name, isComped) {
        _name = name
        _finalName = fname
        _isComped = isComped
        _source = []
        _header = []
        _data = []
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

    scan(path) {
        //System.print("Scanning " + path)
        if (!Directory.exists(path)) return
        var lst = Directory.list(path)
        for (ent in lst) {
            var p = path + "/" + ent
            if (Directory.exists(p)) {
                scan(p)
            } else {
                addFile(ent, p)
            }
        }
    }

    scanDir() {
        scan("src/" + _name)
        scan("asm/" + _name + "/data")
    }

    generate() {
        var allDeps = []
        allDeps.add("build/header.o")
        for (f in _source) {
            Ninja.build("cc", buildDir + f.objName, [f.path], [])
            allDeps.add(buildDir + f.objName)
        }
        var elfPath = "build/" + _name + ".elf"
        var symbolsFile = "symbols." + _name + ".ld"
        Ninja.build("link", elfPath, allDeps, ["shared.ld", symbolsFile])
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
    Executable.new("SCUS_941.03", "main", false),
    Executable.new("JM1/MAIN.PEX", "jm1", true),
    Executable.new("SELECT.PEX", "select", true),
    Executable.new("GAMEOVER.PEX", "gameover", true),
]

for (exe in execs) {
    exe.scanDir()
}

Ninja.set("cross", "mipsel-unknown-linux-gnu-")
Ninja.set("jfdir", "tools/jfcomp")
Ninja.set("jfcomp", "$jfdir/jfcomp")
Ninja.set("makeiso", "mkpsxiso")
Ninja.set("dumpiso", "dumpsxiso")
Ninja.set("cflags", "-Wall -Iinclude -Ipsyq -Iassets -Iassets/gameover -O1 -G0 -fno-zero-initialized-in-bss -msoft-float -mips1 -march=mips1 -mabi=32 -EL -mno-abicalls -fno-stack-protector -Wa,--no-pad-sections -fno-builtin -fno-pic")
Ninja.set("ldflags", "--no-check-sections -nostdlib -s")
Ninja.set("cflagsnat", "-O2")

Ninja.rule("ccnat", "gcc $cflagsnative $in -o $out")
Ninja.rule("cc", "${cross}gcc $cflags -c $in -o $out")
Ninja.rule("link", "${cross}ld $ldflagas -Map=build/$modid.map -T symbols.$modid.ld -T shared.ld $in -o $out")
Ninja.rule("objcopy", "${cross}objcopy -O binary $in $out")
Ninja.rule("copy", "cp $in $out")
Ninja.rule("decomp", "$jfcomp decomp $in $out")
Ninja.rule("comp", "$jfcomp comp $in $out")
Ninja.rule("mkiso", "$makeiso -y $in -o $out")

Ninja.build("phony", "tools", ["$jfcomp"])
Ninja.build("ccnat", "$jfcomp", [
    "$jfdir/main.c",
    "$jfdir/comp.c",
    "$jfdir/decomp.c",
])

var exePaths = []
for (exe in execs) {
    exe.generate()
    exePaths.add(exe.finalPath)
}

Ninja.build("mkiso", "build/aloha.bin", ["us.xml"], exePaths)
