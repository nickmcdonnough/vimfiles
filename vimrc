set nocompatible
syntax on
filetype plugin indent on

"tell vim to use 256 colors
set t_Co=256
"let g:solarized_termcolors = 256 " not using this

"set color scheme
colorscheme solarized
let g:airline_theme = 'base16'
set background=dark

"turn line numbers on
set number

"allow mouse scrolling
set mouse=a

"make backspace work like everywhere else
set backspace=indent,eol,start
set expandtab
set autoindent

" set leader to a comma
let mapleader = ","

"setting for airline
set laststatus=2

"ruby autocomplete stuff
autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby let g:rubycomplete_rails = 1
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" js hint automatic check on file write
let JSHintUpdateWriteOnly=1

" prevents whitespace highlighting in unite window
let g:extra_whitespace_ignored_filetypes = ['unite']

"indent guide setting
let g:indent_guides_start_level=2

" ruby syntax checkers for syntastic
let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'rubylint']

"fuzzy search for file using Unite
nnoremap <Leader>f :Unite -start-insert file_rec

" code search with unite
nnoremap <Leader>/ :<C-u>Unite -no-split -silent -buffer-name=ag grep<CR>

" code search with plain ol' Ag. this needs to be tweaked so it doesnt auto
" open files
nnoremap <Leader>vv :Ack! <cword> . <CR>:cw<CR>

" set up ack.vim to use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"shortcuts for copy/paste (system clipboard)
vmap <Leader>y "*y
vmap <Leader>x "*x
nmap <Leader>p "*p
nmap <Leader>w :w

"shortcuts for dealing with buffers
"move to next buffer left and right
nnoremap <C-j> <C-W>W
nnoremap <C-k> <C-W>w
"open new buffer
nnoremap <Leader>v :vsplit
nnoremap <Leader>h :split

"folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"expand json
vmap <Leader>j :%!python -m json.tool

set grepprg=ag\ --nogroup\ --nocolor
set wildignore+=**/bower_components/**,**/node_modules/**,**vendor/bundle**,*.jpg,*.gif,*.png,*.svg,*.zip
execute pathogen#infect()

" paths to ignore in unite fuzzy search
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', 'deps\/.*\|vendor\/bundle\/.*\|node_modules\/.*')
