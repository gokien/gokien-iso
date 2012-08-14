#!/bin/bash
apt-get install -q -f -y --allow-unauthenticated --no-install-recommends bzr
bzr co --lightweight lp:~elementary-os/elementaryos/elementary-seeds.precise elementary-seeds.precise
bzr co --lightweight lp:~elementary-os/elementaryos/platform.precise platform.precise
for package in $(cat 'platform.precise/blacklist' 'elementary-seeds.precise/blacklist' | grep -v '#'); do
apt-get -q -f -y autoremove --purge "$package"
done
apt-get -q -f -y autoremove --purge bzr
rm -R elementary-seeds.precise platform.precise
