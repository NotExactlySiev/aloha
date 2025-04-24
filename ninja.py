_output = ""

def put(s):
    #print(s, end="")
    global _output
    _output += s

def nl():
    put("\n")

def tab():
    put("    ")

def build(rule, target, direct, indirect=None):
    if indirect is None:
        indirect = []
    line = f"build {target}: {rule}"
    line += "".join(f" {src}" for src in direct)
    if indirect:
        line += " |" + "".join(f" {src}" for src in indirect)
    put(line)
    nl()

def set(var_name, val):
    put(f"{var_name} = {val}")
    nl()

def param(var_name, val):
    tab()
    set(var_name, val)

def rule(name, cmd):
    put(f"rule {name}")
    nl()
    param("command", cmd)

def write_to_file(filename="build.ninja"):
    with open(filename, "w") as f:
        f.write(_output)
