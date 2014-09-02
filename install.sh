#!/bin/bash
#!/usr/bin/bash
#
##Filename: install.sh
##Author: HackingInformation
##Contact: https://github.com/hackinginformation
##Version 0.11 (This might be incorrect, as i sometimes forget to update)
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
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

cd ~

printf "$(tput setaf 1)${BLUE}You need to install git, zsh, wget, curl and vim, if you havnt already$(tput sgr0)\n"
printf "$(tput setaf 1)This will only work on ubuntu based OS's currently$(tput sgr0)\n"
printf "$(tput setaf 1)Select \"n\" if you are not useing an ubuntu based OS$(tput sgr0)\n"
while true; do 
    read -p "$(tput setaf 1)Would you like me to install them for you? (Y/n)$(tput sgr0)" yn
    case $yn in
        [Yy]* ) printf "$(tput setaf 1)Ok I am installing git, zsh and vim for you$(tput sgr0)\n";
            sudo apt-get -y install git zsh wget curl vim > /dev/null; break;;
        [Nn]* ) printf "Ok, skipping the installs$(tput sgr0)\n"; break;;
        * ) printf "$(tput setaf 1)Please answer yes or no$(tput sgr0)\n";; 
    esac
done

GIT_DIRECTORY="$HOME/git"
read -p "$(tput setaf 1)Do you want a regular folder for git or a hidden folder? (R/h)$(tput sgr0)" rh
if [[ "$rh" == "H" ]] || [[ "$rh" == "h" ]]; then
    GIT_DIRECTORY="$HOME/.git"
fi    
    mkdir -p $GIT_DIRECTORY;
    cd $GIT_DIRECTORY;


printf "$(tput setaf 1)Im about to install \"Oh-My-Zsh\", if you want to look into this$(tput sgr0)\n"
printf "$(tput setaf 1)go to their github https://github.com/robbyrussell/oh-my-zsh$(tput sgr0)\n"
printf "$(tput setaf 1)Installing Oh-My-Zsh now!$(tput sgr0)\n"
wget --no-check-certificate http://install.ohmyz.sh >/dev/null 2>&1 | sh 

printf "$(tput setaf 1)Cloneing my dotfiles repo now$(tput sgr0)\n"
git clone --quiet https://github.com/hackinginformation/mydotfiles.git

printf "$(tput setaf 1)Doing some background work$(tput sgr0)\n"
cd $HOME
cp $GIT_DIRECTORY/mydotfiles/zsh/.zshrc .
sed -i "s,RePlAcE,$GIT_DIRECTORY,g" "$HOME/.zshrc"
ln -sf $GIT_DIRECTORY/mydotfiles/vim/.vimrc ~/.vimrc #Symlinks for the .vimrc file
mkdir -p ~/.vim/autoload # Preps for vim-plug to be installed
curl --silent -fLo ~/.vim/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
printf "$(tput setaf 1)You are about to be presented with a vim script updater$(tput sgr0)\n"
printf "$(tput setaf 1)Please wait for it to complete, then run :q two to exit and continue$(tput sgr0)\n"
vim -c :PlugInstall #Calls vim-plug to install plugins ###BROKEN

printf "$(tput setaf 1)You must change your shell to ZSH (Z-Shell) now$(tput sgr0)\n"
while true; do 
    read -p "$(tput setaf 1)Would you like me to change this for you? (Y/n)$(tput sgr0)" yn
    case $yn in
        [Yy]* ) chsh -s $(which zsh);
            printf "$(tput setaf 1)Your shell is now ZSH!\n"; break;;
        [Nn]* ) printf "$(tput setaf 1)Ok, I am not setting zsh as your shell$(tput sgr0)\n"; break;;
        * ) printf "$(tput setaf 1)Please enter Y or N$(tput sgr0)\n";;
    esac
done

printf "$(tput setaf 1)Please restart your shell, once you reopen, please enter option \"0\"$(tput sgr0)\n"
printf "$(tput setaf 1)If you do not, it will overwrite your your .zshrc file with a default one$(tput sgr0)\n"
exit
