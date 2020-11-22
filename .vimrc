" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" Automatic relaoding of unchanged buffers
set autoread
" check for changes after 4s of inactivity in normal mode
au CursorHold * checktime
" Be iMproved
set nocompatible	
" Enhance command-line completion
set wildmenu
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamedplus
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Highlight current line
set cursorline
" Enable line numbers
set number
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" show the partial command while it's being typed
set showcmd
" start scrolling three lines before horizontal window border
set scrolloff=3
" Backspace on MacOS is annoying -> Fix!
set backspace=indent,eol,start
set nowrap  " don't automatically wrap on load

" shared x11-clipboard for standard copy-paste keybindings
vmap <C-c> :'<,'>w !xclip -selection clipboard -in<CR>
nmap <C-v> :call system('xclip -selection clipboard -out')<CR>

" Useful settings
set history=700
set undolevels=700

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'zah/nim.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'flazz/vim-colorschemes'
Bundle 'Lokaltog/vim-powerline'
Bundle 'chase/vim-ansible-yaml'
call vundle#end()            " required
call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
call plug#end()
" let g:deoplete#enable_at_startup = 1
call deoplete#enable()
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 3
let g:ansible_options = {'ignore_blank_lines': 0}
set nobackup
set nowritebackup
set noswapfile
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" enable all Python syntax highlighting features
let python_highlight_all = 1
au FileType gitcommit set tw=72
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" Pathogen load
filetype off
filetype plugin indent on
syntax on
" wrap on for .txt files
au BufRead,BufNewFile *.txt set wrap linebreak nolist
