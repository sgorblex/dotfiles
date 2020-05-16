" Sgorblex's NeoVim config "
" ~/.config/nvim/plugs.vimrc "
" Vim-Plug plugins "



" Install plugin manager if not present "
if ! filereadable(system('echo -n "$HOME/.local/share/nvim/site/autoload/plug.vim"'))
	echo "Installing vim-plug..."
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "Installing plugins..."
	autocmd VimEnter * PlugInstall
endif



" Plugins

call plug#begin('~/.local/share/nvim/plugged')


" General "

" Conquer of Completion "
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" also install coc plugins: :CocInstall coc-go coc-snippets coc-vimtex coc-explorer

" Honza's snippets (using coc-snippets)
" Plug 'honza/vim-snippets'

" NerdTree "
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Nerd Commenter "
Plug 'preservim/nerdcommenter'

" Fuzzy Finder "
Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }

" Tmux Navigator "
Plug 'christoomey/vim-tmux-navigator'

" DevIcons " (requires nerd font[s])
" Plug 'ryanoasis/vim-devicons'

" Floobits "
" Plug 'floobits/floobits-neovim'

" Vim Razer " (for razer keyboards)
Plug 'danmann/vim-razer'

" Colorizer " (RGB hex codes)
Plug 'lilydjwg/colorizer'

" Surround "
Plug 'tpope/vim-surround'

" Airline "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'




" Git wrappers "

" Signify "
Plug 'mhinz/vim-signify'

" Fugitive "
" Plug 'tpope/vim-fugitive'




" Languages support

" toml "
Plug 'cespare/vim-toml'

" fish shell "
Plug 'dag/vim-fish'

" Markdown "
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" VimTex " (i know, it's not a language)
Plug 'lervag/vimtex'


" Themes "

" Minimalist
" Plug 'dikiaap/minimalist'

" Gruvbox "
Plug 'morhetz/gruvbox'


call plug#end()
