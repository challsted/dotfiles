#!/bin/bash
#!/usr/bin/bash
#
##Filename: install.sh
##Author: HackingInformation
##Contact: https://github.com/hackinginformation
##Version 0.4 (This might be incorrect, as i sometimes forget to update)
#
# An attempt at makeing an install for the files I upload
# YOU WILL NEED TO CHMOD THIS FILE (chmod +x install.sh)

cd ~

printf "${RED}You need to install git, zsh, and vim, if you havnt already${NORMAL}\n"
printf "${RED}This will only work on ubuntu based OS's currently${NORMAL}\n"
printf "${RED}Select \"n\" if you are not useing an ubuntu based OS${NORMAL}\n"
while true; do # This simply prompts the user if they want the script to install git, zsh and vim
    read -e -p "${RED}Would you like me to install them for you? (Y/n)${NORMAL}\n" -i "Y" yn
    case $yn in
        [Yy]* ) sudo apt-get -y install git zsh vim;
            printf "${RED}Ok I am installing git, zsh and vim for you${NORMAL}\n"; break;; 
        [Nn]* ) printf "Ok, skipping the installs${NORMAL}\n"; break;;
        * ) printf "${RED}Please answer yes or no, enter will auto accept yes${NORMAL}\n";; 
    esac
done

#if [[ ! -d ~/git/ ]] || [[ ! -d ~/.git/ ]]; then
#    while true; do
#        read -e -p "${RED}Do you want a reguler folder for git or a hidden folder? (R/h)${NORMAL}\n" -i "R" rh
#        case $rh in
#            [Rr]* ) if [[ ! -d ~/git/ ]]; then 
#                GIT_DIRECTORY=mkdir ~/git/ && cd ~/$GIT_DIRECTORY/
#            fi; 
#                printf "${RED}Ok, I have created $GIT_DIRECTORY for you${NORMAL}\n"; break;;
#            [Hh]* ) if [[ ! -d ~/.git/ ]]; then
#                GIT_DIRECTORY=mkdir ~/.git/ && cd ~/$GIT_DIRECTORY/
#            fi;
#                printf "${RED}Ok, I have created $GIT_DIRECTORY for you"; break;;
#            * ) printf "${RED}You must answer with \"R\", \"H\", or the full word(s) enter will auto accept regular${NORMAL}\n";;
#        esac
#    done
#fi

if [[ ! -d ~/git/ ]] || [[ ! -d ~/.git/ ]]; then
    GIT_DIRECTORY="$HOME/git/"
        read -p "Do you want a regular folder for git or a hidden folder? (R/h)" rh
        if [ $rh == "H" ] || [ $rh == "h" ]; then
            GIT_DIRECTORY="$HOME/.git/"
        fi
    mkdir -p $GIT_DIRECTORY && cd $GIT_DIRECTORY && pwd
    printf "Ok, I have created $GIT_DIRECTORY for you.\n"
fi

printf "${RED}Im about to install \"Oh-My-Zsh\", if you want to look into this go to their github${NORMAL}\n"
printf "${RED}https://github.com/robbyrussell/oh-my-zsh${NORMAL}\n"
printf "${RED}Installing Oh-My-Zsh now!${NORMAL}\n"
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

printf "${RED}Cloneing my dotfiles repo now${NORMAL}\n"
git clone https://github.com/hackinginformation/mydotfiles.git

printf "${RED}You must change your shell to ZSH (Z-Shell) now${NORMAL}\n"
while true; do 
    read -e -p "${RED}Would you like me to change this for you? (Y/n)${NORMAL}\n" -i "Y" yn
    case $yn in
        [Yy]* ) printf "${RED}Your shell is now ZSH!"; chsh -s $(which zsh); break;;
        [Nn]* ) printf "${RED}Ok, I am not setting zsh as your shell${NORMAL}\n"; break;;
        * ) printf "${RED}Please enter Y or N, enter will auto accept Yes${NORMAL}\n";;
    esac
done

printf "${RED}Creating symlinks for you${NORMAL}\n"
cd ~
ln -sfv ~/$GIT_DIRECTORY/mymotfiles/zsh/.zshrc ~/.zshrc
ln -sfv ~/$GIT_DIRECTORY/mydotfiles/vim/.vimrc ~/.vimrc

source ~.zshrc && source ~/.vimrc

printf "${RED}Please restart your shell, once you reopen, please enter option \"0\"${NORMAL}\n"
printf "${RED}If you do not, it will overwrite your your .zshrc file with a default one${NORMAL}\n"
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
