call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}


call plug#end()

map <C-n> :NERDTreeToggle<CR>

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

" let g:lightline = {'colorscheme': 'one'}
set noshowmode

" = Rust ===================================================
let g:rustfmt_autosave = 1

" = Golang =================================================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1


" = Syntastic ==============================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" = LCS ====================================================
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" **********************************************************
filetype on
filetype indent plugin on
filetype plugin on

au BufNewFile,BufRead *.py
	\ setlocal tabstop=4 |
	\ setlocal softtabstop=4 |
	\ setlocal shiftwidth=4 |
	\ setlocal textwidth=80 |
	\ setlocal expandtab |
	\ setlocal autoindent

au BufNewFile,BufRead *.js,*.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

set nu
set mouse=a
set encoding=utf-8
set termencoding=utf-8
set backspace=indent,eol,start whichwrap+=<,>,[,]
set foldcolumn=1
set foldmethod=indent
set foldlevel=99
set cc=120
set ru

set nobackup
set noswapfile


