" compatibility mode, no
set nocp

" workaround for gvim screen redraw issues
if !has('nvim')
    set ttyscroll=0
endif

" colors, yes
set t_Co=256
syntax on

" no swap files
set noswapfile

" don't write to a backup file then delete the original and then rename the
" backup to the name of the original file... it's annoying
set nowritebackup

" faster update time
set updatetime=1000

" cursor
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0ng/vim-hybrid'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wesQ3/vim-windowswap'
Plugin 'bkad/CamelCaseMotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/denite.nvim'
Plugin 'machellerogden/vim-istanbul'
Plugin 'sjl/gundo.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'tpope/vim-dotenv'
Plugin 'calebsmith/vim-lambdify'
Plugin 'sheerun/vim-polyglot'
Plugin 'aklt/plantuml-syntax'

" clj
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
" Plugin 'vim-scripts/paredit.vim'
" Plugin 'bhurlow/vim-parinfer'
Plugin 'eraserhd/parinfer-rust'
Plugin 'venantius/vim-eastwood'
Plugin 'venantius/vim-cljfmt'
" Plugin 'dgrnbrg/vim-redl'
" Plugin 'bounceme/poppy.vim'
Plugin 'fbeline/kibit-vim'
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1

" let g:clj_fmt_autosave = 0
Plugin 'dgrnbrg/vim-redl'

" js
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/es.next.syntax.vim'
Plugin 'ternjs/tern_for_vim'
" Plugin 'kern/vim-es7'
Plugin 'mxw/vim-jsx'
Plugin 'evanleck/vim-svelte'

" ts
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi.git'

call vundle#end()
filetype plugin indent on

" enable coverage default mappings
"call glaive#Install()
"Glaive coverage plugin[mappings]
"
" Load matchit.vim, but only if there is no newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" pass correct key-codes in tmux
if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    if !has('nvim')
        set ttymouse=xterm2
    endif
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif

" indenting
filetype indent on
set expandtab       " Use softtabstop spaces instead of tab characters for indentation - abbr et
set shiftwidth=4    " Indent by 4 spaces when using >>, <<, == etc. - abbr sw
set softtabstop=4   " Indent by 4 spaces when pressing <TAB> - abbr sts
set tabstop=4       " Indent by 4 spaces when pressing <TAB> - abbr ts
set smartindent     " Automatically inserts indentation in some cases
set smarttab        " A <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set nofoldenable

" set word separators
"set iskeyword=@,48-57,_,192-255
set lisp

" set leader
let mapleader="\<Space>"

" wildmenu makes life better
set wildmenu wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" set %% as abbreviation for working directory
cabbr <expr> %% expand('%:p:h')

" allow lots and lots of tabs, even though we don't use them much
set tabpagemax=50

" replay q macro with Q
nnoremap Q @q

" make Y yank to end of line as with C and D
nnoremap Y y$

" easier switch to split
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

" better default split positions
set splitbelow
set splitright

" copy paste from system clipboard
set clipboard=unnamed
vmap ç "*y
vmap ≈ "*d
nmap √ :set paste<CR>"*p:set nopaste<CR>
imap √ <ESC>√

" toggle paste mode with <F1> ... this way you can leave autocommenting on most of the time a quickly disable it for pasting in code
set pastetoggle=<F1>
set showmode

" fix backspace (for windows)
set backspace=indent,eol,start


" When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
set autoread

" remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" replace tabs with spaces
nnoremap <Leader>tts :%s/  /    /g<CR>

" tabs to spaces
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'

" spaces to tabs
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Don't redraw while executing macros (good performance config)
set lazyredraw

" scrollbars, no
set guioptions=

" line numbers, yes
set number
set nuw=6  " number width to 6 makes things look a little neater

" word wrap, no
set nowrap

" Height of the command bar
set cmdheight=2

" status line
set noruler             " ruler, no
set laststatus=2        " statusbar on every buffer, yes
let g:airline_powerline_fonts=1
let g:airline_theme="hybridline"

" highlight char at 81st column
call matchadd('ColorColumn', '\%81v', 100)

" Show trailing whitespace and tabs
augroup extrawhitespace_autocmd
    au!
    au BufWinEnter * match ExtraWhitespace /\s\+$\|\t/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\|\t/
    au InsertLeave * match ExtraWhitespace /\s\+$\|\t/
    au BufWinLeave * call clearmatches()
    au InsertEnter * set nolist
    au InsertLeave * set list
augroup END
set listchars=nbsp:¬,tab:▶▶,trail:∙,nbsp:▒
set list

" theme
set background=dark
let g:enable_bold_font=1
let g:gitgutter_override_sign_column_highlight=0

colorscheme mho

fun! SetColorScheme()
    if (&ft == '')
        return
    elseif &ft == 'go'
        colorscheme triplejelly
    else
        colorscheme mho
    endif
    :AirlineRefresh
endfun

augroup colorscheme_autocmd
    au!
    au BufEnter * call SetColorScheme()
augroup END

" font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  endif
endif

" highlight next search item
set hls
nnoremap <Leader>n :nohls<cr>
au BufWinEnter * highlight NextItem ctermbg=112 guibg=#87d700 ctermfg=236 guifg=#303030
nnoremap <silent> n n:call HLNext(80)<cr>
nnoremap <silent> N N:call HLNext(80)<cr>
function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('NextItem', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime) . 'm'
    call matchdelete(ring)
    redraw
endfunction

" use html syntax on ejs and mustache files
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.mustache set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html

" ts syntax
au BufNewFile,BufRead *.ts set filetype=typescript

" poppy rainbow parens
" au! cursormoved *.clj call PoppyInit()

" json formatting
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
    au!
    au FileType json set autoindent
    au FileType json set formatoptions=tcq2l
    au FileType json set textwidth=78 shiftwidth=4
    au FileType json set softtabstop=4 tabstop=4
    au FileType json set expandtab
    au FileType json set foldmethod=syntax
augroup END

autocmd FileType *bash* set expandtab
autocmd FileType sh set expandtab

function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

" ****************
" Plugins
" ****************

" make sure vim has a tmp directory to write to ... needed for fugitive to
" work
set directory+=,~/tmp,$TMP

" NERDtree - http://vim.sourceforge.net/scripts/script.php?script_id=1658
nnoremap <silent> <Leader>a :execute ':silent! NERDTreeToggle'<cr>
fun! InitNERDTree()
    let isNERDTree = (&ft == 'nerdtree')
    let dir = (argv() != []) ? fnamemodify(argv()[0], ':h') : expand('%:p:h')
    sleep 1m
    if (isNERDTree)
        :execute ':NERDTree ' . dir
        :wincmd h
    else
        :execute ':NERDTree ' . dir
        :wincmd l
    endif
    :only
endfun
au vimenter * call InitNERDTree()
let g:bookmark_no_default_key_mappings = 1
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>l <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine


" gundo - http://sjl.bitbucket.org/gundo.vim/
if has('python3')
    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
endif
nnoremap <silent> <F6> :GundoToggle<CR>

" source closetag script
au Filetype html,xml,xsl,ejs,mustache source ~/.vim/scripts/closetag.vim

" eslint
let g:syntastic_javascript_checkers=['eslint']
if executable('node_modules/.bin/eslint')
    let b:syntastic_javascript_eslint_exec = getcwd()."/node_modules/.bin/eslint"
endif
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_html_checkers=[]
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0

" java
let g:syntastic_java_javac_config_file_enabled = 1

" enable emmet just for html/css
let g:user_emmet_install_global=0
au FileType html,ejs,mustache,css EmmetInstall

" intellisense
set omnifunc=syntaxcomplete#Complete
" popup menu inserts the longest common text of all matches
" and the menu will come up even if there's only one match.
set completeopt=longest,menuone
set complete-=1

" just because a number starts with a 0 doesn't mean it's octal
set nrformats-=octal

" timeout
set ttimeout
set ttimeoutlen=100

" Custom IDE functionality using tmux
function! RunInTmux(cmd)
  :execute ":silent !tmux splitw -h '".a:cmd."; read; tmux select-pane -L'"
endfunction
au FileType markdown nnoremap <Leader>k :!open -a Typora.app '%:p'<CR>
au FileType javascript nnoremap <Leader>r :call RunInTmux('node %')<CR>
au FileType sh nnoremap <Leader>s :call RunInTmux('bash %')<CR>
"nnoremap <Leader>! :call RunInTmux('chmod +x % && %')<CR>
"nnoremap <Leader>m :call RunInTmux('make')<CR>
command! -nargs=1 ND :execute ":silent !tmux splitw -h 'killall -9 node;node-vim-inspector " . string(<q-args>) . "';sleep 2;tmux splitw -v 'node debug localhost:5858';tmux select-pane -L" | :nbs
au FileType javascript nmap <Leader>= ciwconst pa = require('phcrk$a');

" use tern for def jump
autocmd FileType javascript nnoremap <buffer> <C-]> :TernDef<CR>

au BufRead,BufNewFile *bash* let g:is_bash=1
au BufRead,BufNewFile *bash* let g:is_posix=1
au BufRead,BufNewFile *bash* setf sh

" denite

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <Leader>p :<C-u>Denite
    \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>


function! SetDeniteGrep()
    if finddir('.git', ';') != ''
        call denite#custom#var('grep', 'command', ['git', '--no-pager', 'grep'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'final_opts', [])
        call denite#custom#var('grep', 'separator', [])
        call denite#custom#var('grep', 'default_opts', ['--no-color', '-nHI'])
    else
        call denite#custom#var('grep', 'command', ['rg'])
        call denite#custom#var('grep', 'recursive_opts', [])
        call denite#custom#var('grep', 'final_opts', [])
        call denite#custom#var('grep', 'separator', ['--'])
        call denite#custom#var('grep', 'default_opts',
            \ ['--vimgrep', '--no-heading'])
    endif
endfunction

nnoremap <Leader>/ :call SetDeniteGrep()<CR>:Denite grep<CR>
nnoremap <Leader>y :Denite neoyank<CR>
nnoremap <Leader>b :Denite buffer<CR>

" hot-load clojure repl
au Filetype clojure nmap <Leader>env :verbose Dotenv export-env<CR>
au Filetype clojure nmap <Leader>repl :Console<CR>
au Filetype clojure nmap <Leader>pig :Piggieback (figwheel-sidecar.repl-api/repl-env)<CR>
au Filetype clojure nmap <Leader>fig :Eval (user/start)<CR>
au Filetype clojure nmap <Leader>cljs :Eval (user/cljs)<CR>
au Filetype clojure nmap <Leader>gif :Eval (user/stop)<CR>
"au Filetype clojure nmap <Leader>aa :A<CR>
"au Filetype clojure nmap <Leader>ee :%Eval<CR>
"au Filetype clojure nmap <Leader>er :Eval<CR>
"au Filetype clojure nmap <Leader>ss :ClojureHighlightReferences<CR>
au Filetype clojure nmap <Leader>r :Require<cr>
au Filetype clojure nmap <Leader>ra :Require!<CR>

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

" edit this file
command Vrc :tabe $MYVIMRC

" edit temp file
command Tmp :tabe `mktemp`

" XML format
command -range=% Xml :<line1>,<line2>!xmllint --format -


function! OpenTmuxSplit()
  :execute ":silent !tmux splitw -p 25"
  :execute ":silent !tmux select-pane -U"
endfunction
nnoremap <Leader>- :call OpenTmuxSplit()<CR>3<C-y>

" word wrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    silent! nunmap <buffer> 0
    silent! nunmap <buffer> $
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k      gk
    noremap  <buffer> <silent> j      gj
    noremap  <buffer> <silent> 0      g0
    noremap  <buffer> <silent> $      g$
    onoremap <buffer> <silent> k      gk
    onoremap <buffer> <silent> j      gj
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" parinfer toggle
nnoremap <Leader>) :call ParinferToggle()<cr>
function! ParinferToggle()
    if g:parinfer_enabled == 1
        let g:parinfer_enabled = 0
        echom "Parinfer disabled"
    else
        let g:parinfer_enabled = 1
        echom "Parinfer enabled"
    endif
endfunction
"au BufRead,BufNewFile *.md setlocal textwidth=80
"au BufRead,BufNewFile *.md nmap <Leader>f gwap

au BufRead,BufNewFile *svelte* setf svelte
