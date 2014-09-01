## This clanage is for anyone who wants to try out my .zshrc and/or .vimrc WITH OUT messing up there current config files
## With little to no risk of breaking there current setup. 

## Also, this is more specifically a instruction set for some friends of mine who are learning linux and i want to show them some stuff



So, you need to have the following packages installed

git, zsh, vim
If you are on ubuntu, or an ubuntu diritive

sudo apt-get update && sudo apt-get install git-core zsh vim -y

Once that is all installed you will need to run the below (this installs "Oh-My-Zsh"

wget --no-check-certificate http://install.ohmyz.sh -O - | sh 

Once that is installed you can do the following. 

Make a directory called "git" (or ".git" if you want it hidden), and clone mydotfiles repo into it. 

mkdir git && cd git

git clone https://github.com/hackinginformation/mydotfiles.git

Now you will want to change your shell to zsh

chsh -s /bin/zsh

You should now close and reopen your terminal window(s)
Upon opening a window you will see that you are greeted with the "Oh-My-Zsh" options, config how you want but dont worry about copying any files to replace what you have. That will be done below. 

Now you will want to remove the following files: .zshrc and .vimrc

rm -rf .zshrc .vimrc

Then you will want to symlink my files to here, please note, that if you used anything besides ~/<USER>/git/ you will need to change the below

ln -s git/mydotfiles/zsh/.zshrc
ln -s git/mydotfiles/vim/.vimrc

You can now either close and reopen your shell again, or you can "source" your new rc files

To source them: 

source .zshrc
source .vimrc

You should knotise your shell change YET AGAIN. This is perfectly ok as this is what it should be doing. 

Now, open some files in vim, (this file if you want!). and check out the awesome!!!
