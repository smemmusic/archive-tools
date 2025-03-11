#!/bin/bash -x

dd if=/dev/usbfd of=$(cat serial.txt).img bs=512
