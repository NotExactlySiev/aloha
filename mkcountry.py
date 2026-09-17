import sys

outPath = "build/disc_world/COUNTRY.TXT"

if len(sys.argv) != 2:
    print("Usage: mkninja.py <version>")
    print("\tversion: one of us, eu, or jp")
    sys.exit(1)

# "us" or "eu". The "jp" region doesn't have a COUNTRY.TXT file.
version = sys.argv[1]

match version:
    case "us":
        tvMode = "NTSC"
        region = "USA"

    case "eu":
        tvMode = "PAL"
        region = "Europe"

    case "jp":
        print(f"The version {version} doesn't need a COUNTRY.TXT file.")
        sys.exit(0)

    case _:
        print(f"Invalid version {version}.")
        sys.exit(1)

with open(outPath, "w") as f:
    tvMode = tvMode.upper()
    if tvMode not in ["NTSC", "PAL"]:
        print(f"Invalid TV mode {tvMode}.")
        sys.exit()

    _ = f.write(tvMode[0])
    _ = f.write(region)
    _ = f.write(" Version\r\n")
    _ = f.write("\x1a")
