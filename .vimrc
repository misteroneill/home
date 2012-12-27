call pathogen#infect()

set ls=2            " always show status line
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set nowrap          " stop lines from wrapping
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db

" indent 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set background=dark
syntax on

set t_Co=256
colorscheme xoria256

" Map Ctrl+<movement> to swap between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Auto-strip trailing whitespace from certain filetypes on write.
autocmd FileType php,phtml,scss,css,js,handlebars autocmd BufWritePre <buffer> :%s/\s\+$//e
