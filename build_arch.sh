#!/bin/bash

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
fi

lb clean
lb config
lb build
md5sum binary.iso > binary.iso.md5
mkdir -p builds/`date +%Y%m%d`/$ARCH
mv binary.* builds/`date +%Y%m%d`/$ARCH/
rm livecd*
