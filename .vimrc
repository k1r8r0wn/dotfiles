" ##########################################
" # Vundle & plugins
" ##########################################

set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rizzatti/dash.vim'
Plugin 'bogado/file-line'
Plugin 'cormacrelf/vim-colors-github'
Plugin 'doums/darcula'
Plugin 'psliwka/vim-smoothie'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails.git'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-dispatch'
Plugin 'mattn/webapi-vim'
Plugin 'danro/rename.vim'
Plugin 'nono/vim-handlebars'
Plugin 'scrooloose/syntastic'
" Plugin 'mattn/gist-vim'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'zxqfl/tabnine-vim'

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required

" ##########################################
" # Main settings
" ##########################################

syntax on " Enable syntax highlighting

" ChangeBackground changes the background mode based on macOS's `Appearance`
" setting. We also refresh the statusline colors to reflect the new mode.
function! ChangeBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark " for the dark version of the theme
    set termguicolors
    let g:lightline = { 'colorscheme': 'darculaOriginal' }
    colorscheme darcula
  else
    set background=light " for the light version of the theme
    let g:lightline = { 'colorscheme': 'github' }
    colorscheme github
  endif
endfunction

" initialize the colorscheme for the first run
call ChangeBackground()

" change the color scheme if we receive a SigUSR1
autocmd SigUSR1 * call ChangeBackground()
set encoding=utf8
set guifont=JetBrains_Mono:h18
" Add a colored column at 120 to avoid going to far to the right
" set colorcolumn=120
" Set ACK as a default grep
set grepprg=ack-grep
 " Set tags directory
set tags=./tags;
" Auto indention should be on
set autoindent
set tabstop=2 shiftwidth=2
" Displaying status line always
set laststatus=2
" Lovely linenumbers
set nu
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Highlight the current line
" set cursorline
" Highlight active column
" set cuc cul

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Backup / tmp files
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.
set buftype: " "

" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif

  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
" autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 sts=0 expandtab

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " Autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END

" ##########################################
" # Tune plugins
" ##########################################

let g:vroom_map_keys = 0
let g:vroom_use_dispatch = 1
let g:vroom_use_zeus = 1

" Speed up ctrl+p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Nerdtree style explorer
let g:netrw_liststyle=3
" Allow nerdtree to remove non-empty local directories
let g:netrw_localrmdir='rm -r'
" Code checkers
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" ##########################################
" # Mappings
" ##########################################

" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

map <Leader>c :call vroom#RunTestFile()<CR>
map <Leader>s :call vroom#RunNearestTest()<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file
map <leader>E :Explore .<cr> " \E to open file explorer in root
map <leader>e :Explore<cr> " \e to open file explorer in current dir

" :Explore mode
map <F2> :!ls<CR>:e

" Cancel a search with `Ctrl+l`
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Increment numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Ruby hash syntax conversion
"noremap <F12>
"nnoremap <F12> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<return>

"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

" Removing escape
ino jj <esc>
cno jj <c-c>
vno v <esc>
