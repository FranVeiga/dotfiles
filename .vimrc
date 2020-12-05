set nocompatible
filetype off

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

call plug#begin('~/.vim/plugged')

Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'davidhalter/jedi-vim'
Plug 'ap/vim-css-color'

call plug#end()

set background=dark

let g:tokyonight_enable_italic = 1
let g:tokyonight_style = 'night'
let g:tokyonight_transparent_background = 1

colorscheme tokyonight



nnoremap <silent> <C-B> :NERDTreeToggle %<CR>

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
map  <C-q> :q!<CR>
imap  <C-q> :q!<CR>
map  <C-s> :w<CR>
imap  <C-s> :w<CR>
imap kk <ESC>

