call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'

call plug#end()

" = Colors =================================================

" Base16
let base16colorspace=256
let g:base16_shell_path="~/dev/others/base16/shell/scripts/"

if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

" Colors
set background=dark
colorscheme base16-materia

" = Rust ===================================================
let g:rustfmt_autosave = 1

" = Syntastic ==============================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" **********************************************************
filetype on
filetype indent plugin on
filetype plugin on

au BufNewFile,BufRead *.py, *.go, *.rs |
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4 |
	\ setlocal shiftwidth=4 |
	\ setlocal textwidth=80 |
	\ setlocal expandtab |
	\ setlocal autoindent

au BufNewFile,BufRead *.js, *.html, *.css
	\ setlocal tabstop=2 |
	\ setlocal softtabstop=2 |
	\ setlocal shiftwidth=2

set nu
set mouse=a
set encoding=utf-8
set termencoding=utf-8
set backspace=indent,eol,start whichwrap+=<,>,[,]
set foldcolumn=1
set foldmethod=indent
set foldlevel=99


