" jshint is used by syntastic for javascript syntax checker, it should be
" installed on the system in order to work. It is installed by `sudo npm
" install -g jshint

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
" run :PluginInstall to install all plugins
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-pathogen'
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'lukaszb/vim-web-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'gregsexton/MatchTag'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Plugin 'blueyed/vim-diminactive'
Plugin 'mattn/emmet-vim' " info https://code.google.com/p/zen-coding/
Plugin 'christoomey/vim-tmux-navigator'

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

set cul
" highlight line in current window
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" ctrlp ignore fodlers
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" configure tabs appeal
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

au BufNewFile,BufRead *.phtml set filetype=php

" Text Snippets Config
" imap <Leader><Tab> <Plug>snipMateNextOrTrigger
" smap <Leader><Tab> <Plug>snipMateNextOrTrigger

" nacholibre .vimrc
let mapleader = ","

" for vim-airline fonts
let g:airline_powerline_fonts = 1

set ffs=unix

set encoding=utf-8

" show only filename in tab, rather than the full path
set guitablabel=%t

nnoremap <Leader>f :NERDTreeFind<cr>
set foldmethod=indent

" Faster scrolling:
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Resize windows
nnoremap <left>  <c-w><
nnoremap <right> <c-w>>
nnoremap <up>    <c-w>-
nnoremap <down>  <c-w>+

" testovo
set ttyfast

" Remove trailing whitespaces map
nnoremap <Leader>rw :%s/\s\+$//e<CR>

" Remove ^M at the end of a line
nnoremap <Leader>rm :%s/\r//g<CR>

" Show matching brackets when text indicator is over them
set showmatch

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on plugins, nerd comment require this
filetype plugin on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy and paste
" set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and backspace
set bs=2     " make backspace behave like normal again

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <Leader>s <Esc>:update<cr>
vnoremap <Leader>s <Esc>:update<cr>
inoremap <Leader>s <Esc>:update<cr>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" Better window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" easier moving between tabs
" map <Leader>n <esc>:tabprevious<CR>
" map <Leader>m <esc>:tabnext<CR>

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
execute pathogen#infect()
filetype on
filetype plugin indent on
syntax on

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Plugins Configuration
" Vimtodo: toggle todo status
map <Leader>tg :call Toggle_task_status()<CR>

" Automatic pep8 checker for python files
autocmd BufWritePost *.py call Flake8()

" Nerdtree: autostart
" https://github.com/jistr/vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=0

let NERDTreeIgnore = ['\.pyc$']

" Nerdtree: toggle
map <C-t> :NERDTreeToggle<CR>

" Syntastic: check only for php syntax errors
let g:syntastic_php_checkers=['php']

nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
