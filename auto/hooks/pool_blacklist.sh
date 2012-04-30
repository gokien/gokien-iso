#!/bin/bash
cd binary/pool

for FILENAME in main/*/*

    do
        cd ${FILENAME%/*}
        rm -f -R linux* gcc-* gtk+* python* binutils coreutils dpkg manpages ttf-* perl libsamplerate glib* nss alsa-utils udev dbus sqlite* cairo apt base-files base-passwd busybox bzip2 db debconf debianutils dmidecode e2fsprogs libx*
        cd ../..
    done

exit 0
