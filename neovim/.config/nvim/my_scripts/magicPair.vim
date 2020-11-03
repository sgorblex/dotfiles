" Sgorblex's NeoVim config "
" ~/.config/nvim/my_scripts/magicPair.vim "
" MagicPair - autocomplete parenthesis & co. "

inoremap <silent> ( ()<left>
inoremap <silent> [ []<left>
inoremap <silent> { {}<left>
autocmd Syntax html,vim inoremap <silent> < <lt>><Esc>i| inoremap <silent> > <c-r>=MagicPair('>')<CR>
inoremap <silent> ) <c-r>=MagicPair(')')<CR>
inoremap <silent> ] <c-r>=MagicPair(']')<CR>
inoremap <silent> } <c-r>=MagicPair('}')<CR>
inoremap <silent> " <c-r>=MagicPair('"')<CR>
" inoremap <silent> ' <c-r>=MagicPair("'")<CR>		" optional

function MagicPair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		if a:char == '"' || a:char == "'"
			return a:char.a:char."\<left>"
		else 
			return a:char
	endif
endf
