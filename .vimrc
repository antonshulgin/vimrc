set nocompatible
set nocursorline
set backspace=indent,eol,start
set encoding=utf-8
set fileformats="unix,mac,dos"
set nobackup
set clipboard=unnamed
set autochdir
set shortmess+=I
set title
"set lazyredraw
set showmode
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set nowrap
set linebreak
set number
"set relativenumber
set ruler
set laststatus=2
set mousehide
set guioptions=ac
set guioptions-=lLrR
set scrollopt=ver,hor
set scrolloff=16
set sidescrolloff=16
set sidescroll=1
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set directory=~/.vim/tmp/

set swb=usetab
syntax on

" Folding
set foldmethod=indent
nnoremap zl :foldopen<CR>
nnoremap zh :foldclose<CR>

" Custom matching pairs
set matchpairs+=<:>

" Custom keywords
set iskeyword+=-

" Workaround for vim-jade iskeyword
au BufEnter * set iskeyword-=.

" EcmaScript 6
au BufRead,BufNewFile *.es6 set filetype javascript

" Default statusline + the filetype tag
set statusline=%<%F\ %y%h%m%r%=%-14.(%l,%c%V%)\ %P\ %{fugitive#statusline()}
set fillchars+=stl:-,stlnc:-

" Remap <Leader> to ,
let mapleader = ','

" Command mode on ; instead of :
nnoremap ; :
vnoremap ; :

" Switch between tabs with t-h/t-l
nnoremap tl :tabnext<CR>
nnoremap th :tabprevious<CR>

" Switch between windows with g-hjkl
nnoremap gh :wincmd h<CR>
nnoremap gj :wincmd j<CR>
nnoremap gk :wincmd k<CR>
nnoremap gl :wincmd l<CR>

" Jump to start/end of line
nnoremap mh ^
vnoremap mh ^
nnoremap ml $
vnoremap ml $

" Diff stuff
map <silent> <Leader>d :set diff<CR>:set scrollbind<CR>
map <silent> <Leader>D :set nodiff<CR>:set noscrollbind<CR>

" open stuff
map <silent> <Leader>o :!open %<CR>

" JK-ing through wrapped lines.
noremap j gj
noremap k gk

" Time-savers
ino "" ""<Left>
ino '' ''<Left>
ino `` ``<Left>
ino <> <><Left>
ino () ()<Left>
ino [] []<Left>
ino {} {}<Left>
ino (<CR> (<CR>)<Esc>O
ino [<CR> [<CR>]<Esc>O
ino {<CR> {<CR>}<Esc>O

" Get to normal mode by hitting <leader> key twice
ino <leader><leader> <Esc>
" Or kj
ino kj <Esc>

" Exit current brackets
ino <S-Space> <Esc>l%%a

" NERDTree
let g:NERDTreeChDirMode=1
let g:NERDTreeWinSize = 40 

" NERDTreeTabs
map <silent> <Leader>n :NERDTreeTabsToggle<CR>

" TagBar
let g:tagbar_left = 1
let g:tagbar_width = 40
let g:tagbar_sort = 1
let g:tagbar_autofocus = 1
map <silent> <Leader>t :TagbarToggle<CR>

" Syntastic
"let g:syntastic_error_symbol='E→'
"let g:syntastic_warning_symbol='W→'
let g:syntastic_error_symbol='→'
let g:syntastic_warning_symbol='→'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute']

" AutoComplPop
let g:acp_behaviorKeywordLength = 1
let g:acp_ignorecaseOption = 1

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

" vim-session
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Show whitespace stuff
set list
set listchars=eol:¬,tab:\|\ 

if has("gui_running")
	"colorscheme kitamorkonom
	colorscheme monokromatik
	set columns=120
	set lines=30
	set linespace=0
	set guifont=Monaco:h10
else
  colorscheme kitamorkonom
endif

" Autoresize current buffer
function! ExpandCurrentBuffer()
	wincmd=
	let &winheight = &lines * 2/3
	let &winwidth  = &columns * 2/3
endfunction

au WinEnter * call ExpandCurrentBuffer()

" Maximize current buffer by ff
function! MaximizeCurrentBuffer()
	wincmd=
	let &winheight = &lines
	let &winwidth  = &columns
endfunction

nnoremap ff :call MaximizeCurrentBuffer()<CR>

" Omnicompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,xslt setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" JSDoc
let g:jsdoc_allow_input_prompt = 1

" Vundle config
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-surround'
Bundle 'https://github.com/terryma/vim-multiple-cursors'
Bundle 'https://github.com/tpope/vim-fugitive'

Bundle 'https://github.com/xolox/vim-session'
Bundle 'https://github.com/xolox/vim-misc'

Bundle 'othree/html5.vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'othree/xml.vim'
"Bundle 'https://github.com/gorodinskiy/vim-coloresque'
Bundle 'https://github.com/ap/vim-css-color'
Bundle 'https://github.com/JulesWang/css.vim'

Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'https://github.com/heavenshell/vim-jsdoc'

Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'

" Autocompletion
Bundle 'https://github.com/othree/vim-autocomplpop'
Bundle 'https://github.com/burnettk/vim-angular'
Bundle 'https://github.com/othree/javascript-libraries-syntax.vim'
Bundle 'https://github.com/matthewsimo/angular-vim-snippets'
Bundle 'https://github.com/garbas/vim-snipmate'
Bundle 'https://github.com/ervandew/supertab'

" Utilities
" L9 is needed in order to make AutoComplPop work
Bundle 'https://github.com/eparreno/vim-l9'

" The stuff below is required by snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

filetype on
filetype plugin on
filetype indent on
