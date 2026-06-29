#!/bin/bash
echo "Please enter a time to set up a timer for in the next format: HH:MM:SS"
read time

hours=$(echo $time | cut -d: -f1)
minutes=$(echo $time | cut -d: -f2)
seconds=$(echo $time | cut -d: -f3)


if [ "$hours" -ge 100 ]; then
    echo "Error! wrong input"
    echo "Hours must be between 0-99"
    exit 1
fi
if [ "$minutes" -ge 60 ]; then
    echo "Error! wrong input"
    echo "Minutes must be between 0-59"
    exit 1
fi
if [ "$seconds" -ge 60 ]; then
    echo "Error! wrong input"
    echo "Seconds must be between 0-59"
    exit 1
fi


: ${hours:=0}
: ${minutes:=0}
: ${seconds:=0}


total_seconds=$(((hours * 3600) + (minutes * 60) + seconds))

while [ $total_seconds -gt 0 ]; do
    echo -ne "\r$total_seconds left                       "
    sleep 1
    total_seconds=$((total_seconds - 1))
done


echo -ne "\r Times up!           \n"