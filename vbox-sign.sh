#!/bin/bash

DRIVE_DIR=$(dirname $(modinfo -n vboxdrv))
sudo zstd -d --rm $DRIVE_DIR/vbox*
for driver in $DRIVE_DIR/vbox*; do
  sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $driver
done
sudo depmod -a
sudo modprobe vboxdrv
sudo modprobe vboxnetflt
sudo modprobe vboxnetadp
# sudo modprobe vboxpci
sudo lsmod | egrep '(vboxdrv|vboxnetflt|vboxnetadp|vboxpci)'
sudo systemctl restart virtualbox
sudo systemctl status virtualbox
