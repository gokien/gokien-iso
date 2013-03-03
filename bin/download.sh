#!/bin/bash

source etc/congrego.conf

export DLARCH=${1:-'i386'}

mkdir -p tmp/$DLARCH

cd tmp
cd $DLARCH

if [ ! -f ubuntu.iso ];
then
    wget http://releases.ubuntu.com/$SUITE/ubuntu-$BASEVERSION-desktop-$DLARCH.iso
	mv ubuntu-$BASEVERSION-desktop-$DLARCH.iso ubuntu.iso
fi

cd ../..