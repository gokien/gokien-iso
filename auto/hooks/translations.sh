#!/bin/bash
cd binary/isolinux
find . -name "*.tr" -exec sed -i "s/Ubuntu/elementary OS/g" '{}' \;
