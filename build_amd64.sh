#!/bin/bash

export ARCH=amd64 SUITE=precise

lb clean
lb config
lb build
md5sum binary.iso > binary.iso.md5
mkdir -p builds/`date +%Y%m%d`/amd64
mv binary.* builds/`date +%Y%m%d`/amd64/
rm livecd*
