au GUIEnter * simalt ~x
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions+=a
set number
set relativenumber
set clipboard=unnamedplus
set tabstop=2
colorscheme desert
syntax enable
syntax on
let mapleader=","
let g:netrw_keepdir = 1
inoremap jk <Esc>
nnoremap fw :w<CR>
nnoremap j gj
nnoremap k gk
nnoremap fe $
nnoremap fs ^
nnoremap <Leader>f <C-f>
nnoremap <Leader>b <C-b>
nnoremap <Leader>r :%s/
nnoremap <Leader>e :e 
nnoremap <Leader>s :saveas 
nnoremap <Leader>w :w 
nnoremap bn :bnext<CR>
nnoremap bp :bprevious<CR>
nnoremap bd :bdelete<CR>
nnoremap qq :wq<Esc>
nnoremap <F5> :source $MYVIMRC<CR>
vnoremap jk <Esc>
vnoremap j gj
vnoremap k gk
vnoremap fe $
vnoremap fs ^
vnoremap <Leader>f <C-f>
vnoremap <Leader>b <C-b>
nnoremap <Leader>ll :cd %:p:h<CR>:w<CR>:!latexmk -pdf -pvc -view=none % && rm -f *.aux *.log *.out *.toc *.lof *.lot *.blg *.fls *.fdb_latexmk<CR>
nnoremap <Leader>lv :cd %:p:h<CR>:!zathura %<.pdf & disown<CR>
nnoremap <Leader>pd :!python -m pdb % <CR>
nnoremap <Leader>ld :cd ~/Lean4/lean4proj<CR>:!lake env lean --run %:p<CR>
