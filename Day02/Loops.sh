
#!/bin/bash

# "This is for and while loop"


<<comment 

1 argument is for the number is integer
2 is the starting value
3 is the ending value
comment

for (( num=$1 ; num<=$3 ; num++))do
	echo "The value is $1 and the number is $num"
done


