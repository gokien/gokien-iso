#!/bin/bash

apt-get clean
rm -rf /tmp/* /root/.bash_history

rm /etc/hosts
rm /etc/resolv.conf

rm /var/lib/dbus/machine-id

rm /sbin/initctl
dpkg-divert --rename --remove /sbin/initctl
