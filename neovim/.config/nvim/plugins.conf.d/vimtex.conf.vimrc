" Sgorblex's Neovim config "
" ~/.config/nvim/plugins.conf.d/vimtex.conf.vimrc "
" VimTex config "


" preview software "
let g:vimtex_view_general_viewer = 'zathura'

" fallback for tex files "
let g:tex_flavor = 'latex'


autocmd Filetype tex command! Format :silent :call s:formatLatex()

function! s:formatLatex()
	write
	call system("latexindent -w -s " . expand("%"))
	call system("rm " . expand("%:r") . ".bak*")
	edit
endf

let g:vimtex_toc_config = {
	\ 'layer_status' : {
		\ 'label' : 0,
		\ 'include' : 0,
	\ },
	\ 'show_help' : 0,
	\ 'todo_sorted' : 0,
\ }
