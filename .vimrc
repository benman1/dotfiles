" Automatic reloading of .vimrc
" autocmd! bufwritepost .vimrc source %
" " Automatic relaoding of unchanged buffers
" set autoread
" " check for changes after 4s of inactivity in normal mode
" au CursorHold * checktime
" " Be iMproved
set nocompatible      
" " Enhance command-line completion
set pastetoggle=<F2>
" paste toggle with f2
" set wildmenu
" " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamedplus
" " Allow cursor keys in insert mode
" set esckeys
" " Optimize for fast terminal connections
" set ttyfast
" " Add the g flag to search/replace by default
" set gdefault
" " Use UTF-8 without BOM
set encoding=utf-8 nobomb
" " Don’t add empty newlines at the end of files
" set binary
" set noeol
" " Highlight current line
set cursorline
" " Enable line numbers (absolute). For hybrid, also enable 'relativenumber'.
set number
" Keep these enabled by default, but disable for large files
autocmd BufRead,BufNewFile * if getfsize(expand("%:p")) > 1000000 | set nonumber nocursorline | endif
" " Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list
" " Ignore case of searches
set ignorecase
" Treat search with an uppercase letter as a case-sensitive request:
set smartcase
" " Highlight dynamically as pattern is typed
set incsearch
" " Highlight searches
set hlsearch
" Clear search highlights with Escape
nnoremap <silent> <Esc> :noh<CR><Esc>
" " Always show status line
set laststatus=2
" " Enable mouse in all modes
" set mouse=a
" " Disable error bells
" set noerrorbells
" " Don’t reset cursor to start of line when moving around.
" set nostartofline
" " Show the cursor position
" set ruler
" " Don’t show the intro message when starting Vim
" set shortmess=atI
" " Show the current mode
" set showmode
" " Show the filename in the window titlebar
" set title
" " Show the (partial) command as it’s being typed
set showcmd
" " Start scrolling three lines before the horizontal window border
" set scrolloff=3
" " Backspace on MacOS is annoying -> Fix!
set backspace=indent,eol,start
"
" set nowrap  " don't automatically wrap on load
"
" " Useful settings
set history=100
set undolevels=100
set statusline=%f\ [%l,%c]\ %p%%
" let
" g:clang_library_path='/usr/local/Cellar/cling/0.5_2/libexec/lib/libclang.dylib'
" let b:ale_linters = ['eslint']
" no backups to save I/O and disk space
set nobackup
set nowritebackup
set noswapfile
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
filetype plugin indent on    " required
" " Enable syntax highlighting
syntax on
" Disable syntax for large files
autocmd BufRead,BufNewFile * if getfsize(expand("%:p")) > 1000000 | syntax off | endif
" " enable all Python syntax highlighting features
let python_highlight_all = 1
" au FileType gitcommit set tw=72
au BufRead,BufNewFile *.txt set wrap linebreak nolist
" ---------- TypeScript / HTML syntax helpers ----------
" Ensure .ts/.tsx get a TypeScript filetype (if not already detected)
augroup user_typescript
  autocmd!
  autocmd BufRead,BufNewFile *.ts,*.tsx,*.js setlocal filetype=typescript
  autocmd FileType typescript,typescriptreact,typescript.tsx setlocal syntax=typescript
augroup END
" Use yats.vim for advanced TypeScript support
" Make sure HTML uses the html syntax (usually automatic)
augroup user_html
  autocmd!
  autocmd FileType html,htmldjango setlocal syntax=html
augroup END
" Install a plugin like vim-polyglot for better HTML/CSS/JS highlighting
" Python syntax (usually automatic, but explicit ensures highlighting)
augroup user_python
  autocmd!
  autocmd FileType python setlocal syntax=python
augroup END
augroup user_c_cpp
  autocmd!
  autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.hpp setlocal filetype=cpp
  autocmd FileType c,cpp setlocal syntax=cpp
augroup END
" Install vim-cpp-enhanced-highlight for better C++ syntax
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" Sensible defaults (recommended)
Plug 'tpope/vim-sensible'
" Better syntax highlighting for many languages
Plug 'sheerun/vim-polyglot'
" Language Server Protocol (LSP) support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Optional: Statusline (shows LSP status, errors, etc.)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Optional: Fuzzy file finder (like Ctrl-P)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
