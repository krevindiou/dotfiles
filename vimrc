" pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * NERDTreeMirror
let NERDTreeShowHidden=1

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" PHP
noremap <C-P><ESC> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>

" General
set nu
syntax on
set t_Co=256
colorscheme wombat256
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set autoindent
set expandtab
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶,trail:·
set colorcolumn=120
highlight ColorColumn ctermbg=gray guibg=gray
let mapleader = ','

if filereadable(".vimrc.local")
    source .vimrc.local
endif

