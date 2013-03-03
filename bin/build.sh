#!/bin/bash

# load config
source etc/congrego.conf

# We're a lengthy background process, so don't eat too much CPU and disk I/O
if [[ "$LOW_PRIORITY" == "yes" ]]; then
	renice '+15' $$ || true
	ionice -c 3 -p $$ || true
fi

export FSARCH=${1:-'i386'}

mkdir -p tmp/$FSARCH

cd tmp/$FSARCH
rm -Rf auto
cp -R ../../etc/auto auto
cp ../../etc/congrego.conf congrego.conf

sed -i "s/all/$FSARCH/" congrego.conf
sed -i "s/@SYSLINUX/$CODENAME/" auto/config

lb clean
lb config
lb build
mv binary.hybrid.iso binary.iso
md5sum binary.iso > binary.iso.md5
mkdir -p ../../builds/`date +%Y%m%d`/$FSARCH
mv binary.* ../../builds/`date +%Y%m%d`/$FSARCH/
rm -f livecd*

cd ../..
