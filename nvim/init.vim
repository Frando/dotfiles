let mapleader = ","                                                                                               
let g:mapleader = ","   

" plugins
" -------
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
Plug 'ap/vim-css-color'
Plug 'stephenway/postcss.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'jxnblk/vim-mdx-js'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'shougu/unite.vim'                                                                                           
" Plug 'vimlab/neojs'

call plug#end()

" general
" -------
set mouse=a

" color settings
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
set termguicolors
syntax on
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }


" editor settings
" ---------------

filetype plugin indent on
set autoindent

set backspace=2             " Allow backspacing over autoindent, EOL, etc.
set showmatch               " Match parentheses
set matchpairs+=<:>         "   - also for angle bracket pairs

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround              " Rounds indent to multiple of shiftwidth
" set cindent

" filetype: js

let g:ale_linters = {
\   'javascript': ['standard'],
\}
let g:ale_fixers = {'javascript': ['standard']}
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent smartindent
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent smartindent
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>


" key bindings
" ------------

map <F9> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <A-p> :Rg<CR>
map <leader>r :Rg<CR>
map <leader>b :Buffers<CR>
map <leader>z :Goyo<CR>
noremap <leader><Space> :nohlsearch<CR>

" window nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" easy tab switching
map <C-w>u gT
map <C-w>i gt
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
noremap <leader>w :tabprevious<CR>
noremap <leader>e :tabnext<CR>
" (occupied by tmux)
" map <A-k> :tabprevious<CR>
" map <A-j> :tabnext<CR>
noremap ä :

" plugin settings
" ---------------

let g:deoplete#enable_at_startup = 1
let g:NERDSpaceDelims = 1

