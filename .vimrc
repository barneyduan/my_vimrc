set encoding=utf-8
" make setting valid immediateliy
autocmd BufWritePost $MYVIMRC source $MYVIMRC


" Global setting
set ignorecase "ignore the case
set nocompatible " disenbale the vi mode
set tabstop=2 " tab -> spaces
set shiftwidth=2
set ts=2
set expandtab
set backspace=2
set colorcolumn=80 "enable a color column at 80
set fdm=marker
" select the color
highlight ColorColumn ctermbg=0

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
"set statusline^=%{coc#status()}

" vundle setting
filetype off
call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'derekwyatt/vim-fswitch'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
"Plug 'yegappan/grep'
Plug 'mileszs/ack.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Lokaltog/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dag/vim-fish'
Plug 'ericbn/vim-relativize'
Plug 'Raimondi/delimitMate'
Plug 'KKPMW/sacredforest-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-surround'
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
" let g:ctrlp_map='<c-p>'
" let g:ctrlp_working_path_mode='ra'
" ignore the files in .gitignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_switch_buffer = 'et'

" window bar definition
map <leader>bl :MBEToggle<cr>
nnoremap <c-l> :MBEbn<cr>
nnoremap <c-h> :MBEbp<cr>

" fzf definition zone
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -e ' .shellescape(<q-args>) . ' '. systemlist('git rev-parse --show-toplevel')[0], 1, fzf#vim#with_preview(), <bang>0)
map <Leader>rg :Rg<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]})
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>ag :Ag<CR>

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
" enable relative line number
set relativenumber

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

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ }
      \ }
function! LightlineFilename()
  return expand('%')
endfunction
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.colorscheme = 'sacredforest'

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
" Apply AutoFix to problem on the current line
nmap <silent> <leader>ff <Plug>(coc-fix-current)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Do default action for next item.
nnoremap <silent> <space>nn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>pp  :<C-u>CocPrev<CR>
" Resume latest coc list.

autocmd BufNewFile leetcode_*.cpp 0r ~/.vim/template/template.cpp
autocmd BufNewFile /home/s3101/code/barney/gim/*.cpp 0r /home/s3101/code/barney/gim/.vim-template:.cpp
autocmd BufNewFile /home/s3101/code/barney/gim/*.hpp 0r /home/s3101/code/barney/gim/.vim-template:.hpp
autocmd BufNewFile /home/s3101/code/agora/access_point/*.h 0r /home/s3101/code/agora/access_point/.ap-vim-template.h
autocmd BufNewFile /home/s3101/code/agora/access_point/*.cpp 0r /home/s3101/code/agora/access_point/.ap-vim-template.cpp

let g:go_bin_path = "/usr/local/go/bin/"

set termguicolors
syntax enable
filetype plugin indent on
colorscheme codedark
