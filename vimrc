" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
"   Tarun Ramakrishna Elankath's vimrc file. Been using VIM for 8 years now. 
"   Re-created from scratch on Aug 20, 2011
"   Re-created from scratch again on Aug 6, 2016, taking the best parts from YADR
"   https://github.com/lenkite/dotfiles
" }
"TODO: Only keep stuff here that is not covered by defaults of tpope/vim-sensible
set number                     " Line numbers are good
set backspace=indent,eol,start " Allow backspace in insert mode
set relativenumber             " Relative line numbers are better
set history=5000               " Store lots of :cmdline history
set showcmd                    " Show incomplete cmds down the bottom
set gcr=a:blinkon0             " Disable cursor blink
set autoread                   " Reload files changed outside vim
set wmh=0                      " Set winminheight to 0 so that
                               " maximizing a window collapses all other windows

set visualbell noerrorbells t_vb= "


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on



" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
  set undolevels=2000         " How many undos
  set undoreload=15000        " number of lines to save for undo
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
"
 set foldmethod=indent   "fold based on indent
 set foldnestmax=3       "deepest fold is 3 levels
 set foldlevel=2
 "set nofoldenable        "dont fold by default


 " ================ Completion =======================
 " "http://vim.wikia.com/wiki/Great_wildmode/wildmenu_and_console_mouse
 
set wildmode=list:longest,full
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=.idea/**
 

"
"" ================ Scrolling ========================

set scrolloff=6         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=8
set sidescroll=1


" ================ Search ===========================
"
 set incsearch       " Find the next match as we type the search
 set hlsearch        " Highlight searches by default
 set ignorecase      " Ignore case when searching...
 set smartcase       " ...unless we type a capital


" =============== Plug Initialization ===============
" This loads all the plugins specified in ~/dotfiles/plugins.vim
" Use vim-plugin plugin to manage all other plugins
if filereadable(expand("~/dotfiles/plugins.vim"))
  source ~/dotfiles/plugins.vim
endif

" Load matchit.vim
if filereadable(expand("$VIMRUNTIME/macros/matchit.vim"))
  source $VIMRUNTIME/macros/matchit.vim
endif

set matchtime=1 "time in tenths of a second to show the matching parenthesis
set showmatch
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source %


source ~/dotfiles/basic-keymap.vim
source ~/dotfiles/unite-config.vim
source ~/dotfiles/snippet-config.vim
source ~/dotfiles/search-and-motion-config.vim
source ~/dotfiles/align-config.vim
source ~/dotfiles/auto-commands.vim
colorscheme solarized


