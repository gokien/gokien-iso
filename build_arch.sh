#!/bin/bash

# check for root permissions
if [ $(id -u) != 0 ]; then
echo "Builds scripts need root permissions, but you don't seem to have them.
Become a local god using sudo, then we'll work together to build the future." > /dev/stderr
exit 1
fi

# accept ARCH as parameter; if none given, build i386
export ARCH=${1:-'i386'}
export SUITE=${SUITE:-'precise'}

# check for dependencies
dependency_list='live-build livecd-rootfs syslinux-themes-ubuntu gfxboot-theme-ubuntu'
for package in $dependency_list; do
dpkg -L "$package" >/dev/null 2>&1 || missing_dependencies="$missing_dependencies $package"
done

if [ "$missing_dependencies" != "" ]; then
echo "Missing dependencies! Please install the following packages:
$missing_dependencies" > /dev/stderr
exit 1
fi

# We're a lengthy background process, so don't eat too much CPU and disk I/O
renice '+15' $$
ionice -t -n 7 -p $$

lb clean
lb config
lb build
md5sum binary.iso > binary.iso.md5
mkdir -p builds/`date +%Y%m%d`/$ARCH
mv binary.* builds/`date +%Y%m%d`/$ARCH/
rm livecd*
