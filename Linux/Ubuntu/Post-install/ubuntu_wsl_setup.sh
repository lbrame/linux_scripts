#!/bin/bash/

# This is a stripped-down version of my Ubuntu setup screen intended to only install CLIs on Ubuntu for WSL
# for working on my Windows partition. It's useless to install GUI applications inside WSL, as Windows
# can do a much better job at running them than WSL and an X server. You can also use it if you do not
# wish to install proprietary or graphical software with my script on a native Ubuntu install.

# Only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

echo "Updating system..."
apt update -y
apt upgrade -y

echo "Installing programs..."
apt install build-essential -y
apt install make -y
apt install vim -y
apt install curl -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - # Required for Node
apt install nodejs -y
apt install git -y
apt install cmake -y
apt install python3 -y
apt install golang-go -y
apt install htop -y
apt install neofetch -y
apt install sl -y # This is critical to my workflow.
sudo apt install default-jdk -y
sudo apt install g++ -y
sudo apt install gdb -y


# Setting up zsh + oh-my-zsh
apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh-my-zsh!
exec zsh -l

# Wrapping things up
apt autoremove
echo "You're done!"

# Notice for WSL
echo "Due to the way WSL works, please follow the instructions in WSL_on_ZSH.md after running this script."
echo "This script does not automate this last step because I do not want to overwrite your .bashrc"