#!/bin/bash

mkdir mnt
sudo mount -o loop elementary.iso mnt

mkdir extract-cd
sudo rsync --exclude=/casper/filesystem.squashfs -a mnt/ extract-cd

sudo unsquashfs mnt/casper/filesystem.squashfs
sudo mv squashfs-root edit

sudo umount mnt
