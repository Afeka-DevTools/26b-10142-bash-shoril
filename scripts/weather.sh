#!/bin/bash
echo "Please enter a city: "
read city

curl wttr.in/$city
