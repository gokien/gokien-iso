#!/bin/sh

if [ -z "$1" ]; then
echo "No file given. Please specify the .iso file"
exit 1
fi

filename=$(basename "$1")

zsyncmake -e \
-o "$1"'.zsync' \
-u 'http://superb-sea2.dl.sourceforge.net/project/elementaryos/unstable/'"$filename" \
-u 'http://ignum.dl.sourceforge.net/project/elementaryos/unstable/'"$filename" \
-u 'http://citylan.dl.sourceforge.net/project/elementaryos/unstable/'"$filename" \
"$1"