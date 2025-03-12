" Settings
" Disable vi compatibility
set nocompatible

" my settings
" <S-K> to show option
set number
set hlsearch
set backspace=indent,eol,start
set incsearch
set ruler
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
set modelines=0
colorscheme monokai

" Web Dev related --START--
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" END

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
nnoremap <S-Tab> <cmd>bprev!<CR>
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

" Sort content in visual
vnoremap <leader>s <cmd>'<,'>sort<CR><ESC>

" vim-airline
let g:airline#extensions#tabline#enabled=1

" vim-commentary
nmap <Leader>/ gcc
vmap <leader>/ gc

" fuzzy finder
" options
let g:enable_fuzzyy_keymaps = 0
let g:fuzzyy_ripgrep_options = [
  \ "--no-follow",
  \ "-glob \"{Doxygen/*}\""
  \ ]
let g:fuzzyy_exclude_file = ['tags','*/tags', '/*.swp', '*/*.o', '*/*.d', '*/*.lst']
let g:fuzzyy_exclude_dir = []
let g:fuzzyy_async_step = 10000

" mappings
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

" vim-cpp-modern syntax highlighting
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" vim-renamer
nnoremap <leader>r <cmd>Renamer<CR>

" vim format
" The line after '\' are astyle options.
if executable("astyle")
  autocmd FileType c,cpp nnoremap <silent> <F3> <cmd>w!<CR> <cmd>!astyle -qnA14s2t2T2xVSKLxWwYMFpxgHxek3W3xbj %<CR> <cmd>redraw!<CR>
else
  echo "astyle is not installed. Formatting is not enabled.\n"
endif

" vim run via <F5> Python only
autocmd FileType python nnoremap <F5> <cmd>w!<CR> <cmd>!make<CR>
" Enable enhanced python highlighting
let g:python_highlight_all = 1
