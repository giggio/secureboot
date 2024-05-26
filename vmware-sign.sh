#!/bin/bash

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmmon)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmnet)
sudo depmod -a
sudo modprobe vmmon
sudo modprobe vmnet
sudo lsmod | egrep '(vmmon|vmnet)'
sudo systemctl restart vmware