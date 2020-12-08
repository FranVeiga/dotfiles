set nocompatible
filetype plugin on

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
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
let g:tokyonight_enable_italic = 1
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1
colorscheme tokyonight

" Snippets
inoremap ,h1 <h1></h1><ESC>T>i
inoremap ,p <p></p><ESC>T>i


map  <C-s> :w<CR>
imap  <C-s> :w<CR>
imap kk <ESC>

nmap <Space>w <C-w>
