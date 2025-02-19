#!/bin/bash
#This is the while loop
num=0

while [[ $num -le 5 ]]; do
    echo "Print the while loop"
    ((num++))  # Correct way to increment
done

