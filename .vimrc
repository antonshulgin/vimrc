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
set lazyredraw
set ttyfast
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
set ruler
set laststatus=2
set mousehide
set guioptions=ac
set guioptions-=lLrR
set scrollopt=ver,hor
set scrolloff=32
set sidescrolloff=16
set sidescroll=1
set tabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
set directory=~/.vim/tmp/
set exrc
set secure
set noswapfile
set t_ut=
set t_Co=256
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

" Default statusline + the filetype tag
set statusline=%<%F\ %y%h%m%r\ %=\ %-14.(%l,%c%V\ %)\ %P\ %{fugitive#statusline()}
set fillchars+=stl:=,stlnc:=

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

" Diff stuff
map <silent> <Leader>d :set diff<CR>:set scrollbind<CR>
map <silent> <Leader>D :set nodiff<CR>:set noscrollbind<CR>

" open stuff
map <silent> <Leader>o :!open %<CR>

" JK through wrapped lines.
noremap j gj
noremap k gk

" Better jumping through blocks
noremap <C-j> }}k{j^
noremap <C-k> {{j^

" Jump inside brackets quote marks and stuff as you type them
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

" Get to normal mode
ino kj <Esc>

" Exit current brackets
ino <S-Space> <Esc>l%%a
ino <Leader><Leader> <Esc>l%%a

" Show whitespace stuff
set list
set listchars=eol:¬,tab:\|\ 

if has("gui_running")
	set colorcolumn=80
	set columns=180
	set lines=60
	set linespace=-1
	set guifont=Input_Mono:h10
endif

" Make everything look bright and classy
function! SetDayLook()
	colorscheme day
	let g:current_daytime = 'day'
endfunction

" Make everything look dark and comfy
function! SetNightLook()
	colorscheme night
	let g:current_daytime = 'night'
endfunction

" Toggle between looks
function! ToggleLook()
	if g:current_daytime == 'day'
		call SetNightLook()
	else
		call SetDayLook()
	endif
endfunction

nnoremap <Leader>z :call ToggleLook()<CR>

" On startup check what time is it, set appropriate look
function! AdjustLook()
	let current_hour = system('date "+%H"')
	if (current_hour > 6) && (current_hour < 18)
		call SetDayLook()
	else
		call SetNightLook()
	endif
endfunction

call AdjustLook()

" Autoresize current buffer
function! ExpandCurrentBuffer()
	wincmd=
	let &winheight = &lines * 2/3
	let &winwidth  = &columns * 1/2
endfunction

au WinEnter * call ExpandCurrentBuffer()

" Maximize current buffer by ff
function! MaximizeCurrentBuffer()
	wincmd=
	let &winheight = &lines
	let &winwidth  = &columns
endfunction

nnoremap ff :call MaximizeCurrentBuffer()<CR>

" Vundle config
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'https://github.com/gmarik/vundle'

" Syntax stuff
Bundle "https://github.com/sheerun/vim-polyglot"

" NERDTree
Bundle 'https://github.com/scrooloose/nerdcommenter'
Bundle 'https://github.com/scrooloose/nerdtree'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeChDirMode = 2
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeCascadeOpenSingleChildDir = 0

" NERDTreeTabs
Bundle 'https://github.com/jistr/vim-nerdtree-tabs'
map <silent> <Leader>n :NERDTreeTabsToggle<CR>
map <silent> <Leader>N :NERDTreeFind<CR>

Bundle 'https://github.com/tpope/vim-surround'
Bundle 'https://github.com/terryma/vim-multiple-cursors'
Bundle 'https://github.com/tpope/vim-fugitive'

" vim-gutter
Bundle 'https://github.com/airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1
map <silent> <Leader>g :GitGutterToggle<CR>

" Local .vimrc support
Bundle 'https://github.com/krisajenkins/vim-projectlocal'

" Syntastic
Bundle 'https://github.com/vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = 'E→'
let g:syntastic_warning_symbol = 'W→'
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute']
let g:syntastic_javascript_checkers = ['jshint']

" AutoComplPop
" L9 is needed in order to make AutoComplPop work
Bundle 'https://github.com/eparreno/vim-l9'
Bundle 'https://github.com/othree/vim-autocomplpop'
let g:acp_behaviorKeywordLength = 1
let g:acp_ignorecaseOption = 1

" SuperTab
Bundle 'https://github.com/ervandew/supertab'
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'

filetype on
filetype plugin on
filetype indent on
