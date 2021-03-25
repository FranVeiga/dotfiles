set nocompatible
filetype plugin indent on
syntax on


" Set leader key
let mapleader = " "


call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()




set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
" set nowrap
set linebreak
set ignorecase
set smartcase
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
set undolevels=5000
set incsearch
set autochdir
set mouse=a
set scrolloff=1
set wildmenu
set showcmd

set background=dark

" netrw options
let g:netrw_banner=0
let g:netrw_liststyle=3
nmap <SPACE>. :edit .<CR>

" Colorscheme configurations
set background=dark
let g:tokyonight_enable_italic = 1
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1
colorscheme tokyonight
nnoremap <C-b> :let g:tokyonight_transparent_background = 0<CR>:colorscheme tokyonight<CR>

map  <C-s> :w<CR>
imap  <C-s> :w<CR>
imap kk <ESC>
nnoremap j gj
nnoremap k gk

" use ,t on insert mode to insert a tag (doesn't work on normal mode)
function! InsertTag(tag)
    execute "normal i<" . a:tag . "></" . a:tag . ">\<Esc>bbl"
    execute "startinsert"
endfunction
imap ,t <ESC>:call InsertTag(input(""))<cr>


"" leader keybinds

noremap <leader>fs :w<cr>
noremap <leader>fS :wq<cr>
noremap <leader>fq :q!<cr>

" Vim
noremap <leader>qr :source $MYVIMRC<cr>
noremap <leader>qq :q<cr>
noremap <leader>qQ :q!<cr>


" comment keybind
noremap <leader>ic <ESC>0i#<SPACE><ESC>

" window movement
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
noremap <leader>wh <C-w>h
" closing windows
noremap <leader>wc <C-W>c
" opening splits
noremap <leader>wv :vs<CR>
noremap <leader>ws :sp<CR>
" resizing splits
noremap <leader>w+ :res +2<CR>
noremap <leader>w- :res -2<CR>
noremap <leader>w< :vert res -10<CR>
noremap <leader>w> :vert res +10<CR>


" tabs
noremap <leader><TAB>n :tabnew<cr>
noremap <leader><TAB>c :tabclose<cr>
