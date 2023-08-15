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
}


o = ""

def put(x):
    global o
    o += x

nl = lambda : put("\n")



# parse the file structure
proc = {}

for ent in os.scandir("./src"):
    if ent.is_dir():
        # is a module. add it to the map
        proc[ent.name] = {}
        proc[ent.name]["src"] = []
        src = os.walk(ent.path)
        for i,f in enumerate(src):
            base = ""
            if i == 0:
                dirs = f[1]
            else:
                base = dirs[i-1] + "/"
            
            for file in f[2]:
                ext = file[-2:]
                if ext in [".c", ".s"]:
                    proc[ent.name]["src"].append(base+file)

for ent in os.scandir("./asm"):
    if ent.is_dir():
        # also add its data files
        proc[ent.name]["data"] = []
        for dat in os.scandir(ent.path + "/data"):
            proc[ent.name]["data"].append(dat.name)


# give the file an extension or change the existing extension
def ext(x, e):
    e = "." + e
    i = x.rfind(".")
    if i > -1:
        return x[:i] + e
    else:
        return x + e
lext = lambda e: lambda x: ext(x, e)

build = lambda r,d,s : put(f"build {d}: {r} {s}\n")
objf = lambda m,o : (f"build/{m}/{ext(o, 'o')}")


# executable files
for mod, files in proc.items():
    ## compile objs
    # TODO: each source file can have a type (c, data etc.) so these
    #       can all be combined:
    for file in files["src"]:
        build("cc", objf(mod, file), f"src/{mod}/{file}")
    for file in files["data"]:
        build("cc", objf(mod, file), f"asm/{mod}/data/{file}")

    nl()

    ## link
    allDeps = (files["src"] + files["data"])
    allObjs = [f"build/{mod}/{x}" for x in allDeps]
    allObjs = " ".join(map(lext("o"), allObjs))
    allObjs += " build/header.o"
    
    elf = "build/" + ext(mod, "elf")
    exe = "build/" + ext(mod, "exe")

    build("link", elf, allObjs)
    put(f"    modid = {mod}\n")   # TODO: this could be a function too
    

    ## compress and finalize
    cname = ext(mod, "pex").upper()
    isComped = True
    
    if mod in specialFiles:
        cname = specialFiles[mod][0]
        isComped = specialFiles[mod][1]

    cname = "build/disc/" + cname

    if isComped:
        build("objcopy", exe, elf)
        build("comp", cname, f"{exe} | $jfcomp")
    else:
        build("objcopy", cname, elf)
    nl()

with open(NINJA_TEMPLATE, "r") as inf:
    templ = Template(inf.read())
    ninja = templ.safe_substitute(decode_block=o)
    with open(NINJA_BUILD, "w") as outf:
        outf.write(ninja)

