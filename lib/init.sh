#!/bin/bash

export HOME=/root
export LC_ALL=C.UTF-8

dbus-uuidgen > /var/lib/dbus/machine-id
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl

. /install-patches.sh
