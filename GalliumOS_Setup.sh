#!/bin/bash

#NOTES:
#	
#	This script is packaged alongside a 64-bit xflux installation, updated as of 2013. To check for the latest version and any updates go to https://justgetflux.com/linux.html
#	The number of exclamation marks  (!) next to each block indicate the importance of that block from low (!) to high (!!!)
#
#	Developed by Kunal Mishra

echo "Beginning GalliumOS Chromebook Setup"
echo ""
sudo echo "Asking for root access before beginning"


####### - Screen Utility (!!!)
echo ""
echo "Installing xflux"
./xflux

echo -n "Enter your zipcode and press [ENTER]: "
read ZIPCODE

sudo xflux -z $ZIPCODE

echo "Installing f.lux GUI"
sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1 -y
cd /tmp
git clone "https://github.com/xflux-gui/xflux-gui.git"
cd xflux-gui
python download-xflux.py
sudo python setup.py install # OR: python setup.py install --local

# Run flux
fluxgui


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


####### - Wine (!!!)
sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install wine1.8


#End of setup script