set nocompatible
filetype plugin indent on
syntax on

" Graphical stuff.
set background=dark
set hlsearch

" Line numbers
set number
set relativenumber

" Wrapping/indentation.
set whichwrap=b,s,<,>,[,]
set autoindent

" Options to make CoC work well.
set hidden
set nobackup
set nowritebackup

" Extra space to display messages.
set cmdheight=2

" Turn off error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" More powerful backspacing
set backspace=indent,eol,start

" Bash & emacs-style completion for file selection
set wildmode=longest,list
set wildmenu

" Auto-reload files modified outside of vim.
set autoread

" We don't want double spaces after punctuation since we are not a boomer.
set nojoinspaces

" Set leader keys
nnoremap <Space> <nop>
let mapleader = " "
let maplocalleader = "\\"

" I keep hitting <F1> on my bigger keyboard instead of <Esc>...
map <F1> <Esc>
imap <F1> <Esc>

" File indent settings.

set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

au BufEnter *.txt,*.md,*.py,*.rst,*.tex,*.c
  \ set textwidth=79

au BufEnter *.py,*.hs
  \ set textwidth=88

au BufEnter *.md,*.js,*.yml,*.html,*.css,*.json,*.tex,*.vue,*.ex,*.exs,*.scss,*.rb,*.ml,*.jsx,*.ts,*.tsx,*.vim
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2

au BufEnter Makefile,makefile,*.php
  \ set noexpandtab

au BufEnter *.md,*.rst,*.tex,*.txt
  \ set spell

" TeX files soft wrap.
au BufEnter *.tex
  \ set wrap |
  \ set linebreak |
  \ set textwidth=0 |
  \ set wrapmargin=0

" Trailing space highlighting
highlight BadWhitespace ctermbg=red guibg=red
au BufEnter * match BadWhitespace /\s\+$/

" Reopen file to last read line
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Key mappings.
nnoremap <Leader>n :noh<CR>

nnoremap <Leader>s :split<CR><C-W>j
nnoremap <Leader>v :vsplit<CR><C-W>l

nnoremap <Leader>w :silent %w !wl-copy<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

nnoremap - :silent bprevious<CR>
nnoremap = :silent bnext<CR>
nnoremap <Leader><Backspace> :silent bdelete<CR>0

nnoremap <Leader>r- :resize -5<CR>
nnoremap <Leader>r= :resize =5<CR>
nnoremap <Leader>r, :vertical resize -5<CR>
nnoremap <Leader>r. :vertical resize +5<CR>

nnoremap <Leader>e- :cprevious<CR>
nnoremap <Leader>e= :cnext<CR>
nnoremap <Leader>e, :lprevious<CR>
nnoremap <Leader>e. :lnext<CR>

" A Neovim matching parentheses highlighter.
let loaded_matchparen = 1
