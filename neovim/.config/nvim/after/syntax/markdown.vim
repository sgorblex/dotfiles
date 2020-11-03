" Sgorblex's NeoVim config "
" ~/.config/nvim/after/syntax/markdown.vim "
" Custom syntax for markdown "


" Inline and display math "
highlight def link markdownInlineMath markdownCode
highlight def link markdownDisplayMath markdownCodeBlock
" syntax match markdownInlineMath /\$.\+\$/
" syntax match markdownInlineMath /\$(.*?)\$/
" syntax match markdownInlineMath /\$([^\$]*)\$/
" syntax region markdownDisplayMath start=/\$\$/ end=/\$\$/




syntax region markdownInlineMath	 start="\$"	skip="\%(\\\\\)*\\\$"	end="\$"
syntax region markdownDisplayMath	 start="\$\$" 				end="\$\$"
