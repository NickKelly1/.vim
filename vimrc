" ***********************************************************
" https://linuxconfig.org/manage-vim-plugins-with-pathogen
" ***********************************************************
set nocompatible
filetype plugin indent on
syntax on

execute pathogen#infect()



" ***********************************************************
" Airlines
" https://github.com/vim-airline/vim-airline
" ***********************************************************
set laststatus=2
let g:airline#extensions#tabline#enabled = 2
" arrow font stuff for vim airlines
let g:airline_powerline_fonts  = 1
let g:airline_theme = 'wombat'
" let g:airline_theme = 'kolor'
" let g:airline_theme='molokai'
" colorscheme molokai
" let g:airline_theme = 'powerlineish'


" ***********************************************************
" Tmux colouring issue
" ***********************************************************
" https://github.com/tmux/tmux/issues/699
" set background=dark
set t_Co=256

" ***********************************************************
" indentation:
" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim
" ***********************************************************

" " show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
set smartindent

" ***********************************************************
" Custom
" ***********************************************************

" Map f9 to makefile command:
:map <f9> :make
" Examining compilation errors:

" Open a mini-window with list of errors
" Hit enter on an error to jump to line
:copen
" closes the mini-window
:cclose
" toggles the mini-window (if errors exist)
:cw

colorscheme molokai
