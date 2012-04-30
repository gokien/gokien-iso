#!/bin/bash
cd binary/pool

for FILENAME in main/*/*

    do
        check=$(basename $FILENAME); [[ -n $(grep "^$check\$" ../../config/package-lists/livecd-rootfs.binary.list) ]] && echo "" || rm -R $FILENAME
    done

find . -depth -empty -type d -exec rmdir {} \;

exit 0
