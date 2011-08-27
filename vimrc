"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc configuration file
"
" File: $HOME/.vimrc
" Maintainer:   Davide Rambaldi <tucano@recipient.cc>
"
" Last Change:  2008 Sep 
" Usage: copy it to
"         for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"         for MS-DOS and Win32:  $VIM\_vimrc
"         for OpenVMS:  sys$login:.vimrc
"
" BACKUP DIRECTORY: ~/.vim/backupfiles/
" 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------------------------------------
" Standard stuff.
"------------------------------------------------------------------------------

set verbose=0           " When bigger than zero, Vim will give messages about what it is doing.
set nocompatible        " Disable vi compatibility.
set history=100         " Number of lines of command line history.
set undolevels=200      " Number of undo levels.
set number              " line numbers o the left
set title               " Show title in xterm window
set showmode            " If in Insert, Replace or Visual mode put a message on the last line.
set showmatch           " Show matching brackets.
set matchtime=2         " Tenths of a second to show the matching paren, when 'showmatch' is "set.
set showmode            " Show current mode.
set nowrap              " I prefeer no wrap long lines....
set visualbell          " Silence the bell, use a flash instead
set noerrorbells        " no freaking error bells
set laststatus=2        " The value of this option influences when the last window will have a status line
set report=0            " show a report when N lines were changed. report=0 thus means show all changes
set ttyfast             " We have a fast terminal connection.
set ttyscroll=100       " Default=999 lower scrolling = faster

"write a .viminfo file, don't store more than 150 lines of registers
set viminfo='100,\"150,n~/.viminfo

"------------------------------------------------------------------------------
" FILE FORMAT
"------------------------------------------------------------------------------
set fileformat=unix                  " unix file format

"------------------------------------------------------------------------------
" BACKUP
"------------------------------------------------------------------------------
" set nobackup            " Do not keep a backup file.

" create ~/.vim/backupfiles/ if it doesn't exist.
if has("unix")
	 if !isdirectory(expand("~/.vim/backupfiles/."))
	  !mkdir -p ~/.vim/backupfiles/
	 endif
endif

set backup                           " keep a backup file
set writebackup                      " yes, make a backup before overwriting a file
set backupdir=~/.vim/backupfiles/    " backup dir
set backupext=~                      " backup extension

"------------------------------------------------------------------------------
" Syntax
"------------------------------------------------------------------------------
" Enable syntax-highlighting.
if has("syntax")
  syntax on
  syntax enable
endif

"------------------------------------------------------------------------------
" INDENTATION
"------------------------------------------------------------------------------
set autoindent                     " Copy indent from current line when starting a new line
set smartindent                    " Do smart autoindenting when starting a new line.
set shiftwidth=4                   " Number of spaces to use for each step of (auto)indent.
set tabstop=4                      " Number of spaces that a <Tab> in the file counts for. (Bad 4 Makefiles!)
set list                           " LIST display TAB end EOF
set listchars=tab:\|\              " use a | to display a TAB

"------------------------------------------------------------------------------
" FOLDING
"------------------------------------------------------------------------------
set foldenable                     " Enable folding
set foldmethod=marker              " Folding configuration marker: # {{{ }}} #
                                   " zf create fold, za open/close

"------------------------------------------------------------------------------
" Keys
"------------------------------------------------------------------------------
" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

"------------------------------------------------------------------------------
" Search
"------------------------------------------------------------------------------
set hlsearch           " When there is a previous search pattern, highlight all its matches
set noterse            " show search message when wrapping around
set magic              " Use 'magic' patterns (extended regular expressions).
                       " NOTE: To avoid portability problems with using patterns, always keep this option at the default "on".
                       " Only switch it off when working with old Vi scripts.

"------------------------------------------------------------------------------
" AUTOCOMPLETITION COMMAND LINE
"------------------------------------------------------------------------------
set wildchar=<TAB>                 " Character you have to type to start wildcard expansion in the command-line
set wildmode=full                  " Completion mode that is used for the character specified with  'wildchar'
                                   " Complete the next full match.  After the last match,
                                   " the original string is used and then the first match again.
set wildmenu                       " When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildignore=*.o,*~,*.bak        " Tab complete now ignores these
set suffixes=.~,.bak,.class,.o,.aux,.bak,.dvi,.idx,.log,.ps,.swp,.tar " Ignore filename with any of these suffixes when using the :edit command.

"------------------------------------------------------------------------------
" AUTOCOMPLETION INSERT MODE
"------------------------------------------------------------------------------
set showfulltag                     " When completing a word in insert mode
set complete=.,b,u,w,t,i,d          " buffers used for loop in INSERT MODE autocompletion CTRL-X and CTRL-P (prev) or CTRL-N (next)
                                    " .   scan the current buffer ('wrapscan' is ignored)
                                    " w   scan buffers from other windows
                                    " b   scan other loaded buffers that are in the buffer list
                                    " u   scan the unloaded buffers that are in the buffer list
                                    " i   scan current and included files
                                    " d   scan current and included files for defined name or macro
                                    " ]   tag completion
                                    " t   same as ']'



"------------------------------------------------------------------------------
" BUFFER OPTIONS
"------------------------------------------------------------------------------
set winheight=100                  " current buffer is always at maxheight
set scrolloff=3                    " Minimal number of screen lines to keep above and below the cursor.

"------------------------------------------------------------------------------
" Function keys.
"------------------------------------------------------------------------------

" F1: Toggle hlsearch (highlight search matches).
nmap <F1> :set hls!<CR>                    

" F2: map Buffer UP
map <F2> OA

" map Buffer DOWN to F3
map <F3> OB

" F4: Write current date 
map <F4> :r !date<CR>


"------------------------------------------------------------------------------
" SHELL and SEARCH PATH
"------------------------------------------------------------------------------
set shell=/bin/bash                   " Name of the shell to use for ! and :! commands.
set path=.,src/*,src/,src/include/,,  " This is a list of directories which will be searched when using

"------------------------------------------------------------------------------
" File-type specific settings.
"------------------------------------------------------------------------------

if has("autocmd")

  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype on
  filetype plugin on
  filetype indent on
  filetype plugin on

  " Turn off ALL indenting for the given file types: 
  autocmd BufEnter *.html setlocal indentexpr= 
  autocmd BufEnter *.htm  setlocal indentexpr= 
  autocmd BufEnter *.xml  setlocal indentexpr= 
  autocmd BufEnter *.xsd  setlocal indentexpr= 
  au BufWrite /private/tmp/crontab.* set nowritebackup  " Don't write backup file if vim is being called by "crontab -e"
  au BufWrite /private/etc/pw.*      set nowritebackup  " Don't write backup file if vim is being called by "chpass"

  " Python code.
  augroup python
    autocmd BufReadPre,FileReadPre      *.py set tabstop=4
    autocmd BufReadPre,FileReadPre      *.py set expandtab
  augroup END

  " Ruby code.
  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set tabstop=2
    autocmd BufReadPre,FileReadPre      *.rb set expandtab
    autocmd BufReadPre,FileReadPre      *.rb set shiftwidth=2
    autocmd BufReadPre,FileReadPre      *.rb set nolist
  augroup END

  " PHP code.
  augroup php
    autocmd BufReadPre,FileReadPre      *.php set tabstop=4
    autocmd BufReadPre,FileReadPre      *.php set expandtab
  augroup END

  " Java code.
  augroup java
    autocmd BufReadPre,FileReadPre      *.java set tabstop=4
    autocmd BufReadPre,FileReadPre      *.java set expandtab
  augroup END

  " Mindstorm NBC
  au BufNewFile,BufRead                 *.nbc,*.nxc set syntax=nqc

endif

"------------------------------------------------------------------------------
" Local settings.
"------------------------------------------------------------------------------

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"------------------------------------------------------------------------------
" GUI STUFF 
"------------------------------------------------------------------------------
" Use less as Pager if we are in a GUI
if has("gui_running") && system('ps xw | grep "Vim -psn" | grep -vc grep') > 0
	
	" Get the value of $PATH from a login shell.
	" If your shell is not on this list, it may be just because we have not
	" tested it.  Try adding it to the list and see if it works.  If so,
	" please post a note to the vim-mac list!
	set icon                           " the icon text of the window will be set to the value of the name of the file
	let $PAGER = 'less'
	let $LESS  = 'dQFe'
	
	"----------COLORS
	highlight search term=bold ctermfg=14  ctermbg=11 guifg=Black guibg=#80aaaa   " search
	highlight Normal guibg=grey85                                                 " Gvim color background                        
	if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
		let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
		let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
	endif
endif

"------------------------------------------------------------------------------
" MAC OSX TERMINAL.app compatibility
"------------------------------------------------------------------------------
" note that the following rval is made by hitting ctrl-v and then backspace...
" this remaps backspace to actualy BACKSPACE - not delete.
" x-term color is Terminal.app
" x-term is X11.app
if &term == "xterm-color"
	set t_kb=                    " Fixes the damn backspace problem
	set enc=utf-8                  " Set encoding to utf-8 Unicode also in
	                               " Terminal.app --> Windows settings -->
	                               " Display
	                               " in Emulation select "Escape non-ASCII
	                               " characters".
	fixdel
elseif &term == "xterm"
	set mouse=a                    " set mouse if X11.app
	set t_kb=                    " Fixes the damn backspace problem
	fixdel
endif

