call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-syntastic/syntastic'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'machine23/cobalt2-vim-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'

Plug 'itchyny/lightline.vim'

" JS Tools
" Wanna be autocomplete-paths
Plug 'rhysd/vim-fixjson'                                            " Autofix json
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx', { 'for': ['jsx','javascript.jsx']}
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

call plug#end()

" =============================================================
"                      SYNTASTIC
" =============================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" =============================================================
"                      RUST
" =============================================================
let g:rustfmt_autosave = 1

" =============================================================
"                      LANGUAGE SERVER
" =============================================================

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" =============================================================
"                      NERDTree
" =============================================================

map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeMinimalUI=1

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\.DS_Store$', '\~$']

" =============================================================
"                      APPEARENCE
" =============================================================

set termguicolors
set background=dark
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
" let g:lightline = {'colorscheme': 'solarized'}
colorscheme cobalt2

"let g:lightline = {'colorscheme': 'one'}
set noshowmode


" **********************************************************
filetype on
filetype indent plugin on
filetype plugin on

au BufNewFile,BufRead *.md setlocal textwidth=80 wrap linebreak cc=80

au BufNewFile,BufRead *.js,*.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

syntax enable
set nu
set numberwidth=5
set mouse=a
set encoding=utf-8
set termencoding=utf-8
set backspace=indent,eol,start whichwrap+=<,>,[,]
"set foldcolumn=2
set foldmethod=indent
set foldlevel=99
set cc=120
set ru
set autoread
set textwidth=120
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed

set nobackup
set noswapfile

set signcolumn=yes
