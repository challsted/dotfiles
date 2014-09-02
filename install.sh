#!/bin/bash
#!/usr/bin/bash
#
##Filename: install.sh
##Author: HackingInformation
##Contact: https://github.com/hackinginformation
##Version 0.7 (This might be incorrect, as i sometimes forget to update)
#
# An attempt at makeing an install for the files I upload
# YOU WILL NEED TO CHMOD THIS FILE (chmod +x install.sh)

cd ~

printf "$(tput setaf 1)You need to install git, zsh, and vim, if you havnt already$(tput sgr0)\n"
printf "$(tput setaf 1)This will only work on ubuntu based OS's currently$(tput sgr0)\n"
printf "$(tput setaf 1)Select \"n\" if you are not useing an ubuntu based OS$(tput sgr0)\n"
while true; do 
    read -e -p "$(tput setaf 1)Would you like me to install them for you? (Y/n)$(tput sgr0)" -i "Y" yn
    case $yn in
        [Yy]* ) sudo apt-get -y install git zsh vim > /dev/null;
            printf "$(tput setaf 1)Ok I am installing git, zsh and vim for you$(tput sgr0)\n"; break;; 
        [Nn]* ) printf "Ok, skipping the installs$(tput sgr0)\n"; break;;
        * ) printf "$(tput setaf 1)Please answer yes or no, enter will auto accept yes$(tput sgr0)\n";; 
    esac
done

if [[ ! -d ~/git/ ]] || [[ ! -d ~/.git/ ]]; then
    GIT_DIRECTORY="$HOME/git"
        read -p "Do you want a regular folder for git or a hidden folder? (R/h)" rh
        if [ $rh == "H" ] || [ $rh == "h" ]; then
            GIT_DIRECTORY="$HOME/.git"
        fi
    mkdir -p $GIT_DIRECTORY && cd $GIT_DIRECTORY && pwd
    printf "Ok, I have created $GIT_DIRECTORY for you.\n"
fi

printf "$(tput setaf 1)Im about to install \"Oh-My-Zsh\", if you want to look into this go to their github$(tput sgr0)\n"
printf "$(tput setaf 1)https://github.com/robbyrussell/oh-my-zsh$(tput sgr0)\n"
printf "$(tput setaf 1)Installing Oh-My-Zsh now!$(tput sgr0)\n"
wget --no-check-certificate http://install.ohmyz.sh -O - | sh  # might want to pipe this to dev null to clean it all up wget http://address.rand >/dev/null 2>&1

printf "$(tput setaf 1)Cloneing my dotfiles repo now$(tput sgr0)\n"
git clone https://github.com/hackinginformation/mydotfiles.git > /dev/null

printf "$(tput setaf 1)Doing some background work$(tput sgr0)\n"
cd $HOME
sed -i 's/\<replace\>/$GIT_DIRECTORY/g' $GIT_DIRECTORY/zsh/.zshrc
ln -sf $GIT_DIRECTORY/mydotfiles/zsh/.zshrc ~/.zshrc
ln -sf $GIT_DIRECTORY/mydotfiles/vim/.vimrc ~/.vimrc

printf "$(tput setaf 1)You must change your shell to ZSH (Z-Shell) now$(tput sgr0)\n"
while true; do 
    read -e -p "$(tput setaf 1)Would you like me to change this for you? (Y/n)$(tput sgr0)" -i "Y" yn
    case $yn in
        [Yy]* ) printf "$(tput setaf 1)Your shell is now ZSH!"; chsh -s $(which zsh); break;;
        [Nn]* ) printf "$(tput setaf 1)Ok, I am not setting zsh as your shell$(tput sgr0)\n"; break;;
        * ) printf "$(tput setaf 1)Please enter Y or N, enter will auto accept Yes$(tput sgr0)\n";;
    esac
done

printf "$(tput setaf 1)Please restart your shell, once you reopen, please enter option \"0\"$(tput sgr0)\n"
printf "$(tput setaf 1)If you do not, it will overwrite your your .zshrc file with a default one$(tput sgr0)\n"
exit

################################
# Adding so I can colorize text!
################################
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
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
