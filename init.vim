:set noshowmode
:set ttimeoutlen=10
:set number
:set relativenumber
:set clipboard+=unnamedplus
:set mouse=a


function! UseTabs()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
  set tabstop=2     " Size of a hard tabstop (ts).
  set shiftwidth=2  " Size of an indentation (sw).
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
:call UseSpaces()

call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/neoclide/coc.nvim',{'branch': 'release'} " Auto Completion
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'honza/vim-snippets' " Snippets
Plug 'https://github.com/sainnhe/gruvbox-material'


Plug 'folke/which-key.nvim'

" idk czy działa
Plug 'lewis6991/gitsigns.nvim'

" Haskell
" Plug 'enomsg/vim-haskellConcealPlus'
Plug 'neovimhaskell/haskell-vim'

" C/C++
Plug 'bfrg/vim-cpp-modern'

" Latex
Plug 'anufrievroman/vim-tex-kawaii'
Plug 'lervag/vimtex'

Plug 'puremourning/vimspector'
Plug 'vim-scripts/restore_view.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'echasnovski/mini.nvim'
Plug 'https://github.com/nvim-lualine/lualine.nvim'
set encoding=UTF-8

call plug#end()

lua require('conf')

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-r> :TagbarToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <leader>D :bd<CR>

let g:vimspector_enable_mappings = 'HUMAN'

noremap <leader>f :Format<CR>
noremap <leader>n :noh<CR>

nnoremap <leader>z :set foldmethod=marker<CR>
nnoremap <leader>x :set foldmethod=manual<CR>
nnoremap <space>x :source ~/.config/nvim/init.vim<CR>

set termguicolors

let g:gruvbox_marerial_enable_italic = '1'
let g:gruvbox_marerial_enable_bold = '1'
let g:gruvbox_material_foreground = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_diagnostic_line_highlight = '1'
set background=dark
colorscheme gruvbox-material
set laststatus=2
set cmdheight=1
