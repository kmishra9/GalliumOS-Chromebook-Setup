#!/bin/bash

#FIRST: 
#	Download atom-amd64.deb from https://atom.io (leave installer in downloads file)
#	Download AND Install xflux from https://justgetflux.com/linux.html
#	


echo "Beginning GalliumOS Chromebook Setup"

sudo echo "Asking for sudo password before beginning"

#######
echo ""
echo "Updating git"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

git config --global user.email "kmishra9@berkeley.edu"
git config --global user.name "Kunal Mishra"


#######
echo ""
echo "Installing tkinter"
sudo apt-get install python-tk
sudo apt-get install python3-tk 

#######
echo ""
echo "Installing pip"
sudo apt-get install python-pip
sudo apt-get install python3-pip
sudo python3 -m pip install --upgrade pip

#######
echo ""
echo "Installing getch"
sudo python3 -m pip install getch 

#######
echo ""
echo "Installing termcolor"
sudo python3 -m pip install termcolor

#######
echo ""
echo "Installing f.lux"
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get-update && upgrade
fluxgui

#######
echo ""
echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && upgrade
sudo apt-get install spotify-client

#######
echo ""
echo "Installing Atom"
cd ~/Downloads
sudo dpkg -i atom-adm64.deb
#If errors occur while installing Atom: sudo apt-get install -f
