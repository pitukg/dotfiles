" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""~ PLUGINS ~"""""""""""""""""""""""""""""""""""""
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
  let g:airline_powerline_fonts = 1


  " Better language syntax support
  Plugin 'sheerun/vim-polyglot'

  " Comment stuff out
  Plugin 'tpope/vim-commentary'
  " Comment toggle
  map <silent> <C-/> :Commentary<CR>
  imap <silent> <C-/> <Esc>:Commentary<CR>

  " plugin for LaTeX live preview editing
  " Plugin 'xuhdev/vim-latex-live-preview'
  " Vim - LaTeX Live Preview settings
  " autocmd Filetype tex setl updatetime=1
  " let g:livepreview_previewer = 'open'

  " plugin for LaTeX support
  Plugin 'vim-latex/vim-latex'
  let g:tex_flavor='latex'
  let g:Tex_DefaultTargetFormat='pdf'
  let g:Tex_ViewRul_pdf='xdg-open'

  " syntax highlighting for kitty terminal emulator config
  Plugin 'fladson/vim-kitty'

  " plugin for file tree
  Plugin 'preservim/nerdtree'

  " All of your Plugins must be added before the following line
call vundle#end()            " required

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

""""""""""""""""""""""""""""""~ CONTROLS ~"""""""""""""""""""""""""""""""""""""
set mouse=a

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


""""""""""""""""""""""""""""""~ FILES ~"""""""""""""""""""""""""""""""""""""
" Use file-specific syntax
syntax on
" Load file-specific plugin and indent file
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Allow saving of files as sudo
cmap w!! w !sudo tee > /dev/null %

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup  " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile  " keep an undo file (undo changes after closing)
  endif
endif

""""""""""""""""""""""""""""""~ APPEARANCE ~"""""""""""""""""""""""""""""""""""""
" Line numbering
set relativenumber
set cursorline

" Show tabs
set list
set listchars=tab:>-

" Color scheme
colorscheme onedark
let g:airline_theme='onedark'
hi Comment ctermfg=36
hi Folded ctermfg=30

" Cursor shapes
let &t_SI = "\e[6 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[2 q"

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
  " Clear search on double Esc
  map <silent> <Esc><Esc> :noh<CR>
endif

