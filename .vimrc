" opfez's vimrc

" Leader
map <space> <leader>

" Basic setup
set nocompatible
set number relativenumber
set encoding=utf-8
syntax on
filetype plugin on
set showcmd
set ignorecase
set smartcase   " only use case-sensitive search when you want to
set cursorline  " highlights current line
set mouse=a     " lets me copy text with the mouse correctly
set clipboard+=unnamedplus   " system clipboard

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
Plug 'tpope/vim-surround'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'noahfrederick/vim-noctu'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" Theme
"set termguicolors
colorscheme jellybeans

"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox

"set t_Co=256
"colorscheme 256_noir

"set notermguicolors t_Co=16
"colorscheme noctu

hi Normal guibg=NONE ctermbg=NONE

" Maps
map <leader>f :Goyo<cr>
map <leader>t :NERDTreeToggle<cr>
map <leader>m <plug>MarkdownPreviewToggle
map <leader>n :set number! relativenumber!<cr>
map <leader>c :setlocal formatoptions-=cro<cr>
map <leader>C :setlocal formatoptions=cro<cr>
map <leader>s :s//gI<left><left><left>
map <leader>l :LLPStartPreview
map <leader>d :w<cr>
map <leader>ss :set nospell
map <leader>se :setlocal spell spelllang=en_us
map <leader>sr :setlocal spell spelllang=ru
map <leader>gd <plug>(coc-definition)
map <leader>gr <plug>(coc-references)
inoremap >t <C-V><Tab>

" Split navigation maps
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" Live LaTeX previewer
let g:livepreview_previewer = 'zathura'

" Miscellaneous
"inoremap jj <Esc>
