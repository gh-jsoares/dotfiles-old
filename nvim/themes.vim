fun! ColorMyPencils()
    colorscheme ayu 
    " colorscheme gruvbox 
    set background=dark
    syntax on

    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    highlight ColorColumn ctermbg=none guibg=grey
    highlight Comment cterm=italic
    highlight Normal guibg=none
    " For gruvbox
    " highlight LineNr guifg=#ff8659
    " For Ayu
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
endfun
call ColorMyPencils()

" Vim with me
nnoremap <leader>vwm :call ColorMyPencils()<CR>
