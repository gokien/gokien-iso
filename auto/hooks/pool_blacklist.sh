#!/bin/bash
cd binary/pool

for FILENAME in main/*/*

    do
        cd ${FILENAME%/*}
        rm -f -R linux*
        cd ../..
    done

exit 0
