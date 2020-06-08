" Sgorblex's NeoVim config "
" ~/.config/nvim/init.vim "



" Vim-Plug plugins "
source ~/.config/nvim/plugs.vimrc

" Plugins' configs "
source ~/.config/nvim/plugins.conf.vimrc



" Theming "
colorscheme gruvbox

" removing background (better look with transparent terminals) "
hi Normal guibg=NONE ctermbg=NONE



" Settings "
set foldmethod=marker 			" Fold method uses {{{ and }}} "
set nu 					" Line numbers "
set cursorline 				" Cursor line gets highlighted "
set mouse=a 				" Mouse active for all modes "
set splitbelow splitright 		" Better splitting "
set iskeyword+=-                      	" Treat dash separated words as a word text object"
set clipboard=unnamedplus 		" Use main X clipboard "


" Mappings "
imap <C-Space> <esc>
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vert resize -2<CR>
nnoremap <M-l>    :vert resize +2<CR>


" Load per directory configs "
if filereadable("local.vimrc")
    so local.vimrc
endif
if filereadable(".local.vimrc")
    so .local.vimrc
endif
