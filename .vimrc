" compatibility mode, no
set nocp

" workaround for gvim screen redraw issues
set ttyscroll=0

" colors, yes
set t_Co=256
syntax on

" dark background, yes
set background=dark

" no swap files
set noswapfile

" don't write to a backup file then delete the original and then rename the
" backup to the name of the original file... it's annoying
set nowritebackup

" jelly beans
" colorscheme jellybeans

" monokai
colorscheme monokai

" font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro:h14
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  endif
endif

" syntax-specific stuff, yes
filetype plugin on

" indenting
filetype indent on
set expandtab       " Use softtabstop spaces instead of tab characters for indentation - abbr et
set shiftwidth=4    " Indent by 4 spaces when using >>, <<, == etc. - abbr sw
set softtabstop=4   " Indent by 4 spaces when pressing <TAB> - abbr sts
set tabstop=4       " Indent by 4 spaces when pressing <TAB> - abbr ts
" set autoindent      " Keep indentation from previous line - abbr ai
" set noautoindent    " abbr noai
set smartindent     " Automatically inserts indentation in some cases
" set nosmartindent " abbr nosi
set smarttab        " A <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
" set nosmarttab      " abbr nosta
" set cindent         " Like smartindent, but stricter and more customisable

" set word separators
set iskeyword-=_

" unix style line endings
set ff=unix

" scrollbars, no
set guioptions=
" set guioptions+=LlRrb
" set guioptions-=LlRrb

" status line
set noruler             " ruler, no
set laststatus=2        " statusbar on every buffer, yes
set statusline=%f       " path to the file in the buffer, as typed or relative to current directory
set statusline+=%{fugitive#statusline()} " git status (courtesy of fugitive)
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}] " file format
set statusline+=%h      " help file flag
set statusline+=%m      " modified flag
set statusline+=%r      " read only flag
set statusline+=%y      " filetype
set statusline+=%=      " left/right separator
set statusline+=%c,     " cursor column
set statusline+=%l/%L   " cursor line/total lines
set statusline+=\ %P    " percent of file on screen

" line numbers, yes
set number
set nuw=6  " number width to 6 makes things look a little neater

" word wrap, no
set nowrap

" wildmenu makes life better
set wildmenu wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
" nmap <F18> :set hls<ENTER>
" nmap <F19> :set nohls<ENTER>

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" set %% as abbreviation for working directory
cabbr <expr> %% expand('%:p:h')

" lots and lots of tabs, yes
set tabpagemax=50

" shortcut for all buffers to tabs
cabbr tb tab ball

" map <Esc> to jk in insert mode (has to be typed quick)
" imap jk <Esc>

" keep the current visual block selection active after changing indent with '<' or '>'
" vmap > >gv
" vmap < <gv

" replay q macro with Q
nnoremap Q @q

" make Y yank to end of line as with C and D
nnoremap Y y$

" easier vertical scroll keys
nnoremap <M-C-k> <C-y>
nnoremap <M-C-j> <C-e>

" horizontal scrolling with <C-h> and <C-l>
nnoremap <M-C-h> z5h
nnoremap <M-C-h> z5l

" easier switch to split
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

" stop auto commenting
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" toggle paste mode with <F1> ... this way you can leave autocommenting on most of the time a quickly disable it for pasting in code
" nnoremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F1>
set showmode

" copy paste from system clipboard
"set clipboard^=unnamed
vmap <a-c> "*y
vmap <a-x> "*d
nmap <a-v> :set paste<CR>"*p:set nopaste<CR>
imap <a-v> <ESC>:set paste<CR>"*p:set nopaste<CR>a

" fix backspace (for windows)
set backspace=indent,eol,start

" remote trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" show white space
set list listchars=tab:>-,trail:-
set list

" tabs to spaces
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'

" spaces to tabs
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" use html syntax on ejs and mustache files
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html

" json formatting via json.vim
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=4
    autocmd FileType json set softtabstop=4 tabstop=4
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END

" make sure vim has a tmp directory to write to ... needed for fugitive to
" work
set directory+=,~/tmp,$TMP

" ****************
" Plugins
" ****************

" pathogen - https://github.com/tpope/vim-pathogen
call pathogen#infect()

" ConqueTerm
let g:ConqueTerm_PyExe = 'usr/bin/python'
noremap <F2> :ConqueTermSplit bash<CR>

" Autoformat - https://github.com/Chiel92/vim-autoformat
noremap <F3> :Autoformat<CR><CR>

" yankring - http://www.vim.org/scripts/script.php?script_id=1234
nnoremap <silent> <F4> :YRShow<CR>
let g:yankring_zap_keys = 'f F t T / ?'

" NERDtree - http://vim.sourceforge.net/scripts/script.php?script_id=1658
nnoremap <silent> <F5> :NERDTreeToggle<CR>
" let NERDTreeShowBookmarks=1

" gundo - http://sjl.bitbucket.org/gundo.vim/
nnoremap <silent> <F6> :GundoToggle<CR>

" source closetag script
au Filetype html,xml,xsl,ejs,mustache source ~/.vim/scripts/closetag.vim

" eslint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []
" let g:syntastic_javascript_args = "--my --args --here"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" lint on save
" let jshint2_save = 1

" enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,ejs,mustache,css EmmetInstall

" emmet trigger key to ctrl-z
" let g:user_emmet_leader_key='<C-Z>'

" intellisense
set omnifunc=syntaxcomplete#Complete

