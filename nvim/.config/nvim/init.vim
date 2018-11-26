let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

call plug#begin()
Plug 'flazz/vim-colorschemes'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim'
call plug#end()

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set clipboard+=unnamedplus

set number
set relativenumber

colorscheme apprentice

let g:deoplete#enable_at_startup = 1
