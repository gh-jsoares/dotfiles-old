" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set guicursor=                          " Disable gui cursor
set relativenumber                      " Relative line numbers
set nohlsearch                          " Stop highlighting search
set hidden                              " Required to keep multiple buffers open multiple buffers
set noerrorbells                        " No more of that annoying bell sound
set tabstop=4                           " Insert 4 spaces for a tab
set softtabstop=4                       " Number of spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Indent in a new line
set autoindent                          " Good auto indent
set number                              " Line numbers
set nowrap                              " Display long lines as just one line
set noswapfile                          " Avoid using swap files
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set undodir=$HOME/.vim/undodir          " For undotree
set undofile                            " For undotree
set incsearch                           " Incremental search
set termguicolors                       " Better term colors
set scrolloff=8                         " Start scrolling 8 lines from the limits
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set signcolumn                          " Show column line limit
set colorcolumn=80                      " Column line at 80 characters long
set isfname+=@-@                        " Unsure, add those characters to possible filenames
set cmdheight=1                         " More space for displaying messages
set shortmess+=c                        " Dont pass messages to completiong menu
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler         			            " Show the cursor position all the time
set iskeyword+=-                      	" treat dash separated words as a word text object"
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
set laststatus=0                        " Always display the status line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set updatetime=50                       " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else

" You can't stop me
cmap w!! w !sudo tee %
com! W w
