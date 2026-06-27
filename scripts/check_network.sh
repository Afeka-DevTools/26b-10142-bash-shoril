#!/bin/bash

if ping -c 3 8.8.8.8 > /dev/null || ping -c 3 facebook.com > /dev/null; then
    echo "Internet is connected."
else
    echo "No internet connection."
fi
