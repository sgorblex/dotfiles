" Sgorblex's NeoVim config "
" ~/.config/nvim/plugins.conf.d/nerdcommenter.conf.vimrc "
" NerdCommenter config "



" Bindings "

map <C-c> <plug>NERDCommenterToggle



" Options "

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
