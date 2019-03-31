#!/bin/bash

sudo dnf upgrade --refresh -y
sudo dnf install @xfce-desktop -y
sudo dnf install xfce4-whiskermenu-plugin xorg-x11-drv-synaptics-devel.x86_64 xfce4-volumed.x86_64 xfce4-pulseaudio-plugin.x86_64 flameshot -y
echo"Xfce is installed and ready to go!"