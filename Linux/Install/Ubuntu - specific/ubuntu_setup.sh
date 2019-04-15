#!/bin/bash/

if [ $(id -u) = 0 ]; then
  echo "Don't run this script as root!"
  echo "Monitor this script you'll be asked for your password on multiple occasions"
  exit 1
fi


# Typora
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

sudo apt update -y && apt upgrade -y

###
# Programming
###
sudo apt install \
  -y \
build-essential `#Basic build tools` \
make `#make` \
vim `# Fantastic text editor` \
nvim `# VIM, but even better` \
emacs `# Very customizable keyboard-driven editor` \
curl `# Download utility` \
git `# Version control system` \
cmake `# Pretty popular build tool` \
filezilla `# GUI FTP client` \
tilix `# Tiling terminal emulator for GNOME` \
python3 `# Python programming language` \
htop `# CLI system monitor` \
neofetch `# Display info about distro`  \
sl `# Silly little thing` \
g++ `# C++ compiler` \
gdb `# GNU debugger` \
devhelp `# Documentation` \
zeal `# Documentation`

###
# General use
##à
sudo apt install \
-y \
vlc `#Video player that plays every format under the sun` \
typora `# WYSIWYG Markdown editor (NONFREE)` \
thunderbird `# email client` \
telegram-desktop `# Messaging platform` \
pandoc `# Convert Tex / md into doc, etc` \

###
# Snaps
###
sudo snap install \
  -y \
  spotify `# Audio player (NONFREE)` \
  sublime-text --classic `#Editor (NONFREE)` \
  discord `#voice chat platform (NONFREE)` \
  gimp `#Image manipulation software` \


gsettings set org.gnome.desktop.peripherals.mouse acce    l-profile 'adaptive'
gsettings set org.freedesktop.Tracker.Miner.Files inde    x-on-battery false
gsettings set org.freedesktop.Tracker.Miner.Files inde    x-on-battery-first-time false
gsettings set org.freedesktop.Tracker.Miner.Files thro    ttle 15
gsettings set org.gnome.nautilus.icon-view default-zoo    m-level 'standard'
gsettings set org.gnome.nautilus.preferences executabl    e-text-activation 'ask'

###
# Better power manager than Ubuntu's default
# (Don't use TLP)
###
sudo apt install tuned -y
sudo systemctl enable --now tuned
sudo tuned-adm profile balanced

sudo apt autoremove -y
