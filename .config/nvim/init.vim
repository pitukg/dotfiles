" neovim config file - Gabor Pituk

" Don't use tab characters by default, except for Makefiles
set expandtab
autocmd FileType make setlocal noexpandtab

" Number of spaces for >>
set shiftwidth=2


"""""""""""""""""
" Plugin section"
"""""""""""""""""
call plug#begin()

Plug 'vim-latex/vim-latex'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-commentary'

" Python completion, only works with Python3 in venv
" Plug 'Valloric/YouCompleteMe'

call plug#end()


"""""""""""""""""""""
" vim-latex settings"
"""""""""""""""""""""
let g:tex_flavor='latex'

" spellcheck on latex files
autocmd FileType tex setlocal spell

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_IgnoredWarnings =
    \'Token not allowed in a PDF string (PDFDocEncoding)'."\n".
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'
let g:Tex_IgnoreLevel = 8
let g:Tex_GotoError = 1
let g:Tex_FoldedEnvironments = 'examquestion,'

" Open NERDtree window on start up
augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

