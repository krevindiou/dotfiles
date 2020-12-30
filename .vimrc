" Plugins
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
call plug#end()

" PHP
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd BufWritePre *.php :%s/\s\+$//e
let php_noShortTags=1

" Map tab key
vmap <Tab> >gv
vmap <S-Tab> <gv

" Map Select All
noremap <C-A> ggVG

" General
set nu
syntax on
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
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
if exists('+colorcolumn')
  set colorcolumn=120
endif
highlight ColorColumn ctermbg=gray guibg=gray
let mapleader = ','
set hlsearch
set foldenable
set foldmethod=syntax
set laststatus=2
set noshowmode
if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ Bold\ 9
endif

if filereadable(".vimrc.local")
    source .vimrc.local
endif

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
