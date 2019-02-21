# Setup scripts

This is a collection of scripts I use to set up my environment in various Linux distros I use.



### ubuntusetup.sh

This is the file I use to set up Ubuntu, but since it only uses standard apt packaging and doesn't install any snaps, is also suitable for Debian or any Debian - based distro. Please note that this script ads third-party repositories to Aptitude and it installs proprietary software.

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

