filetype plugin indent on

set number relativenumber
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'arcticicestudio/nord-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-commentary'
  Plug 'mtth/scratch.vim'
  Plug 'junegunn/fzf'
call plug#end()

com! PU PlugUpdate | PlugUpgrade

" nord color scheme
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
colorscheme nord

" show unsaved changes
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" clear trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" statusline
" always show statusline
set laststatus=2
" buffer number
set statusline=Buf:%(%{&filetype!='help'?bufnr('%'):''}\ \|\ %)
" add full expanded path (without filename) of file, cut from right at 30 chars
set statusline+=%.30{fnamemodify(bufname('%'),':p:h')}/
" add filename
set statusline+=%t
" add modified or RO marker after filename if either true
set statusline+=%{&modified?'\ +\ ':''}
set statusline+=%{&readonly?'\ 🔒\ ':''}
" from here, align the rest to the right
set statusline+=%=
" file type as detected by vim, specifying when none
set statusline+=[%{&filetype!=#''?&filetype:'none'}]
" show file encoding ig
set statusline+=%(\ \|%{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')\.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
" show `et` or `noet` for expandtab on/off. Then, shift width
set statusline+=%(\ \|\ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
" column number
set statusline+=\ \|\ Col:\ %{&number?'':printf('%2d,',line('.'))}
set statusline+=%-2v " Virtual column number if differs
" percentage through file
set statusline+=\ \|\ %2p%%
" total lines
set statusline+=/%L

" treat broken line as separate lines
map j gj
map k gk

" switch between scss, html, ts files
noremap <F2> :e %<.ts<CR>
noremap <F3> :e %<.html<CR>
noremap <F4> :e %<.scss<CR>

" disable backspace and delete
":inoremap <BS> <Nop>
":inoremap <Del> <Nop>

" disable arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" swap colon and semicolon
noremap ; :
noremap : ;

" Preserve selection after indentation
vmap > >gv
vmap < <gv

" set leader key
let mapleader = "\<space>"

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

noremap <leader>fz :FZF<CR>
