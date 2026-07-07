#!/bin/bash

# בדיקה האם התוכנה acpi מותקנת. אם לא - נתקין אותה (כנדרש במטלה)
if ! command -v acpi &> /dev/null
then
    echo "The 'acpi' tool is not installed. Installing it now..."
    sudo apt-get update
    sudo apt-get install -y acpi
else
    echo "The 'acpi' tool is already installed."
fi

echo "-----------------------------------"
echo "Checking Battery Status..."
echo "-----------------------------------"

# שמירת הפלט של פקודת מצב הסוללה לתוך משתנה
# אנחנו מעלימים שגיאות (2>/dev/null) כדי לטפל בהן בעצמנו
battery_info=$(acpi -b 2>/dev/null)

# בדיקה האם התקבל מידע על סוללה
if [ -z "$battery_info" ]; then
    echo "No battery found!" 
    echo "(Note: You might be running this on a Virtual Machine or a desktop computer without a battery)."
else
    echo "Battery status:"
    echo "$battery_info"
fi

echo "-----------------------------------"
