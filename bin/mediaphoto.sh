#!/bin/bash -x

gphoto2 --capture-image-and-download --force-overwrite
convert capt0000.jpg -resize 800 -deskew 40% -fuzz 50% -trim +repage -quality 82 disk.jpg
serial=$(zbarimg -q --raw disk.jpg)

if [[ -z "$serial" ]]; then
	echo "no qr code found"
	exit 1
fi

echo $serial > serial.txt

cat serial.txt

mkdir $serial

mv disk.jpg ${serial}/${serial}.jpg

echo "insert disk in floppy drive then run dump.sh"
