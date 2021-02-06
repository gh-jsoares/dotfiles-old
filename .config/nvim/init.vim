" Plugins
call plug#begin('~/.vim/plugged')
" FZF stuff
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
" Theme
Plug 'gruvbox-community/gruvbox'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Coc
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

source ~/.config/nvim/plugin/sets.vim
source ~/.config/nvim/plugin/colors.vim
source ~/.config/nvim/plugin/airline.vim
source ~/.config/nvim/plugin/fzf.vim
source ~/.config/nvim/plugin/coc.vim
source ~/.config/nvim/plugin/gmlua.vim

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END

augroup trim_whitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
