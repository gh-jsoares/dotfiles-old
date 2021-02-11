" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

fun! InstallPlugins()
    if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        PlugInstall --sync
    endif
endfun

autocmd VimEnter * :call InstallPlugins()

call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Change dates fast
    Plug 'tpope/vim-speeddating'
    " Better undo with a tree
    Plug 'mbbill/undotree'
    " Themes: Gruvbox
    Plug 'gruvbox-community/gruvbox'
    " Themes: Ayu
    Plug 'ayu-theme/ayu-vim'
    " Indent lines
    Plug 'Yggdroot/indentLine'
    " Code completion with CoC
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
