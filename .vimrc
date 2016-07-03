" Tim's .vimrc file
"  Remember if something is not working correctly to check for 32-bit/64-bit
"  inconsistencies among all components

set nocompatible

"execute pathogen#infect()
"filetype off  " necessary when installing bundles
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
syntax enable 

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" list Plugins here before vundle#end
"Plugin 'Command-T'

" All plugins must be added above this point
"call vundle#end()
filetype plugin indent on

"Colorscheme
"set background=dark
"colorscheme solarized
"color zenburn

"******************************
"Vim Settings
"******************************
set nu				" Show line numbers
set hidden  			" Hides buffers instead of closing
set nowrap			" Don't wrap lines
set sidescroll=1
set backspace=indent,eol,start	" allow backspacing over everything in insert
set autoindent 			
set copyindent			" Copy the previous indentation 
set shiftwidth=4		" number of spaces to use for autoindenting
set ignorecase			" ignore case when searching
set incsearch			" show search matches as you type
set smartcase			" ignore case if search pattern is all
				" lowercase, case-sensitive otherwise
set hlsearch			" highlight search terms
set showmatch
"set cursorline
set ruler
set title
set showcmd
set history=1000
set undolevels=1000
set pastetoggle=<F2>		" For ignoring smart indents when pasting
set wildmenu                   " Better commandline completion
set wildmode=longest:full,full " Expand match on first Tab complete
				" Show detailed info in status line
set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v][%p%%\ line\ %l\ of\ %L]
"set mouse=a
vmap <C-c> "+y


" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
set tabstop=8               " DON"t CHANGE, leave as 8.  use softtab. 
set softtabstop=4
set shiftround              " round indent to multiple of shiftwidth
set expandtab               " insert spaces when hitting TABs
set encoding=utf-8
set textwidth=80            " Automatically wrap text at 80 chars
set formatoptions+=t        " Wrap text at word boundaries 
set wrapmargin=2
set noerrorbells visualbell t_vb=
set clipboard=unnamedplus   " automatically used system clipboard for copy/paste

autocmd GUIenter * set visualbell t_be=

" Key Mappings
let mapleader=","
nnoremap ; :
nnoremap j gj			" Cursor jumps to next row in editor instead
nnoremap k gk			"  of next line # (i.e. line wrap)
:inoremap jk <Esc>
:vnoremap jk <Esc>
nmap <silent> ,/ :nohlsearch<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" turn off menu bar, tool bar, and scroll bars
:set guioptions-=m
:set guioptions-=T
:set guioptions-=R
:set guioptions-=L

"for quick opening/reloading of .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR> 
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Start GVIM Maximized
au GUIEnter * simalt ~x

if has("autocmd")
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif
:inoremap <C-c> <nop>           "Disable escaping with <C-c> since 
                                " it messes up with the above cursor switches

" Set font
set guifont=Consolas:h11:cANSI

"These three lines are required for Vim-Latex to work correctly
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'evince'


" Note that latex configuration settings are in C:\Users\trthomas\Vim\vimfiles\bundle\vim-latex\ftplugin\tex.vim
