#!/usr/bin/python2
import datetime
import os

info = 'elementary OS 0.2 "Luna" - '
release = os.environ.get('RELEASE')
arch = os.environ.get('ARCH')
date = datetime.datetime.now().strftime("%Y%m%d")

if not arch:
    arch = 'i386'
if not release:
    release = 'Daily'

if release.startswith("beta"):
    release = 'Beta ' + release.replace("beta", "")
else:
    release = 'Daily'

info = info + release + " " + arch + " (" + date + ")\n"

f = open("binary/.disk/info", "w")
f.write(info)
f.close()
