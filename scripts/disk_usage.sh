#!/bin/bash

if [ -z "$1" ]; then
    DIR="."
else
    DIR=$1
fi

echo "Disk usage for directories in $DIR:"
du -sh "$DIR"/* 2>/dev/null