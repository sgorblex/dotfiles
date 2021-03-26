" Sgorblex's NeoVim config "
" ~/.config/nvim/init.vim "



" Vim-Plug plugins "
source ~/.config/nvim/plugs.vimrc

" My scripts "
source ~/.config/nvim/my_scripts.vimrc

" Theming "
colorscheme gruvbox

" removing background (better look with transparent terminals) "
highlight Normal guibg=NONE ctermbg=NONE

" Plugins' configs "
source ~/.config/nvim/plugins.conf.vimrc



" Settings "
set foldmethod=marker			" Fold method uses {{{ and }}}
set number				" Absolute line numbers	─┬── Hybrid line number
set relativenumber			" Relative line numbers	─┘
set cursorline				" Cursor line gets highlighted
set mouse=a				" Mouse active for all modes
set splitbelow splitright		" Better window splitting
set timeoutlen=500			" Multiple key mappings' timeout
set inccommand=split			" Substitute real time preview
set scrolloff=5				" Rows above/below cursor


" Mappings "
nnoremap Y y$
inoremap <M-Return> <Esc>o
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>
vnoremap <c-c> "+y
nnoremap <c-c> "+yy


" Persistent undo "
if has('persistent_undo')
	let &undodir = expand("~/.local/share/nvim/undo")
	if !isdirectory(&undodir) && has('unix')
		:silent call system('mkdir -p ' . &undodir)
	endif
	set undofile
endif


" Load per directory configs "
if filereadable("local.vimrc")
    source local.vimrc
endif
if filereadable(".local.vimrc")
    source .local.vimrc
endif
