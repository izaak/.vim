call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype off "necessary for next line to work
syntax on
filetype plugin indent on

runtime macros/matchit.vim

set number
set ruler

" more effective buffer management
set hidden

" swap ` with '
"nnoremap ' `
"nnoremap ` '

"let mapleader = ","

" more intuitive command completion
set wildmode=list:longest,full

" location for vim swap/backup files
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" current directory is always matching the
" content of the active window
set autochdir

" faster viewport scrolling
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"set encoding=utf-8
"set autoindent
"set smartindent
"set smarttab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
set pastetoggle=<F2>

set background=dark
"colorscheme solarized

" this searches up the directory tree for tags
set tags=./tags;

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
