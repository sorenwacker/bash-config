filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Activate paste mode by default
set paste

autocmd FileType yaml setlocal ai ts=2 sw=2 et

" Move cursor to end of line (Ctrl + e)
nnoremap <C-e> $
" Move cursor to start of line (Ctrl + a)
nnoremap <C-a> 0
" Move cursor to next word (Ctrl + Right Arrow)
nnoremap <C-Right> w
" Move cursor to previous word (Ctrl + Left Arrow)
nnoremap <C-Left> b
" Move cursor to next word (Option or Alt + Right Arrow)
nnoremap <C-Right> w
" Move cursor to previous word (Option or Alt + Left Arrow)
nnoremap <C-Left> b

syntax on         " Turn on syntax highlighting
set background=dark  " Use a dark background
colorscheme desert

