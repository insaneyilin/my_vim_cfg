" disable compatible mode
set nocompatible

set nobackup
set undofile
set undodir=~/.vim/undodir

" Pathogen
execute pathogen#infect()

" color
syntax enable
packadd! dracula
colorscheme dracula

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

" complete's default value are .,w,b,u,t,i
" remove i for not scanning included files
set complete=.,w,b,u,t

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
" `nnoremap` means mapping in normal mode
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
" `inoremap` means mapping in insert mode
inoremap jk <esc>

"" Insert current filename
" To inserts the current filename without the extension at the cursor position,
" when you are in insert mode.
":inoremap <leader>fn <C-R>=expand("%:t:r")<CR>
" To keep the extension use:
:inoremap <leader>fn <C-R>=expand("%:t")<CR>
" To insert the absolute path of the directory the file is in use:
:inoremap <leader>fd <C-R>=expand("%:p:h")<CR>
" To insert the relative path of the directory the file is in use:
":inoremap <leader>fn <C-R>=expand("%:h")<CR>
" To insert the name of the innermost directory (the one containing the
" current file) use:
":inoremap <leader>fn <C-R>=expand("%:p:h:t")<CR>

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

""" SNIPPETS
" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a
" C++ template
nnoremap ,cpp :-1read $HOME/.vim/snippets/.skeleton.cpp<CR>
" Python template
nnoremap ,py :-1read $HOME/.vim/snippets/.skeleton.py<CR>
" CMakeLists.txt template
nnoremap ,cl :-1read $HOME/.vim/snippets/.skeleton.cmakelists<CR>

""" DoxygenToolkit.vim
" https://github.com/vim-scripts/DoxygenToolkit.vim
"let g:DoxygenToolkit_paramTag_pre="@param: "
"let g:DoxygenToolkit_returnTag="@returns: "
"let g:DoxygenToolkit_blockHeader="/*******************************************************"
"let g:DoxygenToolkit_blockFooter="*******************************************************/"
let g:DoxygenToolkit_authorName="Yilin Gui, yilin.gui@gmail.com"
let s:licenseTag = "\<enter>"
let s:licenseTag = s:licenseTag . "Copyright 2020 insaneyilin All Rights Reserved.\<enter>"
let s:licenseTag = s:licenseTag . "\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag

let g:DoxygenToolkit_briefTag_funcName="no"
let g:doxygen_enhanced_color=1
"let g:DoxygenToolkit_commentType="C++"
let g:DoxygenToolkit_classTag = "@class "
" use :Dox to generate function descriptioin
" use :DoxAuthor to generate Author info.
" use :DoxLic to generate License info.

