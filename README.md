# Project Aloha

A (nonmatching) decompilation of Jumping Flash on PSX.
Incomplete and also kinda broken now. (I've added new bugs :D)

### Requirements

The image file for the USA or Japan version of Jumping Flash, depending
on which one you want to build. The image should be in bin/cue format.
Put it at `original/us.bin` or `original/jp.bin`. Building the European version
is not supported right now.

```sh
$ md5sum original/*.bin
f06c4a94709537b0a12af5df0889629e  original/jp.bin
4e73eb6054568a3ef88843e3d8c7d80b  original/us.bin
bfe9de682f985076dc5409ecabb7e51d  original/eu.bin
```

On Debian/Ubuntu:

```sh
apt install ninja gcc-mipsel-gnu-linux binutils-mipsel-gnu-linux
```

You also need mkpsxiso, dumpsxiso, and Python.

### Building

Dump the original disc image:

```sh
sh dump_jp.sh
# or
sh dump_us.sh
```

Generate the ninja build file:

```sh
python mkninja.py jp
# or
python mkninja.py us
```

(You will probably have to change the `cross` variable, either in the generator
script or in the final build.ninja file.)

And build the image:

```sh
ninja
```

Finally run `build/aloha_*.bin` on an emulator or real hardware.

## Disclaimer

No part of this project was done with the assistance of artificial intelligence.
