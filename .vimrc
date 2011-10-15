set ls=2            " allways show status line
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set number          " show line numbers
set numberwidth=4   " line numbering takes up 5 spaces
set ignorecase      " ignore case when searching
set nowrap          " stop lines from wrapping
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db

" indent 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set background=dark
syntax on

if has("gui_running")
    set guifont=Consolas:h12
    set lines=50
    set columns=120
    colorscheme darkspectrum
else
    set t_Co=256
    colorscheme xoria256 
endif
