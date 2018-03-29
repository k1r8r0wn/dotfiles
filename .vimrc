" ====================
" Custom Vim settings
" ====================

" Main

filetype plugin indent on

syntax enable

highlight ColorColumn ctermbg=7

set encoding=utf8
set guifont=Fira_Code:h18
set colorcolumn=120                  " add a colored column at 120 to avoid going to far to the right
set clipboard=unnamed                " use os clipboard
set tabstop=2                        " number of visual spaces per tab
set softtabstop=2                    " number of spaces in tab when editing
set shiftwidth=2                     " number of columns text which is indented with the reindent operations
set expandtab                        " tab to spaces
set number                           " show line numbers
set showmatch                        " highlight matching [{()}]
set incsearch                        " search as characters are entered
set hlsearch                         " highlight matches
set wildmenu
set smartindent
set autoindent
set nowrap
set noswapfile
set autoread
set mouse=a

" Automatically switch between light & dark themes based on the time of day
let hour = strftime("%H")

if has('gui_running')
  colorscheme one

  if 8 <= hour && hour < 19
    set background=light
  else
    set background=dark
  endif
endif

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" ====================
" Mappings
" ====================

" Cancel a search with `Ctrl+l`
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" ====================
" Pathogen
" ====================

execute pathogen#infect()
call pathogen#helptags()

" ====================
" Plugins
" ====================

" NERDTree (load on start)
let g:NERDTreeDirArrows=0
autocmd VimEnter * NERDTree

" Ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Theme for airline
let g:airline_theme='one'

" Fugitive
set diffopt+=vertical

