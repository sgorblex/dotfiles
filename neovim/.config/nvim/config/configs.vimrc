" Sgorblex's NeoVim config "
" ~/.config/nvim/config/configs.vimrc "
" actual configs "


" Theming "
colorscheme gruvbox

" removing background (better look with transparent terminals) "
hi Normal guibg=NONE ctermbg=NONE



" Folding options "
set foldmethod=marker



" Plugins "

" Conquer of Completion "
source ~/.config/nvim/config/plugins.conf.d/coc.conf.vimrc

" Coc Snippets "
source ~/.config/nvim/config/plugins.conf.d/coc-snippets.conf.vimrc

" NerdTree "
source ~/.config/nvim/config/plugins.conf.d/nerdtree.conf.vimrc

" NerdCommenter "
source ~/.config/nvim/config/plugins.conf.d/nerdcommenter.conf.vimrc

" Fuzzy Finder "
source ~/.config/nvim/config/plugins.conf.d/fzf.conf.vimrc
