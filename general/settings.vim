let mapleader = ","                      " Rebind <Leader> key
syntax on                                " Enable syntax highlighting
set number                               " Show line numbers
set tw=79                                " Width of document (used by gd)
set nowrap                               " Don't automatically wrap on load
set fo-=t                                " Don't automatically wrap text
set colorcolumn=80                       " Column
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile

" basics
filetype plugin indent on
syntax on set number
set nowrap

" preferences
set pastetoggle=<F2>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR><Esc>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Theme
syntax enable
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
colorscheme nova

" Close quickfix window
noremap <Leader>w :ccl<CR>

" Quit vim with sudo
cmap w!! w !sudo tee %

" All split window open bellow
set splitbelow

set showtabline=2

set noshowmode

" Shortcut to insert new line and paste content bellow
nmap <Leader>p o<esc>P

" Insert one single character
nnoremap <C-i> i_<Esc>r
