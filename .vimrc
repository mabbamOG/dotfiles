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

"set shell=bash
set encoding=utf-8
set t_Co=256

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

"" SOME OPTIONS I'M ENABLING FOR MYSELF.....
syntax on
set incsearch
set hlsearch
set background=dark "really needed???
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"set relativenumber
set cursorline
set ignorecase " to search shit with case insensitive
set smartcase " can still have sensitive search if use uppercase letters
set laststatus=2
set mouse=a " enable mouse support
set whichwrap=b,s,<,>,[,] " traverse line breaks
set guifont=Fira\ Mono\ for\ Powerline\ Regular\ 14
"colorscheme darkblue
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab "" Could be used for programming...
set t_Co=256 " for mah 256 colorrrssss
set autochdir

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/mad/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/mad/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'bling/vim-airline'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" MY shiiiit
NeoBundle 'dag/vim-fish'
NeoBundle 'scrooloose/nerdtree'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

""" AIRLINE:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
""" GRUVBOX_THEME:
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"
set background=dark   " Setting light mode
""" THEMES:
colorscheme gruvbox "darkblue is also cool
let g:airline_theme = "base16"
""" NERDTREE_TOGGLE:
map <C-n> :NERDTreeToggle<CR>
""" SAVE WITH KEY:
nmap <c-s> :update<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
"""
