" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

"""""""""""""""COMPATIBILITY:"""""""""""""""""""
"set shell=bash
let mapleader = " "
set encoding=utf-8
set t_Co=256 " enable 256 colors
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""FUNCTIONALITY:"""""""""""""""""
syntax enable " (on) to ignore color customization
set number " show line numbers
"set relativenumber " show relative line numbers
set mouse=a " enable mouse support
set cursorline " show horizontal highlight, also (nocursorline)
set laststatus=2 " always display statusline
set showmatch " highlight matching parenthe
"" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm 
" set whichwrap=b,s,<,>,[,] " traverse line breaks -  useless?
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""SEARCH:""""""""""""""""""""
set incsearch " search as characters are entered
set hlsearch " highlight all searched matches
set ignorecase " to search shit with case insensitive
set smartcase " can still have sensitive search if use uppercase letters
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""TABS AND SPACES:"""""""""""""""
set expandtab  " entered tabs become spaces (softtabs)
set tabstop=4  " tab is long 4
set softtabstop=4  " 4 space tab
set smarttab " special case, ignore if u use all spaces
set shiftwidth=4 " 4 space shift
"
set nocompatible " enable full vim, for next cmd:
filetype indent plugin on " detect TABS/SPACES policy from file automagically
"
set autoindent " copy indentation from prev. line
set smartindent " insert indentation depending on lang struct
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""THEMES:"""""""""""""""""""""
set guifont=Fira\ Mono\ for\ Powerline\ Regular\ 14
colorscheme gruvbox
" colorscheme darkblue
" colorscheme 256-grayvim
let g:airline_theme = "base16"
" GRUVBOX_THEME SPECIFIC:
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"
set background=dark   " or (light)
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""AIRLINE:""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""NERDTREE:"""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""SAVE WITH CTRL KEY:""""""""""""""
nmap <c-s> :update<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
" AN ALTERNATIVE:
"remap <silent> <C-S>          :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""MISC:"""""""""""""""""""""""""
set ttyfast  " faster redraw?
set showcmd " show partial command in bottom bar
set wildmenu " better command line completion
set autochdir " when opening a file, cd to its dir
" set clipboard=unnamed
""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""FOLDING:""""""""""""""""""""""""
 set foldmethod=indent   " fold based on indent level
 set foldnestmax=10      " max 10 depth
 set foldenable          " don't fold files by default on open
 nnoremap <space> za
 set foldlevelstart=10    " start with fold level of 1
""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""???:""""""""""""""""""""""""""
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
""""""""""""""""""""""""""""""""""""""""""""""""







































"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'bling/vim-airline'
  "NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'
NeoBundle 'dag/vim-fish'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/badwolf'

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

