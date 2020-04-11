" opfez's vimrc


" Basic setup
set nocompatible
set number relativenumber
set encoding=utf-8
syntax on
filetype plugin on
set showcmd

" Plugins
" vim-plug check
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plugin 'VundleVim/Vundle.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'gorodinskiy/vim-coloresque'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'noahfrederick/vim-noctu'

call plug#end()

" Theme
set t_Co=256
colorscheme 256_noir

"set notermguicolors t_Co=16
"colorscheme noctu

" Maps
map <Space> <Leader>
map <Leader>f :Goyo<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>ms :MarkdownPreview<CR>
map <Leader>md :MarkdownPreviewStop<CR>
inoremap ,t <C-V><Tab>

" Tab stuff
set autoindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" File search
set path+=**
set wildmenu

" NERDTree
let NERDTreeQuitOnOpen = 1 " Closes NERDTree when you open a file

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1 " Makes it look pwetty.

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1


" Miscellaneous
"inoremap jj <Esc>
