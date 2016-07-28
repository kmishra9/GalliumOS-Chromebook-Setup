#!/bin/bash

#NOTES:
#	
#	This script is packaged alongside a 64-bit xflux installation, updated as of 2013. To check for the latest version and any updates go to https://justgetflux.com/linux.html
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


####### - Screen Utility (!!!)
echo ""
echo "Installing xflux"
./xflux

echo "Installing f.lux GUI"
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install fluxgui
sudo fluxgui


####### - Music Client (!!!)
echo ""
echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install spotify-client


####### - Battery Optimization 1 (!!!)
echo ""
echo "Installing Powertop"
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tlp
sudo tlp start


####### - Battery Optimaization 2 (!!!)
echo ""
echo "Installing Powertop"
sudo apt-get install powertop
sudo powertop --auto-tune
#This is responsible for ensuring powertop starts at the beginning of every reboot
sudo bash
cat >/etc/systemd/system/powertop.service <<EOF
[Unit]
Description=PowerTOP auto tune

[Service]
Type=idle
Environment="TERM=dumb"
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF


####### Versatile, Lightweight Text Editor (!!)
echo ""
echo "Installing Sublime Text 3"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install sublime-text-installer

#End of setup script