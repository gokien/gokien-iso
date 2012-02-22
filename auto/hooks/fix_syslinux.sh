#!/bin/bash
sed -i 's/.lz/.img/g' binary/isolinux/txt.cfg || exit 1
cd binary/casper || exit 1
vmlinuz=$(ls vmlinuz* | tail -n1)
ln  $vmlinuz vmlinuz || true
initrd=$(ls initrd.img* | tail -n1)
ln  $initrd initrd.img || true
