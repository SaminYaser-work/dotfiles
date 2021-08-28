    set title
    set go=a
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
    set notimeout
    " set mouse=a
    " set nohlsearch
    " set visualbell
    " set linebreak
    " set tabstop=4 shiftwidth=4 expandtab softtabstop=0 smarttab
    " set noswapfile
    " setlocal conceallevel=3
    " set virtualedit=all
    " set autoindent

" Some basics:
	nnoremap c "_c
	set nocompatible
	set encoding=utf-8
	" filetype plugin on
	" syntax on
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

" Lazy redraw
    " set lazyredraw

lua <<EOF

vim.cmd('filetype indent plugin on')
vim.cmd('syntax on')
vim.cmd('set clipboard+=unnamedplus')

vim.o.mouse               = 'a'
vim.o.hlsearch            = false         -- Set highlight on search
vim.opt.clipboard         = 'unnamedplus' -- copy/paste to system clipboard
vim.opt.showmatch         = true          -- highlight matching parenthesis
-- vim.opt.colorcolumn       = '80'          -- line lenght marker at 80 columns

vim.opt.visualbell        = true          -- stop annoying beeping for non-error errors
vim.opt.hidden            = true          -- allows you to hide buffers with unsaved changes without being prompted
vim.opt.linebreak         = true          -- wrap long lines at characters in 'breakat'
-- vim.wo.number            = true          -- show line numbers in gutter
vim.opt.pumblend          = 10            -- pseudo-transparency for popup-menu
-- vim.opt.relativenumber = true                -- show relative numbers in gutter

vim.opt.shiftwidth        = 4             -- spaces per tab (when shifting)
vim.opt.tabstop           = 4             -- spaces per tab
-- vim.opt.softtabstop       = 4             -- spaces per tab
vim.opt.smarttab          = true
vim.opt.expandtab         = true          -- always use spaces instead of tabs

vim.opt.swapfile          = false         -- don't create swap files
vim.opt.splitbelow        = true          -- open horizontal splits below current window
vim.opt.splitright        = true          -- open vertical splits to the right of the current window
vim.opt.lazyredraw        = true          -- don't bother updating screen during macro playback

-- highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Disable unused builtin plugins
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
    "rrhelper"
    --    "spellfile_plugin",
    --    "matchit"
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.opt.list          = true                        -- show whitespace
vim.opt.listchars     = {
    nbsp              = "⦸",                        -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
    extends           = "»",                        -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
    precedes          = "«",                        -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
    tab               = "▷⋯",                       -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
    trail             = "•"                         -- BULLET (U+2022, UTF-8: E2 80 A2)
}
vim.opt.showbreak     = '↳ '               -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.g.indentLine_char = '|'       -- set indentLine character


local home              = "/home/sam"
local config            = home .. "/.config/nvim"
vim.opt.undofile        = true                  -- actually use undo files
vim.opt.undodir         = "/home/sam/.config/nvim/undo"   -- keep undo files out of the way
vim.cmd("set undolevels=10000")
EOF
