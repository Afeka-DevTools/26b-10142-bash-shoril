#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <days>"
    exit 1
fi

DIR=$1
DAYS=$2

find "$DIR" -type f -mtime +"$DAYS" -exec rm -f {} \;
echo "Deleted files older than $DAYS days in '$DIR'."