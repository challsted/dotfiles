"If viewing this file and it appears like with several '+-- X lines: ...' you
"can expand them easily by hovering over them and typeing ', ' <leader><space>
"or just 'za'

"Colors {{{
set t_Co=256        "Terminal Colors set to 256
syntax on           "Creates better highlighting
colorscheme molokai "Uses the very nice looking 'molokai' thee
highlight Normal ctermfg=grey ctermbg=black
" }}}
"Specific to a filetype {{{
filetype indent on	" Activates indenting for files
filetype plugin on	" Activates plugins for file types
" }}}
"Spaceing, Tab Key, and Indention {{{
set autoindent      " Auto indenting
set smartindent		" Smarter indenting
set expandtab		" 1 tab = 4 spaces
set shiftwidth=4	" 1 tab = 4 spaces
set tabstop=4		" Backspace over a full tab if tab is expanded to tabstop or expandtab
set softtabstop=4   " Backspace over a full tab if tab is expanded to tabstop or expandtab
set smarttab		" Uses 'smart' tabs
set showtabline=2   " Always display the tabline, even if there is only 1 tab
set backspace=2 	" Backspace in insert mode works like normal editor
" }}}
"Writeing and backing up files {{{
set nobackup        " Get rid of annoying ~file
set nowb		    " Helps above
set noswapfile		" Helps above
" }}}
"Menu and Search {{{
set wildmenu		" Shows auto completed menu's
set wildmode=list:longest " Make 'wildmenu' behave a little nicer
set hlsearch		" Highlights search results
set incsearch       " Search characters as you type them
" }}}
"Layout of the actual editor {{{
set number          " Line numbers
set cursorline		" Show location of cursor using a horizontal line
set ruler 		    " Shows current position
set noshowmode      " Prevents the 'mode' from showing (this is because airline does this for us) 
set laststatus=2	" Always show the status line
set lazyredraw      " Redraw the screen less, leading to faster response
" }}}
"Search Optomization {{{
set ignorecase		" Ignores case when searching '/searchparam'
set smartcase		" Even with ignore case, still try to be smart about it
set showmatch		" Shows matching bracket when highlighting with cursor
" }}}
"Core Settings {{{
set pastetoggle=<f5> " Allows for the f5 key to be used for paste -- i dont remember why i have this here at the moment...
set encoding=utf8	" Sets default encoding to utf8, and en_US as default language
" }}}
"Folding {{{
set foldenable      " Enables Folding
set foldlevelstart=10 " Opens the first 10 folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent " Tells vim to fold based on indent level
set modeline      " Turn ModeLine On
set modelines=1     " Checks last line for file specific commands via modeline
" }}}
" Key Remaps {{{
let mapleader=","       " leader is comma
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Space open/closes folds
nnoremap <leader><space> za
" Highlights last inserted text from insert mode in visual mode
nnoremap gV `[v`]
" }}}
" Plugin Stuff {{{ 
" The syntax is 'Plug' single quote name of author/vim-plugin single quote. So
" for example 'bling/vim-airline' is https://github.com/bling/vim-airline
" VimPlug {{{
call plug#begin('~/.vim/plugged') " Starts using vim-plug https://github.com/junegunn/vim-plug
Plug 'bling/vim-airline' " This is a bar that shows current mode as well as ton of useful info
Plug 'scrooloose/nerdtree' " Tree file navigator
Plug 'tomasr/molokai' " Color scheme 'Molokai' for vim, since solarized is so touchy....
Plug 'godlygeek/csapprox' " 
Plug 'scrooloose/syntastic' " Automatic Syntax Checking
call plug#end()     " Stops using vim-plug
" }}}
let g:airline_theme='luna' " This sets the theme of airline
    " The below sets NERDTree to Ctrl+N
map <C-n> :NERDTreeToggle<CR>
" }}}
" Fixes Powerline Unicode Issues {{{
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

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
" }}}
" Molokai Specific Settings {{{
let g:molokai_original = 1 " Origional Monokai background
let g:rehash256 = 1 " 'more like the gui 256 scheme'
" }}}
" Syntastic Plugin Checkers {{{
" C++ {{{
let g:syntastic_cpp_compiler = "g++" " Use g++ as compiler
let g:syntastic_cpp_check_header = 1 " Allows syntastic to check header files
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
" }}}
let g:syntastic_check_on_open = 1 " Check on file open
let g:syntastic_check_on_wq = 0 " Dont check on :wq
let g:syntastic_enable_signs = 1 " Enable symbols listed below 
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
" }}}
" Do not edit below line unless you know what your doing
" vim: set foldmethod=marker foldlevel=0 :
