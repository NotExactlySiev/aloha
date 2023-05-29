def apply(config, args):
    config["baseimg"] = "disc/SCUS_941.03"
    config["myimg"] = "build/main.bin"
    config["mapfile"] = "build/build.map"
    config["source_directories"] = ["."]
    # config["show_line_numbers_default"] = True
    config["arch"] = "mipsel"
    # config["map_format"] = "gnu" # gnu, mw, ms
    # config["build_dir"] = "build/" # only needed for mw and ms map format
    # config["expected_dir"] = "expected/" # needed for -o
    # config["makeflags"] = []
    config["objdump_executable"] = "mipsel-linux-gnu-objdump"
