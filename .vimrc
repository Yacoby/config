let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-obsession'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'

call plug#end()


filetype on

filetype plugin indent on " filetype detection, filetype specific scripts, ft indent scripts
set background=dark
colorscheme gruvbox

syntax on
set smartindent

set spell

" show unprintable chars
set list
set listchars=tab:»\ ,eol:¶,trail:·

set nocompatible " don't need anything from vi

filetype plugin on
set ofu=syntaxcomplete#Complete

set expandtab

set number " show line numbers
set relativenumber " relative line numberings

set colorcolumn=120

set encoding=utf-8
set scrolloff=5 "minmax lines to keep above/below the curson
set showcmd "off by default in Unix
set hidden "?

set backspace=indent,eol,start
set laststatus=2 " always show the status line
set undofile " allow infinate list undo

set backupdir=/tmp// " The // means that the directory information will be saved in the filename
set directory=/tmp//
set undodir=/tmp//

" search settings
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch


set mouse=a " allow mice control

set clipboard=unnamed " avoid the faf for copy/paste

" avoid the delay exiting insert mode
au InsertEnter * set timeoutlen=0
au InsertLeave * set timeoutlen=1000

nnoremap <leader><space> :noh<cr> " remove search highlighting

nnoremap <tab> %
vnoremap <tab> %

" make the md file extension markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Change cursor shape in different modes on OS X
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif


set wildmenu "wildmenu, better autocomplete of commands
set wildmode=list:longest
set wildignore+=*.pyc,*/env/*     " MacOSX/Linux

" change autocomplete so that it works more like a 'standard' ide
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" nerd tree settings
let NERDTreeIgnore = ['\.pyc$']
nmap <silent> <C-D> :NERDTreeToggle<CR>

"Ctrl P
nnoremap <leader>t :CtrlP<CR>

" remap arrow keys to move around slips
nnoremap <silent> <Right> <c-w>l
nnoremap <silent> <Left> <c-w>h
nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j
