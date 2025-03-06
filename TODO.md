# This won't even build lol

The assembly files for functions that haven't been decompiled yet are not
included in the repository. Should they be included?
This will only affect the binaries that we are rebuilding, which for now are
main and gameover. gameover is fine as it is 100% decompiled.

- Decompile the remaining functions
- Include the ones that are not yet decompiled into the repo
- The embedded asset files need to be extracted from the original binaries
- wren_cli is not available on most distros. just include it? :P
-

I should do this in two steps.
1- Make sure a clean clone of the repo can build on my own system.
2- Make sure it can run on someone else's system (not Nix)
Ubuntu is usually a good target.

# Documentation and Tools

- The ImHex pattern files
- Exact-o-knife CLI tool for ripping out the individual binaries

I don't want to include the entirety of robbit. No GUI is needed here.
