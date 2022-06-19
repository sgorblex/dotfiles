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
