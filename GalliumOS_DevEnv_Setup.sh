#!/bin/bash

#NOTES:
#	
#	This script installs updates to Git, python, python3, R, RStudio, Brew, Java SDK 7, and Sublime Text 3
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


####### - Statistical Language (!!)
echo ""
echo "Installing the R Project for Statistical Computing"

# Appends the CRAN repository to your sources.list file 
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/debian lenny-cran/" >> /etc/apt/sources.list'
# Adds the CRAN GPG key, which is used to sign the R packages for security.
gpg --keyserver keyserver.ubuntu.com --recv-key 06F90DE5381BA480
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get install r-base r-base-dev


####### - Statistical Language IDE (!!)
echo ""
echo "Installing the RStudio"

#This is the latest version of RStudio as of July 28th, 2016
#Find the latest installation here: https://www.rstudio.com/products/rstudio/download/
sudo apt-get install gdebi-core
wget https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
sudo gdebi -n rstudio-0.99.903-amd64.deb
rm rstudio-0.99.896-amd64.deb


####### - Prerequisite to Node and web development language (!!!)
echo ""
echo "Installing the Ruby"
sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev


####### - Prerequisite to Node and web development language (!!)
echo ""
echo "Installing the Ruby"
sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev


####### - Prerequisite to Node and a package manager (!!!)
echo ""
echo "Installing linuxbrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bashrc
echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> ~/.bashrc
echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> ~/.bashrc

brew update
brew update
brew doctor


####### - Node (!!!)
echo ""
echo "Installing linuxbrew"
brew install node
brew upgrade node


####### Versatile, Lightweight Text Editor (!!)
echo ""
echo "Installing Sublime Text 3"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install sublime-text-installer
echo "You can run Sublime Text 3 from Terminal with the command 'subl'"


####### Java SDK 7 (!!!)

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

#If the above doesn't work, you can download the SDK's at the following links: 
# 	For Java 7 use this link: https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=java%20jdk%207
# 	For Java 8 use this link: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
#	Then, follow these instructions: http://www.wikihow.com/Install-Oracle-Java-JDK-on-Ubuntu-Linux


####### Intellij IDEA

echo ""
echo "Installing IntelliJ IDEA..."
[ $(id -u) != "0" ] && exec sudo "$0" "$@" # We need root to install
ed=C
# Fetch the most recent version
VERSION=$(wget "https://www.jetbrains.com/intellij-repository/releases" -qO- | grep -P -o -m 1 "(?<=https://www.jetbrains.com/intellij-repository/releases/com/jetbrains/intellij/idea/BUILD/)[^/]+(?=/)")
# Prepend base URL for download
URL="https://download.jetbrains.com/idea/ideaI$ed-$VERSION.tar.gz"
# Truncate filename
FILE=$(basename ${URL})
# Set download directory
DEST=~/Downloads/$FILE
echo "Downloading idea-I$ed-$VERSION to $DEST..."
# Download binary
wget -cO ${DEST} ${URL} --read-timeout=5 --tries=0
echo "Download complete!"
# Set directory name
DIR="/opt/idea-I$ed-$VERSION"
echo "Installing to $DIR"
# Untar file
if mkdir ${DIR}; then
    tar -xzf ${DEST} -C ${DIR} --strip-components=1
fi
# Grab executable folder
BIN="$DIR/bin"
# Add permissions to install directory
chmod -R +rwx ${DIR}
# Set desktop shortcut path
DESK=/usr/share/applications/IDEA.desktop
# Add desktop shortcut
echo "[Desktop Entry]\nEncoding=UTF-8\nName=IntelliJ IDEA\nComment=IntelliJ IDEA\nExec=${BIN}/idea.sh\nIcon=${BIN}/idea.png\nTerminal=false\nStartupNotify=true\nType=Application" -e > ${DESK}
# Create symlink entry
ln -s ${BIN}/idea.sh /usr/local/bin/idea



#End of DevEnv setup script


### ISSUES STILL WITH INSTALL RSTUDIO
