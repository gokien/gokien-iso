#!/bin/bash
cd binary/pool

for FILENAME in main/*/*

    do
        check=$(basename $FILENAME); [[ -n $(grep "^$check\$" ../../auto/pool) ]] && echo "" || rm -R $FILENAME
    done

exit 0
