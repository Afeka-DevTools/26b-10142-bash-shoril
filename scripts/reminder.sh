#!/bin/bash

# בדיקה האם פקודת notify-send מותקנת (חלק מחבילת libnotify-bin)
if ! command -v notify-send &> /dev/null
then
    echo "The 'notify-send' tool is not installed. Installing 'libnotify-bin'..."
    sudo apt-get update
    sudo apt-get install -y libnotify-bin
else
    echo "The 'notify-send' tool is ready."
fi

echo "-----------------------------------"

# בדיקה אם המשתמש העביר זמן והודעה כארגומנטים
if [ -z "$1" ] || [ -z "$2" ]
then
    # אם חסר אחד מהם, נבקש מהמשתמש להקליד כעת
    read -p "Enter time to wait (e.g., 5s for 5 seconds, 1m for 1 minute): " wait_time
    read -p "Enter your reminder message: " reminder_msg
else
    # אם העביר, נשמור את הזמן במשתנה
    wait_time=$1
    shift
    reminder_msg=$@
fi

echo "Reminder set for $wait_time from now."
echo "You can keep working. A pop-up notification will appear when the time is up!"
echo "-----------------------------------"

# המתנה לזמן שהוגדר
sleep "$wait_time"

# הקפצת התראת מערכת מחוץ לטרמינל
notify-send "⏰ Reminder!" "$reminder_msg"
