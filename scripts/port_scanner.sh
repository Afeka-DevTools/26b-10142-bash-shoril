#!/bin/bash

# 1. בדיקה אם התוכנה nmap מותקנת (כנדרש בהנחיות)
if ! command -v nmap &> /dev/null
then
    echo "nmap is not installed. Installing it now..."
    # התקנת התוכנה (הפקודה מותאמת לסביבות לינוקס כמו אובונטו)
    sudo apt-get update
    sudo apt-get install -y nmap
else
    echo "nmap is already installed. Proceeding..."
fi

echo "-----------------------------------"

# 2. קבלת כתובת ה-IP מהמשתמש
# נבדוק אם המשתמש העביר כתובת IP כשהוא הריץ את הסקריפט (ארגומנט ראשון)
if [ -z "$1" ]
then
    # אם לא העביר, נבקש ממנו להקליד כעת
    read -p "Please enter an IP address to scan (e.g., 127.0.0.1): " target_ip
else
    # אם העביר, נשתמש בארגומנט שהוזן
    target_ip=$1
fi

echo "Scanning open ports on IP: $target_ip..."
echo "This might take a few moments."
echo "-----------------------------------"

# 3. ביצוע הסריקה
# הדגל F- מבצע סריקה "מהירה" (Fast) של 100 הפורטים הנפוצים ביותר
nmap -F $target_ip

echo "-----------------------------------"
echo "Scan complete!"
