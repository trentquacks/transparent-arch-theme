call plug#begin()

Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'master'}
Plug 'mikavilpas/yazi.nvim', {'branch': 'main'}
Plug 'nvim-lua/plenary.nvim', {'branch': 'master'}
Plug 'jesseleite/nvim-startled'
Plug 'nmac427/guess-indent.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nanozuki/tabby.nvim'
Plug 'tiagovla/scope.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rmagatti/auto-session'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" LSPS
Plug 'mason-org/mason.nvim',
Plug 'nvimdev/lspsaga.nvim',
Plug 'mason-org/mason-lspconfig.nvim',

call plug#end()

lua << EOF

require('ibl').setup()
require('yazi').setup({yazi_floating_window_border="rounded",})
require('startled').setup(require('startled_conf'))
require('guess-indent').setup()
require('nvim_cmp_conf')
require('lspsaga').setup()
require('mason').setup()
require("scope").setup({})
require("auto-session").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"basedpyright",
	},	
})

local theme = {
  fill = { fg = '#FFFFFF', bg = '#14171B' }, 
  head = { fg = '#FFFFFF', bg = '#14171B', style = 'italic' },
  tail = { fg = '#FFFFFF', bg = '#14171B', style = 'italic' },
  current_tab = { fg = '#FFFFFF', bg = '#576175', style = 'bold' },
  tab = { fg = '#576175', bg = '#1c1c1c', style = 'italic' },
  win = { fg = '#FFFFFF', bg = '#14171B', style = 'italic' },
}
require('tabby.tabline').use_preset('active_wins_at_tail', {
  theme = theme,
})

EOF

" Vim Options
syntax on              " highlight syntax

set number             " show line numbers
set noswapfile         " disable the swap file
set hlsearch           " highlight all results
set ignorecase         " ignore case in search
set incsearch          " show search results as you type
set showtabline=2

" Default indent
filetype indent on
set smartindent
set tabstop=4
set shiftwidth=4

highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

" Winbar, Statusline, Tab Color
highlight WinBar guifg=white guibg=#080808
highlight IsModified guifg=#FFFFFF guibg=#576175
highlight IsNotModified guifg=#FFFFFF guibg=#1c1c1c

highlight StatusLineTerm ctermfg=white ctermbg=NONE guifg=#FFFFFF guibg=NONE
highlight StatusLine ctermfg=white ctermbg=NONE guifg=white guibg=NONE
highlight StatusLineNC guifg=white guibg=#14171B
highlight TabLineSel guifg=white guibg=#576175
highlight TabLine guifg=white guibg=#1c1c1c
highlight TabLineFill guifg=LightGreen guibg=#14171B

" Syntax Color
highlight Comment guifg=#576175 ctermfg=NONE
highlight Function guifg=#74c7ec ctermfg=NONE
highlight String guifg=#a6e3a1 ctermfg=NONE
highlight Constant guifg=#fab387 ctermfg=NONE
highlight Statement guifg=#f5c2e7 ctermfg=NONE
highlight Type guifg=#94e2d5 ctermfg=NONE
highlight Identifier guifg=#94e2d5 ctermfg=NONE
highlight Operator guifg=#f5c2e7 ctermfg=NONE

let mapleader = ","

"set spell spelllang=en_us
nnoremap <leader>f 1z=
nnoremap <leader>ws :%s/\s\+$//<Enter>

" Plugins bind
nnoremap <leader>e :Yazi<Enter>
nnoremap <leader>i :GuessIndent<Enter>
nnoremap <leader>b :Telescope buffers<Enter>
nnoremap <leader><F2> :Tabby rename_tab 
nnoremap <leader>c :Tabby jump_to_tab<Enter>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
vnoremap  <leader>Y  "+yg_

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Terminal
"nnoremap <leader>t :botright new \| resize 10 \| terminal<CR>i
"tnoremap <Esc> <C-\><C-n>


" Move tab
nnoremap <leader>> :tabm +1<CR>
nnoremap <leader>< :tabm -1<CR>
