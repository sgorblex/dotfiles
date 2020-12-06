" Sgorblex's NeoVim config "
" ~/.config/nvim/after/syntax/markdown.vim "
" Custom syntax for markdown "


" Inline and display math "
highlight def link markdownInlineMath Statement
highlight def link markdownDisplayMath Statement

syntax region markdownInlineMath	 start="\$"	skip="\%(\\\\\)*\\\$"	end="\$"
syntax region markdownDisplayMath	 start="\$\$" 				end="\$\$"
