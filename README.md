# Project Aloha
A (nonmatching) decompilation of Jumping Flash on PSX.
Incomplete and also kinda broken now. (I've added new bugs :D)

### Requirements
The image file for the USA version of Jumping Flash. (bin/cue)
Put it at `original/us.bin`

```sh
$ md5sum original/us.bin 
4e73eb6054568a3ef88843e3d8c7d80b  original/us.bin
```

On Debian/Ubuntu:

```sh
apt install ninja gcc-mipsel-gnu-linux binutils-mipsel-gnu-linux
```

You also need Wren CLI, mkpsxiso and dumpsxiso.

### Building
Dump the original disc image:
```sh
sh dump.sh
```

Generate the ninja build file:

```sh
wren_cli mkninja.wren
```

And build the image:

```sh
ninja
```

Finally run build/aloha.bin on an emulator or real hardware.
