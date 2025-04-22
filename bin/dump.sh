#!/bin/bash -x
serial=$(cat serial.txt)

if [[ -z $serial ]]; then
    echo "serial missing"
    exit 1
fi

mkdir -p ${serial}

dd if=/dev/usbfd of=${serial}/${serial}.img bs=512 && rm serial.txt
