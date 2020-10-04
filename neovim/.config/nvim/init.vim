" Sgorblex's NeoVim config "
" ~/.config/nvim/init.vim "



" Vim-Plug plugins "
source ~/.config/nvim/plugs.vimrc

" Theming "
colorscheme gruvbox
"
" removing background (better look with transparent terminals) "
highlight Normal guibg=NONE ctermbg=NONE

" Plugins' configs "
source ~/.config/nvim/plugins.conf.vimrc



" Settings "
set foldmethod=marker			" Fold method uses {{{ and }}} "
set number				" Line numbers "
set cursorline				" Cursor line gets highlighted "
set mouse=a				" Mouse active for all modes "
set splitbelow splitright		" Better window splitting "
set timeoutlen=500			" Multiple key mappings' timeout
set inccommand=split			" Substitute real time preview "


" Mappings "
nnoremap Y y$
inoremap <M-Return> <Esc>o
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
