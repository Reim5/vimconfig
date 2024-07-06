" Settings
" Disable vi compatibility
if &compatible
	set nocompatible
endif

" my settings
" <S-K> to show option
set number
set hlsearch
set backspace=indent,eol,start
set incsearch
set ruler
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ttimeout
set ttimeoutlen=500
set wildmenu
set scrolloff=5
set nolangremap
set autoread
set nowrap
set laststatus=2
set sidescroll=1
set sidescrolloff=2
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set history=1000
set tabpagemax=50
set mouse=a
set encoding=utf8
colorscheme monokai

if !empty(&viminfo)
  set viminfo^=!
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Enable the :Man command shipped inside Vim's man filetype plugin.
if exists(':Man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif

set nolangremap

set sessionoptions-=options
set viewoptions-=options

filetype plugin indent on
syntax enable

if has("gui_running")
  set guifont=Consolas:h14:cANSI:qDRAFT
endif

" User Mappings
" Set leader key
let g:mapleader = " "

" buffer management
nnoremap <Tab> <cmd>bnext!<CR>
nnoremap <Leader>b <cmd>enew<CR>
nnoremap <Leader>x <cmd>bdelete<CR>

" CTRL+S, save buffer in Normal mode
nnoremap <C-s> <Cmd>w!<CR>
" Esc, remove highlight from search
nnoremap <Esc> <Cmd>noh<CR>
" Autoclose brackets,parentheses,quotes, & more
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {;<CR> {<CR>};<Esc>O

" vim-airline
let g:airline#extensions#tabline#enabled=1

" vim-commentary
nnoremap <Leader>/ <cmd>Commentary<CR>

" fuzzy finder
let g:enable_fuzzyy_keymaps = 0
nnoremap <silent> <leader>fb <cmd>FuzzyInBuffer<CR>
nnoremap <silent> <leader>fc <cmd>FuzzyColors<CR>
nnoremap <silent> <leader>fd <cmd>FuzzyHelps<CR>
nnoremap <silent> <leader>ff <cmd>FuzzyFiles<CR>
nnoremap <silent> <leader>fi <cmd>FuzzyCommands<CR>
nnoremap <silent> <leader>fg <cmd>FuzzyGrep<CR>
nnoremap <silent> <leader>ft <cmd>FuzzyBuffers<CR>
nnoremap <silent> <leader>fh <cmd>FuzzyHighlights<CR>

" floaterm
nnoremap <silent> <leader>i <cmd>FloatermToggle<CR>
