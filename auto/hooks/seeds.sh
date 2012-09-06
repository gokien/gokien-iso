#!/bin/bash

function apt-download { wget $(apt-get install --reinstall --print-uris -qq $1 | cut -d"'" -f2 | grep "/${1}_"); }

apt-get install -q -f -y --allow-unauthenticated --no-install-recommends bzr
bzr branch lp:~elementary-os/elementaryos/elementary-seeds.precise elementary-seeds.precise
bzr branch lp:~elementary-os/elementaryos/platform.precise platform.precise
for package in $(cat 'platform.precise/blacklist' 'elementary-seeds.precise/blacklist' | grep -v '#'); do
apt-get -q -f -y autoremove --purge "$package"
done
apt-get -q -f -y autoremove --purge bzr

mkdir pool
cd pool

while read -r line; do
    if [[ $line == *"*"* ]]
    then
        line=${line%%#*}
        line=${line%%[*}
        line=${line/'*'/}
        apt-download $line
    fi
done < "../elementary-seeds.precise/ship-live"

rm -R ../elementary-seeds.precise ../platform.precise