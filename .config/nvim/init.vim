" Plugins
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

source ~/.config/nvim/plugin/sets.vim
source ~/.config/nvim/plugin/colors.vim
source ~/.config/nvim/plugin/telescope.vim

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
