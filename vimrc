" disable compatible mode
set nocompatible

" Pathogen
execute pathogen#infect()

" color
syntax enable
"set background=dark
"colorscheme solarized

" space & tab
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4    " number of spaces in tab when editing
set expandtab        " tabs are spaces

" UI config
set number           " show line numbers
set showcmd          " show command in bottom bar
set cursorline       " highlight current line
filetype indent on   " load filetype-specific indent files
filetype plugin on
set wildmenu         " visual autocomplete for command menu
set lazyredraw       " redraw only when we need to.
set showmatch        " highlight matching [{()}]

" searching
set incsearch        " search as characters are entered
set hlsearch         " highlight matches

" folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" leader shortcus
let mapleader=","    " leader is a comma `,`

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
"nnoremap <space> za

" movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" remap <ESC>
inoremap jk <esc>

""" NERDTree remapping
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "modified",
    \ "Staged"    : "staged",
    \ "Untracked" : "untracked",
    \ "Renamed"   : "renamed",
    \ "Unmerged"  : "unmerged",
    \ "Deleted"   : "deleted",
    \ "Dirty"     : "dirty",
    \ "Clean"     : "clean",
    \ 'Ignored'   : "ignored",
    \ "Unknown"   : "?"
    \ }

""" Fuzzy Finding
set path+=**    " add subdirectories to path
"set wildmenu
" now we can use `:find <filename> <TAB>` to fuzzy search among current and
" sub-folders

""" Tag Jumping
" use :MakeTags to create the `tags` file
" (may need to install ctags first):
" $ sudo snap install universal-ctags
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" SNIPPETS
" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
" Read an empty C++ template
nnoremap ,cpp :-1read $HOME/.vim/.skeleton.cpp<CR>
" Read an empty python template
nnoremap ,py :-1read $HOME/.vim/.skeleton.py<CR>

