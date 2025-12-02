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
require('yazi').setup({yazi_floating_window_border="single",})
require('startled').setup(require('startled_conf'))
require('guess-indent').setup()
require('nvim_cmp_conf')
require('lspsaga').setup()
require('mason').setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"basedpyright",
	},	
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

" Transparency
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

" Winbar, Statusline, Tab Color
highlight WinBar guifg=#b4befe guibg=#07080D
highlight IsModified guifg=#FFFFFF guibg=#FF0000
highlight IsNotModified guifg=#FFFFFF guibg=#00FF00

highlight StatusLineTerm ctermfg=white ctermbg=NONE guifg=#FFFFFF guibg=#1e1e2e
highlight StatusLine ctermfg=white ctermbg=NONE guifg=#a6adc8 guibg=#1e1e2e
highlight StatusLineNC guifg=#a6adc8 guibg=#1e1e2e
highlight TabLineSel guifg=#bac2de guibg=#45475a
highlight TabLine guifg=#a6adc8 guibg=#1e1e2e
highlight TabLineFill guifg=LightGreen guibg=#181825


" Syntax Color
highlight Comment guifg=#6c7086 ctermfg=NONE
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
nnoremap <leader>t :botright new \| resize 10 \| terminal<CR>i
tnoremap <Esc> <C-\><C-n>

