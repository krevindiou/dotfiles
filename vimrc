" pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" NERDTree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

