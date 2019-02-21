#!/bin/bash/

# This script was written in order to automate the debloat of the Fedora KDE spin. Fedora is a great
# distro that pioneers the latest technologies while maintaining a high level of stability, but its KDE
# spin is, quite frankly, too bloated.
# This scripts seeks to create a vanilla KDE experience as close to KDE Neon as possible, while
# keeping the more up to date Fedora base.

# This makes sure you are root.
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

# This updates your system as it good practice to do so.
echo "Starting full system upgrade..."
dnf upgrade -y

# This creates a backup of a list of your installed pacakges to a file.
dnf list installed > backup.txt

# This will remove the extra packages. There are certain packages you may like - comment out the line in the case.

# Duplicate programs and not strictly necessary software
dnf remove falkon.x86_64 juk.x86_64 k3b.x86_64 kamera.x86_64 kamoso.x86_64 kolourpaint kruler qupzilla ktorrent krusader kgpg krfb kmines kpat kmahjongg krdc konversation konqueror akregator kamoso dragon knode dnfdragora kcolorchooser kget  -y

# Calligra suite
dnf remove calligra-core.x86_64 calligra-libs.x86_64 calligra-sheets.x86_64 calligra-sheets-libs.x86_64 calligra-stage.x86_64 calligra-stage-libs.x86_64 calligra-words.x86_64 calligra-words-libs.x86_64 -y
# Address book and email management
dnf remove kmail kaddressbook korganizer telepathy* ktp* kfind knetattach -y

# Accessibility packages (commented out by default)
# dnf remove kmouth kmousetool jovie kmag -yf


# This will clear our any orphan package.
echo "Removing extra packages..."
dnf autoremove -y
echo "You're done!"