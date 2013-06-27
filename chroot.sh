#!/bin/bash

cp /etc/resolv.conf edit/etc/
cp /etc/hosts edit/etc/
cp lib/init.sh lib/uninit.sh lib/install-patches.sh edit/
cp -R patches edit/


mount --bind /dev/ edit/dev
mount -t proc none edit/proc
mount -t sysfs none edit/sys
mount -t devpts none edit/dev/pts

chroot edit bash install-patches.sh
chroot edit bash --init-file init.sh
chroot edit bash uninit.sh

umount edit/proc || umount -lf edit/proc
umount edit/sys
umount edit/dev/pts
umount edit/dev

rm -rf edit/patches
rm -rf edit/{init.sh,uninit.sh,install-patches.sh}
