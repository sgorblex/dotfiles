" Sgorblex's NeoVim config "
" ~/.config/nvim/plugs.vimrc "
" Vim-Plug plugins "



" Install plugin manager if not present "
if has("unix") && ! filereadable(expand("~/.local/share/nvim/site/autoload/plug.vim"))
	echo "Installing vim-plug..."
	silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	echo "Installing plugins..."
	autocmd VimEnter * PlugInstall
endif

" Automatically install missing plugs "
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Settings to call before loading plugins "
let g:polyglot_disabled = ['markdown', 'sensible', 'autoindent']

" Vim-Plug Plugins
call plug#begin(expand('~/.local/share/nvim/plugged'))

" Vim Plug entry					Plugin Name			Description

" General "
Plug 'christoomey/vim-tmux-navigator'			" Tmux Navigator		Fast tmux bindings
Plug 'junegunn/fzf',					" Fuzzy Finder			Quickly find files
Plug 'junegunn/fzf.vim'					" Fuzzy Finder			Default FZF integration
Plug 'lambdalisue/suda.vim'				" Suda				Edit as root
Plug 'lilydjwg/colorizer'				" Colorizer			Colorize RGB hex codes
Plug 'mhinz/vim-startify'				" Startify			Start screen
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Conquer of Completion		Completion engine
Plug 'preservim/nerdcommenter'				" Nerd Commenter		Auto line commenter
" Plug 'DanManN/vim-razer'				" Vim Razer			Razer keyboards RGB integration
Plug 'sgorblex/vim-razer'				" Vim Razer			Razer keyboards RGB integration
Plug 'tpope/vim-obsession'				" Obsession			Automatic session updater
Plug 'tpope/vim-repeat'					" Repeat 			. command fix for vim-surround
Plug 'tpope/vim-surround'				" Surround			Fast handling of quotes & similar
Plug 'vim-airline/vim-airline'				" Airline			Status bar
Plug 'vim-airline/vim-airline-themes'			" Airline themes		Themes for Airline bar
Plug 'poggeroni/vim-poggers'

" Languages support "
Plug 'iamcco/markdown-preview.nvim'			" Markdown			Markdown in-browser preview
Plug 'lervag/vimtex'					" VimTex			LaTeX integration
Plug 'sheerun/vim-polyglot'				" Polyglot			Format and syntax support

" Themes "
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'					" Gruvbox			Theme

" Plug 'chrisbra/unicode.vim'				" Unicode.vim			Get Unicode characters' information
" Plug 'dikiaap/minimalist'				" Minimalist			Theme
" Plug 'honza/vim-snippets'				" Honza's snippets		Collection of snippets
" Plug 'puremourning/vimspector'			" Vimspector			Debugger
" Plug 'wellle/context.vim'				" Context			Show view's context

" Bulky Plug options
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()
