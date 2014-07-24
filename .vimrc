scriptencoding utf-8

set nocompatible                    " Yay ViM!

call pathogen#infect()
filetype plugin indent on
syntax on

set background=dark                 " Well, it /is/ dark...
let g:inkpot_black_background = 1
colorscheme inkpot                  " My colorscheme's better

set backspace=indent,eol,start      " Backspace can eat anything
set expandtab                       " Use spaces, not tabs.
set tabstop=4                       " Tabs are 4 spaces
set shiftwidth=4                    " Indent is 4 spaces
set smarttab                        " Tab goes to the next tab stop
set nowrap                          " The wrapping behavior is annoying
set showmatch                       " Point out matched parens
set matchtime=2                     " Show match for 0.2 sec
set scrolloff=10                    " Context lines around cursor
set linebreak                       " Break lines in a polite fashion
set autoindent                      " Use previous line's indentation
set nodigraph                       " No. I typo 1<BS>2 too much.
set ruler                           " Show line/column number
set wildmenu                        " Show a menu for cmdline completion
set wildmode=list:longest           "    And make it behave like the shell
set laststatus=2                    " Always show a status line
set shortmess=atIO                  " Get rid of most messages
set pastetoggle=<f11>               " hit f11 to paste
set hlsearch                        " highlighting search
set history=1000                    " remember 1000 cmds
set showcmd                         " show typed command in progress
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out " ignore tex intermediates for menu
set autowrite                       " Autosave on some buffer-switching ops
set autoread                        " Re-read changed file when safe
set incsearch                       " Incremental search
set formatoptions+=n                " Recognize numbered lists
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
set grepprg=grep\ -nH\ $*           " Always show filename for grep
set numberwidth=3                   " 3-digit line numbers
set viminfo+=!                      " Store upper-case registers in viminfo
set updatetime=2000                 " Wait before triggering CursorHold event
set tabpagemax=30

set switchbuf=useopen,usetab        " Try to switch to an open tab
if version >= 702
    set switchbuf+=newtab
endif

set showtabline=1                   " Show tab line if more than one tab open
set nolazyredraw                    " Delay redrawing the screen
set novisualbell                    " Don't you dare flash the screen
set t_vb=                           "   No, really, I'll hurt you if you do.
set noerrorbells                    " And don't bell me with errors, either
set nomore                          " Display all of the message at once
set secure                          " Turn on vimrc security
set exrc                            "   ... and allow local-directory vimrcs
set completeopt=longest,menuone,preview " Make code-completion spiffy
set path+=/usr/local/include        " local should be in the default path

" Set up good status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=\ %{fugitive#statusline()}   " git branch
set statusline+=\ %{virtualenv#statusline()} " virtualenv
set statusline+=%=                           " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Set title string and push it to xterm/screen window title
" vim <truncate><fullpath>
set titlestring=%{fnameescape(hostname())}:\ vim\ %<%F%m%r%h
set titlelen=70

if &term =~? "screen"
  " Make sure set title works for screen
  set t_ts= k
  set t_fs= \
  set title
endif

set list listchars=tab:>-,trail:.,extends:>,precedes:<

if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Set taglist up properly
let Tlist_Compact_Format    = 1
let Tlist_Display_Prototype = 0
let Tlist_Exit_OnlyWindow   = 1
let Tlist_Sort_Type         = "name"
let Tlist_Use_Right_Window  = 1
let Tlist_Use_SingleClick   = 1
let Tlist_WinWidth          = 40

" Open netrw file in new tab
let g:netrw_browse_split    = 3

" Syntax highlighting tweaks
let perl_extended_vars = 1
let perl_string_as_statement = 1
let html_number_lines = 0
let html_use_css = 1
let is_bash=1
let python_highlight_all = 1
let python_slow_sync = 1
let g:xml_syntax_folding = 1

" command-t tweaks
let g:CommandTMatchWindowAtTop = 1
let g:CommandTMaxHeight = 20
" These are to prevent C-h (BACKSPACE) from being mapped to left.
let g:CommandTCursorLeftMap='<Left>'
let g:CommandTCursorRightMap='<Right>'
let g:CommandTMaxCachedDirectories = 0
let g:CommandTMaxFiles = 40000

nmap <unique> <silent> <Leader>f :CommandT<CR>

" Syntastic
let g:syntastic_check_on_open=0
let g:syntastic_auto_loc_list=1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_enable_highlighting = 1

" vim-virtualenv
let g:virtualenv_stl_format = '[venv:%n]'

" pep8 plugin
let g:pep8_map='<leader>8'

set wildignore+=*.pyc
set wildignore+=*.pyo
set wildignore+=*egg-info*
set wildignore+=*EGG-INFO*

nnoremap  <silent> <leader>ss m`:%s/\s\s*$//e<CR>``
nnoremap  <C-p> :Unite file_rec/async<cr>
nnoremap  <space>/ :Unite grep:.<cr>

let g:unite_source_history_yank_enable = 1
nnoremap  <space>y :Unite history/yank<cr>

autocmd FileType html setlocal shiftwidth=2 tabstop=2 
autocmd FileType css setlocal shiftwidth=2 tabstop=2 
autocmd FileType js setlocal shiftwidth=2 tabstop=2 

imap {% {%  %}<LEFT><LEFT><LEFT>
imap {{ {{  }}<LEFT><LEFT><LEFT>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <silent><A-Right> :tabnext<CR>      " map Alt-RightArrow to jump to the next tab
map <silent><A-Left> :tabprevious<CR>   " map Alt-LeftArrow to jump to the previous

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<space>
map <leader>tf :tabfind<space>
map <leader>te :tabedit<space>


autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

function BufNewFile_PY()
0put = '#/usr/bin/env python'
normal G
endfunction

autocmd BufNewFile *.py call BufNewFile_PY()
