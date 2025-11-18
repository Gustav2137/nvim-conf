:set noshowmode
:set ttimeoutlen=10
:set number
:set relativenumber
:set clipboard+=unnamedplus
:set mouse=a

function! EditConfig()
  edit ~/.config/nvim/init.vim
endfunction

command Config call EditConfig()

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

Plug 'mfussenegger/nvim-dap'
Plug 'vim-scripts/restore_view.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'echasnovski/mini.nvim'
Plug 'https://github.com/nvim-lualine/lualine.nvim'

Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

Plug 'https://github.com/lambdalisue/vim-suda' " Opening files with sudo permissions

set encoding=UTF-8

call plug#end()

lua require('conf')

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-r> :TagbarToggle<CR>
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
nnoremap <leader>D :bd!<CR>

noremap <leader>f :Format<CR>
noremap <leader>n :noh<CR>

nnoremap <leader>z :set foldmethod=marker<CR>
nnoremap <leader>x :set foldmethod=manual<CR>
nnoremap <space>x :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>t :CocCommand document.toggleInlayHint<CR>

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
set cursorline

function! BufPos_ActivateBuffer(num)
    let l:count = 1
    for i in range(1, bufnr("$"))
        if buflisted(i) && getbufvar(i, "&modifiable") 
            if l:count == a:num
                exe "buffer " . i
                return 
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction

function! BufPos_Initialize()
    for i in range(1, 9) 
        exe "map <A-" . i . "> :call BufPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <A-0> :call BufPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call BufPos_Initialize()

runtime node.vim
