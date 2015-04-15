# What this is for

Just a place for me to share my current "dot files" with everyone and a easy way to make sure i stay in sync accrost multiple devices.
Feel free to take any or all of them, tweek them to your desire and distribute them! 
If you do something new with one of them, and you think someone else might benefit from it, please push it back to me! I will happily give you credit for what you commited back.

**Please** 
* Feel free to clone this to your local machine!

## Other Downloads you will need

If you want to use ZSH you will need to download [Oh-My-ZSH][zsh] for pieces of my config

If you are useing vim, please download [vim-plug][plug] by following the instructions on his github.

## Installation

You will need git installed, and if you want to use these you will also need vim, zsh, curl(and/or wget) as well as if your useing the i3 or awesome files, youll need those.
So, if your on ubuntu, you could copy this (does not include Window Manager)
* `sudo apt-get install git vim zsh curl wget`

Now you will need to clone my repository, I suggest that you put it inside of a folder under your home directory, i personally use a folder called "git" but this is up to you, and optional.
If you want to make a folder first you can do this:
* `mkdir -p ~/git && cd ~/git`

If you created the folder make sure you cd into it, then run the next command
* `git clone https://github.com/hackinginformation/dotfiles.git`

**ZSH**
If you have zsh installed, and you have already downloaded [Oh-My-Zsh][zsh] from above. You will need to run this to use my config:
* `ln -sf ~/git/dotfiles/zsh/zshrc.symlink ~/.zshrc` 
* If you didnt use the ~/git folder, or you used a different one then you need to update this line, you will also need to open the ~/.zshrc and edit line number 32 to your correct path.
Once that is complete, you will need to run:
* `source ~/.zshrc` and your complete! Your zsh will change and you'll notice a few new features.

**VIM**
If you have vim installed, and you have already downloaded [vim-plug][plug] from above. You will need to run this to use my config:
* `ln -sf ~/git/dotfiles/vim/vimrc.symlink ~/.vimrc` If you didnt use the ~/git folder, or you used a different one then you need to update this line
Once that is complete open your vimrc in vim:
* `vim ~/.vimrc`
* **VIM WILL THROW AN ERROR** this is normal the first time. Just hit enter.
* Once vim is up type `:PlugInstall`, this will cause a new pane to open in your vim window on the left, depending on your connection speed it will download a bunch of plugins from the internet and put them where they belong. 
* One of the last plugins is called "molokai". At the moment there is a bug where molokai installs useing the "light" theme by default. It will cause your screen to go very bright and white. But we can fix this!
* Type `:q` then `:wq` this will exit the new pane, then exit vim.
* We need to symlink the molokai plugin into the colors directory which we need to create.

**FIXING MOLOKAI**
* `mkdir -p ~/.vim/colors/`
* `ln -sf ~/.vim/plugged/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim`

Now if we open any file in vim again, for example `vim ~/.vimrc` you will see that molokai works perfectly :D
I have a plan to fork molokai and replace my call to my own molokai that dose not include the light version soon.

## Contact the author

Personal      Twitter [@urlordandmaster][tweet1]

Professional  Twitter [@hackinginfo][tweet2]

Blog    [masammich's][blog]


[plug]:         https://github.com/junegunn/vim-plug
[zsh]:          https://github.com/robbyrussell/oh-my-zsh
[tweet1]:       https://twitter.com/urlordandmaster
[tweet2]:       https://twitter.com/MaSammichs
[blog]:         http://masammich.technoanomaly.com/
