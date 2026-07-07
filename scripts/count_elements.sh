#!/bin/bash

if [ -z "$1" ]; then
    DIR="."
else
    DIR=$1
fi

echo "Statistics for directory: $DIR"

FILES=$(find "$DIR" -maxdepth 1 -type f | wc -l)
DIRS=$(find "$DIR" -maxdepth 1 -type d | wc -l)
LINKS=$(find "$DIR" -maxdepth 1 -type l | wc -l)

echo "Regular Files: $FILES"
echo "Directories: $DIRS"
echo "Symbolic Links: $LINKS"