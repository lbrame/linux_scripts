# Setup scripts

This is a collection of scripts I use to set up my environment in various Linux distros I use.



### ubuntusetup.sh

This is the file I use to set up Ubuntu, but since it only uses standard apt packaging and doesn't install any snaps, is also suitable for Debian or any Debian - based distro. Please note that this script adds third-party repositories to Aptitude and it installs proprietary software.

To use this script, run the commands:

```shell
$ git clone https://github.com/lbrame/linux_scripts.git
$ cd linux_scripts
$ cd Setup
$ chmod +x ubuntusetup.sh
$ sudo bash ubuntusetup.sh
```



### ubuntu_wsl_setup.sh

As you may know, Microsoft added a feature in Windows 10, aptly named *Windows Subsystem for Linux*, that lets you run Ubuntu Linux and other GNU/Linux distributions natively within Windows, in such a way that they are not virtualized and they share the same filesystem of Windows. Though I run a dual-boot system for practical purposes, I find myself preferring to use Windows in some occasions for various reasons. In That's why I created a nice setup script for my WSL setup as well. This is a stripped-down version of my regular setup script that only really installs terminal utilities, since it would be useless to add GUI applications such as Typora to run through an X server - Windows already runs them natively at full speed!

To use this script, run the commands:

```bash
$ git clone https://github.com/lbrame/linux_scripts.git
$ cd linux_scripts
$ cd Setup
$ chmod +x ubuntu_wsl_setup.sh
$ sudo bash ubuntu_wsl_setup.sh
```
After running this script, please follow the steps outlined in [this file](https://github.com/lbrame/linux_scripts/blob/master/Setup/WSL_on_ZSH.md).



### ubuntu_debloat.sh

Let's face it, Ubuntu's default installation is heavily bloated. Canonical finally added a minimal install option from Ubuntu 18.04 onwards, but the side effect is that upgrading your system to the next version of Ubuntu brings all the bloat from the main installation with it. Furthermore, you might have started out with a full installation but might want to convert your install to a minimal installation. This script will backup a list of installed packages to a `backup.txt` file, remove all the extra programs and then clean out any orphan entry that the script might have left behind. Please make a backup and use this tool with caution, as it is not endorsed or recommended by Canonical.

To use the script, run these commands:

```bash
$ git clone https://github.com/lbrame/linux_scripts.git
$ cd linux_scripts
$ cd Setup
$ chmod +x ubuntu_debloat.sh
$ sudo bash ubuntu_debloat.sh
```



### fedora_kde_debloat.sh

Fedora Linux is a fantastic Linux distro that pioneers the latest technologies and consistently delivers the latest packages without sacrificing stability. Fedora Workstation comes with various desktop environments, however, the KDE spin is notorious for being bloated. With this script, I seek to bring Fedora's KDE spin closer in preloads to the non-distro KDE Neon, while keeping the more modern Fedora base.

Again, running this script is quite simple, just run the following commands:

```bash
$ git clone https://github.com/lbrame/linux_scripts.git
$ cd linux_scripts
$ cd Setup
$ chmod +x fedora_kde_debloat.sh
$ sudo bash fedora_kde_debloat.sh
```


