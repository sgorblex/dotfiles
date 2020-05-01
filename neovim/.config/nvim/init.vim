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

" Folding "
set foldmethod=marker

" Line numbers and highlighting "
set nu
set cursorline

" Mappings "
imap <C-Space> <esc>

" Load per directory configs "
if filereadable("local.vimrc")
    so local.vimrc
endif
if filereadable(".local.vimrc")
    so .local.vimrc
endif

" Better splitting "
set splitbelow splitright
