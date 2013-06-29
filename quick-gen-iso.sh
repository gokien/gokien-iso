#!/bin/bash

# The same as gen-iso.sh but does not regenerate filesystem.squashfs
#

source lib/gen-iso.sh

gen_manifest
change_default_locale
gen_iso
