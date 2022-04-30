#!/bin/bash
# change all files to 777
find ./ -type f -exec chmod 777 {} \;

echo "Set device to test: ex.sdb1"
#read target

mkdir /mnt/target
mount -t ext4 /dev/target /mnt/

./iomonkey64 -f1024 -g -k -s20 -t0 -R -B0 -iRunTime  -x/ -x/home -x/tmp -x/boot/efi

umount /dev/target
rm -rf /mnt/target