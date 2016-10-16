" required for pathogen
filetype off
call pathogen#infect()
filetype on

filetype plugin indent on " filetype detection, filetype specific scripts, ft indent scripts

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

" enable 256 colours
set t_Co=256
set background=dark
colorscheme solarized

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
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <leader>t :CtrlP<CR>

" autoindent
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1

" syntastic
let g:syntastic_javascript_checkers=['jshint', 'jslint']
let g:syntastic_ruby_checkers=['mri', 'rubocop']
let g:syntastic_python_checkers=['python', 'pyflakes', 'flake8']

" remap arrow keys to move around slips
nnoremap <silent> <Right> <c-w>l
nnoremap <silent> <Left> <c-w>h
nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j
