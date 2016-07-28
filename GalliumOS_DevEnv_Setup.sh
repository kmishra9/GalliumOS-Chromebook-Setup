#!/bin/bash

#NOTES:
#	
#	This script installs updates to Git, python, python3, R, RStudio, and Sublime Text 3 
#	Enter your GitHub email when prompted (store in EMAIL)
# 	Enter Full Name when prompted (stored in NAME)
#	The number of exclamation marks  (!) next to each block indicate the importance of that block from low (!) to high (!!!)
#
#	Developed by Kunal Mishra

echo "Beginning GalliumOS Chromebook Setup"
echo ""
sudo echo "Asking for root access before beginning"

#######
echo -n "Enter your Full Name and press [ENTER]: "
read NAME
echo -n "Enter your GitHub email and press [ENTER]: "
read EMAIL
#######


####### - Git configurations (!!!)
echo ""
echo "Updating git"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

echo "Configuring git for $NAME with Username: $EMAIL"
git config --global user.email $EMAIL
git config --global user.name $NAME
#Keeps credentials in a file somewhere = less privacy for more convenience. Remove if unwanted
git config --global credential.helper store


####### - Python Graphics (!!)
echo ""
echo "Installing tkinter"
sudo apt-get install python-tk
sudo apt-get install python3-tk 


####### - Python3 Package Manager (!!!)
echo ""
echo "Installing pip"
sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo python3 -m pip install --upgrade pip


####### - Python3 Utility (!)
echo ""
echo "Installing getch"
sudo python3 -m pip install getch 

####### - Python3 Utility (!)
echo ""
echo "Installing termcolor"
sudo python3 -m pip install termcolor

####### Versatile, Lightweight Text Editor (!!)
echo ""
echo "Installing Sublime Text 3"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install sublime-text-installer
echo "You can run Sublime Text 3 from Terminal with the command 'subl'"




