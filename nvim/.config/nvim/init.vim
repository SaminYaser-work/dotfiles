" Setting leader key
let mapleader =","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" My Plugins """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-startify'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
" Plug 'sheerun/vim-polyglot'
Plug 'sbdchd/neoformat'
Plug 'rhysd/vim-grammarous'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'thanthese/Tortoise-Typing'
Plug 'unblevable/quick-scope'
Plug 'skywind3000/asyncrun.vim'
Plug 'SirVer/ultisnips'
Plug 'phaazon/hop.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tweekmonster/startuptime.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'vim-scripts/scrollfix'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Sourcing My Configs """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basic stuff
source ~/.config/nvim/myConfigs/settings.vim
source ~/.config/nvim/myConfigs/themes.vim
source ~/.config/nvim/myConfigs/remaps.vim
source ~/.config/nvim/myConfigs/autocmds.vim

" Plugin configs
source ~/.config/nvim/myConfigs/vimling.vim
source ~/.config/nvim/myConfigs/vimwiki.vim
source ~/.config/nvim/myConfigs/airline.vim
" lua require('statusline')
source ~/.config/nvim/myConfigs/coc-stuff.vim
source ~/.config/nvim/myConfigs/digraps_alphabets.vim
source ~/.config/nvim/myConfigs/fzf-rg.vim
source ~/.config/nvim/myConfigs/startify-settings.vim
source ~/.config/nvim/myConfigs/signify.vim
source ~/.config/nvim/myConfigs/coc-explorer.vim
source ~/.config/nvim/myConfigs/quickscope.vim
source ~/.config/nvim/myConfigs/hop.vim
lua require('treesitter')
lua require('nvim-colorizer')
source ~/.config/nvim/myConfigs/neoformatter.vim

" Unused stuff
" source ~/.config/nvim/myConfigs/polyglot.vim


" @FIXME
" Unbinding tab from UltiSnip because it interferes with coc autocompletion
    let g:UltiSnipsExpandTrigger="<C-'>"
" let g:UltiSnipsJumpForwardTrigger="<C-space>"
" let g:UltiSnipsJumpBackwardTrigger="<C-b>"
