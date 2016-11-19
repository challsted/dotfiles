# What this is for

Just a place for me to share my current "dot files" with everyone and a easy way to make sure I stay in sync across multiple devices.  
Feel free to take any or all of them, tweak them to your desire and distribute them!  

### Optional Extra Repos
By Request, I have created some "[templates_dotfiles][template_dotfiles]". If you could rather use them.  
These files have no plugins, and a lot less "personalized" stuff in them, they are designed to be used a spring board to jump start you into a customized set of files.  

I have also created an "[Extended Dotfiles][extended_dotfiles]" repo for people who want dotfiles for window managers or other utilities. 

## Pre-Installation

Obviously, if you want to use any of the tools below, you will need to have it installed, any of its dependencies, as well as any extras I list and there dependencies.  
Before you can use any of the stuff here, you will need to have the following installed:  
* `git`

Now you will need to clone my repository, I suggest that you put it inside of a folder under your home directory,  
I personally use a folder called "git" but this is up to you, and optional.  
If you want to make a folder first you can do this:
* `mkdir -p ~/git && cd ~/git`

If you created the folder make sure you cd into it, then run the next command
* `git clone https://github.com/challsted/dotfiles.git`

## ZSH Installation
[**ZSH Wiki**][ZSH_WIKI]

**Packages:**
* `zsh` (Official Repositories)
* [Oh-My-Zsh][zsh]

**You will need to run this to use my config:**
* `ln -sf ~/git/dotfiles/zsh/zshrc.symlink ~/.zshrc`
Once that is complete, you will need to run:
* `source ~/.zshrc`

**Notes:**
* If you do not use `~/$USER/git/` to clone, then you will need to open ~/.zshrc and tweak the line that starts with `CUSTZSH` to the path to this repo's zsh folder

## Vim Installation
[**VIM Wiki**][VIM_WIKI]

**Packages:**
* `vim` (Official Repositories)
* [vim-plug][plug]

**You will need to run this to use my config:**
* `ln -sf ~/git/dotfiles/vim/vimrc.symlink ~/.vimrc`
* `mkdir -p ~/.vim/colors/`
* `ln -sf ~/.vim/plugged/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim`

**Once that is complete open your vimrc in vim:**
* `vim ~/.vimrc`
* Once vim is up type `:PlugInstall`, this will cause a new pane to open in your vim window on the left, depending on your connection speed it will download a bunch of plugins from the internet and put them where they belong.
* Type `:q` then `:q` this will exit the new pane, then exit vim.

**Notes:**
* If you do not use `~/$USER/git/` to clone, then you will need to tweak the symlinks above

## NeoVim Installation
[**NVim Wiki**][NVIM_WIKI]

**Packages**
* `nvim` ([Installing Neovim][neovim_wiki_installing-neovim])
* [vim-plug][plug]


**You will need to run this to use my config:**
* `mkdir -p ~/.config/nvim`
* `cd ~/.config/nvim && mkdir colors undo swap spell backup && cd -`
* `ln -sf ~/git/dotfiles/nvim/nvimrc.symlink ~/.config/nvim/init.vim`
* `ln -sf ~/.config/nvim/plugged/molokai/colors/molokai.vim ~/.config/nvim/colors/molokai.vim`

**Notes:**
* If you do not use `~/$USER/git/` to clone, then you will need to tweak the symlinks above
* Neovim will automatically install vim-plug and all plugins if you haven't done so already

## TMux Installation
[**TMUX Wiki**][TMUX_WIKI]

**Packages:**
* `tmux`
**Optional Package**
* [TMux Plugin Manager][tpm]

**You will need to run this to use my config:**
* If your using 2.0 or older then you'll need to use the "PRE" file
  * `ln -sf ~/git/dotfiles/tmux/tmux.conf.symlink.PRE ~/.tmux.conf`
* If your using the latest and greatest (2.1+)
  * `ln -sf ~/git/dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf`

**Optional Package Install:**
* Download [TPM][tpm] from its site, as of right now the command do that is
  * git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
* Open a new tmux session (if your not already in one)
  * (for example) `tmux new -s random`
* Once inside a tmux session, press `$PREFIX + I`
  * If your using my tmux.conf then this will be `Ctrl+A` (Release the keys) `Shift i`

**Notes:**
* If you do not use `~/$USER/git/` to clone, then you will need to tweak the symlinks above
* If you chose not to use TPM, you will probably want to remove the bottom section of the file about TPM, and update the bar to not have the extra info in the bottom right


## Contact the author

Professional  Twitter [@hackinginfo][tweet]  

[plug]:         https://github.com/junegunn/vim-plug
[zsh]:          https://github.com/robbyrussell/oh-my-zsh
[tpm]:          https://github.com/tmux-plugins/tpm
[tweet]:        https://twitter.com/MaSammchs
[TMUX_WIKI]:    ../../wiki/TMux
[VIM_WIKI]:     ../../wiki/VIM
[ZSH_WIKI]:     ../../wiki/ZSH
[NVIM_WIKI]:    ../../wiki/NVim
[template_dotfiles]: https://github.com/challsted/template_dotfiles
[extended_dotfiles]: https://github.com/challsted/extended_dotfiles
[neovim_wiki_installing-neovim]: https://github.com/neovim/neovim/wiki/Installing-Neovim
