call pathogen#infect()

filetype plugin indent on

runtime macros/matchit.vim

if has("autocmd")
    au FileType taglist setl nornu
    au BufRead,BufNewFile *.module,*.install,*.test,*.engine set filetype=php
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    au BufWritePre * :KeepView :%s/\s\+$//e
    au BufEnter :Rooter
    au FileType coffee,ruby,html,css,php,sh,javascript setl sw=2 sts=2
    au FileType html SyntasticDisable
    au FocusLost * :wa
endif

syntax enable

set softtabstop=4
set shiftwidth=4
set expandtab
set nocompatible
set modelines=0
set rnu
set ruler
"set encoding=utf-8
set hidden
set wildmode=list:longest,full
set backupdir=~/.vim/tmp,~/tmp,.
set directory=~/.vim/tmp,~/tmp,/tmp,/var/tmp,.
set undodir=~/.vim/tmp,~/tmp,.
set undofile
set scrolloff=3
set laststatus=2
set ignorecase
set smartcase
set gdefault
set list
set listchars=tab:▸\ ,trail:⋅,nbsp:⋅
set backspace=indent,eol,start
set hlsearch
set incsearch
set visualbell
set tags=./tags; " Semicolon triggers search up the directory tree.
set cursorline

" Make viewport scrolling faster
no <C-e> 4<C-e>
no <C-y> 4<C-y>

cabbr <expr> %% expand('%:p:h')

" I hate pressing shift.
no ; :
no ' ;
no \ $
map <tab> %

no <C-j> <C-w>j
no <C-k> <C-w>k
no <C-h> <C-w>h
no <C-l> <C-w>l

let mapleader = ","
map <leader>c :close<CR>
map <leader>g :TlistToggle<CR>
map <leader><space> :nohls<cr><c-l>
map <leader>s <C-w>s<C-w>j
map <leader>v <C-w>v<C-w>l
map <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

map <F1> :call g:ToggleNuMode()<CR>

function! g:ToggleNuMode()
    if (&rnu == 0 && &nu == 0)
        set rnu
    elseif (&rnu == 1)
        set nu
    else
        set nu!
    endif
endfunc

set pastetoggle=<F2>
map <F2> :set paste!<CR>
map <F3> :set list!<CR>
call togglebg#map("<F5>") " reverse color contrast

no <up> <nop>
no <down> <nop>
no <left> <nop>
no <right> <nop>

let g:Tlist_Use_SingleClick = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Auto_Highlight_Tag = 0
let g:Tlist_Highlight_Tag_On_BufEnter = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_GainFocus_On_ToggleOpen = 0
let g:Tlist_Compact_Format = 1
let g:Tlist_Use_Right_Window = 1
let tlist_php_settings = 'php;c:classes;f:functions;i:interfaces'

let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

set statusline=%<%f\ %h%m%y%r
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%#error#%{&paste?'[paste]':''}%*
set statusline+=%=%-14.(%l,%c%V%)\ %P

if has('gui_running')
    set background=dark
    let g:solarized_contrast = "high"
    colorscheme solarized
else
    set background=dark
    colorscheme solarized
endif
