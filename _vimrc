" basic setting
au GUIEnter * simalt ~x
set shell=cmd.exe
set shellcmdflag=/c
set shellxquote=
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set number
set relativenumber
set tabstop=4
colorscheme desert
set clipboard+=unnamedplus
set guioptions+=a
syntax enable
syntax on
let mapleader=","
" keymap
inoremap jk <Esc>
nnoremap fw :w<CR>
nnoremap j gj
nnoremap k gk
nnoremap fe $
nnoremap fs ^
nnoremap <Leader>f <C-f>
nnoremap <Leader>b <C-b>
nnoremap <Leader>s :%s/
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap qq :wq<Esc>
nnoremap <F5> :source $MYVIMRC<CR>
vnoremap jk <Esc>
vnoremap j gj
vnoremap k gk
vnoremap fe $
vnoremap fs ^
vnoremap <Leader>f <C-f>
vnoremap <Leader>b <C-b>
" latex
nnoremap <Leader>ll :!latexmk -pdf -pvc -view=none % & latexmk -c % & del /q %:r.nav %:r.snm<CR>
nnoremap <Leader>lv :!start "C:\Users\Administrator\AppData\Local\SumatraPDF\SumatraPDF.exe" %<.pdf <CR>
" python
nnoremap <Leader>db :!python -m pdb % <CR>
