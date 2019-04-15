#!/bin/bash/


# Only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

echo "Updating system..."
apt update -y && apt upgrade -y

apt install \
  -y \
build-essential `#Basic building tools` \
make \
cmake \
vim \
nvim \
curl \
git \
python3 \
htop \
neofetch \
sl \
g++ \
gdb \


# Wrapping things up
apt autoremove

