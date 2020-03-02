" Sgorblex's NeoVim config "
" ~/.config/nvim/config/plugs.vimrc "
" Vim-Plug plugins "



call plug#begin('~/.local/share/nvim/plugged')


" General "

" Conquer of Completion "
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" also install coc plugins: :CocInstall coc-go coc-snippets coc-vimtex

" Honza's snippets (using coc-snippets)
Plug 'honza/vim-snippets'

" NerdTree "
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Nerd Commenter "
Plug 'preservim/nerdcommenter'

" Fuzzy Finder "
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }

" Vim Tex "
Plug 'lervag/vimtex'

" Tmux Navigator "
Plug 'christoomey/vim-tmux-navigator'

" Signify "
" Plug 'mhinz/vim-signify'

" DevIcons (requires nerd font[s]) "
Plug 'ryanoasis/vim-devicons'


" Themes "

" Minimalist
" Plug 'dikiaap/minimalist'

" Gruvbox "
Plug 'morhetz/gruvbox'


call plug#end()
