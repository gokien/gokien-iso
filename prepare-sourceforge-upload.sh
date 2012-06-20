#!/bin/sh

builddir=$( echo ./builds/* | tr ' ' '\n' | tail -n 1 )

for arch in i386 amd64; do
[ -e "$builddir"/"$arch"/binary.iso ] && ./generate_zsync_metafile.sh $( ./rename_for_sourceforge.sh "$builddir"/"$arch"/binary.iso )
done