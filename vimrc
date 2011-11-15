" pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * NERDTreeMirror
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Tag List
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow=1

" easytags
set tags=./.tags;,~/.vimtags

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" PDV
noremap <C-P><ESC> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
func! PDVLocalSettings()
    let g:pdv_cfg_Author = "krevindiou <krevindiou@users.noreply.github.com>"
    let g:pdv_cfg_Copyright = "Copyright (C) 2011 krevindiou"
    let g:pdv_cfg_License = "GNU GPL version 3 {@link http://www.gnu.org/licenses/gpl-3.0.txt}"
    let g:pdv_cfg_Uses = 0
    let g:pdv_cfg_php4always = 0
endfunc
au BufRead,BufNewFile *.php call PDVLocalSettings()

" Snipmate
let g:snips_author = "krevindiou <krevindiou@users.noreply.github.com>"

" PHP
autocmd FileType php noremap <C-L> :!/usr/bin/env php -l %<CR>
autocmd BufWritePre *.php :%s/\s\+$//e
let php_noShortTags=1
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete

" Javascript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Twig
autocmd BufRead,BufNewFile *.twig set syntax=jinja

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
set hlsearch
set foldenable
set foldmethod=syntax
if has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ Bold\ 9
endif

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction


if filereadable(".vimrc.local")
    source .vimrc.local
endif

