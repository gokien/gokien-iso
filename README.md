# Gokien buildscripts

These scripts are created based on the instructions given in this [tutorial](https://help.ubuntu.com/community/LiveCDCustomization).

## Requirements

	sudo apt-get install squashfs-tools genisoimage gfxboot-dev

The architecture (amd64 or i386) to be stored on the LiveCD should be the same as the architecture used to perform the customization, or the LiveCD may not run. It is not trivial to customize an AMD64 LiveCD using an i386 operating system, for example.

## Steps to create a bootable iso

All commands must be run with root permission.

1. Download an official Elementary iso and copy it to this directory, renamed as **elementary.iso**.
2. Run `./extract-iso.sh`<br>
   Now we have `./extract-cd` which contains the metadata and `./edit` which holds the iso's chroot.
3. Run `./chroot.sh` and make customizations inside that chroot.
4. When you're done. Press **Control-D** to exit cleanly.
5. Run `./gen-iso.sh` to create the final iso, named as **gokien.iso**.

Alternately, the last step can be replaced with running `./quick-gen-iso.sh`, which does not compress `./edit` into `extract-cd/casper/filesystem.squashfs` (computationally heavy).
