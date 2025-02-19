#!/bin/bash

<<disclaimer 
This is to write the comments
disclaimer


# Disclaimer: This script compares a user-input number with 10.

read -p "Enter the number: " number
read -p "The number is integer : " b
if [[ $number == "10" ]]; then
    echo "The number is same"
elif [[ $b -ge 100 ]]; then
	echo "The number is same"


else
    echo "The number is not same"
fi




