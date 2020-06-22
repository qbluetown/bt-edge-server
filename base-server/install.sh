#!/bin/sh
rm disk.img
truncate -s 512g disk.img
cat seeds/* >preseed.cfg
qemu-system-x86_64 -m 2G -enable-kvm -hda disk.img -tftp . -kernel ipxe.lkrn -bootp install.ipxe
qemu-system-x86_64 -m 2G -enable-kvm -hda disk.img -net nic -net tap,ifname=tap0,script=no
