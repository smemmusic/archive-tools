#!/bin/bash

gphoto2 --capture-image 
magick capt0000.jpg -resize 800 -deskew 40% -fuzz 50% -trim +repage -quality 82 disk.jpg
serial=$(zbarimg disk.jpg)

echo $serial > serial.txt

cat serial.txt

mv disk.jpg ${serial}.jpg

echo "insert disk in floppy drive then run dump.sh"
