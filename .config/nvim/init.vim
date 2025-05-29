" vim: set tw=100

set nocompatible

" Neovim plugin providers
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

set showcmd                             " Show me my commands

"" Indentation
set smarttab                            " Use tabs when it makes sense
set expandtab                           " Use spaces instead of tabs
set softtabstop=2
set shiftwidth=2                        " 1 tab = 2 spaces
set tabstop=2
set linebreak                           " Hard break lines
set textwidth=160                       " ... on 160 chars
set shiftround
set autoindent                          " When writing, indent for me
set copyindent                          " Follow indent style of file

"" Searching
set ignorecase                          " Make / search ignore case
set smartcase                           " Make / search case sensitive when I use an uppercase letter
set incsearch                           " Incremental search
set hlsearch                            " Highlight search  results

" Code-folding
set foldmethod=syntax
set foldlevelstart=99

" Display whitespace (:set list)
" Configure how to display whitespace
set listchars=trail:·,extends:»,eol:↲,tab:▸\ ,nbsp:+

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes

" Clipboard integration (y will copy to clipboard, p will paste from
" clipboard, etc)
set clipboard+=unnamedplus

" ===========================================================
" GLOBAL KEY BINDINGS & SHORTCUTS
" ===========================================================

let g:mapleader=','

