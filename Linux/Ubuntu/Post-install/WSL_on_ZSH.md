# Running ZSH on WSL

Due to the way WSL works, the classical way to change shell does not work here. We're going to need to re-direct  `bash` to `zsh` at every login by adding a few lines to our bash configuration file. It's a hack, but it works and there are no real downsides in this approach.

**After** running ubuntu_wsl_setup.sh, add these lines to your .bashrc file:


```bash
bash -c zsh
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
```

**Remember to use `vim`, `nano` or any other utility that runs inside WSL for this. NEVER touch files in your WSL Linux filesystem with Windows tools. It might corrupt your distro and cause permanent data loss.**

Credits to Syed Sharizal on Medium for finding this out. Check out [his awesome article on how to set up WSL](https://medium.com/@ssharizal/hyper-js-oh-my-zsh-as-ubuntu-on-windows-wsl-terminal-8bf577cdbd97)!

