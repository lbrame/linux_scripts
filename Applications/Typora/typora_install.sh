#!/bin/bash/

# I wrote this script to make installing Typora on non-Debian system faster.

# This makes sure you are root.
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

echo "Installing / Updating Typora..."

# This installs Typora
wget -O ~/Typora-linux-x64.tar.gz https://typora.io/linux/Typora-linux-x64.tar.gz # Downloads Typora x64
tar xf ~/Typora-linux-x64.tar.gz # Extracts the Typora folder
mv Typora-linux-x64 /opt/typora # Installs Typora
cp typora.desktop ~/.local/share/applications/typora.desktop # Creates desktop entry for Typora
# Important: make sure the typora.desktop file is in the same directory as the script. It should be, if you followed the GitHub instructions.
mkdir ~/.icons # Creates .icons folder (Can also be used to install icon themes)
mkdir ~/.icons/Typora/ # Creates a specific folder for the Typora icon (temporary hack while I figure out a more elegant solution.)
cp ~/Typora-linux-x64/resources/app/asserts/app-11.png ~/.icons/Typora/ # Copies the 256x256 png icon to the Typora icon folder
mv ~/.icons/Typora/app-11.png icon.png # Renames app-11.png into icon.png
rm ~/Typora-linux-x64.tar.gz # Clean up: removes the Typora archive
rm -r ~/Typora-linux-x64 # Clean up: removes the extracted Typora folder

echo "All done!"