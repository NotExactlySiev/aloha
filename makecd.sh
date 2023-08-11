make build/gameover.exe build/main.exe && cd .. &&
./jfcomp comp splat/build/gameover.exe usa2/GAMEOVER.PEX &&
cp splat/build/main.exe usa2/SCUS_941.03 &&
mkpsxiso -o usaregen.bin -y usa2.xml
