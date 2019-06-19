let mapleader = ","                                                                                               
let g:mapleader = ","   

call plug#begin('~/.local/share/nvim/plugged')

" Plugins
" -
" General
Plug 'Shougo/denite.nvim'

" UI
Plug 'itchyny/lightline.vim' " a status line
" Plug 'vim-airline/vim-airline'

" Tree and files
"
"   a file browser
Plug 'scrooloose/nerdtree', { }
"   icons in the file browser
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"   use - for quick dir nav
Plug 'tpope/vim-vinegar'
"   fuzzy file search!
Plug 'junegunn/fzf.vim'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'rafaqz/ranger.vim'

"   :Ack for multi-file search
Plug 'wincent/ferret'

" Windows 
"   a scratch window
" Plug 'mtth/scratch.vim'

" VCS
"   git integration - :G... commands
Plug 'tpope/vim-fugitive'


" Editor
" -
"
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"   autocoomplete with tab
Plug 'ervandew/supertab'

" Plug 'Yggdroot/indentLine' " maybe needs patched font?
" (does not work properly - some lines are missing)

" Colors
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Javascript etc
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'jxnblk/vim-mdx-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
Plug 'jonsmithers/vim-html-template-literals'
" Plug 'pangloss/vim-javascript' (included in vim-polyglot)
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
" Plug 'maxmellon/vim-jsx-pretty'

" GraphQL
Plug 'jparise/vim-graphql'

" CSS
Plug 'ap/vim-css-color'
Plug 'stephenway/postcss.vim'

" Reason
Plug 'jordwalke/vim-reasonml'

" Faust
Plug 'gmoe/vim-faust'

" other
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'easymotion/vim-easymotion'

call plug#end()

" general settings
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
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" let g:airline_powerline_fonts = 1
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"


" editor settings

filetype plugin indent on
set autoindent

set number

set backspace=2             " Allow backspacing over autoindent, EOL, etc.
set showmatch               " Match parentheses
set matchpairs+=<:>         "   - also for angle bracket pairs

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround              " Rounds indent to multiple of shiftwidth
set foldlevelstart=99

set hidden

" set cindent

" filetype: js

let g:ale_linters = {
  \   'javascript': ['standard'],
  \ }
let g:ale_fixers = {'javascript': ['standard']}

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent smartindent
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent smartindent
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab autoindent

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" let g:javascript_conceal_function             = "ƒ"
" let g:javascript_conceal_null                 = "ø"
" let g:javascript_conceal_this                 = "@"
" let g:javascript_conceal_return               = "⇚"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

let g:vim_jsx_pretty_colorful_config = 1 

map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=2"<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" filetype: markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1


" filetype: rust
let g:rustfmt_autosave = 1
" let g:racer_cmd = "$HOME/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>d <Plug>(rust-doc)

" key bindings
" ------------

noremap ä :

" NERDTree
map <F9> :NERDTreeToggle<CR>
map <leader>a :NERDTreeFind<CR>

" fzf
map <C-p> :Files<CR>
map <A-p> :Files ..<CR>

noremap <leader>b :Buffers<CR>
noremap <leader>z :Goyo<CR>
noremap <leader>f :Files<CR>
noremap <leader>g :Files ..<CR>

" Rg
map <leader>r :Rg<CR>
map <leader>t :Rg ..<CR>

" Ale

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
noremap <leader><leader>f :ALEFix<CR>

" window nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easy tab switching
" map <C-K> gt
" map <C-J> gT
map <C-w>u gT
map <C-w>i gt
"nnoremap <A-S-u> :tabprevious<CR>
"nnoremap <A-S-i> :tabnext<CR>
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

" noremap <C-1> 1gt
" noremap <C-2> 2gt
" noremap <C-3> 3gt
" noremap <C-4> 4gt
" noremap <C-5> 5gt
" noremap <C-6> 6gt
" noremap <C-7> 7gt
" noremap <C-8> 8gt
" noremap <C-9> 9gt
" (occupied by tmux)
" map <A-k> :tabprevious<CR>
" map <A-j> :tabnext<CR>

" imap <S-Tab> 

" fold level navigation
noremap <leader>f ]z
noremap <leader>d [z


" plugin settings

let g:deoplete#enable_at_startup = 1

let g:NERDSpaceDelims = 1

let g:scratch_persistence_file = "/home/bit/.local/share/nvim/scratch.vim"

" lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" nerdcommenter

let g:NERDDefaultAlign = 'left'

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ale


" better folding and search colors color
hi Folded guibg=#262729
hi Folded guifg=#61afef
hi Search guifg=#e5c07b
hi Search guibg=#444444

" Filter command
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" macros
" require -> import
let @x = '^dwiimport t=lxifromwdwxt''llxj^'

let @s = 'i```sh```ko'
