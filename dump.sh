dumpsxiso -x build/disc -s us.xml original/us.bin

mkdir assets
mkdir assets/main
mkdir assets/gameover

dd if=build/disc/SCUS_941.03 of=assets/main/fontdata.bin bs=1 skip=107028 count=4152
dd if=build/disc/SCUS_941.03 of=assets/main/asciifont.bin bs=1 skip=111180 count=1024
dd if=build/disc/SCUS_941.03 of=assets/main/mcicon.bin bs=1 skip=112220 count=416
dd if=build/disc/SCUS_941.03 of=assets/main/logo.prs.bin bs=1 skip=112636 count=4936
