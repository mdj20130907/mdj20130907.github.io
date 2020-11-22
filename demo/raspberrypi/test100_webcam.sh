#!/bin/bash
# * * * * * ~/webcam.sh 2>&1

DATE=$(date +"%Y-%m-%d_%H%M")

[ ! -d ~/webcam ] && mkdir ~/webcam

fswebcam -r 1920x1080 ~/webcam/$DATE.jpg
