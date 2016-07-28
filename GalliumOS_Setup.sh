#!/bin/bash

#FIRST: 
#	Download atom-amd64.deb from https://atom.io (leave installer in downloads file)
#	Download AND Install xflux from https://justgetflux.com/linux.html
#	
#	Enter your GitHub email when prompted (store in EMAIL)
# 	Enter Full Name when prompted (stored in NAME)

echo "Beginning GalliumOS Chromebook Setup"
sudo echo "Asking for sudo password before beginning"

#######
echo -n "Enter your Full Name and press [ENTER]: "
read NAME
echo -n "Enter your GitHub email and press [ENTER]: "
read EMAIL
#######

####### - Git configurations
echo ""
echo "Updating git"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

echo "Configuring git for "
git config --global user.email $EMAIL
git config --global user.name $NAME
git config --global credential.helper store

####### - Python Graphics
echo ""
echo "Installing tkinter"
sudo apt-get install python-tk
sudo apt-get install python3-tk 

####### - Python3 Package Manager
echo ""
echo "Installing pip"
sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo python3 -m pip install --upgrade pip

####### - Python3 Utility
echo ""
echo "Installing getch"
sudo python3 -m pip install getch 

####### - Python3 Utility
echo ""
echo "Installing termcolor"
sudo python3 -m pip install termcolor


####### - Screen Utility
echo ""
echo "Installing f.lux"
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get upgrade
#STILL NEED TO INSTALL HERE (F.LUX)
fluxgui


####### - Music
echo ""
echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install spotify-client


####### - Battery Optimization
echo ""
echo "Installing Powertop"
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tlp
sudo tlp start


####### - Battery Optimaization
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


####### Text Editor - Requires dependencies in /Downloads folder... See top for details
echo ""
echo "Installing Atom"
cd ~/Downloads
sudo dpkg -i atom-adm64.deb
#If errors occur while installing Atom: sudo apt-get install -f
