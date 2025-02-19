
#!bin/bash


read -p "Enter username: " username

echo "you entered $username"
echo "Now we will learn to add the user : "

sudo useradd -m $username
echo "New user added"

