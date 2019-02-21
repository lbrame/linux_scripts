#!/bin/bash

# This script was created to debloat the GNOME variant of Ubuntu 18.04 and 18.10. I created this because
# upgrades bring back the bloatware clean installations once removed.
# This is only for the main Ubuntu version with the GNOME desktop environment. Do not use this on
# Kubuntu, Xubuntu, Lubuntu, Linux Mint, Elementary OS or other Ubuntu spins or derivates.

# First, let's make sure you're root:
# Only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

# Then, let's create a backup of your currently listed applications:
echo "Backing up the list of your installed programs to backup.txt."
echo "In case something goes wrong, you'll find a list of everything you had installed prior to running this script in backup.txt"
apt list --installed > backup.txt

# Before doing any further modifications, we're going to update Ubuntu as it's good practice to do so.
echo "Starting system update..."
apt update && apt upgrade

# Let's get to the juicy part!
echo "Starting debloat process..."
apt purge aisleriot baobab branding-ubuntu cheese-common cheese deja-dup example-content gir1.2-rb-3.0 gir1.2-totem-1.0 gir1.2-totemplparser-1.0 gnome-mahjongg gnome-calendar gnome-mines gnome-sudoku gnome-todo gnome-todo-common gnome-video-effects guile-2.0-libs hyphen-en-us libabw-0.1-1 libavahi-ui-gtk3-0 libdmapsharing-3.0-2 libexttextcat-2.0-0 libexttextcat-data libfreehand-0.1-1 libgnome-games-support-1-3 libgnome-games-support-common libgnome-todo libmessaging-menu0 libmhash2 libminiupnpc10 libmwaw-0.3-3 libmythes-1.2-0 libnatpmp1 libneon27-gnutls liborcus-0.13-0 libpagemaker-0.0-0 libraptor2-0 librasqal3 librdf0 libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk3 libreoffice-help-en-us libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-breeze libreoffice-style-galaxy libreoffice-style-tango libreoffice-writer librhythmbox-core10 libtotem0 libvisio-0.1-1 libwpd-0.10-10 libwpg-0.3-3 libwps-0.4-4 libyajl2 mythes-en-us python3-uno remmina remmina-common remmina-plugin-rdp remmina-plugin-secret remmina-plugin-vnc rhythmbox rhythmbox-data rhythmbox-plugin-alternative-toolbar rhythmbox-plugins shotwell shotwell-common simple-scan thunderbird thunderbird-gnome-support thunderbird-locale-en thunderbird-locale-en-us totem totem-common totem-plugins transmission-common transmission-gtk ubuntu-web-launchers uno-libs3 ure usb-creator-gtk vino zeitgeist-core -y

# This will get rid of orphan packages
apt autoremove -y

echo "You're done!"