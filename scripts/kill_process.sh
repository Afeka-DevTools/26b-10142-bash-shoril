#!/bin/bash

# בדיקה האם הפקודה killall מותקנת (היא חלק מחבילת psmisc)
if ! command -v killall &> /dev/null
then
    echo "'killall' command not found. Installing 'psmisc' package..."
    sudo apt-get update
    sudo apt-get install -y psmisc
else
    echo "The 'killall' tool is ready."
fi

echo "-----------------------------------"

# בדיקה אם המשתמש העביר את שם התהליך כארגומנט
if [ -z "$1" ]
then
    # אם לא, נבקש ממנו להקליד כעת
    read -p "Enter the EXACT name of the process you want to kill: " process_name
else
    # אם כן, נשתמש בארגומנט שהוזן
    process_name=$1
fi

echo "Attempting to kill all processes named: $process_name ..."
echo "-----------------------------------"

# ביצוע הפקודה להריגת התהליך
killall "$process_name"

# בדיקה אם הפקודה האחרונה הצליחה (0 אומר הצלחה ב-Bash)
if [ $? -eq 0 ]; then
    echo "Success: Process(es) '$process_name' terminated."
else
    echo "Failed: Could not find or kill process '$process_name'."
    echo "(It might not be running, or you may need to run this script with sudo)."
fi

echo "-----------------------------------"
