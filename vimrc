call pathogen#infect()
filetype plugin indent on

" plugins for future reference
" lusty- http://www.vim.org/scripts/script.php?script_id=1890
" scratch- https://github.com/duff/vim-scratch

runtime macros/matchit.vim

if has("autocmd")
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
  autocmd Filetype php call SetPHPOptions()
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

function SetPHPOptions()
"  set foldmethod=syntax
"  let g:php_folding=1
endfunction

syntax enable

set nocompatible
set modelines=0
set rnu
set ruler
"set encoding=utf-8
set autoindent
set smartindent
set smarttab
set hidden
set wildmode=list:longest,full
set backupdir=~/.vim/tmp,~/tmp,.
set directory=~/.vim/tmp,~/tmp,/tmp,/var/tmp,.
set undodir=~/.vim/tmp,~/tmp,.
set undofile
set scrolloff=3
set showmode
set showcmd
set ttyfast
set laststatus=2
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set showmatch
set list
set listchars=tab:▸\ ,trail:⋅,nbsp:⋅
set backspace=indent,eol,start
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
set visualbell

" this searches up the directory tree for tags
set tags=./tags;

"set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=89

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" current directory is always matching the
" content of the active window
"set autochdir

" faster viewport scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" not a bad idea
"nnoremap <tab> %
"vnoremap <tab> %

function! g:ToggleNuMode()
  if (&rnu == 0 && &nu == 0)
    set rnu
  elseif (&rnu == 1)
    set nu
  else
    set nu!
  endif
endfunc

let g:Tlist_Use_SingleClick = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Auto_Highlight_Tag = 0
let g:Tlist_Highlight_Tag_On_BufEnter = 0
let g:Tlist_Show_One_File = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_GainFocus_On_ToggleOpen = 0
let g:Tlist_Compact_Format = 1
let tlist_php_settings = 'php;f:functions;c:classes;v:variables'

let mapleader = ","
nnoremap <F1> :call g:ToggleNuMode()<CR>
nnoremap <F2> :set paste!<CR>
" default is <F5>
call togglebg#map("<F5>")
nnoremap <leader><space> :nohls<cr><c-l>
nnoremap ; :
nnoremap \ ;
nnoremap <leader>ws :%s/\s\+$//<cr>:nohlsearch<cr>
nnoremap <leader>c :close<CR>
nnoremap <leader>g :TlistToggle<CR>
nnoremap <up> gk
nnoremap <down> gj
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>v <C-w>v<C-w>l

" auto-save on losing focus
"au FocusLost * :wa

set statusline=%<%f\ %h%m%y%r
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%#error#%{&paste?'[paste]':''}%*
set statusline+=%=%-14.(%l,%c%V%)\ %P
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

if has('gui_running')
  set background=dark
  let g:solarized_contrast = "high"
  colorscheme solarized
else
  set background=dark
  colorscheme solarized
endif

" Kill trailing whitespace on save
"autocmd BufWritePre * :%s/\s\+$//e
