set encoding=utf-8
" make setting valid immediateliy
autocmd BufWritePost $MYVIMRC source $MYVIMRC
autocmd FileType json syntax match Comment +\/\/.\+$+

" Global setting
set ignorecase "ignore the case
set nocompatible " disenbale the vi mode
set tabstop=2 " tab -> spaces
set shiftwidth=2
set ts=2
set expandtab
set backspace=2
set colorcolumn=80 "enable a color column at 80
" select the color
highlight ColorColumn ctermbg=0
syntax enable
colorscheme monokai

" define the shortcut prefix
let mapleader=" "
" forward search tag
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>
nnoremap <Leader>sp :CtrlSF<CR>
nnoremap <leader>dwp :StripWhitespace<CR>
nnoremap <leader>ss :update<CR>
set runtimepath^=~/.vim/plugged/bbye
nnoremap <leader>q :Bdelete<CR>

" Always show the status
set laststatus=2
" Show current ruler
set ruler
" Set line number
set number
" Set hight light search
set hlsearch
set cursorline

" vundle setting
filetype off
call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'yegappan/grep'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-powerline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
filetype plugin indent on

" switch *.cpp and *.h
nmap <silent> <Leader>sw :FSHere<cr>

let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
let g:indexer_disableCtagsWarning=1
" NodeTree : file list
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" CtrlP definition Zone
let g:ctrlp_map='<c-p>'
let g:ctrlp_working_path_mode='ra'
" ignore the files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_switch_buffer = 'et'

" window bar definition
map <leader>bl :MBEToggle<cr>
nnoremap <c-l> :MBEbn<cr>
nnoremap <c-h> :MBEbp<cr>

" coc-vim configuration
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>jy <Plug>(coc-type-definition)
nmap <silent> <leader>ji <Plug>(coc-implementation)
nmap <silent> <leader>jr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
