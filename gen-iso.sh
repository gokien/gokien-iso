#!/bin/bash

source lib/gen-iso.sh

gen_manifest
gen_squashfs
change_default_locale
gen_iso
