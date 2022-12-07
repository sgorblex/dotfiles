" Sgorblex's Neovim config "
" ~/.config/nvim/plugins.conf.d/goyo.conf.vimrc "
" Goyo config "


" Mappings "
nnoremap <leader>y :Goyo<CR>


function! s:goyo_enter()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status off
	endif
	set noshowmode
	set noshowcmd
	set scrolloff=999
endfunction

function! s:goyo_leave()
	highlight Normal guibg=NONE ctermbg=NONE
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status on
	endif
	set showmode
	set showcmd
	set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
