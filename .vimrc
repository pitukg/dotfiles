" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color scheme
Plugin 'joshdick/onedark.vim'

" Airline status bar
Plugin 'vim-airline/vim-airline'

" Better language syntax support
Plugin 'sheerun/vim-polyglot'

" Comment stuff out
Plugin 'tpope/vim-commentary'

" plugin for LaTeX live preview editing
" Plugin 'xuhdev/vim-latex-live-preview'

" plugin for LaTeX support
Plugin 'vim-latex/vim-latex'

" plugin for file tree
Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Vim - LaTeX Live Preview settings
" autocmd Filetype tex setl updatetime=1
" let g:livepreview_previewer = 'open'

let g:tex_flavor='latex'

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Syntax highlighting
filetype plugin indent on
syntax on

" Color scheme
colorscheme onedark
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" Line numbering
set relativenumber
set cursorline

" Clear search on double Esc
map <silent> <Esc><Esc> :noh<CR>

" Comment toggle
map <silent> <C-_> :Commentary<CR>
imap <silent> <C-_> <Esc>:Commentary<CR>

" Cursor shapes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

set mouse=a

