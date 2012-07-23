#!/bin/sh

builddir=$( echo ./builds/* | tr ' ' '\n' | tail -n 1 )

rm .latest_build_sourceforge_filenames

for arch in i386 amd64; do
    [ -e "$builddir"/"$arch"/binary.iso ] && ./rename_for_sourceforge.sh "$builddir"/"$arch"/binary.iso >> .latest_build_sourceforge_filenames
done

for file in $(cat .latest_build_sourceforge_filenames); do
./generate_zsync_metafile.sh "$file"
done