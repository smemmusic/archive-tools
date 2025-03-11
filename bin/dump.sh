#!/bin/bash -x
serial=$(cat serial.txt)

mkdir -p ${serial}

dd if=/dev/usbfd of=${serial}/${serial}.img bs=512
