import os
from string import Template

TEMPLATE = "template.ninja"

# TODO: now we can have a parameter for using nugget or included

# everything not in this just gets capitalized
finalNames = {
    "main": "SCUS_941.03",
}

o = ""

oprint = print

def print(x="", end="\n"):
    global o
    #oprint(x, end=end)
    o += x + end


# parse the file structure
proc = {}

for ent in os.scandir("./src"):
    if ent.is_dir():
        # is a module. add it to the map
        proc[ent.name] = {}
        proc[ent.name]["src"] = []
        for f in os.scandir(ent.path):
            if f.name[-2:] == ".c":
                proc[ent.name]["src"].append(f.name)

for ent in os.scandir("./asm"):
    if ent.is_dir():
        # also add its data files
        proc[ent.name]["data"] = []
        for dat in os.scandir(ent.path + "/data"):
            proc[ent.name]["data"].append(dat.name)


# executable files
for mod, files in proc.items():
    print(f"## {mod}")
    # compile objs
    for file in files["src"]:
        obj = file[:-2] + ".o"
        print(f"build build/{mod}/{obj}: cc src/{mod}/{file}")
    for file in files["data"]:
        obj = file[:-2] + ".o"
        print(f"build build/{mod}/{obj}: cc asm/{mod}/data/{file}")

    print()

    # link
    print(f"build build/{mod}.elf: link build/header.o ", end="")

    for file in files["src"] + files["data"]:
        obj = file[:-2] + ".o"
        print(f"build/{mod}/{obj} ", end="")
    print()
    print(f"    modid = {mod}")
    
    
    cname = mod.upper() + ".PEX"

    # main file is a special case
    if mod == "main":
        cname = "SCUS_941.03"
        print(f"build build/disc/{cname}: objcopy build/{mod}.elf")
        continue
    
    print(f"build build/{mod}.exe: objcopy build/{mod}.elf")
    print(f"build build/disc/{cname}: comp build/{mod}.exe")
    print()
    print()

with open(TEMPLATE, "r") as inf:
    templ = Template(inf.read())
    ninja = templ.safe_substitute(decode_block=o)
    with open("build.ninja", "w") as outf:
        outf.write(ninja)
