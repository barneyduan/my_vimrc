" make setting valid immediateliy
autocmd BufWritePost $MYVIMRC source $MYVIMRC

:set tabstop=2
:set shiftwidth=2
:set expandtab
syntax enable

" define the shortcut prefix
let mapleader=";"
nmap lh 0
nmap le $
nnoremap <Leader>wl :<C-W>l
nnoremap <Leader>wh :<C-W>h
nnoremap <Leader>wk :<C-W>k
nnoremap <Leader>wj :<C-W>j
" forward search tag
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>
nnoremap <Leader>sp :CtrlSF<CR>


" Always show the status
set laststatus=2
" Show current ruler
set ruler
" Set line number
" set number
" Set hight light search
set hlsearch

" vundle setting
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'yegappan/grep'
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

" switch *.cpp and *.h
nmap <silent> <Leader>sw :FSHere<cr>

" Set TAGBAR zone
let tagbar_left=1
" show/hide the tag window: identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" set width
let tagbar_width=32
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
