#!/bin/bash

cd binary

mv ../pool pool

cd pool

dpkg-scanpackages . /dev/null > Packages
gzip -9c Packages > Packages.gz

cat > Release <<EOF
Archive: precise
Origin: Ubuntu
Label: elementary Local Archive
Architecture: $ARCH
MD5Sum:
EOF
printf ' '$(md5sum Packages | cut --delimiter=' ' --fields=1)' %16d Packages\n' \
   $(wc --bytes Packages | cut --delimiter=' ' --fields=1) >> Release
printf ' '$(md5sum Packages.gz | cut --delimiter=' ' --fields=1)' %16d Packages.gz' \
   $(wc --bytes Packages.gz | cut --delimiter=' ' --fields=1) >> Release

gpg --home ../../gnupg --detach-sign --armor --output Release.gpg Release

exit 0
