set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType make set noexpandtab

set background=dark

if has("gui_running")
    set guifont=Consolas:h12
    set lines=50
    set columns=120
    colorscheme darkspectrum
else
    set t_Co=256
    colorscheme xoria256 
endif

