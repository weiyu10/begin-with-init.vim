" plugins

call plug#begin()

"" color

Plug 'cocopon/iceberg.vim'

"" misc

Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'jiangmiao/auto-pairs'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pbrisbin/vim-mkdir'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug '907th/vim-auto-save'

"" fuzzy finder

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"" language

Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()



" pure vim

augroup Rc
	autocmd!
augroup END

set autoread
set nobackup
set nolazyredraw
set nowritebackup
set swapfile
set tildeop
set ttyfast
set visualbell
set wildmenu
set wildmode=full
filetype plugin indent on
autocmd Rc BufWinEnter * set mouse=

"" space setting

set autoindent
set list
set shiftround
set shiftwidth=2
set smartindent
set smarttab
set tabstop=2

"" appearance

syntax on
set backspace=indent,eol,start
set colorcolumn=80
set completeopt=menu
set cursorline
set hlsearch
set inccommand=nosplit
set incsearch
set number
set relativenumber
set showcmd
set showmatch
set showmode
set splitbelow
set splitright
set wrap
autocmd Rc FileType sh set filetype=zsh
autocmd Rc BufEnter * EnableStripWhitespaceOnSave

"" keymaps

let g:mapleader = "\<space>"

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap gj j
nnoremap gk k
nnoremap <esc><esc> :nohlsearch<cr>
nnoremap Y y$


" plugin settings

"" deoplete

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"


"" deoplete-rust

let g:deoplete#sources#rust#racer_binary = $HOME . '/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $RUST_SRC_PATH


"" neosnippet

let g:neosnippet#enable_auto_clear_markers = 0
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = [
			\ '~/.config/nvim/snippets',
			\ '~/.config/nvim/plugged/vim-snippets/snippets']
imap <c-s> <plug>(neosnippet_expand_or_jump)
smap <c-s> <plug>(neosnippet_expand_or_jump)
xmap <c-s> <plug>(neosnippet_expand_target)


"" easymotion

nmap t <plug>(easymotion-s2)
nmap / <plug>(easymotion-sn)


"" auto-pairs

let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0


"" fzf

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :History:<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>
nnoremap <leader>r :Ag<cr>


"" autoformat

autocmd Rc BufEnter,BufWinEnter,BufRead,BufNewFile *
			\ if &filetype == "" | set filetype=text | endif
autocmd Rc BufWrite * :Autoformat
autocmd Rc FileType
			\ conf,cucumber,diff,elm,gitrebase,groovy,markdown,sh,text,tisp,xdefaults,yaml,zsh
			\ let b:autoformat_autoindent = 0
let g:formatters_python = ['autopep8']
let g:formatters_javascript = ['standard_javascript']


"" ale

let g:ale_linters = {
			\ 'javascript' : ['standard'],
			\ 'python': ['flake8', 'pylint'],
			\ }
let g:ale_javascript_standard_options = '--global describe --global it'


"" auto-save

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1


"" lightline

let g:lightline = { 'colorscheme': 'iceberg' }


"" colorscheme

colorscheme iceberg

highlight Normal      ctermbg=none
highlight NonText     ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight VertSplit   cterm=none ctermfg=240 ctermbg=240
