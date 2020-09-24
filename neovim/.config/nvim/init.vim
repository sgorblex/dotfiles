" Sgorblex's NeoVim config "
" ~/.config/nvim/init.vim "



" Vim-Plug plugins "
source ~/.config/nvim/plugs.vimrc

" Theming "
colorscheme gruvbox
"
" removing background (better look with transparent terminals) "
hi Normal guibg=NONE ctermbg=NONE

" Plugins' configs "
source ~/.config/nvim/plugins.conf.vimrc



" Settings "
set foldmethod=marker 			" Fold method uses {{{ and }}} "
set nu 					" Line numbers "
set cursorline 				" Cursor line gets highlighted "
set mouse=a 				" Mouse active for all modes "
set splitbelow splitright 		" Better window splitting "
set timeoutlen=500 			" Multiple key mappings' timeout
set inccommand=split 			" Substitute real time preview "

" Optional options (lul)
" set iskeyword+=- 			" Treat dash separated words as a word text object"
" set clipboard=unnamedplus 		" Use main X clipboard "


" Mappings "
nmap Y y$
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vert resize -2<CR>
nnoremap <silent> <M-l> :vert resize +2<CR>


" Persistent undo
if has('persistent_undo')
    let &undodir = expand("~/.local/share/nvim/undo")
    :silent call system('mkdir -p ' . &undodir)
    set undofile
endif


" Load per directory configs "
if filereadable("local.vimrc")
    so local.vimrc
endif
if filereadable(".local.vimrc")
    so .local.vimrc
endif
