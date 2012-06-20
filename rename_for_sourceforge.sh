#!/bin/sh

file=$(realpath "$1")
path=$(dirname "$file")
builds_relative_path=${file##*/builds/}
date=$(echo "$builds_relative_path" | cut -d '/' -f 1)
arch=$(echo "$builds_relative_path" | cut -d '/' -f 2)

newfilename=$(dirname "$1")/"elementaryos-unstable-$arch.$date.iso"

ln "$file" "$newfilename" && echo "$newfilename"