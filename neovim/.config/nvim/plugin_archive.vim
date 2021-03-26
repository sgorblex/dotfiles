" Sgorblex's NeoVim config "
" ~/.config/nvim/plugin_archive.vim
" Plugin Archive - my known plugins (for reference, just in case)
" Don't source this

" See vimawesome.com for other cool plugins!



" Vim Plug entry					Plugin Name			Description						Notes

Plug 'cespare/vim-toml'					" Vim-Toml			Tom Language support
Plug 'chrisbra/unicode.vim'				" Unicode.vim			Get Unicode characters' information
Plug 'christoomey/vim-tmux-navigator'			" Tmux Navigator		Fast tmux bindings
Plug 'dag/vim-fish'					" Vim-Fish			Fish shell scripting support
Plug 'danmann/vim-razer'				" Vim Razer			Razer keyboards RGB integration				Has a bug, see issue #6
Plug 'dikiaap/minimalist'				" Minimalist			Theme
Plug 'floobits/floobits-neovim'				" Floobits			Real time co-editing
Plug 'honza/vim-snippets'				" Honza's snippets		Collection of snippets
Plug 'iamcco/markdown-preview.nvim'			" Markdown			Markdown in-browser preview
Plug 'junegunn/fzf',					" Fuzzy Finder			Quickly find files
Plug 'junegunn/fzf.vim'					" Fuzzy Finder			Default FZF integration
Plug 'junegunn/goyo.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}		" Ranger on nvim		TUI file manager directly in vim
Plug 'lambdalisue/suda.vim'				" Suda				Edit as root
Plug 'lervag/vimtex'					" VimTex			LaTeX integration
Plug 'lilydjwg/colorizer'				" Colorizer			Colorize RGB hex codes					Watch out, it scans every entire file
Plug 'liuchengxu/vista.vim'				" Vista				LSP object navigation (requires ctags)
Plug 'luochen1990/rainbow'				" Rainbow			Parenthesis highlighter
Plug 'metakirby5/codi.vim'				" Codi				Interactive scratchpad					Works for a few languages
Plug 'mhinz/vim-signify'				" Signify			Git wrapper
Plug 'mhinz/vim-startify'				" Startify			Start screen
Plug 'morhetz/gruvbox'					" Gruvbox			Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Conquer of Completion		Completion engine
Plug 'preservim/nerdcommenter'				" Nerd Commenter		Auto line commenter
Plug 'sheerun/vim-polyglot'				" Polyglot			Format and syntax support
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}	" Markdown			Markdown in-browser preview
Plug 'tpope/vim-fugitive'				" Fugitive			Git wrapper
Plug 'tpope/vim-obsession'				" Obsession			Automatic session updater
Plug 'tpope/vim-repeat'					" Repeat 			. command fix for vim-surround
Plug 'tpope/vim-surround'				" Surround			Fast handling of quotes & similar
Plug 'unblevable/quick-scope'				" Quick scope			Highlight when using f and t
Plug 'vim-airline/vim-airline'				" Airline			Status bar
Plug 'vim-airline/vim-airline-themes'			" Airline themes		Themes for Airline bar
Plug 'voldikss/vim-floaterm'				" Floaterm			Floating terminal
Plug 'wellle/context.vim'				" Context			Show view's context


" Bulky Plug options
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
