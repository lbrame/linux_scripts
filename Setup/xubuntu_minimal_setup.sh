#!/bin/bash

# Minimal install I use to setup my Xubuntu VM.

# Only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

apt update -y & & apt upgrade -y
apt install build-essential vim git curl zsh python3 golang-go -y