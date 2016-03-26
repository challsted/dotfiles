#!/bin/bash
#!/usr/bin/bash
#
##Filename: install.sh
##Author: HackingInformation
##Contact: https://github.com/challsted/dotfiles
##Version 2.0.0 - Rewriting the whole script to be automated and possibly work on arch
##Notes:
#Need to add pushd/popd to allow user to run this script from anywhere but everything still work as expected.
#Need to check what package management tool is installed, (which apt-get) and if it exists install with it. This will allow for debian, mint, fedora, rhel, centos, and many others to be used simply by adding this and "yum" as options!



#Detect OS, based on OS install needed componets
USROS=`lsb_release -si`
if [[ $USROS == 'Ubuntu' ]]; then
    INSTALLER="sudo apt-get update && sudo apt-get -y install git zsh wget curl vim > /dev/null"
elif [[ $USROS == 'Arch_Linux' ]]; then
    INSTALLER="sudo pacman --no-confirm -Syu git zsh wget curl vim > /dev/null" #This is NOT tested
else
    printf "Your not running Ubuntu or Arch, this script currently dosn't support you...\n  \
        you can still install the packages manually: \n \
        git zsh wget curl vim"
    exit 2
fi

#Setup Git Folder and install OMZsh and VimPlug
mkdir -p ~/git/ && cd ~/git
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone --quiet https://github.com/challsted/dotfiles.git
cd

#Pre-Symlink molokai to prevent the issue with it assuming a light background
mkdir -p ~/.vim/colors && ln -sf ~/.vim/plugged/molokai/colors/molokai.vim

#Checks if an existing .zshrc exists, if so it backes it up first
if [[ -e ~/.zshrc ]]; then
    mv ~/.zshrc ~/.zshrc.backup-pre-script && ln -sf ~/git/dotfiles/zsh/zshrc.symlink ~/.zshrc
else
    ln -sf ~/git/dotfiles/zsh/zshrc.symlink ~/.zshrc
fi

#Checks if an existing .vimrc exists, if so it backes it up first
if [[ -e ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc.backup-pre-script && ln -sf ~/git/dotfiles/vim/vimrc.symlink ~/.vimrc
else
    ln -sf ~/git/dotfiles/vim/vimrc.symlink ~/.vimrc
fi

#Calls vim-plug to install plugins, and quites both windows
vim ~/.vimrc -c 'PlugInstall | q | q'

#Change login shell to zsh
sudo chsh -s $(which zsh)
exit 0
