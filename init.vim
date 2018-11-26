call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'

Plug 'chriskempson/base16-vim'
Plug 'machine23/cobalt2-vim-theme'
"Plug 'altercation/vim-colors-solarized'
Plug 'kaicataldo/material.vim'

"Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

Plug 'jiangmiao/auto-pairs'


call plug#end()

" =============================================================
"                      NERDTree
" =============================================================

map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let NERDTreeMinimalUI=1

" NERDTree File highlighting
if has_key(g:plugs, 'nerdtree')
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  " Ignore annoying files
  let NERDTreeIgnore=['\.pyc$', '\.DS_Store$', '\~$']
endif

if has_key(g:plugs, 'vim-devicons')
  " If you need to add an unicode first use like this: "\uE275"
  " then copy and paste the resulting one
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['svg'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['liquid'] = ''
  if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
  endif

endif

if has_key(g:plugs, 'vim-nerdtree-syntax-highlight')
  let s:brown = "905532"
  let s:aqua =  "3AFFDB"
  let s:blue = "689FB6"
  let s:darkBlue = "44788E"
  let s:purple = "834F79"
  let s:lightPurple = "834F79"
  let s:red = "AE403F"
  let s:beige = "F5C06F"
  let s:yellow = "F09F17"
  let s:orange = "D4843E"
  let s:darkOrange = "F16529"
  let s:pink = "CB6F6F"
  let s:salmon = "EE6E73"
  let s:green = "8FAA54"
  let s:lightGreen = "31B53E"
  let s:white = "FFFFFF"
  let s:rspec_red = 'FE405F'
  let s:git_orange = 'F54D27'

  let g:NERDTreeExtensionHighlightColor = {}
  let g:NERDTreeExtensionHighlightColor['svg'] = s:blue
  let g:NERDTreeExtensionHighlightColor['png'] = s:blue
  let g:NERDTreeExtensionHighlightColor['gif'] = s:blue
  let g:NERDTreeExtensionHighlightColor['jpg'] = s:blue
  let g:NERDTreeExtensionHighlightColor['liquid'] = s:blue

  " Show hidden files
  let NERDTreeShowHidden=1
endif

" =============================================================
"                      APPEARENCE
" =============================================================

autocmd Colorscheme * highlight FoldColumn guibg=bg " guifg=bg
autocmd Colorscheme * highlight LineNr guibg=NONE

" Base16
"let base16colorspace=256
"let g:base16_shell_path="~/dev/others/base16/shell/scripts/"

"if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
"  set termguicolors
"endif

" Colors
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set background=dark
"colorscheme base16-materia
colorscheme cobalt2

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:lightline = {'colorscheme': 'one'}
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
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


" = LCS ====================================================
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

" = JavaScript =============================================
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"let g:syntastic_javascript_checkers = ['eslint']

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_open_list=1 " 'on_save'

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
set textwidth=100
set wrap
set linebreak
set clipboard=unnamed

set nobackup
set noswapfile



