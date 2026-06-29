#!/bin/bash

letterset="a-zA-Z"
numberset="0-9"
signset="!@#$&"
password=""
for i in {1..8}; do
    password+=$(tr -dc "$letterset" < /dev/urandom | head -c 1)
done
password+=$(tr -dc "$numberset" < /dev/urandom | head -c 1)
password+=$(tr -dc "$signset" < /dev/urandom | head -c 1)
shuffled_password=$(echo "$password" | fold -w1 | shuf | tr -d '\n')


echo "Your new password is: $shuffled_password"    