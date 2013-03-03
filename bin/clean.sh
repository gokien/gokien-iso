#!/bin/bash

# check for root permissions
if [ $(id -u) != 0 ]; then
echo "You have to be root to clean up after root." > /dev/stderr
exit 1
fi

rm -R tmp
