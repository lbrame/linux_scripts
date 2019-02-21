#!/bin/bash/

# This is the script I use to set up my personal environment on Ubuntu Linux and other Debian derivatives.
# Run this script at your own risk. Warning: this will install third-party repositories and proprietary
# software. If you're looking for my WSL setup, refer to ubuntu_wsl_setup.sh
# This should work on every Ubuntu flavor and derivative, the preinstalled DE plays no role.

# Only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

echo "Updating system..."
apt update -y
apt upgrade -y

echo "Preparing installation process..."
apt install software-properties-common apt-transport-https wget -y

echo "Adding ppas..."
# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Typora
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'


# Refreshing package list
apt update -y

echo "Installing programs..."
# Programming
apt install build-essential -y
apt install make -y
apt install code -y
apt install vim -y
apt install emacs -y
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d # Installs spacemacs
apt install curl -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - # Required for Node
apt install nodejs -y
apt install git -y
apt install cmake -y
apt install filezilla -y
apt install tilix -y
apt install python3 -y
apt install golang-go -y
apt install htop -y
apt install neofetch -y
apt install sl -y # This is critical to my workflow.
sudo apt install default-jdk -y
sudo apt install g++ -y
sudo apt install gdb -y

# General use
apt install google-chrome-stable -y
apt install spotify-client -y
apt install vlc -y
apt install typora -y
apt install thunderbird -y
apt install telegram-desktop -y
apt install pandoc -y

# Setting up zsh + oh-my-zsh
apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh-my-zsh!
exec zsh -l

# Wrapping things up
apt autoremove -y
echo "You're done!"