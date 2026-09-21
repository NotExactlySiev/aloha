dumpsxiso -x build/disc_jp -s jp.xml original/jp.bin

mkdir -p execs

cp build/disc_jp/PSX.EXE execs/jp_main.exe
cp build/disc_jp/TITLE.PEX execs/jp_title.pex
cp build/disc_jp/SELECT.EXE execs/jp_select.exe
cp build/disc_jp/GAMEOVER.PEX execs/jp_gameover.pex
