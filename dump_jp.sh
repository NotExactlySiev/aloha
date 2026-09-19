dumpsxiso -x build/disc_jp -s jp.xml original/jp.bin

mkdir -p assets/main
mkdir -p assets/gameover

dd if=./execs/gameover_jp.exe of=assets/gameover/sprtdata.bin bs=1 skip=2048 count=2804
dd if=./execs/gameover_jp.exe of=assets/gameover/sprttiles.bin bs=1 skip=4852 count=40704
dd if=./execs/gameover_jp.exe of=assets/gameover/clut0.bin bs=1 skip=45556 count=512
dd if=./execs/gameover_jp.exe of=assets/gameover/clut1.bin bs=1 skip=46068 count=512
dd if=./execs/gameover_jp.exe of=assets/gameover/clut2.bin bs=1 skip=46580 count=512
dd if=./execs/gameover_jp.exe of=assets/gameover/bunny.bin bs=1 skip=47092 count=2312
