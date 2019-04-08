#!/bin/bash/

# This script is meant to automate my setup of KDE Neon. I created a separate script because KDE Neon,
# being a "non-distro" but rather a technical preview of the latest Plasma technologies, lacks some
# expected preloads Kubuntu ships with that I intend to use. This also automates some settings in
# the Plasma desktop. As I learn deeper how the Plasma desktop environment works under the hood, I will
# tweak more stuff. Credits to https://zren.github.io/kde/#kde-neon-missing-software--fixes for a lot
# of this.

# Only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

echo "Updating system..."
apt update -y && apt upgrade -y

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
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'


# Refreshing package list
apt update -y

echo "Installing programs..."

# Missing preloads
apt install -y kubuntu-driver-manager kdeplasma-addons libnotify-bin p7zip-full p7zip-rar qapt-deb-installer unrar kcron

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
git config --global push.default matching # Configures git

# General use
apt install google-chrome-stable -y
apt install spotify-client -y
apt install vlc -y
apt install typora -y
apt install thunderbird -y
apt install telegram-desktop -y
apt install pandoc -y
apt install -y redshift redshift-qt # Plasma lacks a "night mode"
apt install -y libreoffice # It does not come with KDE Neon or minimal Kubuntu

# Eliminating alt + tab delay
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DelayTime 0
qdbus org.kde.KWin /KWin reconfigure


# Setting up zsh + oh-my-zsh
apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh-my-zsh!
exec zsh -l

# Wrapping things up
apt autoremove -y
echo "You're done!"