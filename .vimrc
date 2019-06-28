" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.


runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
"! set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"lets reset autocmd commands
"autocmd!

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'rip-rip/clang_complete'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'chazy/cscope_maps'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-sensible'
Plugin 'mileszs/ack.vim'

"Plugin 'autoproto.vim'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has("syntax")
  syntax on
endif


" All of your Plugins must be added before the following line
filetype plugin indent on    " requiredt the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"colorscheme desert256
let g:rehash256 = 1
colorscheme molokai
"hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
set background=dark
hi MatchParen cterm=underline,bold ctermbg=black ctermfg=green


set conceallevel=3
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'
"let g:clang_user_options = "-std=c++11 -stdlib=libc++"
let g:clang_user_options = "-std=c++14"
let g:clang_hl_errors=1


set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2





" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Limit popup menu height
set pumheight=20

 " SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"let g:SuperTabDefaultCompletionType='<c-x><c-o>'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-x><c-o>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u><c-p>") |
  \ endif

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
vmap <c-t> :call UltiSnips#SaveLastVisualSelection()<CR>gvs

let g:airline_theme='aurora'
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
let mapleader = ","
nnoremap <silent><leader>n :NERDTree<cr>
nnoremap <silent><leader>t :NERDTreeToggle<cr>
nnoremap <silent><leader><leader>t :NERDTreeVCS<cr>
nnoremap <silent><leader>f :NERDTreeFocus<cr>
nnoremap <silent><leader>s :w<cr>:TmuxNavigateRight<cr> 

vnoremap <silent><leader>c "+y<cr>
vnoremap <silent><leader>x "+ygvd<cr>
nnoremap <silent><leader>v :set paste<cr>"+p :set paste!<cr>
nnoremap <leader><leader>c :call ClangUpdateQuickFix()<cr> :copen<cr> 

"save as sudo 
nnoremap ZZ :w !sudo tee %:p<cr> 

"nnoremap <leader>q :q<cr>
nnoremap <F8> :TagbarToggle<CR>

nnoremap <F5> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.h' -o -iname '*.hpp' > cscope.files && cscope -b -i cscope.files -f cscope.out<CR>
      \:cs reset<CR>

nnoremap <tab> :tn<cr>
nnoremap <S-tab> :tp<cr>

let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:AutoPairsMapCR=0

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"tmux navigator mappings
 let g:tmux_navigator_no_mappings = 1
 nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
 nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
 nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
 nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
 "nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>
 "nmap <c-;> :TmuxNavigatePrevious<cr>

":smap <C-j> <Plug>snipMateBack
":imap <C-j> <Plug>snipMateBack
":smap <C-k> <Plug>snipMateNextOrTrigger
":imap <C-k> <Plug>snipMateNextOrTrigger
"set rnu
set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType python :set tabstop=4
autocmd FileType python :set shiftwidth=4
autocmd FileType *.py :set tabstop=4
autocmd FileType *.py :set shiftwidth=4
autocmd FileType python nnoremap <F10> :! ./%<cr>

"set ro!

set relativenumber
nnoremap <leader>r :set relativenumber!<cr>
nnoremap <leader>w :wnext<cr>
nnoremap <leader>q :wprevios<cr>
"nnoremap <leader>

let g:clang_library_path='/usr/lib/libclang.so'
let g:clang_use_library=1


" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

