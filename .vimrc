:set nocompatible
:filetype indent plugin on
" Smart Defaults / Indenting
:syntax on
:set hidden
:set history=500
:set mmp=5000
:set smartindent
:set autoindent
:set showmatch
:set mouse=a
set ttyfast
set lazyredraw

"backspace behaves properly
:set backspace=eol,start,indent
:set whichwrap+=<,>,h,l

"Ignore case when searching
:set ignorecase
"Try to be smart about cases when searching
:set smartcase
" Highlight search resaults
:set hlsearch
:set incsearch


"Text and Tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
"Spaces instead of tabs
:set expandtab
:set smarttab
:set ai "auto indent
:set si "smart indent
:set wrap "wrap lines
set lbr
set tw=500

"Moving Around, windows and buffers
" Map <space to / (search)
:map <space> /
"Move between windows
:map <C-j> <C-W>j
:map <C-k> <C-W>k
:map <C-l> <C-W>l
:map <C-h> <C-W>h

"splits:
set splitright
set splitbelow

"Managing tabs
:map <leader>tn :tabnew<cr>
:map <leader>tc :tabclose<cr>
:map <leader>t<leader> :tabnext<cr>

"toggle between last tab w/ tl
let g:lasttab=1
:nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"Open new tab w/ current buffer's path
:map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"Switch CWD to directory of open buffer
:map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

let mapleader=","
:map <leader>s :source ~/.vimrc<CR>

" Remove Whitespace on save
:autocmd BufWritePre * :%s/\s\+$//e

" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
"linting
Plug 'w0rp/ale'
"sidebar
Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'

"status line on the bottom
Plug 'itchyny/lightline.vim'
" set lighline theme inside lightline config
let g:lightline = { 'colorscheme': 'tender' }

Plug 'ervandew/supertab'               " complete using <TAB>
  let g:SuperTabDefaultCompletionType = "<c-n>"

"Color schems
Plug 'jacoborus/tender.vim'

" ctrlp
Plug 'kien/ctrlp.vim'
" open files in new tab instead of split
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
let g:ctrlp_open_multiple_files = 't'

" search
Plug 'mileszs/ack.vim'
map <leader>g :Ack!

call plug#end()

"NERDTree
map <leader>nn  :NERDTreeTabsToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

"CtrlP
map <leader>cp :CtrlP<CR>

" Cosmetics
:set number

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme tender

" copy/paste between diff vims
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>
