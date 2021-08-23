    set title
    set go=a
    set mouse=a
    set nohlsearch
    set clipboard+=unnamedplus
    set noshowmode
    set visualbell
    " set virtualedit=all
    " set autoindent
    set noruler
    set laststatus=0
    set noshowcmd
    set notimeout
    set linebreak
    set tabstop=4 shiftwidth=4 expandtab softtabstop=0 smarttab
    set noswapfile
    " setlocal conceallevel=3

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
    " set relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>

" spell languages
	set spelllang=en
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Tab complete spellcheck
    set complete+=kspell

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Vim scrollfix | cursor middle of the screen
    " let g:scrollfix=50

" Lazy redraw
    set lazyredraw

" Disable unused plugins
lua <<EOF
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
--    "spellfile_plugin",
--    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
EOF
