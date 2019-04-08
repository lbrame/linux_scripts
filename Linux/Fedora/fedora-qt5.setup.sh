#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root!" 1>&2
   exit 1
fi

sudo dnf upgrade --refresh -y
sudo dnf install qt5 qt5-devel qt-creator qt-creator-data qt-creator-doc qt5-qtbase-examples qt5-qttools-examples qt5-qtdoc -y