:colors koehler
filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
set background=dark
filetype plugin indent on
set modeline
set foldmethod=indent
set foldlevel=99


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>n :NERDTreeToggle<CR>
