" CURRENT_FILE_NAME_PATH: echo expands("%");
" HELPGREP: helpgrep <search term>
"   - :cn
"   - :cb
"   - :cl
"
" ***********************************************************
" https://linuxconfig.org/manage-vim-plugins-with-pathogen
" ***********************************************************
set nocompatible
filetype plugin on
filetype plugin indent on
syntax on
set showcmd

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

" ********************************************************
" https://www.youtube.com/watch?v=XA2WjJbmmoM
" *******************************************************
" NOTE: use ":set <variable>?" to the value of a variable

" *********************
" FUZZY SEARCH:
" *********************
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
" - += -> appended to the current path
" - ** -> when you look through a file, search through subdirectory, and every
" subdirectory of every subdirectory  
" - Can be used with :find (& with * wildcard)
set path+=**

" Display all matching files when we tab complete
set wildmenu

" ignore node_modules:
" set wildignore+=**/node_modules/**

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" CONSIDERATIONS:
" - :b lets you autocomplete any open buffer

" *********************
" TAG JUMPING:
" *********************
"
" Create the 'tags' file (may need to install "ctags" firsT)
" "!" is for running as a shell command
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" CONSIDERATIONS:
" - This doesn't help if you want a visual list of tags


" *********************
" SNIPPETS:
" *********************
nnoremap ,singleton :-1read $HOME/.vim/snippets/ts/Singleton.ts<CR>


