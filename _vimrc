" =====================================================================
" Vundle
" =====================================================================
set nocompatible               " be iMproved, required
filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

" Colors
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =====================================================================
" Settings
" =====================================================================
set ls=2            " always show status line
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set nowrap          " stop lines from wrapping
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set backspace=indent,eol,start

" no bells or blinks
set noerrorbells
set vb t_vb=

" indent 4 spaces
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

set cursorline              " have a line indicate the cursor location
set scrolloff=3             " Keep 3 context lines above and below the cursor

set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

set guifont=Source\ Code\ Pro:h15

syntax on
set background=dark

let g:solarized_termcolors=256           " use degraded 256 colorscheme in terminal
let g:solarized_termtrans=1
colorscheme solarized

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" Auto-strip trailing whitespace from on write. This works on all files,
" so if there is ever a need to retain trailing space this will have to
" be limited using autocmd FileType and replacing * with <buffer>
autocmd BufWritePre * :%s/\s\+$//e
