#!/bin/bash

DIR=`dirname $0`

for script in $DIR/patches/*; do
	source $script
done
