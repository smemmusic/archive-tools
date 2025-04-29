#!/bin/bash -x

gphoto2 --capture-image-and-download --force-overwrite
#convert capt0000.jpg -resize 800 -deskew 40% -fuzz 50% -trim +repage -quality 82 disk.jpg
serial=$(zbarimg -q --raw capt0000.jpg)

if [[ -z "$serial" && -n "$1" ]]; then
    serial="$1"
fi

if [[ -z "$serial" ]]; then
	echo "no qr code found"
	exit 1
fi

echo $serial > serial.txt

cat serial.txt

if [[ -d $serial ]]; then
    echo "$serial already exists, was this already photographed?"
    echo "remove $serial and try again or run dump.sh"
    exit 1
fi

mkdir $serial

mv capt0000.jpg ${serial}/${serial}.jpg

echo "insert disk in floppy drive then run dump.sh"
