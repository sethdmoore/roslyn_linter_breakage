set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

call plug#begin('~/.vim/plugged')
    " Plug 'w0rp/ale'
    Plug 'OmniSharp/omnisharp-vim'
call plug#end()

let g:OmniSharp_server_stdio = 1

" let g:OmniSharp_server_path = '/opt/roslyn-1.32.0/run'
let g:OmniSharp_server_path = '/opt/roslyn-1.34.4/run'
