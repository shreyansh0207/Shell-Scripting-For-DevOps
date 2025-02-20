
#!/bin/bash


#create_directory() {
#	mkdir demo  
<<comment
Here we create the folder and after run the first time it will run in proper manner but if we run this in the second time it will show the error that the folder it already created 
comment
#} 
#create_directory

#echo "This should not work because the code in interrupted"


#error_handling

create_directory(){
       mkdir demo
}
if ! create_directory; then
	echo "The folder is exited as the dirctory"
	exit 1
fi

echo "The code create the folder when we run this for the firts time and after that it till handle the error"
