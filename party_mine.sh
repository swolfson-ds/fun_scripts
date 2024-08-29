#!/bin/bash

TXT_FILE="msg.txt"
if ! command -v toilet &> /dev/null
then
    echo "toilet could not be found, please install it first."
    exit
fi

if [ ! -f "$TXT_FILE" ]; then
    # If the file doesn't exist, create it with default text
    echo "0" > "$TXT_FILE"
    echo "Congratulations" >> "$TXT_FILE"
    echo "on your" >> "$TXT_FILE"
    echo "promotion" >> "$TXT_FILE"
    echo "Eric!" >> "$TXT_FILE"
fi

    write_count=$(head -n 1 "$TXT_FILE")
    tail -n +2 "$TXT_FILE" | while IFS= read -r line
    do
        toilet -t -f mono9 -F metal "$line"
    done 


# Increment the count
write_count=$((write_count+1))
# if write count < 3
if [ "$write_count" -eq 1 ]; then
    {
        echo "$write_count"
        echo "Yer a senior engineer Eric"
    } > "$TXT_FILE"
elif [ "$write_count" -eq 2 ]; then
    {
        echo "$write_count"
        echo "Pay raise coming later"
    } > "$TXT_FILE"
elif [ "$write_count" -eq 3 ]; then
    rm -f "$TXT_FILE"
    exit 0
else
    {
        echo "$write_count"
        echo "Well Done"
        echo "on your"
        echo "new role"
        echo "Eric!"
    } > "$TXT_FILE"
fi

