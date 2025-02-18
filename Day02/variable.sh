#!/bin/bash
#This is the variable file
<< comment
this is the 
multiline comments
comment

name="ABCD"
echo "Name is $name"
echo "----Now we will learn command as a variable----"
echo "The data is $(date)"

echo "Now we will learn how to take the input..."
echo "We need to use the read"
echo  "Enter the name"
read username
echo "The name is $username"


