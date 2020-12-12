set nocompatible
filetype plugin on


call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call plug#end()



syntax on

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
set incsearch
set autochdir
set mouse=a
set scrolloff=1
set wildmenu

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

" Snippets
inoremap ,h1 <h1></h1><ESC>T>i
inoremap ,p <p></p><ESC>T>i


map  <C-s> :w<CR>
imap  <C-s> :w<CR>
imap kk <ESC>



" comment keybind
map <C-]> <ESC>0i#<SPACE><ESC>


" Set leader key
let mapleader = " "

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
noremap <leader><TAB>n :tabnew
noremap <leader><TAB>c :tabclose




" PYTHON OPTIONS

autocmd FileType python set breakindent
autocmd FileType python nmap ,! i#! /usr/bin/python3<CR><CR><ESC>


" BASH OPTIONS
autocmd FileType sh nmap ,! i#! /bin/bash<CR><CR><ESC>



