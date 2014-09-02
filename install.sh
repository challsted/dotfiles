#!/usr/bin/bash
#
# An attempt at makeing an install for the files I upload
# YOU WILL NEED TO CHMOD THIS FILE (chmod +x install.sh)

cd ~

printf "You need to install git, zsh, and vim, if you havnt already"
printf "This will only work on ubuntu based OS's currently"
printf "Select \"n\" if you are not useing an ubuntu based OS"
while true; do # This simply prompts the user if they want the script to install git, zsh and vim
    read -e -p "Would you like me to install them for you? (Y/n)" -i "Y" yn
    case $yn in
        [Yy]* ) sudo apt-get -y install git zsh vim;
            printf "Ok I am installing git, zsh and vim for you"; break;; 
        [Nn]* ) printf "Ok, skipping the installs"; break;;
        * ) printf "Please answer yes or no, enter will auto accept yes";; 
    esac
done

if [[ ! -d ~/git/ ]] || [[ ! -d ~/.git/ ]]; then
    while true; do
        read -e -p "Do you want a reguler folder for git or a hidden folder? (R/h)" -i "R" rh
        case $rh in
            [Rr]* ) if [[ ! -d ~/git/ ]]; then 
                GIT_DIRECTORY=mkdir ~/git/ && cd ~/$GIT_DIRECTORY/
            fi; 
                printf "Ok, I have created $GIT_DIRECTORY for you"; break;;
            [Hh]* ) if [[ ! -d ~/.git/ ]]; then
                GIT_DIRECTORY=mkdir ~/.git/ && cd ~/$GIT_DIRECTORY/
            fi;
                printf "Ok, I have created $GIT_DIRECTORY for you"; break;;
            * ) printf "You must answer with \"R\", \"H\", or the full word(s) enter will auto accept regular";;
        esac
    done
fi

printf "Im about to install \"Oh-My-Zsh\", if you want to look into this go to their github"
printf "https://github.com/robbyrussell/oh-my-zsh"
printf "Installing Oh-My-Zsh now!"
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

printf "Cloneing my dotfiles repo now"
git clone https://github.com/hackinginformation/mydotfiles.git

printf "You must change your shell to ZSH (Z-Shell) now"
while true; do 
    read -e -p "Would you like me to change this for you? (Y/n)" -i "Y" yn
    case $yn in
        [Yy]* ) printf "Your shell is now ZSH!"; chsh -s $(which zsh); break;;
        [Nn]* ) printf "Ok, I am not setting zsh as your shell"; break;;
        * ) printf "Please enter Y or N, enter will auto accept Yes";;
    esac
done

printf "Creating symlinks for you"
cd ~
ln -sfv ~/$GIT_DIRECTORY/mymotfiles/zsh/.zshrc ~/.zshrc
ln -sfv ~/$GIT_DIRECTORY/mydotfiles/vim/.vimrc ~/.vimrc

source ~.zshrc && source ~/.vimrc

printf "Please restart your shell"
exit
