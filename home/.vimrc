set nocompatible               " be iMproved
filetype off                   " required! (by vundle?)

" rvm and zsh: http://beginrescueend.com/integration/vim/
set shell=/bin/sh

set exrc                       " Pick up local vimrc files

" " Section: vundle
"
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " usage:
 " vim plugins
" Bundle 'plugin_name'
 " github
" Bundle 'tpope/vim-rails.git'
 " non github repos
"  Bundle 'git://git.wincent.com/command-t.git'

" My Bundles here:
 "
 Bundle 'mileszs/apidock.vim'
 Bundle 'ack.vim'
 Bundle 'git://git.wincent.com/command-t.git'
 "" Had issues with C extensions
" Bundle 'Command-T'
 Bundle 'Gist.vim'
 Bundle 'matchit.zip'
 Bundle 'juvenn/mustache.vim'
 Bundle 'rails.vim'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'SuperTab'
 Bundle 'surround.vim'
 Bundle 'Syntastic'
 Bundle 'taglist.vim'
 Bundle 'The-NERD-tree'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'tpope/vim-fugitive'
   " see http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
   autocmd BufReadPost fugitive://* set bufhidden=delete
 Bundle 'tpope/vim-rails.git'
 Bundle 'Vim-Rspec'
 Bundle 'ecomba/vim-ruby-refactoring'
 Bundle 'godlygeek/tabular'
 Bundle 'Wiked'
 " used in vundle's sample .vimrc
" Bundle 'FuzzyFinder'
" Bundle 'L9'

 "" for review
" Bundle 'robgleeson/hammer.vim'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'robgleeson/vim-markdown-preview'
" Bundle 'greyblake/vim-preview'
" Bundle 'tpope/vim-surround'
 "vmp.vim

 " ...

 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

 
" " Section: colors
"
syntax enable
if has('gui_running')
    set background=dark
else
    set background=dark
endif
let g:solarized_termcolors=256
colorscheme solarized
" Default color scheme
color desert

"" Swap
set nobackup
set noswapfile
"" Directories for swp files
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup


"" Section: Bundle Config
"" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

"" CommandT config
augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END

" Section: File Types

filetype plugin indent on     " required! (by vundle?) 
 
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
"au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

"au BufRead,BufNewFile *.txt call s:setupWrapping()

" Section: Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·
"" remove all trailing spaces
au BufWrite *.{coffee,css,erb,haml,js,Rakefile,rb,ru,sass,scss} %s/\s\+$//e
au BufWrite Gemfile %s/\s\+$//e


" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Spell checking
:setlocal spell spelllang=en_us

" Section: Key bindings

    " Set the leader to , instead of \
    let mapleader = ","

    " Close the active buffer, but keep the split open.
    map <leader>x :Bclose<CR>
    map <leader>X :bd<CR>

"     " insert hashrocket
"     imap <C-l> <Space>=><Space>
" 
    " toggle comments
    nmap <D-/> ,c<space>
    vmap <D-/> ,c<space>
    imap <D-/> <C-O>,c<space>


" Section: Status bar
set laststatus=2
"" see:
"    http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"    http://winterdom.com/2007/06/vimstatusline
if has('statusline')
	" Status line detail:
	" %f     file path
	" %y     file type between braces (if defined)
	" %([%R%M]%)   read-only, modified and modifiable flags between braces
	" %{'!'[&ff=='default_file_format']}
	"        shows a '!' if the file format is not the platform
	"        default
	" %{'$'[!&list]}  shows a '*' if in list mode
	" %{'~'[&pm=='']} shows a '~' if in patchmode
	" (%{synIDattr(synID(line('.'),col('.'),0),'name')})
	"        only for debug : display the current syntax item name
	" %=     right-align following items
	" #%n    buffer number
	" %l/%L,%c%V   line number, total number of lines, and column number
	"function SetStatusLineStyle()
	"	if &stl == '' || &stl =~ 'synID'
	"		let &stl="%f %y%{fugitive#statusline()}%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%=#%n %l/%L,%c%V %p%% "
	"	else
	"		let &stl="%f %y%{fugitive#statusline()}%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V %p%% "
	"	endif
	"endfunc
	"" Switch between the normal and vim-debug modes in the status line
	"nmap _ds :call SetStatusLineStyle()<CR>
	"call SetStatusLineStyle()
	" Window title
	" if has('title')
	"    set titlestring=%t%(\ [%R%M]%)
	" endif
endif

"define 3 custom highlight groups
 hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
 hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
 hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

" see http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" set statusline %{fugitive#statusline()}
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set statusline=
set statusline+=%#error# "switch to error highlight
set statusline+=%r                     "read-only flag
set statusline+=%*                     "reset color
set statusline+=\ %n                   "buffer number
set statusline+=\ %{strlen(&fenc)?&fenc:&enc} " encoding
set statusline+=%3*%y%*              "file type
set statusline+=%{&ff}                 "file format
set statusline+=\ %-40f\                 "partial path
"set statusline+=\ %<%F                 "full path
set statusline+=%2*%m%*                "modified flag
set statusline+=%3*%{fugitive#statusline()}%*
set statusline+=%=                     "everyhing after this is right justified
set statusline+=%l/%L                 "current line/total lines
set statusline+=\ %v                   "virtual column number
set statusline+=\ %P                   "percentage thru buffer
" set statusline +=%2*0x%04B\ %*          "character under cursor


" Section: Visual stuff
set number " show line number

" " Section: old configuration
"" set encoding=utf-8
"" 
"" 
"" " Status bar
"" set laststatus=2
"" "" see:
"" "    http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"" "    http://winterdom.com/2007/06/vimstatusline
"" if has('statusline')
""    " Status line detail:
""    " %f     file path
""    " %y     file type between braces (if defined)
""    " %([%R%M]%)   read-only, modified and modifiable flags between braces
""    " %{'!'[&ff=='default_file_format']}
""    "        shows a '!' if the file format is not the platform
""    "        default
""    " %{'$'[!&list]}  shows a '*' if in list mode
""    " %{'~'[&pm=='']} shows a '~' if in patchmode
""    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
""    "        only for debug : display the current syntax item name
""    " %=     right-align following items
""    " #%n    buffer number
""    " %l/%L,%c%V   line number, total number of lines, and column number
""    function SetStatusLineStyle()
""       if &stl == '' || &stl =~ 'synID'
""          let &stl="%f %y%{fugitive#statusline()}%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%=#%n %l/%L,%c%V %p%% "
""       else
""          let &stl="%f %y%{fugitive#statusline()}%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V %p%% "
""       endif
""    endfunc
""    " Switch between the normal and vim-debug modes in the status line
""    nmap _ds :call SetStatusLineStyle()<CR>
""    call SetStatusLineStyle()
""    " Window title
""    " if has('title')
""    "    set titlestring=%t%(\ [%R%M]%)
""    " endif
"" endif
"" 
"" " set statusline %{fugitive#statusline()}
"" 
"" 
"" " Without setting this, ZoomWin restores windows in a way that causes
"" " equalalways behavior to be triggered the next time CommandT is used.
"" " This is likely a bludgeon to solve some other issue, but it works
"" set noequalalways

"
" 
" 
"     " Syntax highlighting
"     set nocompatible
"     syntax on
" 
"     " Wrap lines on word break
"     set linebreak
" 
"     " Let me hide modified buffers
"     set hidden
" 
"     " Theme
"     "colorscheme ir_black
"     colorscheme vividchalk
" 
"     " Font
"     set gfn=Monaco:h10
" 
"     scriptencoding utf-8
"     set encoding=utf-8 " Not sure if there's a difference
" 
"     " filetype-specific indenting and plugins
"     filetype plugin indent on
" 
"     " Size the window
"     set lines=52 columns=171
" 
"     " Set the command window to be 2 lines tall.
"     set cmdheight=2
" 
"     " Set wrap width
"     set textwidth=80
" 
"     " show the best match so far as search strings are typed
"     set incsearch
" 
"     " highlight search results
"     set hlsearch
" 
"     " Ignore case when searching.
"     set ignorecase
"     set smartcase
" 
"     set visualbell
" 
"     " highlight the current cursor line
"     set cursorline
" 
"     " flashes matching brackets and parenthesis
"     set showmatch
" 
"     " Tabs should be 2 spaces wide.
"     set shiftwidth=2
"     set tabstop=2
" 
"     " Convert a <Tab> to <space>s
"     set expandtab
" 
"     " Helps with backspacing expanded tabs
"     set smarttab
" 
"     " scroll off-screen 3 lines at a time
"     set scrolloff=3
" 
"     " line numbers
"     set number
"     setlocal numberwidth=5
" 
"     " Enable tab completion for commands
"     " first tab shows matches and next tab cycles through matches
"     set wildmenu
"     set wildmode=list:longest,full
" 
"     " Nice statusbar
"     set laststatus=2
"     set statusline=\ "
"     set statusline+=%f\ " filename
"     set statusline+=[
"     set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"     set statusline+=%{&fileformat}] " file format
"     set statusline+=%h%m%r%w " flag
"     set statusline+=%= " right align
"     set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
" 
"     " enable setting title
"     set title
" 
"     " configure title to look like: /path/to/file
"     set titlestring=%-25.55F\ %a%r%m titlelen=70
" 
"     " Make backspace work in insert mode
"     set backspace=indent,eol,start
" 
"     " Hide MacVim's toolbar by default
"     set guioptions-=T
" 
" 
" " Section: matchit
" "  :source ~/.vim/plugin/matchit.vim
" 
" " Section: bufexplorer
"   
"   " Hide default help
"   let g:bufExplorerDefaultHelp=0
" 
" " Section: NERDTree
"   
"   " Hide default help
"   let NERDTreeQuitOnOpen=1
" 
" 
" " Section: bindings
" 
"     " Set the leader to , instead of \
"     let mapleader = ","
" 
"     " Close the active buffer, but keep the split open.
"     map <leader>x :Bclose<CR>
"     map <leader>X :bd<CR>
" 
"     " insert hashrocket
"     imap <C-l> <Space>=><Space>
" 
"     " toggle comments
"     nmap <D-/> ,c<space>
"     vmap <D-/> ,c<space>
"     imap <D-/> <C-O>,c<space>
" 
"     " toggle file browser
"     map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" 
"     " no highlight
"     nmap <leader>nn :noh<CR>
" 
"     " Search with ack
"     map <leader>F :Ack<space>
" 
"     " Yank from the cursor to the end of the line.
"     nnoremap Y y$
" 
"     " Mash pinkies to escape.
"     imap jj <Esc>
" 
"     " Window splitting mappings
"     nmap <leader>v :vsplit<CR><C-w><C-w>
"     nmap <leader>s :split<CR> <C-w><C-w>
" 
"     " Switch to previous buffer
"     nmap <leader>w <C-w>p
" 
"     " Fix navigation to work when { is not in the first column
"     map [[ ?{<CR>w99[{
"     map ][ /}<CR>b99]}
"     map ]] j0[[%/{<CR>
"     map [] k$][%?}<CR>
" 
"     " Switching buffers
"     nmap <tab> :tabnext<cr>
"     nmap <s-tab> :tabprevious<cr>
" 
"     " Quickly edit vimrc
"     map \v :sp ~/.vimrc<CR><C-W>_
" 
"     " Line up stuff in visual mode
"     vmap <leader>: :Tabularize first_colon<CR>
"     "vmap <leader>L :Tabularize colon<CR>
"     vmap <leader>l :Tabularize hash_rocket<CR>
"     vmap <leader>= :Tabularize equals<CR>
"     vmap <leader>' :Tabularize first_single_quote<CR>
"     vmap <leader>" :Tabularize first_double_quote<CR>
"     vmap <leader>{ :Tabularize first_left_stash<CR>
"     vmap <leader>} :Tabularize first_right_stash<CR>
"     vmap <leader>\| :Tabularize bar<CR>
" 
"     " Git
"     nmap <leader>gs :Gstatus<CR>
"     nmap <leader>gc :Gcommit<CR>
"     nmap <leader>gd :Gdiff<CR>
" 
"     nmap <leader>t :tabe<CR>:Bclose<CR>
" 
" " Section: closetag.vim
" 
"   let g:closetag_html_style=1
" 
" " Section: commands
" 
"   " Various useful Ruby command mode shortcuts
"   augroup Ruby
"     autocmd!
"     autocmd BufRead,BufNewFile,BufEnter *.rb
"       \ :nmap <leader>r :w<CR>:call Send_to_Screen("ruby " . expand("%") . "\n")<CR>|
"     autocmd BufRead,BufNewFile,BufEnter *_test.rb,test_*.rb
"       \ :nmap <leader>r :w<CR>:call Send_to_Screen("ruby -Itest -Ilib -rubygems " . expand("%") . "\n")<CR>|
"     autocmd BufRead,BufNewFile,BufEnter *_spec.rb
"       \ :nmap <leader>r :w<CR>:call Send_to_Screen("rspec " . expand("%") . "\n")<CR>|
" 
"     autocmd Filetype eruby source ~/.vim/scripts/closetag.vim
"   augroup END
" 
"   augroup Cucumber
"     autocmd!
"     autocmd BufNewFile,BufReadPost,BufEnter *.feature,*.story
"       \ set filetype=cucumber|
"       \ :nmap <leader>r :w<CR>:call Send_to_Screen("cucumber -r features " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
"       \ :nmap <leader>R :w<CR>:call Send_to_Screen("cucumber -r features " . expand("%") . "\n")<CR>|
"   augroup END
" 
"   " Execute the last command executed in screen.
"   :nmap <leader>l :w<CR>:call Send_to_Screen("exec_last_feature_or_test\n")<CR>
"   :nmap <leader>L :call Send_to_Screen("!!\n")<CR>
" 
"   augroup Vim
"     autocmd!
" 
"     " Reload vimrc after save.
"     autocmd BufWritePost ~/.vimrc so ~/.vimrc
" 
"     " Create the directory if it doesn't exist.
"     autocmd BufNewFile * silent !mkdir -p $(dirname %)
"   augroup END
