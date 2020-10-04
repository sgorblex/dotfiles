" Sgorblex's NeoVim config "
" ~/.config/nvim/plugins.conf.d/nerdcommenter.conf.vimrc "
" NerdCommenter config "


" Mappings "
" note: it's actually <c-/> but for some reason this works instead
nmap <C-_> <plug>NERDCommenterToggle



" Options "

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Custom formats
let g:NERDCustomDelimiters = { 'asm': { 'left': '#' } }
