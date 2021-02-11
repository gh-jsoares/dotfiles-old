" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Source init.vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>:call InstallPlugins()<CR>

" Buffer keybinds to navigate and close
nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-q> :bdelete<CR>
" Maybe remove this later?
" nnoremap <TAB> :bnext<CR>
" nnoremap <S-TAB> :bprevious<CR>

" Paste from system register
vnoremap <leader>p "_dP

" Copy to system register
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" CTRL-C to exit insert mode
inoremap <C-c> <esc>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
