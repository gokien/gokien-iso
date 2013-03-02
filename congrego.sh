#!/bin/bash

# check for root permissions
if [ $(id -u) != 0 ]; then
echo "Builds scripts need root permissions, but you don't seem to have them.
Become a local god using sudo, then we'll work together to build the future." > /dev/stderr
exit 1
fi

# load config
source etc/congrego.conf

if [[ "$ARCH" == "all" ]]; then
	$(dirname "$0")/bin/build_fs.sh i386
	$(dirname "$0")/bin/build_fs.sh amd64
else
	$(dirname "$0")/bin/build_fs.sh "$ARCH"
fi

if [[ "$SOURCEFORGE" == "yes" ]]; then
	$(dirname "$0")/bin/sourceforge.sh
fi