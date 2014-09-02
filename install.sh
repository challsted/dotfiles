#!/bin/bash
#!/usr/bin/bash
#
##Filename: install.sh
##Author: HackingInformation
##Contact: https://github.com/hackinginformation
##Version 1.1.1 - Trying to fix issue with wget/curl
#
# An attempt at makeing an install for the files I upload
# YOU WILL NEED TO CHMOD THIS FILE (chmod +x install.sh)
#
##################################
#An attempt at makeing colors easy
##################################
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr 0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
cd ~
printf "${WHITE}You need to install git, zsh, wget, curl and vim, if you havnt already${NORMAL}\n"
printf "${WHITE}This will only work on ubuntu based OS's currently${NORMAL}\n"
printf "${WHITE}Select \"n\" if you are not useing an ubuntu based OS${NORMAL}\n"
while true; do 
    read -p "${CYAN}Would you like me to install them for you? (Y/n)${NORMAL}" yn
    case $yn in
        [Yy]* ) printf "${CYAN}Ok I am installing git, zsh and vim for you${NORMAL}\n";
            sudo apt-get -y install git zsh wget curl vim > /dev/null; break;;
        [Nn]* ) printf "${BLUE}Ok, skipping the installs${NORMAL}\n"; break;;
        "" ) sudo apt-get -y install git zsh wget curl vim > /dev/null; break;;
        * ) printf "${RED}Please answer \"y\"es or \"n\"o${NORMAL}\n";; 
    esac
done
GIT_DIRECTORY="$HOME/git"
read -p "${CYAN}Do you want a regular folder for git or a hidden folder? (R/h)${NORMAL}" rh
    if [[ "$rh" == "H" ]] || [[ "$rh" == "h" ]]; then
        GIT_DIRECTORY="$HOME/.git"
    fi    
        mkdir -p $GIT_DIRECTORY;
        printf "${CYAN} Ok, I have created $GIT_DIRECTORY for you${NORMAL}\n";
        cd $GIT_DIRECTORY;
printf "${WHITE}Im about to install \"Oh-My-Zsh\", if you want to look into this${NORMAL}\n"
printf "${WHITE}go to their github https://github.com/robbyrussell/oh-my-zsh${NORMAL}\n"
printf "${WHITE}Installing Oh-My-Zsh now!${NORMAL}\n"
wget --no-check-certificate http://install.ohmyz.sh >/dev/null 2>&1 | sh 
printf "${WHITE}Cloneing my dotfiles repo now${NORMAL}\n"
git clone --quiet https://github.com/hackinginformation/mydotfiles.git
printf "${WHITE}Doing some background work${NORMAL}\n"
cd $HOME
cp $GIT_DIRECTORY/mydotfiles/zsh/.zshrc .
sed -i "s,RePlAcE,$GIT_DIRECTORY,g" "$HOME/.zshrc"
ln -sf $GIT_DIRECTORY/mydotfiles/vim/.vimrc ~/.vimrc #Symlinks for the .vimrc file
mkdir -p ~/.vim/autoload # Preps for vim-plug to be installed
curl --silent -fLo ~/.vim/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
printf "${WHITE}You are about to be presented with a vim script updater${NORMAL}\n"
printf "${WHITE}Please wait for it to complete, then run \":q\" TWO TIMES to exit and continue${NORMAL}\n"
vim -c :PlugInstall #Calls vim-plug to install plugins
printf "${WHITE}You must change your shell to ZSH (Z-Shell) now${NORMAL}\n"
while true; do 
    read -p "${CYAN}Would you like me to change this for you? (Y/n)${NORMAL}" yn
    case $yn in
        [Yy]* ) chsh -s $(which zsh);
            printf "${CYAN}Your shell is now ZSH!\n"; break;;
        [Nn]* ) printf "${BLUE}Ok, I am not setting zsh as your shell${NORMAL}\n"; break;;
        "" ) chsh -s $(which zsh);
            printf "${CYAN}Your shell is now ZSH!\n"; break;;
        * ) printf "${RED}Please answer \"y\"es or \"n\"o${NORMAL}\n";;
    esac
done
printf "${WHITE}Please restart your shell, once you reopen, please enter option \"0\"${NORMAL}\n"
printf "${WHITE}If you do not, it will overwrite your your .zshrc file with a default one${NORMAL}\n"
exit
