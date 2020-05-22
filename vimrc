" [See](https://www.youtube.com/watch?v=n9k9scbTuvQ)
syntax on

set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80

filetype plugin on

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" [Force vim to use python3](https://robertbasic.com/blog/force-python-version-in-vim/)
" to check verison, run
" :python import sys; print(sys.version)
if has('python3')
elseif has('python')
endif

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
" :Git add
" :Git commi
" :Git diff
" :Git blame
" :Git log
" force bufffer: --paginate -p
Plug 'tpope/vim-fugitive'
" [GitHub typescript-vim](https://github.com/leafgarland/typescript-vim)
Plug 'leafgarland/typescript-vim'
" :Man printf
" :Man pri<Tab> # auto complete
" :gx # open a link under cursor in a browser
" :gf # jump to a file under cursor
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
" [GitHub Ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
" [GitHub CoC](https://github.com/neoclide/coc.nvim)
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mbbill/undotree'
" [GitHub NERDTree](https://github.com/preservim/nerdtree)
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
" [GitHub Vim Airline](https://github.com/vim-airline/vim-airline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" [GitHub Nerdcommenter](https://github.com/preservim/nerdcommenter)
Plug 'preservim/nerdcommenter'
" [GitHub Jedi-Vim](https://github.com/davidhalter/jedi-vim)
Plug 'davidhalter/jedi-vim'

call plug#end()


set t_Co=256
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark

" allow rg to detect root
" & use .git as root
" & use .gitignore for faster searching
if executable('rg')
  let g:rg_device_root='true'
endif

" ignore with ctrlp
let g:ctrlp_user_command = ['./git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" leader key = spacebar
let mapleader = " "
let g:netrw_browse_split=2
" remove help information on file tree
let g_netrw_banner=0
" window size should be ~25%
let g:netrw_winsize=25

" ag is fast enough that CtrLP doesn't need to cache
let g:ctrlp_use_caching=0

" remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
" wincmd v splits 2 windows
" :Ex opens netrw
" resizes to 30
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" ps: Project search
" opens Ripgrep instantly
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" YCM
" The best part
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>gs :YcmCompleter GetType<CR>
" nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gdr :YcmCompleter GoToReferences<CR>
" nnoremap <leader>gdi :YcmCompleter GoToImplementation<CR>
" nnoremap <leader>gdt :YcmCompleter GoToType<CR>
" nnoremap <leader>gdt :YcmCompleter GoToType<CR>
" nnoremap <leader>gdd :YcmCompleter GoTo<CR>
" nnoremap <leader>gp :YcmCompleter GetType<CR>
" nnoremap <leader>gf :YcmCompleter FixIt<CR>

" [make QuickFix show if there are any errors](https://github.com/leafgarland/typescript-vim)
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost [^l]* nested lwindow


nnoremap <silent> <leader>d :NERDTreeToggle<CR>
" map <C-d> :hihi<CR>

" Starting NERDTree with vim if no files were specified
autocmd StdinReadPre * let_s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" start NERDTree with vim when starting directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if only window left is NERDTree
autocmd * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())) | q | endif

" [Airline Config](https://github.com/vim-airline/vim-airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme = "wombat"


" [NerdCommenter Config](https://github.com/preservim/nerdcommenter)
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for perttified multi line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom format or override the default
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*/' } }
" Allow commenting and inverting empty lines (useful whn commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all lines whether commented or not
let g:NERDToggleCheckAllLines = 1

" <leader>cc            => comment
" <leader>cn            => comment with forced nesting
" <leader>c<space>      => toggle comment
" <leader>cm            => comment given lines using one set of multipart delimiters
" <leader>ci            => comment state of selected line(s) individually
" <leader>cs            => comment out selected lines with a pretty block formatted layout
" <leader>cy            => same as cc except that commented line(s) are yanked first
" <leader>cu            => uncomment the selected lines


" Python
if (&filetype=='py')
  " [Jedi-Vim config](https://github.com/davidhalter/jedi-vim)
  let g:jedi#goto_command = "<leader>gd"
endif

" [Copying to clipboard](https://github.com/leafgarland/typescript-vim)
vmap <C-c> "+y

" make copy-pasting ident lines correctly
" [GitHub plugin](https://github.com/ConradIrwin/vim-bracketed-paste)
" set paste!
" Setting this has side effects so I'm keeping turned off
" Use ":help paste" for more info

