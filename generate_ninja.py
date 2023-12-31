import os
import sys
from string import Template

NINJA_TEMPLATE = "template.ninja"
NINJA_BUILD = "build.ninja"

# TODO: now we can have a parameter for using nugget or included

# 1- read the original disc to find out all the files we need
# 2- read the source dir to figure out which ones we can make
# 3- subtract the two to figure out which ones we just copy


# final name and compression of non-default files
# everything not in this just gets capitalized and compressed
specialFiles = {
    "main": ["SCUS_941.03", False],
    "jm1": ["JM1/MAIN.PEX", True],
    "select": ["SELECT.PEX", True],
    "gameover": ["GAMEOVER.PEX", True],
}


o = ""
def put(x):
    global o
    o += x

def for_dirs(addr, cb):
    for ent in os.scandir(addr):
        if ent.is_dir():
            cb(ent)

def get_ext(x):
    i = x.rfind(".")
    if i > -1:
        return x[i+1:]
    else:
        return ""

# give the file an extension or change the existing extension
def ext(x, e):
    e = "." + e
    i = x.rfind(".")
    if i > -1:
        return x[:i] + e
    else:
        return x + e

lext = lambda e: lambda x: ext(x, e)
objf = lambda m,o : (f"build/{m}/{ext(o, 'o')}")

def build(rule, target, source, indirect=""):
    put(f"build {target}: {rule} {source}")
    if len(indirect) > 2:
        put(f" | {indirect}")
    put("\n")



var = lambda n,v : put(f"    {n} = {v}\n")


# parse the file structure
proc = {}

def module_setup(ent):
    global proc
    proc[ent.name] = {
        "src": [],
        "header": [],
        "data": [],
    }

def src_add(ent):
    global proc
    src = os.walk(ent.path)
    for i,f in enumerate(src):
        base = ""
        if i == 0:
            dirs = f[1]
        else:
            base = dirs[i-1] + "/"
        
        for file in f[2]:
            if get_ext(file) in ["c", "s"]:
                proc[ent.name]["src"].append(base+file)
            elif get_ext(file) == "h":
                proc[ent.name]["header"].append(base+file)

def asm_add(ent):
    global proc
    # also add its data files
    try:
        for dat in os.scandir(ent.path + "/data"):
            proc[ent.name]["data"].append(dat.name)
    except:
        pass


for_dirs("./src", module_setup)
for_dirs("./src", src_add)
for_dirs("./asm", asm_add)

# executable files
exes = []
for mod, files in proc.items():
    print(f"{mod}\t: {files}\n")
    ## compile objs
    # TODO: each source file can have a type (c, data etc.) so
    #       these can all be combined:
    cdirpath = f"src/{mod}/"

    # TODO: could be cool if each C file only depended on the headers
    #       it actually uses and not all of them. but this works for now
    headers = map(lambda x: cdirpath+x , files["header"])

    for file in files["src"]:
        build("cc", objf(mod, file), f"src/{mod}/{file}", " ".join(headers))
    for file in files["data"]:
        build("cc", objf(mod, file), f"asm/{mod}/data/{file}")

    ## link
    allDeps = (files["src"] + files["data"])
    allObjs = [f"build/{mod}/{x}" for x in allDeps]
    allObjs = " ".join(map(lext("o"), allObjs))
    allObjs += " build/header.o"
    
    elf = "build/" + ext(mod, "elf")
    exe = "build/" + ext(mod, "exe")

    build("link", elf, allObjs, f"shared.ld symbols.{mod}.ld")
    var("modid", mod)

    ## compress and finalize
    cname = ext(mod, "pex").upper()
    isComped = True

    if mod in specialFiles:
        cname = specialFiles[mod][0]
        isComped = specialFiles[mod][1]

    cname = "build/disc/" + cname
    exes.append(cname)

    if isComped:
        build("objcopy", exe, elf)
        build("comp", cname, f"{exe} | $jfcomp")
    else:
        build("objcopy", cname, elf)

build("mkiso", "build/aloha.bin", f"us.xml | {' '.join(exes)}")


with open(NINJA_TEMPLATE, "r") as inf:
    templ = Template(inf.read())
    ninja = templ.safe_substitute(decode_block=o)
    with open(NINJA_BUILD, "w") as outf:
        outf.write(ninja)

