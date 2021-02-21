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
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Backspace on MacOS is annoying -> Fix!
set backspace=indent,eol,start

set nowrap  " don't automatically wrap on load

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
Plugin 'google/vim-maktaba'
Plugin 'google/vim-glaive'
Plugin 'google/vim-codefmt'
Plugin 'rhysd/vim-clang-format'
Plugin 'Rip-Rip/clang_complete'
Plugin 'vimwiki/vimwiki'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
call vundle#end()            " required
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
let mapleader = ","
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
Bundle 'zah/nim.vim'
Plugin 'scrooloose/syntastic'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'flazz/vim-colorschemes'
Plugin 'elixir-editors/vim-elixir'
Bundle 'Lokaltog/vim-powerline'
Bundle 'chase/vim-ansible-yaml'
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 3
let g:ansible_options = {'ignore_blank_lines': 0}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:clang_library_path='/usr/local/Cellar/cling/0.5_2/libexec/lib/libclang.dylib'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'
let g:syntastic_c_include_dirs = ['/usr/local/include/SDL2', '/usr/local/lib/']
let g:syntastic_cpp_include_dirs = ['/usr/local/include/SDL2', '/usr/local/lib/']
let g:syntastic_haskell_ghc_mod_exec = 'ghc-mod.sh'
let g:syntastic_java_javac_executable = 'javac'
let g:syntastic_enable_perl_checker = 1
let g:syntastic_elixir_checkers = ['elixir']
let g:syntastic_enable_elixir_checker = 1
let b:ale_linters = ['eslint']
let g:syntastic_javascript_checkers = ['standard', 'jshint']
let g:syntastic_javascript_standard_exec = 'happiness'
let g:syntastic_javascript_standard_generic = 1
let g:vimwiki_list = [{
	\ 'path' : '$HOME/Dropbox/vimwiki/',
	\ 'path_html' : '$HOME/Dropbox/vimwiki/_html/',
	\ 'name' : 'wiki',
	\ 'auto_export' : 1,
	\ 'auto_toc' : 1,
	\ 'links_space_char' : '_',
	\ 'template_path' : '$HOME/Dropbox/vimwiki/templates/',
	\ 'template_default' : 'default',
\ }]
" for markdown:
" 	\ 'custom_wiki2html': 'vimwiki_markdown',\ 'template_ext' : 'html'
" \ 'syntax': 'markdown', 'ext': '.md',

set nobackup
set nowritebackup
set noswapfile
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
filetype plugin indent on    " required
" Enable syntax highlighting
syntax on
" enable all Python syntax highlighting features
let python_highlight_all = 1
au FileType gitcommit set tw=72
au BufRead,BufNewFile *.txt set wrap linebreak nolist