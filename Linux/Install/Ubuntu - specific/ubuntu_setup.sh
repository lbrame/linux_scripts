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


###
# GNOME settings
# From Tobias's Fedora setup script https://git.furworks.de/tobias/fedora-install/src/branch/master/install.sh
###
# Make sure rgba font smoothing is enabled
gsettings set org.gnome.settings-daemon.plugins.xsetti    ngs antialiasing 'rgba'
# Less annoying mouse acceleration
gsettings set org.gnome.desktop.peripherals.mouse acce    l-profile 'adaptive'
# Enable overamplification (Not recommended on earphones)
gsettings set org.gnome.desktop.sound allow-volume-abo    ve-100-percent true
# Multi-display improvements
gsettings set org.gnome.shell.overrides workspaces-onl    y-on-primary false
# Make the file indexer less power-hungry
gsettings set org.freedesktop.Tracker.Miner.Files inde    x-on-battery false
gsettings set org.freedesktop.Tracker.Miner.Files inde    x-on-battery-first-time false
gsettings set org.freedesktop.Tracker.Miner.Files thro    ttle 15
# Better Nautilus settings
gsettings set org.gnome.nautilus.icon-view default-zoo    m-level 'standard'
# Bring back launching executable files directly from Nautilus
gsettings set org.gnome.nautilus.preferences executabl    e-text-activation 'ask'
gsettings set org.gtk.Settings.FileChooser sort-direct    ories-first true
gsettings set org.gnome.nautilus.list-view use-tree-vi    ew true

###
# Better power manager than Ubuntu's default
# (Don't use TLP)
###
sudo apt install tuned -y
sudo systemctl enable --now tuned
sudo tuned-adm profile balanced

# Profile settings
# * balanced - Default tuning
# * desktop - pure performance with no regards for mpower consumption
# * powersave - maximize battery life

# cleanup
sudo apt autoremove -y
