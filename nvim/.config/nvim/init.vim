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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
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
Plug 'airblade/vim-rooter'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sbdchd/neoformat'
" Plug 'romgrk/barbar.nvim'
Plug 'rhysd/vim-grammarous'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'thanthese/Tortoise-Typing'
Plug 'unblevable/quick-scope'
Plug 'skywind3000/asyncrun.vim'
Plug 'SirVer/ultisnips'
Plug 'phaazon/hop.nvim'
Plug 'tweekmonster/startuptime.vim'
Plug 'junegunn/vim-easy-align'
Plug 'windwp/nvim-autopairs'
" Plug 'famiu/feline.nvim'
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
lua require('lsp')
lua require('treesitter')
lua require('completion')
lua require('nvim-colorizer')
" lua require('barbar')
lua require('_nvim-autopairs')
" lua require('_feline')


source ~/.config/nvim/myConfigs/lspconfig.vim
source ~/.config/nvim/myConfigs/vimling.vim
source ~/.config/nvim/myConfigs/vimwiki.vim
source ~/.config/nvim/myConfigs/airline.vim
source ~/.config/nvim/myConfigs/digraps_alphabets.vim
source ~/.config/nvim/myConfigs/startify-settings.vim
source ~/.config/nvim/myConfigs/signify.vim
source ~/.config/nvim/myConfigs/quickscope.vim
source ~/.config/nvim/myConfigs/hop.vim
source ~/.config/nvim/myConfigs/neoformatter.vim

" Unused stuff
" source ~/.config/nvim/myConfigs/polyglot.vim
" source ~/.config/nvim/myConfigs/coc-stuff.vim
" source ~/.config/nvim/myConfigs/fzf-rg.vim
" source ~/.config/nvim/myConfigs/coc-explorer.vim


" @FIXME
" Unbinding tab from UltiSnip because it interferes with coc autocompletion
    let g:UltiSnipsExpandTrigger="<A-'>"
" let g:UltiSnipsJumpForwardTrigger="<C-space>"
" let g:UltiSnipsJumpBackwardTrigger="<C-b>"
