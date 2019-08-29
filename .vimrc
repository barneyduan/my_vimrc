set encoding=utf-8
" make setting valid immediateliy
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Global setting
:set ignorecase "ignore the case
:set nocompatible " disenbale the vi mode
:set tabstop=2 " tab -> spaces
:set shiftwidth=2
:set ts=2
:set expandtab
:set backspace=2
:set colorcolumn=80 "enable a color column at 80
" select the color
highlight ColorColumn ctermbg=0
syntax enable
colorscheme monokai

" define the shortcut prefix
let mapleader=" "
nmap lh 0
nmap le $
" forward search tag
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>
nnoremap <Leader>sp :CtrlSF<CR>
nnoremap <leader>dwp :StripWhitespace<CR>
nnoremap <leader>ss :update<CR>

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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'yegappan/grep'
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Lokaltog/vim-easymotion'
call vundle#end()
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

" YCM definition zone
let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
"let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tags_files=1
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
set tags+=/usr/include/c++/7.4.0/stdcpp.tags
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=1
"let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
let g:ycm_key_list_select_completion=['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion=['<c-k>', '<Up>']

" UltiSnips Zone
let g:UltiSnipsSnippetDirectories=['mysnippets']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEnableSnipMate=0


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

