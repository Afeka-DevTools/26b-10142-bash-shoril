#!/bin/bash

charset="a-zA-Z0-9!@#$&"
password=""
for i in {1..10}; do
    password+=$(tr -dc "$charset" < /dev/urandom | head -c 1)
done

echo "Your new password is: $password"