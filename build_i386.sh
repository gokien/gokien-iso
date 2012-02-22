#!/bin/bash

export ARCH=i386 SUITE=precise

lb clean
lb config
lb build
md5sum binary.iso > binary.iso.md5
mkdir -p builds/`date +%Y%m%d`/i386
mv binary.* builds/`date +%Y%m%d`/i386/
rm livecd*
