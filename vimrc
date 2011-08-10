call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype off "necessary for next line to work
syntax on
filetype plugin indent on

set number
set ruler

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"set encoding=utf-8
"set autoindent
"set smartindent
"set smarttab

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

set pastetoggle=<F2>

set background=dark
"colorscheme solarized

set tags=./tags;

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
