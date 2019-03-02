#!/bin/bash

# This is the script I use to set up my environment on the Fedora Linux distro.
# Fedora is a bit involved to set up at first due to it's freedom-first philosophy, so using a script
# can make applying the final touches significantly less painful.
# Please note this is only meant to be used on the Fedora GNOME distro. I have another script for the
# Fedora KDE spin, which makes choices that are better suited for the Plasma desktop.

# This makes sure you are root.
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

# This performs a system upgrade
echo "Performing full system upgrade..."
dnf upgrade -y
dnf --refresh

# This adds the rpmfusion repos
echo "Installing rpmfusion repos..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -you

# This enables media codecs
echo "Adding media codecs..."
dnf install gstreamer1-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0 -y

# This installs the software I use

# Programming
dnf install @development-tools -y
dnf install @development-libaries -y
dnf install make automake gcc gcc-c++ kernel-devel -y
dnf install code vim emacs nodejs cmake filezilla htop sl golang gcc-c++ -y

# General purpose
dnf install vlc tilix telegram-desktop pandoc thunderbird -y

# Spotify
dnf install lpf-spotify-client -y
lpf approve spotify-client
-u pkg-build lpf build spotify-client # It can take up to 5 minutes
dnf install /var/lib/lpf/rpms/spotify-client/spotify-client-*.rpm

# Chrome
dnf install fedora-workstation-repositories -y
dnf config-manager --set-enabled google-chrome
dnf install google-chrome-stable -y

# Typora
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
# For Typora updates, it's more practical to run the typora_install.sh file

# This sets zsh and oh-my-zsh up
dnf install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh-my-zsh!
exec zsh -l

# This removes any orphan entry
dnf autoremove -y


echo "You're done!"