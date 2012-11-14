#!/bin/bash

set -e

export RELEASE='beta1'

./build_i386.sh
./build_amd64.sh
