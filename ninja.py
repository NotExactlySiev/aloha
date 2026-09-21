_output: str = ""


def put(s: str):
    # print(s, end="")
    global _output
    _output += s


def nl():
    put("\n")


def tab():
    put("    ")


def build(rule: str, target: str, direct: list[str], indirect: list[str] | None = None):
    if indirect is None:
        indirect = []
    line = f"build {target}: {rule}"
    line += "".join(f" {src}" for src in direct)
    if indirect:
        line += " |" + "".join(f" {src}" for src in indirect)
    put(line)
    nl()


def set(var_name: str, val: str | int):
    put(f"{var_name} = {val}")
    nl()


def param(var_name: str, val: str | int):
    tab()
    set(var_name, val)


def rule(name: str, cmd: str):
    put(f"rule {name}")
    nl()
    param("command", cmd)


def write_to_file(filename: str = "build.ninja"):
    with open(filename, "w") as f:
        _ = f.write(_output)
