#!/bin/bash

# בדיקה האם התוכנה colordiff מותקנת (להצגת הבדלים בצבעים)
if ! command -v colordiff &> /dev/null
then
    echo "The 'colordiff' tool is not installed. Installing it now..."
    sudo apt-get update
    sudo apt-get install -y colordiff
else
    echo "The 'colordiff' tool is ready."
fi

echo "-----------------------------------"

# בדיקה אם המשתמש העביר שני קבצים כארגומנטים
if [ -z "$1" ] || [ -z "$2" ]
then
    echo "Please provide two files to compare."
    read -p "Enter the path for the first file: " file1
    read -p "Enter the path for the second file: " file2
else
    file1=$1
    file2=$2
fi

echo "-----------------------------------"

# הגנה: בדיקה שהקבצים אכן קיימים במערכת לפני שמנסים להשוות אותם
if [ ! -f "$file1" ]; then
    echo "Error: The file '$file1' does not exist!"
    exit 1
fi

if [ ! -f "$file2" ]; then
    echo "Error: The file '$file2' does not exist!"
    exit 1
fi

echo "Comparing '$file1' and '$file2':"
echo "-----------------------------------"

# ביצוע ההשוואה עצמה ושמירת קוד היציאה (0 = זהים, 1 = שונים)
colordiff "$file1" "$file2"
diff_status=$?

echo "-----------------------------------"

# הדפסת סיכום למשתמש לפי תוצאת ההשוואה
if [ $diff_status -eq 0 ]; then
    echo "Result: The files are IDENTICAL."
elif [ $diff_status -eq 1 ]; then
    echo "Result: The files are DIFFERENT (see details above)."
else
    echo "Result: An error occurred during the comparison."
fi

echo "-----------------------------------"
