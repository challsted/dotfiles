"""""""""""""""
" Stuff to make vim easier, all commented so remove what you dont like
"""""""""""""""
colorscheme koehler	" Sets the colorscheme to koehler
filetype indent on	" Activates indenting for files
filetype plugin on	" Activates plugins for filetypes
syntax on		    " Syntax highlighting
set t_Co=256
set backspace=2 	" Backspace in insert mode works like normal editor
set autoindent      " Auto indenting
set smartindent		" Smart indenting
set number          " Line numbers
set nobackup        " Get rid of anoying ~file
set nowb		    " Helps above
set noswapfile		" Helps above
set cursorline		" Show location of cursor useing a horizontal line
set wildmenu		" Shows auto completed menu's
set wildmode=list:longest " Make 'wildmenu' behave a little nicer
set ruler 		    " Shows current position
set ignorecase		" Ignores case when searching '/searchparam'
set smartcase		" Even with ignore case, still try to be smart about it
set hlsearch		" Highlights search results
set showmatch		" Shows matching bracket when hilighting with cursor
set background=dark	" For dark xterm's
set encoding=utf8	" Sets default encodeing to utf8, and en_US as default language
set expandtab		" Turns tabs into spaces
set shiftwidth=4	" 1 tab = 4 spaces
set tabstop=4		" Helps above
set smarttab		" Uses 'smart' tabs
set laststatus=2	" 'Always show the status line'
set noshowmode      " Prevents the 'mode' from showing (this is because aireline does this for us) 
set spell spelllang=en_us " Turns on vim spell checker
setlocal spell spelllang=en_us "Changes vim spell to only the local buffer



"""""""""""""""
" Below is remaped keys
""""""""""""""


"""""""""""""""
" Below is a bunch of plugin crap
" The syntax is 'Plug' single quote name of author/vim-plugin single quote. So
" for example 'blint/vim-airline' is https://github.com/bling/vim-airline
"""""""""""""""
call plug#begin('~/.vim/plugged') " Starts useing vim-plug https://github.com/junegunn/vim-plug
Plug 'bling/vim-airline' " This is a bar that shows current mode as well as ton of useful info
Plug 'scrooloose/nerdtree' " Tree file navigator


call plug#end()     " Stops using vim-plug

let g:airline_theme='luna' " This sets the teeme of airline
    " The below sets NERDTree to Ctrl+N
map <C-n> :NERDTreeToggle<CR>

""""""""""""""
" Fixes Powerline Unicode Issues
""""""""""""""
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1


