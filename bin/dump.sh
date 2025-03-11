#!/bin/bash

dd if=/dev/fd of=$(cat serial.txt).img bs=512
