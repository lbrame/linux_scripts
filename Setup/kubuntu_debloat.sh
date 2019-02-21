#!/bin/bash

# This script removes extra KDE software from Kubuntu 18.x, in case one forgot to perform a minimal installation or if an upgrade brought all of it back.
# This will remove preloaded programs. Please proceed with caution. Run this script at your own risk.
# Tested on Kubuntu 18.10

# Only root can run this script. This makes sure you're running this script as root.
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

# This will update all your packages as a precaution.
echo "Updating system..."
apt update -y
apt upgrade -y

# This will remove bloatware. I used lines rather than &&'s to make this list easily customizable.
# Simply comment out any program you don't want to remove and bash will ignore it.

apt purge 