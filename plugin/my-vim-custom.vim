" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

": colorscheme {{{

" https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
let &t_ut=''

" tmux hack to make truecolor work
" https://github.com/iCyMind/NeoSolarized
"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum
"set background=light
set termguicolors
set t_Co=256
set background=dark
set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
"set background=light
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
let g:rigel_lightline = 1
let g:lightline = { 'colorscheme': 'rigel' }

let g:neosolarized_contrast = "high"
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

let g:neodark#background = '#202020'
"let g:neodark#use_256color = 1 " default: 0
"let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0


let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
"let g:loaded_python_provider = 1
let g:python2_host_prog = '/usr/local/bin/python2'

"let g:deoplete#enable_at_startup = 1

" filetype plugin indent on
syntax enable
" syntax on

": }}}

": vim general settings {{{

": indent settings {{{ id=g12607

" ref: error: vim bazen 6 space ile indent ediyor bazen 2  <url:file:///~/projects/study/otl/cvim.otl#r=g12606>
" ref: /usr/local/Cellar/neovim/0.6.0/share/nvim/runtime/indent/vim.vim

set tabstop=2      " An indentation every two columns

" [vim - Setting autoindentation to spaces in neovim? - Stack Overflow](https://stackoverflow.com/questions/51995128/setting-autoindentation-to-spaces-in-neovim/51995699)
" length to use when editing text (eg. TAB and BS keys)
" (0 for ‘tabstop’, -1 for ‘shiftwidth’):
set softtabstop=0
" length to use when shifting text (eg. <<, >> and == commands)
" (0 for ‘tabstop’):
set shiftwidth=0
" round indentation to multiples of 'shiftwidth' when shifting text
" (so that it behaves like Ctrl-D / Ctrl-T):
set shiftround

set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4

set expandtab                           " Converts tabs to spaces
" try to be smart (increase the indenting level after ‘{’, decrease it after ‘}’, and so on):
" smartindent is deprecated: [whitespace - Tab key == 4 spaces and auto-indent after curly braces in Vim - Stack Overflow](https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim)
set nosmartindent                         " Makes indenting smart
" reproduce the indentation of the previous line:
set autoindent                          " Good auto indent

" indent folding with manual folds
" http://vim.wikia.com/wiki/Folding
augroup vimrc
  autocmd BufReadPre * setlocal foldmethod=indent
  autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set foldmethod=syntax

" Get that filetype stuff happening
" use language‐specific plugins for indenting (better):
filetype plugin indent on

" do NOT expand tabulations in Makefiles:
autocmd FileType make setlocal noexpandtab

" for the C language, indent using 4‐column wide tabulation characters,
" but make <Tab> insert half‐indentations as 2 spaces (useful for labels):
autocmd FileType c setlocal noexpandtab shiftwidth=2

" use shorter indentation for Bash scripts:
autocmd FileType sh setlocal tabstop=2

autocmd FileType vim setlocal expandtab nosmartindent

": tab space convert {{{
" convert spaces to tabs
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\\( \\{'.&ts.'\\}\\)\\+#\\=repeat("\\t", len(submatch(0))/' . &ts . ')'
function! Tab2Space()
  set expandtab
  retab
endfunction
command! Tab2Space :call Tab2Space()
" use spaces instead of tabs
" zN
nmap zI :set expandtab \| :retab<cr>
function! UseSpaces()
  set tabstop=2     " Size of a hard tabstop (ts).
  set shiftwidth=2  " Size of an indentation (sw).
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

": tab space convert  }}}

": indent settings }}}

" autocompletion for command line 
" [defaults: wildoptions=pum,tagfile by justinmk · Pull Request #10384 · neovim/neovim](https://github.com/neovim/neovim/pull/10384)
set wildmenu
set wildmode=longest:full,full
set wildoptions+=pum
set wildoptions+=tagfile
set pumblend=20
set pumheight=150


" [](https://www.chrisatmachine.com/Neovim/02-vim-general-settings/)

let g:mapleader = "\<Space>"
let g:maplocalleader =',' 

set nohidden                              " Required to keep multiple buffers open multiple buffers
" set nowrap                              " Display long lines as just one line
set wrap         " wrap long lines
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                                                                                       " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300                      " Faster completion
set formatoptions-=cro                  " Stop newline continution of comments
"set autochdir                           " Your working directory will always be the same as your working directory

autocmd! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

set linespace=3
"set guifont=Fira\ Code:h12
set guifont=JetBrains\ Mono:h12
set cursorline

set smartcase       " become case sensitive if you type uppercase characters
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set viminfo='200,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set history=5000          " keep 50 lines of command history
let notabs=1

set textwidth=0
set wrapmargin=0

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions=ces$

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
" hide menu and toolbars
set guioptions=ac

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
" set timeoutlen=500
set timeoutlen=200

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Folding for functions and augroups
let g:vimsyn_folding='af'

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" For how *I* code these are the best types of settings for
" completion but I get rid of some neat things that you might
" like
set complete=.,w,b,t

" Incrementally match the search.  I orignally hated this
" but someone forced me to live with it for a while and told
" me that I would grow to love it after getting used to it...
" turns out he was right :)
set incsearch

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" ignore case in searches
set ignorecase

" other settings

set textwidth=0 wrapmargin=0

set relativenumber
set number                              " Line numbers

" dbext profile - database connection string
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=:dbname=test_xbrl'

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" use system clipboard as register
set clipboard=unnamedplus               " Copy paste between vim and everything else

": Derek Wyatt settings {{{

" Taken from Derek Wyatt http://www.derekwyatt.org/vim/the-vimrc-file/

" Forget being compatible with good ol' vi
set nocompatible

filetype detect

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
"set wildmenu=longest,list
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set wildignore+=**/tmp/*,*.swp,*.zip,*.exe
set wildignore+=**/node_modules/**

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Toggle paste mode
"nmap  ,p :set paste!|:set paste?

" Turn off that stupid highlight search
"nmap  ,n :set hls!|:set hls?

" Set text wrapping toggles
"nmap  ,w :set wrap!|:set wrap?

" Set up retabbing on a source file
nmap  ,rr :1,$retab<cr>

" vmap <C-x> :!pbcopy<CR>  
" vmap <C-c> :w !pbcopy<CR><CR> 
"nmap <Space> <C-d>
nmap <S-Space> <C-u>

" MRU settings
let MRU_Max_Entries = 5000
 
set backupdir=~/.vim/backup

" set highlight for search
set hlsearch

set directory=~/.vim/tmp,.
" disable swap files
set noswapfile

" autosave every sec
autocmd! CursorHoldI,CursorHold,BufLeave <buffer> silent! :update

": }}} Derek Wyatt


": }}} vim general settings 

": startify settings {{{

let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]

let g:startify_commands = [
		\ ':colorscheme OceanicNext',
		\ ':help reference',
		\ ['Vim Reference', 'h ref'],
		\ {'h': 'h ref'},
		\ {'m': ['My magical function', 'call Magic()']},
		\ ]

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
": startify settings }}}

": netrw settings {{{

" netrw vinegar options
" https://shapeshed.com/vim-netrw/
let g:netrw_browsex_viewer = "open"
" make tree style default
let g:netrw_liststyle = 3
" remove the directory banner
let g:netrw_banner = 0
" open files in horizontal split by default (1)
let g:netrw_browse_split = 0
let g:netrw_winsize = 25
" change from left split to right splitting
let g:netrw_altv = 1

": netrw settings }}}

": clojure settings {{{

" vim-clojure-static additional syntax keywords
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }
let g:clojure_maxlines = 100
let g:clojure_align_multiline_strings = 1
let g:clojure_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,defn'

": clojure settings }}}

": highlighting several words {{{

": https://github.com/t9md/vim-quickhl
nmap <Space>hm <Plug>(quickhl-manual-this)
xmap <Space>hm <Plug>(quickhl-manual-this)
nmap <Space>hM <Plug>(quickhl-manual-reset)
xmap <Space>hM <Plug>(quickhl-manual-reset)

": }}}

": conceal {{{
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
": }}} conceal

": all {{{

" outline operation Move Left (<< ^Left ül) work always
let g:voom_always_allow_move_left = 1

" conceallevel=1 olursa markdown içindeki `` gibi semboller gizlenir
" autocmd BufRead,BufNewFile,BufWritePost *.md setlocal nospell conceallevel=0
" autocmd BufRead,BufNewFile,BufWritePost *.markdown setlocal nospell conceallevel=0
" rfr: ~/prj/private_dotfiles/.vim/after/ftplugin/markdown.vim
" autocmd FileType markdown set conceallevel=0
" spell check
autocmd BufRead,BufNewFile *.otl setlocal nospell
autocmd BufRead,BufNewFile *.txt setlocal nospell
" set nospell
" word completion with ^N ^P
set complete+=kspell
" spell check exclude: id=g93092
syn match mygIdWords +\<g\d\+\>+ contains=@NoSpell
" spell check exclude: p01 a01
syn match p01a01Words +\<\w\d\d\>+ contains=@NoSpell

" naming conventions for custom commands:
" Put
" Convert
" Collect
" Sort
" Replace
" Copy
" Extract
" Ref
" Id
" Paste

let NERDCreateDefaultMappings=0

function! Test()
  norm o
  norm "cP
  norm gcc
  norm ^
endfunction

": fff file manager plugin settings {{{

" FFF file manager
" [dylanaraps/fff.vim: A plugin for vim/neovim which allows you to use fff as a file opener.](https://github.com/dylanaraps/fff.vim)

": }}}

": }}}

": path shortcuts {{{

let $MYNOTES = '~/gdrive/mynotes/'
let $MYREPO = '~/projects/myrepo'
let $LAYERMARK = '/Users/mertnuhoglu/gdrive/btg/layermark_projects'

" plehn work
let $PLEHNPROJECT = '$HOME/Dropbox2/projects/SEC_Filings/parser/'
"command! CdPlehnDocs cd $KEYNOTE/plehn
"command! CdPlehnCodes cd $PLEHNPROJECT
"command! Cd10k cd $PLEHNPROJECT . 'filings/10k/'
"command! EFlowDocumentationPlehn e $HOME/projects/SEC_Filings/parser/flow.otl
"command! EFlowAutomatic e $HOME/projects/SEC_Filings/parser/automatic_flow.otl
"command! EMySecFilings e $HOME/.vim/bundle/my-sec-filings/plugin/my-sec-filings.vim

" projects for others
let $EVAMPROJECT = '$HOME/projects/study/study_evammoa'
"command! ENotesEvamMoa e $EVAMPROJECT/notes_evam.otl
"command! EPragmaNotes e $HOME/gdrive/IntelligentSearchAssistant/customer_development/meeting_notes_pragma.otl

command! Elamsmeeting e ~/gdrive/btg/layermark_projects/ams/ams_meeting_notes_mert.md
command! Elcatchbasin e /Users/mertnuhoglu/gdrive/btg/layermark_projects/catchbasin/catchbasin_meeting_notes_mert.md
command! Eldmb e ~/gdrive/btg/layermark_projects/dmb/dmb_meeting_notes_mert.md | :normal zT
command! Eleems e ~/gdrive/btg/layermark_projects/ems/ems_meeting_notes_mert.md | :normal zT
command! Elgreendrop e /Users/mertnuhoglu/gdrive/btg/layermark_projects/greendrop/greendrop_meeting_notes_mert.md | :normal zT
command! Elhydrant e /Users/mertnuhoglu/gdrive/btg/layermark_projects/hydrant/hydrant_meeting_notes_mert.md | :normal zT
command! Elopal e ~/gdrive/btg/layermark_projects/opal/opal_meeting_notes_mert.md | :normal zT
command! Elprvmeeting e ~/gdrive/btg/private_layermark/prv_meeting_notes_mert.md | :normal zT
command! Elvms e ~/gdrive/btg/layermark_projects/vms/valve_meeting_notes.md | :normal zT
command! Elwmms e ~/gdrive/btg/layermark_projects/wmms/wmms_meeting_notes_mert.md | :normal zT

command! Elopalsndmrt e ~/gdrive/btg/layermark_projects/opal/opal_sandbox_mert.md
command! Elprvpersonal e ~/gdrive/btg/private_layermark/prv_personal_layermark/prv_personal_layermark.otl
command! Elglobal e ~/gdrive/btg/layermark_projects/opal/doc/global_doc_mert.md | :normal zT
command! Elmodulardocumentation e ~/gdrive/btg/layermark_projects/opal/doc/outline_modular_documentation.md | :normal zT
command! Elgtd e ~/gdrive/btg/layermark_projects/opal/gtd_list_mert.md | :normal zT
command! Elamsnotes e ~/gdrive/btg/layermark_projects/ams/ams_notes.otl
command! Elsrs e ~/gdrive/btg/layermark_projects/opal/doc/doc_srs.md
command! Elinterviewnotes e ~/gdrive/btg/BTG_HR/interview/interview_notes_mert.md | :normal zT
command! Elevaluationsofanalysts e ~/gdrive/btg/BTG_HR/80-GELEN CEVAPLAR/10-Analyst/analyst_evaluations_mert_nuhoglu.otl | :normal zT
" ref: layermark_files_map <url:file:///~/projects/private_dotfiles/.config/nvim/lua/mert/which-key.lua#r=g13006>

" Cd commands
let $KEYNOTE = '$HOME/gdrive/Apps/MindMup/'
"let $PROJECTS = '$HOME/projects/'
"let $NOTATIONALDATA = '$HOME/gdrive/Apps/Notational Data/'
"let $DROPBOX = '$HOME/gdrive/'
"let $MYNOTES = '$HOME/gdrive/mynotes/'
"let $DSCP = '$HOME/projects/dewey/dscp/'
command! CdContent cd $MYNOTES/content | :pwd
command! Cdc CdContent  | :pwd
command! CdVim cd $HOME/.vim | :pwd
" cd to keynote export/import directory
command! CdScripts cd '$HOME/projects/scripts' | :pwd
command! CdKeynote cd $KEYNOTE | :pwd
command! CdProjects cd $PROJECTS | :pwd
command! Cdp CdProjects
command! CdLayermark cd $LAYERMARK | :pwd
command! CdLymAms cd $LYM_AMS | :pwd
command! CdLymOpal cd $LYM_OPAL | :pwd
command! CdLymDmb cd $LYM_DMB | :pwd
command! CdLymVms cd $LYM_VMS | :pwd
command! CdLymEms cd $LYM_EMS | :pwd
command! CdLymWmms cd $LYM_WMMS | :pwd
" copy file name to system clipboard
"command! CdNotationalData cd $NOTATIONALDATA
"let $STUDY = '$HOME/projects/study'
"let $ITR = '$HOME/projects/itr'
"let $ITR_DOC = '$HOME/projects/itr/vrp_doc'
"let $VRP_PSK = '$VRP_PSK'
"let $YUML2DATA_WT = '$YUML2DATA_WT'
"let $DATA_MODEL = '$DATA_MODEL'
"let $YUML2DATA_R = '$YUML2DATA_R'
"let $YUML2DATA = '$YUML2DATA_R'
"let $BIZQUALIFY = '$HOME/projects/bizqualify'
let $BQdatarun = '$BIZQUALIFY/BQ-data-run'
let $BigQuery = '$BIZQUALIFY/BigQuery'
let $BzqWebapp = '$BIZQUALIFY/web_app'
let $BzqDoc = '$BIZQUALIFY/bq_doc'
let $KNS = '$KNS'
let $NHV = '$NHV'
let $CMMI = '$CMMI'
let $CMMIC = '$CMMIC'
let $CMMIMY = '/Users/mertnuhoglu/projects/myrepo/prj/cmmi'
command! Cdgdrive cd /Users/mertnuhoglu/gdrive | :pwd
command! Cdlogseq cd ~/gdrive/logseq/logseq | :pwd
command! Cdmynotes cd /Users/mertnuhoglu/gdrive/mynotes | :pwd
command! Cdfulcro cd /Users/mertnuhoglu/codes/clojure/fulcro/tutorial_tags | :pwd
command! Cdcmmi cd $CMMIMY | :pwd
command! Cdbtgcmmi :Cdcmmi
command! Cdmn cd $MYNOTES | :pwd
command! Cdprojects cd $PROJECTS | :pwd
command! Cdstudy cd $STUDY | :pwd
command! CdMyrepo cd $MYREPO | :pwd
command! Cdmyr cd $MYREPO | :pwd
command! Cdgrsm cd ~/gdrive/grsm
command! Cdbdoc cd $BzqDoc | :pwd
command! Cdkns cd $KNS | :pwd
command! Cditr cd $ITR | :pwd
command! Cdvrpdoc cd $VRP_DOC | :pwd
command! Cdpalet cd $DENTAS_PALET | :pwd
command! Cdpeyman cd $PEYMAN_PROJECT_DIR | :pwd
command! Cdpmap cd $PMAP | :pwd
command! Cdpvrp cd $PVRP | :pwd
command! Cdpvrpr cd $PVRPR | :pwd
command! Cditd cd $ITR_DOC | :pwd
command! Cditrvrppsk cd $VRP_PSK | :pwd
command! Cdvrppsk Cditrvrppsk  | :pwd
command! Cdyuml2datawt cd $YUML2DATA_WT | :pwd
command! Cdy2dwt Cdyuml2datawt | :pwd
command! Cdy2dr cd $YUML2DATA_R | :pwd
command! Cdbzq cd $BIZQUALIFY | :pwd
command! Cdbdr cd $BQdatarun | :pwd
command! Cdbq cd $BigQuery | :pwd
command! Cdbw Cdbzqwebapp | :pwd
command! Edershaftalik :e "$HOME/gdrive/Apps/Notational Data/ders_ozne_ben_nesne/haftalik_ders.otl"

" E commands

" mynotes/ files
command! Enwork e ~/projects/myrepo/work/work.otl
command! Enw Enwork
command! Enwork2 e ~/projects/myrepo/work/work2.otl
command! Enwork3 e ~/projects/myrepo/work/work3.otl
command! Enwork4 e ~/projects/myrepo/work/work4.otl
command! Enknwl e ~/projects/myrepo/otl/knwl.otl
command! Enindexnotes e /Users/mertnuhoglu/projects/myrepo/otl/index_notes.otl
command! Enactivities e /Users/mertnuhoglu/projects/myrepo/otl/activities.otl
command! Enarticles e /Users/mertnuhoglu/projects/myrepo/otl/articles.otl

" mynotes/content/ files
command! Erefmine e ~/projects/myrepo/refmine.otl
command! Erm Erefmine
command! EquickstartKms :Utl openLink ~/projects/myrepo/refmine.otl#r=g_11660
command! EquickstartQuickstarts :Utl openLink ~/projects/myrepo/refmine.otl#r=11708
command! EquickstartCmmi :Utl openLink ~/projects/btg/btg_cmmi/logbook/study_cmmi.otl#r=g_11704
command! EquickstartLym :Utl openLink ~/projects/lym/lym/study_lym.otl#r=g_11707
command! EquickstartNhv :Utl openLink ~/gdrive/mynotes/prj/stk/nuhoglu_vakfi_personal/study_nhv.otl#r=g_11709
command! Erefcard e $STUDY/other/refcard.otl
command! Erc Erefcard
command! Erefcardarchive e $STUDY/other/refcard_archive.otl
command! Ercar Erefcardarchive
command! Erclojure e $STUDY/clj/refcard_clojure.otl
command! Ercl Erclojure
command! Erconvertdata e $STUDY/r/rfc_convert_data.md
command! Ercd Erconvertdata
command! Earticlesr e ~/projects/study/r/articles_r.md
command! Ear Earticlesr
command! Earticlesjs e ~/projects/study/js/articles_js.md
command! Earticlesdb e ~/projects/study/db/articles_db.md
command! Eadb Earticlesdb
command! Eajs Earticlesjs
command! Earticlesjava e ~/projects/study/java/articles_java.md
command! Eaj Earticlesjava
command! Earticlesdatascience e ~/projects/study/ds/articles_datascience.md
command! Eads Earticlesdatascience
command! Earticlesfp e ~/projects/study/fp/articles_fp.md
command! Eafp Earticlesfp
command! Earticlesai e ~/projects/study/ai/articles_ai.md
command! Eaai Earticlesai

" logseq files
command! Elgdrive e ~/gdrive/logseq/logseq/config.edn
command! Elstudy e ~/projects/study/logseq/logseq/config.edn
command! Ellogseqotl e ~/projects/study/code/logseq.otl

" study/otl/ files
command! Ecinfo e ~/projects/study/otl/cinfo.otl
command! Eci Ecinfo
command! Eccode e ~/projects/study/otl/ccode.otl
command! Ecc Eccode
command! Ecodeai  e ~/projects/study/otl/cai.otl
command! Ecoder e ~/projects/study/otl/cr.yaml
command! Ecr Ecoder
command! Ecodejava e ~/projects/study/otl/cjava.otl
command! Ecodeclojure e ~/projects/study/logseq-study/pages/clojure-otl.md
command! Ecj Ecodeclojure
command! Ecodedb e ~/projects/study/otl/cdb.otl
command! Ecdb Ecodedb
command! Ecodejs e ~/projects/study/otl/cjs.otl
command! Ecjs Ecodejs
command! Ecodefp e ~/projects/study/otl/cfp.otl
command! Ecvim e ~/projects/study/otl/cvim.otl
command! Ecemacs e ~/projects/study/otl/cemacs.otl
command! Eceng e ~/projects/study/otl/cenglish.otl

" clojure files
command! Ecodedatomic e ~/projects/study/clj/datomic.otl
command! Ecodesexp e ~/projects/study/clj/sexp_editing.otl
command! Ecodefulcro e ~/projects/study/clj/fulcro.otl
command! EArticlesFulcro e ~/projects/study/clj/articles_fulcro.otl
command! EArticlesClojure e ~/projects/study/clj/articles_clojure.otl

" study/ files
command! Esclojurescript e ~/projects/study/clj/study_clojurescript.md
command! Escj Esclojurescript
command! Esclojure e ~/projects/study/clj/study_clojure.md
command! Escl Esclojure
command! Eseng e ~/projects/study/other/study_english.Rmd
command! Estudybash e ~/projects/study/bash/study_bash.Rmd
command! Esbash Estudybash
command! Escode e ~/projects/study/code/study_code.Rmd
command! Esc Escode
command! Estudydb e ~/projects/study/db/study_db.Rmd
command! Esdb Estudydb
command! Eexamplesdb e ~/projects/study/db/examples_db.Rmd
command! Eedb Eexamplesdb
command! Eexamplesvim e ~/projects/study/vim/examples_vim.Rmd
command! Eevim Eexamplesvim
command! Eexamplesbash e ~/projects/study/bash/examples_bash.Rmd
command! Eeb Eexamplesbash
command! Eexamplesr e ~/projects/study/r/examples_r.Rmd
command! Eer Eexamplesr
command! Estudyr e ~/projects/study/r/study_r.Rmd
command! Esr Estudyr
command! Estudyshiny e ~/projects/study/r/shiny/study_shiny.Rmd
command! Estudyjs e ~/projects/study/js/study_js.Rmd
command! Esjs Estudyjs
command! Estudyts e ~/projects/study/js/study_ts.Rmd
command! Ests Estudyts
command! Estudycyclejs e ~/projects/study/js/study_notes_cyclejs.Rmd
command! Escjs Estudycyclejs
command! Estudycyclejsexamples e ~/projects/study/js/study_cyclejs_examples.Rmd
command! Estudydbvrp e ~/projects/study/db/db_vrp.Rmd
command! Estudyvrpcyclejs e ~/projects/study/js/vrp/cyclejs_vrp.Rmd
command! Estudypostgreststarterkit e ~/projects/study/db/study_postgrest_starter_kit.Rmd
command! Espsk Estudypostgreststarterkit
command! Esvrpc Estudyvrpcyclejs
"command! Elb e $HOME/projects/study/logbook
command! Esvim e ~/projects/study/vim/study_vim.Rmd
command! Esv Esvim
"command! Estudyvrp e ~/projects/itr/vrp/vrp_doc/study/study_vrp.Rmd
"command! Esvrp Estudyvrp
command! Erefbookmarks e ~/projects/study/code/refbookmarks.otl
command! Erb Erefbookmarks
command! Estudyspacemacs e ~/projects/study/emacs/spacemacs.md
command! Ess Estudyspacemacs
command! Estudyintellij e ~/projects/study/code/study_intellij.md
command! Esij Estudyintellij
command! Estudykeybindings e ~/projects/study/keybindings_vim_emacs_intellij.otl

" prj/ files
command! Ennotesnhv e ~/gdrive/mynotes/prj/stk/nuhoglu_vakfi_personal/notes_nhv.otl
command! Ennotesdscp e ~/gdrive/mynotes/prj/dscp/notes_dscp.otl
command! Endocitr e ~/projects/itr/vrp/vrp_doc/doc_itr.md
command! Ennotesitr e ~/gdrive/mynotes/prj/itr/notes_itr.md
command! Ennotespvrp e ~/gdrive/mynotes/prj/itr/notes_pvrp.md
command! Enkinesin e ~/gdrive/mynotes/prj/biz/startup_projects/kinesin/notes_kinesin.md
"command! Enotesbzq e ~/gdrive/mynotes/prj/bzq/notes_bzq.md
"command! Edocbzq e ~/gdrive/mynotes/prj/bzq/doc_bzq.md
"command! Enotessipa e ~/gdrive/mynotes/prj/sipa/notes_sipa.md
"command! Edocsipa e ~/gdrive/mynotes/prj/sipa/doc_sipa.md

command! Ejdepsedn e ~/.config/clojure/deps.edn

" cmmi files
command! Ecmgtd e ~/projects/myrepo/prj/cmmi/gtd_list_cmmi.otl
command! Ecmglobal e ~/projects/myrepo/prj/cmmi/global_doc_cmmi.otl
command! Ecmquestions e ~/projects/myrepo/prj/cmmi/questions_database.otl
command! Ecmdict e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/dictionary_cmmi.tsv
command! Ecmpascal e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/meeting_pascal/agenda_pascal.md
command! Ecmp Ecmpascal
command! Ecmleadappraiser e ~/projects/myrepo/prj/cmmi/lead_appraiser_training_20210704.otl
command! Ecml Ecmleadappraiser
command! Ecmmdd e ~/projects/myrepo/prj/cmmi/doc/mdd_ref.otl
command! Ecmstudy e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/study_cmmi.otl
command! Ecms Ecmstudy
command! Ecmchecklist e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/gap_analysis_checklist_questions.otl
command! Ecmc Ecmchecklist
command! Ecmartifacts e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/gap_analysis_artifacts_database.otl
command! Ecma Ecmartifacts
command! Ecmfindings e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/gap_analysis_findings_database.otl
command! Ecmf Ecmfindings
command! Ecmmodel e ~/projects/myrepo/prj/cmmi/doc/cmmi_model_v20.txt
command! Ecmm Ecmmodel
command! Ecmideas e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/ideas_cmmi.md
command! Ecmid Ecmideas
command! Ecmmpm e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/study_mpm.otl
command! Ecmdictionary e ~/projects/btg/btg_cmmi/logbook/dictionary_cmmi_official.md
command! Ecmd Ecmdictionary
command! Ecmatldatabase e ~/projects/myrepo/prj/cmmi/atl_database.otl
command! Ecmmodelpdf :!open /Users/mertnuhoglu/projects/myrepo/prj/cmmi/cmmi_mynotes/CMMI_Model_22.pdf
command! Ecmmddpdf :!open /Users/mertnuhoglu/projects/myrepo/prj/cmmi/cmmi_mynotes/MDD22.pdf
command! Ecmcopcpdf :!open /Users/mertnuhoglu/projects/myrepo/prj/cmmi/cmmi_mynotes/policies/COPC.pdf
command! Ecmmddxlsx :!open /Users/mertnuhoglu/projects/myrepo/prj/cmmi/cmmi_mynotes/mdd_tables.xlsx
command! Ecmrefpractices :e ~/projects/myrepo/prj/cmmi/ref_practices.otl
command! Ecmprocess :e ~/prj/myrepo/prj/cmmi/process_cmmi.otl
command! Ecmcurrentappraisal :e ~/gdrive/cmmi_appraisals_private/Shenzen-Super-Electron/cmmi_super_electron.otl

" vim scripts
command! Evmyvim e $HOME/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim
command! Evinfoman e $HOME/.vim/bundle/vim-infoman/plugin/vim-infoman.vim
command! Evkeybindings e $HOME/.vim/bundle/my-custom-keybindings/plugin/my-custom-keybindings.vim
command! Evdataflow e $HOME/.vim/bundle/vim-dataflow-generator-r/plugin/vim-dataflow-generator-r.vim
command! Evmymertprojects e $HOME/.vim/bundle/my-mert-projects/plugin/my-mert-projects.vim
command! Evhammerspoon e $HOME/prj/private_dotfiles/.hammerspoon/init.lua " SPC Evh
command! EvhammerspoonMenu e $HOME/prj/private_dotfiles/.hammerspoon/menuHammerCustomConfig.lua " SPC EvH

" myrepo notes files
command! Eesandbox e ~/projects/myrepo/scrap/sandbox.Rmd
command! Ees Eesandbox
command! Eninfop e /Users/mertnuhoglu/projects/myrepo/otl/infop.otl
command! Enidea e /Users/mertnuhoglu/projects/myrepo/otl/nidea.otl
command! Enid Enidea
command! Enidc e $HOME/projects/myrepo/notes/nproduct/nidea/nidea_content.md
command! Ennotesanki e /Users/mertnuhoglu/projects/myrepo/otl/notes_anki.otl
command! Ensettings e ~/projects/myrepo/otl/nsettings.otl
command! Enregistry e ~/projects/myrepo/otl/registry.otl
command! Enr Enregistry
command! Enprojects e ~/projects/myrepo/projects.otl
command! Enpformscheduler e ~/prj/myrepo/prj/ppfs/project-ppfs.otl

" mynotes/general files
command! Enconventions e ~/projects/myrepo/notes/general/conventions.md
command! Enconventionsnaming e ~/projects/myrepo/otl/conventions_naming.otl
command! Enprocesses e ~/projects/myrepo/otl/processes.otl
command! Enrules e ~/projects/myrepo/otl/rules.otl
command! Enquality e ~/projects/myrepo/notes/general/quality.md
command! Enkms e ~/projects/myrepo/otl/kms_ideas.otl
command! Enkmsref e ~/projects/myrepo/otl/refcard_kms.otl
command! Enotesme e ~/projects/myrepo/otl/notesme.otl
command! Enstandards e ~/projects/myrepo/otl/standards.otl
command! Enpstuff e ~/projects/myrepo/otl/pstuff.otl
command! Enstuff e /Users/mertnuhoglu/projects/myrepo/otl/cstuff.otl
command! Encs Enstuff
command! Englobal e ~/projects/myrepo/global_doc.otl
command! Engtd e ~/projects/myrepo/gtd_list.otl
command! Enlogbook e ~/projects/study/otl/logbook.otl
command! Engrsm e ~/prj/myrepo/logseq-myrepo/pages/grsm.md
command! Eggrsm e ~/gdrive/grsm/opal/docs-grsm/pages/gtd_list_grsm.md
command! Egglobal e ~/prj/myrepo/logseq-myrepo/pages/global_doc_grsm.md
command! Egmtng e ~/gdrive/grsm/mtng_grsm.md

" mynotes/ other files
command! Enps Enpstuff

command! Enmsd e $HOME/gdrive/mynotes/msd/notes_msd.otl
command! Enbiz e $HOME/gdrive/mynotes/biz/notes_biz.otl
command! Enstk e $HOME/gdrive/mynotes/stk/notes_stk.otl
command! Eness e $HOME/gdrive/mynotes/ess/notes_ess.otl
command! Enmvpe e $HOME/gdrive/mynotes/mvpe/notes_mvpe.otl
command! Ensfp e $HOME/gdrive/mynotes/sfp/notes_sfp.otl

" dotfiles
command! Edbashprofile e $HOME/.bash_profile
command! Edzshrc e $HOME/.zshenv
command! Edzs Edzshrc
command! Edfzfrefbash e $HOME/projects/private_dotfiles/fzf/refbash.txt
command! Edfrb Edfzfrefbash
command! Edfzfrefvrp e $HOME/projects/private_dotfiles/vim/refvrp.txt
command! Edfrvrp Edfzfrefvrp

function! Elvlbook()
  " opens lvlbook of today
  " goal:
  " Evb ->
  " e ~/projects/study/lvlbook/2017-11-27.md"
  let cmd = 'e ~/projects/study/lvlbook/lvl_' . strftime("%Y%m%d") . '.md'
  echo cmd
  execute cmd
endfunction
command! Evb call Elvlbook()

function! GetLogseqPath(logseq_repo, page_type) " id=g13607
  " get path of the document in logseq_repo for page_type
  " page_type_set = ['journals', 'pages']
  " logseq_repo_set = ['study', 'grsm', 'myrepo']
  let logseq_repo = a:logseq_repo
  let page_type = a:page_type
  let logseq_repo_set = ['study', 'grsm', 'myrepo']
  let page_type_set = ['journals', 'pages']
  if index(page_type_set, page_type) < 0
    echoerr 'page_type must be one of: ' . string(page_type_set)
  endif
  if index(logseq_repo_set, logseq_repo) < 0
    echoerr 'logseq_repo must be one of: ' . string(logseq_repo_set)
  endif

  let logseq_path = { 'study': 'projects/study/logseq-study', 'grsm': 'gdrive/grsm/opal/docs-grsm', 'myrepo': 'projects/myrepo/logseq-myrepo', }
  let dir = get(logseq_path, logseq_repo, 'gdrive/grsm/opal/docs-grsm')
  let path = '~/' . dir . '/' . page_type . '/' . strftime("%Y_%m_%d") . '.md'
  echo path
  return path
endfunction

function! ELogseqStudyJournal() " id=g13607
  " opens journal page of study repo of Logseq
  " goal:
  " Elsj ->
  " e ~/prj/study/logseq-study/journals/2022_11_29.md
  " let cmd = 'e ~/projects/study/logseq-study/journals/' . strftime("%Y_%m_%d") . '.md'
  " echo cmd
  " execute cmd
  let path = GetLogseqPath("study", "journals")
  let cmd = 'e ' . path
  execute cmd
  return cmd
endfunction
command! Elsj call ELogseqStudyJournal()
command! ELogseqStudyJournal call ELogseqStudyJournal()

function! ELogseqStudyPage() " SPC ibsp  id=g13766
  let path = GetLogseqPath("study", "pages")
  let cmd = 'e ' . path
  execute cmd
  return cmd
endfunction
command! Elsp call ELogseqStudyPage()
command! ELogseqStudyPage call ELogseqStudyPage()

function! ELogseqMyrepoJournal() 
  let path = GetLogseqPath("myrepo", "journals")
  let cmd = 'e ' . path
  echo cmd
  execute cmd
endfunction
command! Elmj call ELogseqMyrepoJournal()
command! ELogseqMyrepoJournal call ELogseqMyrepoJournal()

function! ELogseqMyrepoPage() " SPC ibbp id=g13753
  let path = GetLogseqPath("myrepo", "pages")
  let cmd = 'e ' . path
  echo cmd
  execute cmd
endfunction
command! Elmp call ELogseqMyrepoPage()
command! ELogseqMyrepoPage call ELogseqMyrepoPage()

function! ELogseqGrsmJournal() 
  let path = GetLogseqPath("grsm", "journals")
  let cmd = 'e ' . path
  echo cmd
  execute cmd
  normal! mJ
endfunction
command! Elgj call ELogseqGrsmJournal()
command! ELogseqGrsmJournal call ELogseqGrsmJournal()

function! ELogseqGrsmPage() " SPC ibgp 
  let path = GetLogseqPath("grsm", "pages")
  let cmd = 'e ' . path
  echo cmd
  execute cmd
  normal! mP
endfunction
command! Elgp call ELogseqGrsmPage()
command! ELogseqGrsmPage call ELogseqGrsmPage()

function! Elogbook()
  " opens logbook of today
  " goal:
  " Elb ->
  " e ~/projects/study/logbook/2017-11-27.md"
  let cmd = 'e ~/projects/study/logbook/log_' . strftime("%Y%m%d") . '.md'
  echo cmd
  execute cmd
endfunction
command! Elb call Elogbook()
command! Elogbook call Elogbook()
command! ElogbookStudy call Elogbook()

function! ElogbookMyr()
  " opens logbook of today
  " goal:
  " Elb ->
  " e ~/projects/study/logbook/2017-11-27.md"
  let cmd = 'e ' . $MYREPO . '/logbook/log_myr_' . strftime("%Y%m%d") . '.md'
  echo cmd
  execute cmd
endfunction
command! Elbmyr call ElogbookMyr()
command! ElogbookMyr call ElogbookMyr()

function! ElogbookLym()
  " opens logbook of today
  " goal:
  " Elb ->
  " e ~/projects/study/logbook/2017-11-27.md"
  let cmd = 'e ' . $LAYERMARK . '/logbook/log_lym_' . strftime("%Y%m%d") . '.md'
  echo cmd
  execute cmd
endfunction
command! Elblym call ElogbookLym()
command! ElogbookLym call ElogbookLym()

function! ElogbookKns()
  " opens logbook of today
  " goal:
  " Elb ->
  " e ~/projects/study/logbook/2017-11-27.md"
  let cmd = 'e ' . $KNS . '/logbook/log_kns_' . strftime("%Y%m%d") . '.md'
  echo cmd
  execute cmd
endfunction
command! Elbkns call ElogbookKns()

function! ElogbookNhv()
  " opens logbook of today
  " goal:
  " Elb ->
  " e ~/projects/study/logbook/2017-11-27.md"
  let cmd = 'e ' . $NHV . '/log_nhv_' . strftime("%Y%m%d") . '.md'
  echo cmd
  execute cmd
endfunction
command! Elbnhv call ElogbookNhv()

function! ElogbookCmmi()
  " opens logbook of today
  " goal:
  " Elb ->
  " e ~/projects/study/logbook/2017-11-27.md"
  let cmd = 'e ' . $CMMIMY . '/logbook/' . strftime("%Y%m%d") . '_log_cmmi.md'
  echo cmd
  execute cmd
endfunction
command! Elbcmmi call ElogbookCmmi()
command! ElogbookCmmi call ElogbookCmmi()

command! Eclikes e $LIKED_TWEETS_CSV
command! Ecfollowers e $FOLLOWERS_CSV
command! Eccontacts e $CONTACTS_CSV
command! Ectweets e $TWEETS_CSV
command! Ecmentions e $MENTIONS_CSV
command! Ecpocket e $POCKET_CSV

function! CreateExFile(name)
  " Create an example code file for the current md (documentation) file
  let filename = expand("%:t:r")
  let path = expand("%:p")
  lcd %:h
  exe '!mkdir -p ' . 'ex/' . filename . '/' . a:name
  split
  ene
  exe 'cd ex/' . filename . '/' . a:name
endfunction
command! -nargs=1 CreateExFile call CreateExFile(<f-args>)
function! CreateExFile2()
  " Create an example code file for the current md (documentation) file
  let l:fileprompt = input('File name: ')
  let filename = expand("%:t:r")
  let path = expand("%:p")
  lcd %:h
  exe '!mkdir -p ' . 'ex/' . filename . '/' . l:fileprompt
  split
  ene
  exe 'cd ex/' . filename . '/' . l:fileprompt
endfunction
command! CreateExFile2 call CreateExFile2()

": }}} path shortcuts

": tmux settings {{{ 

" arrow keys
if &term =~ '^screen' && exists('$TMUX')
  set mouse+=a
  " tmux knows the extended mouse mode
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


" tmux vim arrow keys problem
" http://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
" Make Vim recognize XTerm escape sequences for Page and Arrow
" keys combined with modifiers such as Shift, Control, and Alt.
" See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  map <Esc>[B <Down>
endif


": }}} vim general settings 

": filetype settings {{{ 

" markdown
" disable automatic bullets in markdown
let g:vim_markdown_new_list_item_indent = 0
autocmd BufNewFile,BufRead * setlocal formatoptions-=r
" disable automatic comment inserts
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" add Rmd file extension to markdown filetype
autocmd BufNewFile,BufRead *.Rmd set filetype=markdown

" augroup pandoc_syntax
" 		autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" rmarkdown support
autocmd! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" disable spelling in markdown
let g:pandoc#spell#enabled = 0
" soft wrap mode: j/k per real line not visible line
let g:pandoc#keyboard#display_motions = 0

" turn off expandtab for tsv/csv files
autocmd FileType csv setlocal noexpandtab
" json comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+


": }}} filetype settings 

": unmap settings {{{ 

try
  " ranger hijacks <Space>f unmap it
  unmap <Space>f
catch
endtry

": }}} unmap settings 

": compatible keybindings: vim vs spacemacs vim-which-key id=g_11007 {{{

let g:which_key_timeout = 300

": vim-which-key spacemacs emacs-which-key port {{{ id=g_11679

": https://github.com/liuchengxu/vim-which-key
"nnoremap <silent> <leader> :WhichKey 'ü'<CR>

command! ColorschemeGithubDark :colorscheme github-dark
command! ColorschemeGithubLight :colorscheme github-light
command! ColorschemeGithub :colorscheme github
command! ColorschemeMonokai :colorscheme Monokai
command! ColorschemeMountainDew :colorscheme MountainDew
command! ColorschemeOceanicNext :colorscheme OceanicNext
command! ColorschemePapayaWhip :colorscheme PapayaWhip
command! ColorschemeAyu :colorscheme ayu
command! ColorschemeRigel :colorscheme rigel
command! ColorschemeNightfly :colorscheme nightfly
command! ColorschemeVotlLight :colorscheme votl_light
command! ColorschemeSoftlight :colorscheme softlight
command! ColorschemeCatppuccin :colorscheme catppuccin
command! ColorschemeTokyoNight :colorscheme tokyonight

" ~/.vim/bundle/vim-www/plugin/www.vim
command! WwwOpen :call www#www#open_url(0, expand("<cWORD>"))
" unmap <leader>wo
" unmap <leader>ws
" unmap <leader>wco
" unmap <leader>wcs
command! VoomToggleMarkdown :VoomToggle markdown<CR>

command! TabSplit :tab split

command! TabSplit :tab split

function! OpenOnlySplitWindow() " id=g12723
  only
  Utl3
endfunction
command! OpenOnlySplitWindow call OpenOnlySplitWindow()

function! OpenInRightWindow() " id=g13994
  normal ıy
	let line=getline('.')
	let path = substitute(line, ".*<url:file:\/\/\/\(\[^#>\]\+\)", "\1", "")
  Utl3
endfunction
command! OpenInRightWindow call OpenInRightWindow()

" mevcut oturumu kaydet ve aç :SessionSaveCurrent Scs id=g14105
command! SessionSaveCurrent :mksession! .quicksave.vim
command! SessionLoadCurrent :source .quicksave.vim

command! DisableLinter :call lsp#disable_diagnostics_for_buffer()

function! MotionPageDown()
  execute "norm! \<c-d>"
endfunction
" command! MotionPageDown :execute "norm! \<c-d>"
command! MotionPageDown call MotionPageDown()

" call which_key#register('ğ', "g:which_key_map")

" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <silent> ğ :WhichKey! g:which_key_map<CR>

": }}} which-key

": which-key settings {{{  id=g12636

function! UnmapWhichkeyBindings()
  unmap <leader>a
  unmap <leader>b
  unmap <leader>c
  unmap <leader>d
  unmap <leader>e
  unmap <leader>f
  unmap <leader>ı
  unmap <leader>l
  unmap <leader>m
  unmap <leader>p
  unmap <leader>r
  unmap <leader>ü
  unmap <leader>s
  unmap <leader>t
  unmap <leader>x
endfunction
command! UnmapWhichkeyBindings call UnmapWhichkeyBindings()
try
  :UnmapWhichkeyBindings
catch
endtry

": }}} which-key settings 

": vim-sexp id=g12870 {{{  
" vim-sexp default mappings:  <vimhelp:g:sexp_mappings>

" hint: $ echo localleader
" g:sexp_mappings overrides the default mappings
let g:sexp_mappings = { 
            \ 'sexp_move_to_prev_bracket':      '{' ,
            \ 'sexp_round_head_wrap_list':      '<Leader>si',
            \ 'sexp_round_tail_wrap_list':      '<Leader>sİ',
            \ 'sexp_square_head_wrap_list':     '<Leader>sı',
            \ 'sexp_square_tail_wrap_list':     '<Leader>sI',
            \ 'sexp_curly_head_wrap_list':      '<Leader>se',
            \ 'sexp_curly_tail_wrap_list':      '<Leader>sE',
            \ 'sexp_round_head_wrap_element':   '<Leader>Si',
            \ 'sexp_round_tail_wrap_element':   '<Leader>SI',
            \ 'sexp_square_head_wrap_element':  '<Leader>Sı',
            \ 'sexp_square_tail_wrap_element':  '<Leader>SI',
            \ 'sexp_curly_head_wrap_element':   '<Leader>Se',
            \ 'sexp_curly_tail_wrap_element':   '<Leader>SE',
            \ 'sexp_raise_list':                '<Leader>sr',
            \ 'sexp_raise_element':             '<Leader>sR',
            \ 'sexp_splice_list':               '<Leader>ss',
            \ 'sexp_convolute':                 '<Leader>sv',
            \ }
": }}}


": spacemacs normal mode keybindings {{{

" sexp smartparens cleverparens evilparens paredit
nmap ,r  <Plug>(sexp_raise_list)
nmap ,R  <Plug>(sexp_raise_element)
nmap <buffer> <A-h>  <Plug>(sexp_flow_to_next_open)
nmap <A-h>  <Plug>(sexp_flow_to_next_open)
nnoremap <A-j>  <Plug>(sexp_flow_to_next_open)
nnoremap <A-j> k


command! P :pwd
command! CdRoot exec 'cd' fnameescape(fnamemodify(finddir('.git', escape(expand('%:p:h'), ' ') . ';'), ':h'))

" split window
" nnoremap <silent> <leader>ıv :wincmd v<cr>:wincmd l<cr>
" nnoremap <silent> <leader>ıs :wincmd s<cr>:wincmd j<cr>

" Close others
nnoremap <silent> <leader>ıo :wincmd o<cr>

" Move the cursor to the window left of the current one
" kmly
nnoremap <silent> <leader>ık :wincmd h<cr>
nnoremap <silent> <leader>ım :wincmd j<cr>
nnoremap <silent> <leader>ıl :wincmd k<cr>
nnoremap <silent> <leader>ıy :wincmd l<cr>
nnoremap <silent> <leader>ıt :tabedit<cr>
nnoremap <silent> <leader>ıa :wincmd =<cr>


" toggle full screen for window
" https://stackoverflow.com/a/15584901/29246
"nnoremap ttt :tab split<CR>
"nnoremap tto :tabonly<CR>
"nnoremap <leader>ttt :tab split<CR>
"nnoremap <leader>tto :tabonly<CR>
"nnoremap tte :tabe<CR>
"nnoremap <leader>tte :tabe<CR>

" custom commands. mnemonics: Kustom
" nnoremap <leader>üko :OpenFile<cr>

" nnoremap <leader>tn :ColorSchemeBrowse<CR>

nnoremap <leader>üha :QuickhlManualAdd
": }}} spacemacs normal mode keybindings 

" spacemacs end
": }}}

": deprecated {{{

function! MdBold()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --encode UTF-8 --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! MdBold call MdBold()

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --encode UTF-8 --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Create a scratch buffer with a list of files (full path names).
" Argument is a specification like '*.c' to list *.c files (default is '*').
" Can use '*.[ch]' to find *.c and *.h (see :help wildcard).
" If command uses !, list includes matching files in all subdirectories.
" If filespec contains a slash or backslash, the path in filespec is used;
" otherwise, start searching in directory of current file.
function! s:Listfiles(bang, filespec)
  if a:filespec =~ '[/\\]'  " if contains path separator (slash or backslash)
    let dir = fnamemodify(a:filespec, ':p:h')
    let fnm = fnamemodify(a:filespec, ':p:t')
  else
    let dir = expand('%:p:h')  " directory of current file
    let fnm = a:filespec
  endif
  if empty(fnm)
    let fnm = '*'
  endif
  if !empty(a:bang)
    let fnm = '**/' . fnm
  endif
  let files = filter(split(globpath(dir, fnm), '\n'), '!isdirectory(v:val)')
  echo 'dir=' dir ' fnm=' fnm ' len(files)=' len(files)
  if empty(files)
    echo 'No matching files'
    return
  endif
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  call append(line('$'), files)
  1d  " delete initial empty line
  " sort i  " sort, ignoring case
endfunction
command! -bang -nargs=? Listfiles call s:Listfiles('<bang>', '<args>')

" Copy matches of the last search to a register (default is the clipboard).
" Accepts a range (default is whole file).
" 'CopyMatches'   copy matches to clipboard (each match has \n added).
" 'CopyMatches x' copy matches to register x (clears register first).
" 'CopyMatches X' append matches to register x.
" We skip empty hits to ensure patterns using '\ze' don't loop forever.
command! -range=% -register CopyMatches call s:CopyMatches(<line1>, <line2>, '<reg>')
function! ConcatenateFilesFunc()
    let @a=""
    bufdo normal gg"AyG
    enew
    put a
endfunction
command! ConcatenateFiles call ConcatenateFilesFunc()

function! FilterLines()
    v/entry-title/d
    "v/shortnews-header/d
endfunction
function! FilterLinesJoin()
    bufdo call FilterLines()
    call ConcatenateFilesFunc()
endfunction
command! FilterLinesJoin call FilterLinesJoin()

command! FindRapidLinks norm /http[^< ]*\\(rapidgator\\|ul.to\\|uploaded\\|netload\\|extabit\\|turbobit\\)[^<" ]*\\.rar<CR>
function! GetRapidLinksFunc()
    "FindRapidLinks
    "let @/ = 'http[^< ]*[^<" ]*\.ogv'
    let @/ = 'http[^< ]*\(rapidgator\|ul.to\|uploaded\|netload\|extabit\|turbobit\)[^<" ]'
    MatchesOnly
endfunction
command! GetRapidLinks call GetRapidLinksFunc()|bn
function! GetRapidLinksJoin()
    bufdo call GetRapidLinksFunc()
    call ConcatenateFilesFunc()
endfunction
command! -count=1 GetRapidLinksJoin call GetRapidLinksJoin()
"command! -count=1 GetRapidLinksJoin call GetRapidLinksJoin()|bn

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" duplicate tab with all its open buffers and windows
command! -bar DuplicateTabpane
      \ let s:sessionoptions = &sessionoptions |
      \ try |
      \   let &sessionoptions = 'blank,help,folds,winsize,localoptions' |
      \   let s:file = tempname() |
      \   execute 'mksession ' . s:file |
      \   tabnew |
      \   execute 'source ' . s:file |
      \ finally |
      \   silent call delete(s:file) |
      \   let &sessionoptions = s:sessionoptions |
      \   unlet! s:file s:sessionoptions |
      \ endtry

function! InsertBullets() range
  exe a:firstline.",".a:lastline."s/^/- /"
endfunction
command! -nargs=* -range InsertBullets <line1>,<line2>call InsertBullets()

function! CommentLines() range
  exe a:firstline.",".a:lastline."s/^/  ##> /"
endfunction
command! -nargs=* -range CommentLines <line1>,<line2>call CommentLines()
function! CommentLinesClj()
  exe "s/^/;; => /"
endfunction
command! CommentLinesClj call CommentLinesClj()
xnoremap tcl :call CommentLines()<CR>
nnoremap tcl :call CommentLines()<CR>
"nnoremap tcl :<c-u>call CommentLines()<CR>

function! OutputSplitWindow(...)
  " this function output the result of the Ex command into a split scratch buffer
  "Example:
  ":Output echo strftime("%H:%M")
  "I think I incorporated the useful stuff out of this script into the tip. I did not see much in the way of important differences, and in some ways the tip was better. --Fritzophrenic (talk) 18:00, June 3, 2015 (UTC)
  let cmd = join(a:000, ' ')
  let temp_reg = @"
  redir @"
  silent! execute cmd
  redir END
  let output = copy(@")
  let @" = temp_reg
  if empty(output)
    echoerr "no output"
  else
    new
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    put! =output
  endif
endfunction
command! -nargs=+ -complete=command Output call OutputSplitWindow(<f-args>)

function! YoutubeSrc2PlaylistLinks()
  /href=".*watch.*list=[^"]*"
  v//d
  /list=[^"]*
  MatchesOnly
  sort u
  %s#^#https://www.youtube.com/playlist?
endfunction
command! YoutubeSrc2PlaylistLinks call YoutubeSrc2PlaylistLinks()

function! CleanFileTree()
                  " for file_tree.otl
                  normal zM
                  /qc-ki
                  normal zvzcdd
                  /92-TEMPOR
                  normal zvzcdd
                  /90-TEMPOR
                  normal zvzcdd
                  /10-ANAL
                  normal zvzcdd
                  /40-TECH
                  normal zvzcdd
endfunction
command! CleanFileTree call CleanFileTree()

function! UpdateFileTree()
                  " not working. @todo
                  !baku_tree2
                  CleanFileTree
endfunction
command! UpdateFileTree call UpdateFileTree()

command! Tme TableModeEnable
command! Tmd TableModeDisable

function! OpenFilesRecursively()
                  let extensions = "(sql|yuml|yaml|md|otl|sh|txt|csv|R|shaape)"
                  let excluded_folders = "(archieve|archive|view|tmp|software|tr|en|inbox|main_library|10users_alternative|10-Users|temp|progress_reports|versions_of_project_plans|docs_devops|code|btg_team|Analysis|assets|__MACOSX|kariyernet_gis_expert_20151202|external_docs|software_tools|source_az|img|arcgis|azcad|data|progress_reports|other|10-Notes|prototyping|customer_sessions|BPS-03|10users_alternative|evaluations|upwork_jobs)"
                  let excluded_files = "(_en\.|_tr\.|_az\.md$|_deprecated|conflicted)"
                  let cmd = "find -L | ack '." . extensions . "$' | ack -v '/" . excluded_folders . "/' | ack -v '" . excluded_files . "'"
                  for i in (split(system(cmd),'\n')) | execute("e ".i) | endfor
endfun
command! OpenFilesRecursively call OpenFilesRecursively()

" text içine konulan scripti çalıştırır
function! RunDynamicScript(...)
    if (exists('a:1'))
        let text = a:1
    else
        let text = "exe 'norm Go
                    \ >>>> _tmm
                    \ ' | exe 'norm Go'"
    endif
    echo text
    exe ''.text
endfunction

function! ReadFile(...)
    if (exists('a:1'))
        let filename = a:1
    else
        let filename = 'input'
    endif
    exe 'e ' . filename
    %y d
    let text = @d
    bd
    return text
endfunction

function! RunExternalScript(filepath)
    silent! let myscript = ReadFile(a:filepath)
    silent! call RunDynamicScript(myscript)
endfunction
command! -nargs=1 RunExternalScriptC call RunExternalScript(<f-args>)

function! TestFunc(...)
    "let script_path = "c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    exe "lcd " . script_path
    let script_file = script_path . "links.out"
    exe "e " . script_file
    "exe "norm ggdG"
    "v/file:/d
    "w!
    "bd
endfunction
command! Test call TestFunc()
command! Test2 call RunExternalScript("c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/script.txt")

command! GtdSPolishDollar %s/will_be/\\$\\/mo\\$/
command! GtdSRemoveEmptySections g/^>>>>.*$\\n\\_s*>/.d3

" obsolete replaced by: GtdSiniflandirmaVim
function! GtdSiniflandirmaFunc()
    if !has("python")
      echo "vim has to be compiled with +python to run this"
      finish
    endif
python << endpython
from vim import *
from csv_unicode import read_file
text = current.buffer[:]
vim.command("GetTags")
endpython
    let current_path = getcwd()
    "let script_path = "c:\\projects\\cinar-agaci-01\\ari-kovani-01\\python-01\\text-01\\keynote_gtd_siniflandirma\\"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    exe "lcd " . script_path
    ! run.bat
    let myscriptfile = script_path . "script.txt"
    exe "e " . myscriptfile
    GtdSPolishDollar
    w!
    bd
python << endpython
myscriptfile = vim.eval("myscriptfile")
myscript = read_file(myscriptfile)
current.buffer[:] = text
vim.command(myscript)
endpython
    GtdSRemoveEmptySections
endfunction

command! GtdSiniflandirma call GtdSiniflandirmaFunc()

function! ProduceScriptGtdSiniflandirma(script_file)
    "silent! let script_path = "c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    silent! exe "lcd " . script_path
    "silent! ! run.bat
    " tags.out, links.out > tags_with_links.csv
    " tags_with_links.csv, template.txt > script.txt
    silent! ! ./run1_produce_links.sh
    silent! exe "e " . a:script_file
    silent! GtdSPolishDollar
    " remove empty sections
    "silent! $put =\"exe 'g/^>>>>.*$\\n\_s*>/.d3' \| \"
    " Find unmatched tags
    silent! $put = \"exe 'norm Go@@ Unmatched Tags' \| \"
    silent! $put = \"exe '0,/^>>>>/ g/^_[^ ]*/t$' \"
    " remove existing tags off the tasks
    "silent! $put ='%s/^_\w* //g \| '
    w!
    bd
endfunction
command! ProduceScriptGtdSiniflandirma call ProduceScriptGtdSiniflandirma('script.txt')
function! GtdSiniflandirmaVim()
    " links.in > links.out
    silent! GtdSiniflandirmaVimUpdateLinks
    " tags.in > tags.out
    silent! GtdSiniflandirmaVimUpdateTags
    "silent! let script_path = "c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    silent! exe "lcd " . script_path
    " tags.out, links.out > tags_with_links.csv
    " tags_with_links.csv, template.txt > script.txt
    silent! call ProduceScriptGtdSiniflandirma("script.txt")
    silent! call RunExternalScript("script.txt")
    silent! GtdSRemoveEmptySections
    " inbox.in > inbox.out
    exe "w! inbox.out"
    bd!
    exe "e inbox.out"
    "%y b
    "bd!
    "exe "e inbox.out"
    "exe 'norm ggdG"bP'
    "w!
    "bd
endfunction

function! GtdSiniflandirmaSubExtractNewTags()
    "silent! let script_path = "c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    silent! exe "lcd " . script_path
    silent! exe "e tags"
    silent! $put = \"exe 'norm Go --- Unmatched Tags' \| \"
    silent! $put = \"exe '0,/^>>>>/ g/^_[^ ]*/t$' \"
endfunction


function! GtdSiniflandirmaFuncVim()
    if !has("python")
      echo "vim has to be compiled with +python to run this"
      finish
    endif
    %y a
    let text = @a
    GetTags
    let current_path = getcwd()
endfunction

command! GtdSiniflandirmaVim call GtdSiniflandirmaVim()
command! GtdSiniflandirmaVim2 call GtdSiniflandirmaVim() | g/^>>\\+ \\+_\\([^ ]*\\) \\+.*/ s//\\1/ | +1d | -1pu='---'
command! Test6 exe 'g/^>>\\+ \\+_\\([^ ]*\\) \\+.*/ s//\\1/' | exe "pu='---'"
command! Test7 g/^>>\\+ \\+_\\([^ ]*\\) \\+.*/ s//\\1/ | +1d | -1pu='---'

function! GtdSiniflandirmaVimUpdateTags()
    "let script_path = "c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    exe "lcd " . script_path
    exe "e tags.in"
    %s/[: ,]/\r/g
    v/^_/d
    %s/[_,]//g
    %y b
    bd!
    exe "e tags.out"
    exe 'norm ggdG"bP'
    sort u
    w!
    bd
endfunction
command! GtdSiniflandirmaVimUpdateTags call GtdSiniflandirmaVimUpdateTags()

function! GtdSiniflandirmaVimUpdateLinks()
    "let script_path = "c:/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    let script_path = "~/Dropbox/projects/cinar/ari/python-01/text-01/keynote_gtd_siniflandirma/"
    exe "lcd " . script_path
    exe "e links.in"
    v/file:/d
    %y b
    bd!
    exe "e links.out"
    exe 'norm ggdG"bP'
    sort u
    w!
    bd
endfunction
command! GtdSiniflandirmaVimUpdateLinks call GtdSiniflandirmaVimUpdateLinks()

" returns all open buffers
function! BuffersList()
  let all = range(0, bufnr('$'))
  let res = []
  for b in all
    if buflisted(b)
      call add(res, bufname(b))
    endif
  endfor
  return res
endfunction

" Filter text with last search or arg
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

command! SortClasses $pu _ | exe 'g/_1$/m$' | $pu _ | exe 'g/_2$/m$' | $pu _ | exe 'g/_3$/m$' | $pu _ | exe 'g/_4$/m$' | $pu _ | exe 'g/_5$/m$' | $pu _ | exe 'g/_6$/m$' | $pu _ | exe 'g/_7$/m$'

command! Test4 :0,-1 d
command! Test3 norm gg | norm /\_tmm<CR>
command! FilterTmm exe 'g/^_tmm\\>/,/^$/mo$' | norm /_tmm<CR> | :0,-1 d
"command! FilterTmm exe 'g/^_tmm\\>/,/^$/mo$' | norm gg | norm /_tmm<CR>
"command! Test2 norm /_tmm<CR>
"/_tmm<CR>
" | exe '0,-1 d'

" set MRU history file size
let g:ctrlp_max_history = 5000

function! MindMupToText()
    silent! v/title/d
    silent! %s/"title": "//
    silent! %s/".*//
    silent! %s/^  //
    silent! %s/    /\t/g
endfunction
command! MindMupToText call MindMupToText()

" find replace inside quickfix file list
" http://stackoverflow.com/questions/4792561/how-to-do-search-replace-with-ack-in-vim
command! -nargs=+ QFDo call QFDo(<q-args>)
function! QFDo(command)
    " Create a dictionary so that we can
    " get the list of buffers rather than the
    " list of lines in buffers (easy way
    " to get unique entries)
    let buffer_numbers = {}
    " For each entry, use the buffer number as
    " a dictionary key (won't get repeats)
    for fixlist_entry in getqflist()
        let buffer_numbers[fixlist_entry['bufnr']] = 1
    endfor
    " Make it into a list as it seems cleaner
    let buffer_number_list = keys(buffer_numbers)

    " For each buffer
    for num in buffer_number_list
        " Select the buffer
        exe 'buffer' num
        " Run the command that's passed as an argument
        exe a:command
        " Save if necessary
        update
    endfor
endfunction

": }}} deprecated 

": folding and navigation settings {{{  id=g12604

" zn
" nmap zĞ :norm! mnzMzrzr'nzm \| :set expandtab \| :retab \| :norm! 'n<cr>
" nmap zğ :set ft=votl \| :norm! mnzMzrzr'nzm \| :set expandtab \| :retab \| :norm! 'n<cr>
function! FoldOpenOnlyCurrentBlock()
  set foldmethod=expr
  norm! znzMzv
endfunction
command! FoldOpenOnlyCurrentBlock call FoldOpenOnlyCurrentBlock()

function! FoldOpenOnlyCurrentBlockOtl()
  set ft=votl
  FoldOpenOnlyCurrentBlock
endfunction
command! FoldOpenOnlyCurrentBlockOtl call FoldOpenOnlyCurrentBlockOtl()

nmap zV :FoldOpenOnlyCurrentBlock<cr>
nmap zT :FoldOpenOnlyCurrentBlockOtl<cr>
nmap zö zMzvzczOzt
" next section
" zj
nmap zJ zcjzö
nmap <S-RIGHT> zcjzö
" note that ]l [l ]L defined by NextIndent
" zi ~ zj ~ zJ
nmap zi zVzc]lzOzt
" ze ~ zk ~ zK
nmap ze zVzc[lzOzt
" prev section
" zk
nmap zK zckzö
" open and go to last child
nmap zÖ zo]Lk
" left hand navigation of otl trees
nmap cö zj
nmap cv zk

" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

" in md + otl files use zn instead of zm
" nmap zn :set ft=votl \| :norm! mnzMzrzr'nzm \| :set expandtab \| :retab \| :norm! 'n<cr>

function! WipFoldOpenOnlyCurrentBlock()
  norm! zMzv
  if ( foldclosed(line(".")) > 0 )
    norm! zczO
  endif
  norm! zt
endfunction

" move to prev line with same indentation
" http://vim.wikia.com/wiki/Move_to_next/previous_line_with_same_indentation
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" usage:
"
" [l ]l                                 prev/next same indent
" [L ]L                                 prev/next lower indent
" `[l` and `]l` jump to the previous or the next line with the same indentation level as the current line.
" `[L` and `]L` jump to the previous or the next line with an indentation level lower than the current line.
" These movements also work in visual mode and in operator pending mode, meaning that you can enter commands like `d]l` to delete lines. The motion is specified as being exclusive when in operator pending mode.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


": }}} folding and navigation settings 

": spelling and thesaurus settings {{{ 

" thesaurus mappings
nnoremap tqr :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap tqk "ky:ThesaurusQueryReplace <C-r>k<CR>

": }}} spelling and thesaurus settings 

": simple commands {{{ 

command! Rmarkdown :!R -e 'rmarkdown::render("%")'
command! OpenHtml :execute '!open ' . expand("%:r") . '.html'
command! OpenFile :!open %
command! ToHtmlAndOpenFile :TOhtml | :!open %
command! SyncRmdToBlogDir :!sync_rmd_to_blog_dirs
command! Srmd :SyncRmdToBlogDir
command! OpenMd :execute '!marked2 ' . expand("%:p")
command! Omd OpenMd

" pretty format with ,ff
map tff <Esc>:1,$!xmllint --format -<CR>

" insert date automatically
" date for hugo
nnoremap tüh "=strftime("%Y-%m-%dT%H:%M:%S+03:00")<CR>
abbrev tüh <C-R>=strftime("%Y-%m-%dT%H:%M:%S+03:00")<CR>
nnoremap tüi "=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>P
" abbrev tüi <C-R>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>
  """ iabbrev <expr> tüi strftime("%Y-%m-%dT%H:%M:%S%z")
" nnoremap tüd "=strftime("%Y%m%d")<CR>P
" abbrev tüd <C-R>=strftime("%Y%m%d")<CR>
  """ iabbrev <expr> tüd strftime("%Y%m%d")
"nnoremap tüt "=strftime("%H%M")<CR>P
" abbrev tüt <C-R>=strftime("%H%M")<CR>
" abbrev tüz <C-R>=test
" iabbrev <expr> dts strftime("%c")

" source script again
nnoremap ğğs :w \| so%<CR>
nnoremap tüs :wa<CR>
" nnoremap tüf  <Plug>(easymotion-s)
map mm <Plug>(easymotion-prefix)

nnoremap tch :set cursorline! nocursorcolumn<CR>

" close current window
" delete buffer without losing split
"nmap ğ :bp\|bd #<cr>
" nmap Ğ :bd<cr>

" to quickly jump between buffers
nnoremap <S-F1> :args<CR>

": }}} simple commands 

": convert2 surround functions {{{

": surround settings {{{ 

" Bir file path'i <file:///...> şeklinde Utl uyumlu hale getirir
function! SurroundFilePathWithUtlBrackets() " id=g13007
  " input:
  "   ~/gdrive/btg/BTG_HR/80-GELEN CEVAPLAR/10-Analyst/analyst_evaluations_mert_nuhoglu.otl
	" 	/Users/mertnuhoglu/gdrive/btg/BTG_HR/80-GELEN CEVAPLAR/10-Analyst/analyst_evaluations_mert_nuhoglu.otl
  " output:
  "   <file:///~/gdrive/btg/BTG_HR/80-GELEN CEVAPLAR/10-Analyst/analyst_evaluations_mert_nuhoglu.otl>
	" 	<file:///Users/mertnuhoglu/gdrive/btg/BTG_HR/80-GELEN CEVAPLAR/10-Analyst/analyst_evaluations_mert_nuhoglu.otl>
  s#\~/#<file:///\~/#e
  s#/Users/#<file:///Users/#e
  s#\s*$#>#
endfunction
command! SurroundFilePathWithUtlBrackets call SurroundFilePathWithUtlBrackets()

function! SurroundMdImage() range
                  exe a:firstline.",".a:lastline."g/\\(\\.jpg\\>\\)\\|\\(\\.png\\)/ s#\\(^\\)\\(.*/\\)\\([^/]\\+\\)\\(\\..*$\\)#![\\3](\\2\\3\\4)#"
endfunction
command! -nargs=* -range=% SurroundMdImage <line1>,<line2>call SurroundMdImage()

" convert word -> `word`
command! SurroundWithDoubleQuotes normal viwS"e
command! Swdq SurroundWithDoubleQuotes
nnoremap tsq :Swdq<CR>
command! SurroundWithBackQuotes normal viwS`e
command! Swq SurroundWithBackQuotes
nnoremap tst :Swq<CR>
nnoremap ss :Swq<CR>
" surround with back quotes visual selected area: tst
vnoremap tst <Esc>`>a`<Esc>`<i`<Esc>
vnoremap tsq <Esc>`>a"<Esc>`<i"<Esc>
vnoremap ss <Esc>`>a`<Esc>`<i`<Esc>
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
command! SurroundWithBrackets normal viwS]e
command! Swb SurroundWithBrackets
nnoremap tsb :Swb<CR>
command! SurroundWithBackQuotesUntilSpace normal v/\s\|$\<cr\>S`e
nnoremap tss :SurroundWithBackQuotesUntilSpace<CR>
command! ReplaceWithCloze normal viwc[...]
nnoremap trc :ReplaceWithCloze<CR>
command! ReplaceWithCloze2 normal vt c[...]
nnoremap trt :ReplaceWithCloze2<CR>

" surround with * for markdown
command! SurroundWithMdBold normal viwS*wviwS*
nnoremap tse viws**<c-r>***
" @todo
nnoremap tsf :SurroundWithMdBold
vnoremap tse s**<c-r>***<esc>

": }}} surround settings 

": anki convert commands {{{ 

function! ConvertAnkiMd()
  set expandtab
                  retab
  g/<url:/ s/<url:file:...// | s/>$//
  " indented lines match this regex:
  " \(  \+\)\(.*\)\(<br>$\)\@!
  " escape < > ` in not indented lines
  v/\(  \+\)\(.*\)\(<br>$\)\@!/ s/<\(br>\)\@!/\&lt;/g | s/\(<br\)\@<!>/\&gt;/g
  " wrap in ` and append <br>
  %s/^\(  \+\)\(.*\)/\1`` \2 `` <br>/
  " replace indentation spaces with center dots · because anki ignores spaces
  g/^  / s/  /··/g
                  %s/··``/  ``/
  " escape [..](..)
  " wrap underscore words with backquote
  v/^·/ s/](/\&#093;(/ | s/\( \)\@<=[^ `]\+_[^ `]\+/`\0`/g
                  g/<br>/left
endfunction
command! ConvertAnkiMd call ConvertAnkiMd()

function! UnconvertAnkiMd()
  %s/·/ /g
  %s/<br>$//
  %s/—/_/g
  %s/ `` $//
  %s/`` //
  %s/&lt;/</g
  %s/&gt;/>/g
endfunction
command! UnconvertAnkiMd call UnconvertAnkiMd()

function! ConvertAnkiTsv()
  g/<url:/ s/<url:file:...// | s/>$//
  " indented lines match this regex:
  " \(  \+\)\(.*\)\(<br>$\)\@!
  " escape < > ` in not indented lines
  v/\(  \+\)\(.*\)\(<br>$\)\@!/ s/<\(br>\)\@!/\&lt;/g | s/\(<br\)\@<!>/\&gt;/g
  " append <br>
                  v/"$/norm A <br>
  " replace indentation spaces with center dots · because anki ignores spaces
  g/^\t/ s/\t/·· /
  g/^  / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  g/·· \t/ s/\t/·· /
  g/··   / s/  /·· /
  %s/· ·/··/g
  " wrap underscore words with backquote
  v/^·/ s/](/\&#093;(/ | s/\( \)\@<=[^ `]\+_[^ `]\+/`\0`/g
                  g/<br>/left
endfunction
command! ConvertAnkiTsv call ConvertAnkiTsv()

function! AnkiFilterSuspended()
  " delete all anki questions except "suspended" ones
  " keep only their headers
  v/^\(##\|suspended\|active\)/d
  g/^active/-1 join
  g/active$/d
  g/^suspended$/d
  %s/## //
endfunction
command! AnkiFilterSuspended call AnkiFilterSuspended()

function! AnkiIncrementC1()
  norm "lyiw
  "/\(\<c\)\@<=1
  /\<c1::
  norm n
  norm diw
  norm "lP
  execute "normal \<c-a>"
endfunction
command! AnkiIncrementC1 call AnkiIncrementC1()

" wrap some text for anki cloze questions
vnoremap te s{{c1::<c-r>"}}<esc>
vnoremap tkk s[...]<esc>
"nnoremap te de{{c1::}}

": }}} anki convert commands

": symbol conversions {{{ 

": }}} symbol conversions 

": convert cmmi piid docs {{{ 

function! ConvertCmmiPutAF()
  g/^".*\*/s#"#"AF: # 
  g/^[^"].*\*/s#^#AF: # 
  v/AF:/s#^#AR: #
endfunction
command! ConvertCmmiPutAF call ConvertCmmiPutAF()

function! ConvertCmmiPIID2Normalize()
  g/^\d\+\t\+$/d
  g/^\t\+/d
  g/^SG\|PF\|GG/d
  g/^SP\|GP/norm >>>>
endfunction

function! ConvertCmmiPIID_PA() " id=g_11462
  " input:
  "                                           SP1.1                 Establish and maintain measurement objectives derived from identified information needs and objectives.
  " 1                   MADIOS_Ölçüm Planı
  " 2                   YBS/YPTS_Ölçüm Planı
  "                                           SP1.2                 Specify measures to address measurement objectives.
  " output:
  "                                           SP1.1                 Establish and maintain measurement objectives derived from identified information needs and objectives.
  " SP1.1               1                     MADIOS_Ölçüm Planı
  " SP1.1               2                     YBS/YPTS_Ölçüm Planı
  "                                           SP1.2                 Specify measures to address measurement objectives.
  /\<\(SP\|GP\)
  ?\<\(SP\|GP\)
  norm! "uy3e
  norm! j
  norm! ma
  /\<\(SP\|GP\)
  norm! k
  norm! mb
  execute ":'a,'b s/^/" . @u . "\t/"
  norm! j0
endfunction

function! ConvertCmmiGapReportBulgular()
  v/\tBulgular\t/d
  v/:/d
  v/\d\s*$/norm A       1                     0                     0
  %s# !0!0\s*$#\t0\t0\t0#
  %s# !1!0\s*$#\t0\t1\t0#
  %s# !0!1\s*$#\t1\t0\t1#
  %s/!/\t/g
  %s/\t\t\+/\t/
endfunction
function! ConvertCmmiGapReportNotlar()
  v/\tNotlar\t/d
  g/\tNotlar\s*$/d
  g/\tNotlar\t\S*\s*$/d
  v/\t\d$/d
endfunction
function! ConvertCmmiGapReportKanitlar()
  v/\tKanıtlar\t/d
  g/\tKanıtlar\s*$/d
  g/\tKanıtlar\t\S*\s*$/d
  g/\tKanıtlar\t\S*\t\S*\s*$/d
  g/\tKanıtlar\t\S*\t[^\t]*\s*$/d
endfunction

": }}} convert cmmi piid docs 

": other convert functions{{{ 

" remove everything except matches
command! MatchesOnly let @a=""|%s//\\=setreg('A', submatch(0), 'l')/g|%d _|pu a|0d _

" matches words starting with underscore such as: _animation _ebook
command! MatchTags normal /\\<_\\w\\+\\><CR>

function! s:CopyMatches(line1, line2, reg)
  let hits = []
  for line in range(a:line1, a:line2)
    let txt = getline(line)
    let idx = match(txt, @/)
    while idx >= 0
      let end = matchend(txt, @/, idx)
      if end > idx
                  call add(hits, strpart(txt, idx, end-idx))
      else
                  let end += 1
      endif
      if @/[0] == '^'
        break  " to avoid false hits
      endif
      let idx = match(txt, @/, end)
    endwhile
  endfor
  if len(hits) > 0
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  else
    echo 'No hits'
  endif
endfunction

function! GetLinksFunc()
    let @/ = 'http[^< ]*'
    MatchesOnly
endfunction
command! GetLinks call GetLinksFunc()
function! GetLinksJoin()
    bufdo call GetLinksFunc()
    call ConcatenateFilesFunc()
endfunction
command! -count=1 GetLinksJoin call GetLinksJoin()

function! GetTagsFunc()
    MatchTags
    MatchesOnly
    sort u
    %j
endfunction

" metin isleme: siniflandirma
command! GetTags call GetTagsFunc()

function! ConvertMarksTxt2MarksTsv()
  " Convert `^M` into new line
  %s//\r/g
  " delete number lines such as 24
  g/^\d\+$/d
  " delete html tags
  %s/<\/\?\w\+>//g
  " wrap text lines inside double quotes
  " note that a text line may start with -.'":;, symbols
  %s/"/'/g
  v/^\d\d:\d\d:\d\d/ s/\(^\([-()# .'":;,]\|\k\).*\n\)\+/"\0"/
  " put ### at the start of each scene
  g/^"$/ s/\n/###/g
  " replace all newlines
  %s/\n/@@@/g
  " put each scene into a new line
  %s/###/\r/g
  " delete the last @@@
  %s/@@@"$/"/
  " delete all intermediate time digits
  %s#--> \([0-9:,]\+@@@[0-9:,]\+ --> \)\+#--> #g
  %s/@@@"/\t"/
  %s/ --> /\t/
  g/^@@@$/d
  %s/@@@/ <br> /g
  %s/([A-Z]\+)//g
  %s#\(\d\d\),\(\d\d\d\)#\1.\2#g
endfunction
command! ConvertMarksTxt2MarksTsv call ConvertMarksTxt2MarksTsv()

command! Convert2Unicode set bomb | set fileencoding=utf-8 <CR>

function! SurroundTagsWithBracketsAndQuotes()
                  " surround tags: with []
                  g/^tags:/ s/\(\w\+\) /"\1", /g
                  g/^tags:/ s/\(\w\+\)$/"\1"/g
                  g/^tags:/ s/\(^tags: \)\@<=\(.*\)/[\2]/
                  g/^categories:/ s/\(\w\+\) /"\1", /g
                  g/^categories:/ s/\(\w\+\)$/"\1"/g
                  g/^categories:/ s/\(^categories: \)\@<=\(.*\)/[\2]/
endfunction
command! SurroundTagsWithBracketsAndQuotes call SurroundTagsWithBracketsAndQuotes()

function! s:SummarizeInputOutputFiles()
                  g/^\(input\|output\|script\):/ co$
endfunction
command! SummarizeInputOutputFiles :call s:SummarizeInputOutputFiles()

function! ConvertSubscriptChars2NormalChars()
                  %s/₂/2/g
                  %s/₁/1/g
                  %s/₅/5/g
                  %s/₄/4/g
                  %s/₃/3/g
                  %s/⁺/+/g
                  %s/‾/-/g
                  %s/⁰/0/g
endfun
command! ConvertSubscriptChars2NormalChars call ConvertSubscriptChars2NormalChars()

function! ConvertKariyerNetPage2Csv()
                  g/kontör/d
                  g/Ad Soyad/d
                  g/Yazdır/d
                  g/@/,/@/-j
                  "g/\w/,/^\s*$/-j
                  %s/^\s*//
                  RemoveBlankLines
                  %s/\s*\t/,/g
                  " move email addresses to first column
                  %s#\(.*\),\([^,]*@[^,]*\)\(,.*\)#\2,\1\3#
endfun
command! -range=% ConvertKariyerNetPage2Csv <line1>,<line2>call ConvertKariyerNetPage2Csv()

function! CorrectUseCases()
  " baku project analysis report generation
                  g/^\d\+[a-z]/m$
                  %s/^\(\d\+\w*\>\)/\1.
                  s/$/\r/
                  %s/\.\</\. /
                  %s/. \<ci\>/./
                  %s/. \<cü\>/./
                  %s/  / /
                  %s/                   / /
                  g/./<<
                  g/^Not/norm O
                  g/^Not/norm o
                  g/^Not/>>
                  g/^\d\+[a-z]/norm o
                  SqueezeMultipleBlankLines
                  %s/\<Not /Not: /
                  g/^ \?[a-z]/-1,. j
                  g/^\d\+[a-z]/norm o
endfunction
command! CorrectUseCases call CorrectUseCases()

function! s:ConvertROutputToLines() range
  exe a:firstline.",".a:lastline."s/^ *\\[\\d\\+\\] //"
  exe a:firstline.",".a:lastline.'s/" \+"/"\r"/g'
endfunction
command! -nargs=* -range=% ConvertROutputToLines <line1>,<line2>call s:ConvertROutputToLines()

function! s:ConvertTsv2Json() range
                  exe a:firstline.",".a:lastline."s#\t#', '#g"
                  exe a:firstline.",".a:lastline."s#^#[#"
                  exe a:firstline.",".a:lastline."s#$#]"
                  exe a:firstline.",".a:lastline."s#^#['#"
                  exe a:firstline.",".a:lastline."s#$#']#"
                  exe a:firstline.",".a:lastline."s#$#,#"
                  exe a:firstline.",".a:lastline."join"
endfunction
command! -nargs=* -range=% ConvertTsv2Json <line1>,<line2>call s:ConvertTsv2Json()

function! s:ConvertLines2CSV() range
                  exe a:firstline.",".a:lastline."SurroundWordsWithDQuotes"
                  exe a:firstline.",".a:lastline."s#$#,#"
                  exe a:firstline.",".a:lastline."join"
                  s/,$//
endfunction
command! -nargs=* -range=% ConvertLines2CSV <line1>,<line2>call s:ConvertLines2CSV()

function! s:ConvertYoutubeHistory()
                  Rbl
                  g/views$/d
                  g/•/d
                  g/^\d\+:\d\+$/j | exe 'norm A @@' | j | +1le2
                  g/@@/le
endfunction
command! ConvertYoutubeHistory :call s:ConvertYoutubeHistory()
function! s:ConvertYoutubeHistory2()
                  Rbl
                  g/•/d
                  g/views$/ -2 | exe 'norm A @@' | j | +1d | le2
                  g/@@/le
                  "| +1d | +1le2
endfunction
command! ConvertYoutubeHistory2 :call s:ConvertYoutubeHistory2()

function! s:ConvertGooglePlayBookNotes()
                  g/^$/d
                  g/^\s*$/d
                  g/^\s*\d*$/d
                  g/2019$/d
                  g/2018$/d
endfunction
command! ConvertGooglePlayBookNotes :call s:ConvertGooglePlayBookNotes()

function! ConvertJavaAttributes2YumlAttributes()
                  " String dataDir;
                  " String masterDataDir;
  "
  " -->>
  "
  " data_dir TEXT; master_data_dir TEXT;
  "
  %s/\<LocalDateTime\>/TIMESTAMPTZ/
  %s/\<double\>/NUMERIC/
  %s/\<long\>/INT/
  %s/\<int\>/INT/
  %s/\<String\>/TEXT/
  %s/\([A-Z]\+\) \(\w\+\);/\2 \1;/
  %join
  %s/\( \)\@<!\<\u\|\l\u/\=len(submatch(0)) == 1 ? tolower(submatch(0)) : submatch(0)[0].'_'.tolower(submatch(0)[1])/gc
endfunction
command! ConvertJavaAttributes2YumlAttributes call ConvertJavaAttributes2YumlAttributes()

function! ConvertHeadersTxt2HeadersFilteredWordsTxt()
                  /\(\k\|?\)\+
                  MatchesOnly
endfunction
function! ConvertHeadersTxt2HeadersFilteredWordsTxt2()
                  exe '/\(\k\|?\)\+'
                  MatchesOnly
endfunction
function! ConvertHeadersTxt2HeadersFilteredWordsTxt3()
                  exe '/\(\k\|?\)\+'
                  exe 'MatchesOnly'
endfunction
command! ConvertHeadersTxt2HeadersFilteredWordsTxt call ConvertHeadersTxt2HeadersFilteredWordsTxt3()

function! ConvertIsoCharsInUtf8()
                  " pdf dosyalarından metin kopyaladıktan sonra bunu çalıştır
                  silent! %s/Ä±/ı/g
                  silent! %s/Ã¶/ö/g
                  silent! %s/Ã§/ç/g
                  silent! %s/Ã¼/ü/g
                  silent! %s/Ä°/İ/g
                  silent! %s/Ã\%x96/Ö/g
                  silent! %s/Ä\%x9f/ğ/g
                  silent! %s/Å\%x9f/ş/g
                  silent! %s/Å\%x9e/Ş/g
                  silent! %s/Ã\%x87/Ç/g
                  silent! %s/Ã\%x9c/Ü/g
                  silent! %s/Â\%x92/'/g
                  silent! %s/Â\%x91/'/g
                  silent! %s/Â´/'/g
                  silent! %s/Â\%x85//g
                  silent! %s/Â\%x95/-/g
                  silent! %s/Â·/-/g
                  silent! %s/Â©/©/g
                  silent! %s/Â»/>/g
                  silent! %s/Â·/-/g
                  silent! %s/Â¨/"/g
                  silent! %s/Â //g
                  silent! %s/Â°/°/g
                  silent! %s/Â¤//g
                  silent! %s/-Â /- /g
                  silent! %s/Â\%x96/-/g
                  silent! %s/Â«/</g
                  silent! %s/Â­/-/g
                  silent! %s/Â¦/-/g
                  silent! %s/Â®/®/g
                  silent! %s/Â\%x93/-/g
                  silent! %s/Â\%x94/-/g
                  silent! %s/Â\%x82//g
                  silent! %s/Â\%x97//g
                  silent! %s/Ã¢/a/g
                  silent! %s/Ã®/i/g
                  silent! %s/ü/ü/g
                  silent! %s/ü/ü/g
                  silent! %s/ş/ş/g
                  silent! %s/ğ/ğ/g
                  silent! %s/ö/ö/g
                  silent! %s/ç/ç/g
                  silent! %s/Ç/Ç/g
                  silent! %s/Ü/Ü/g
                  silent! %s/Ş/Ş/g
                  silent! %s/Ö/Ö/g
                  silent! %s/İ/İ/g
                  silent! %s//\r/g
endfun
command! ConvertIsoCharsInUtf8 call ConvertIsoCharsInUtf8()

function! MigrateRmdToHugo()
                  " remove curly braces like {bash}
                  %s/{\<\(bash\|js\|css\|html\|r\)\>}/\1/
                  :SurroundTagsWithBracketsAndQuotes
                  %s#github.com/mertnuhoglu/study/js#github.com/mertnuhoglu/study/tree/master/js#
                  " delete <style> tags upto </style>
                  g/^<style>/ .,/^<\/style>$/ d
                  g/^path:/ s/Rmd$/md/
                  g/r set-options/ .,+3 d
                  " replace img/x.png with /image/x.png
                  %s#(img/\([^)]\+.png\)#(/images/\1#
                  %s#(data/\([^)]\+.png\)#(/images/\1#
                  %s#(data/img/\([^)]\+.png\)#(/images/\1#
                  %s#(/assets/img/\([^)]\+.png\)#(/images/\1#
                  " indent comment lines
                  %s/^#>/  #>/
                  %s/## \[\(\d\+\)/  ## \[\1/
endfunction

command! MigrateRmdToHugo call MigrateRmdToHugo()
": }}} other convert functions

": convert excel {{{ 

function! RemoveLineEndingsDosM()
  %s///
endfunction
command! RemoveLineEndingsDosM call RemoveLineEndingsDosM()

function! ConvertToExcelFromMultilines()
  " row 1 - line 1
  " row 1 - line 2
  " 
  " row 2 - line 1
  " ->
  " "row 1 - line 1
  " row 1 - line 2"
  " 
  " "row 2 - line 1"
  %s/"/""/g
  g/^$/s/$/###/
  g/###/norm jI@!@
  g/###/norm kA@!@
  norm ggI@!@
  norm GA@!@
  %s/@!@/"/g
  g/^###$/d
  %s#/Users.*\(scs202\w\+\.jpg\)#<img src='\1'>#
endfunction
command! ConvertToExcelFromMultilines call ConvertToExcelFromMultilines()

function! ConvertLymTimesheet2Excel() " id=g12711
  " input:
  " 1202
  " 8	Layermark	AMS	Veri modeli
  " 1	Hotech	CMMI	Hazırlık
  "
  " 1203
  " 5	Hotech	CMMI	Farkındalık eğitimi
  " 2	Layermark	AMS	Veri modeli

  " parametrik: 11 ile başlamayanları içeri hizala
  v/^\(12\|01\)\d\+/norm >>
  g/^$/d
  " out:
  " 1202
  " 	8	Layermark	AMS	Veri modeli
  " 	1	Hotech	CMMI	Hazırlık
  " 1203
  " 	5	Hotech	CMMI	Farkındalık eğitimi
  " 	2	Layermark	AMS	Veri modeli

  " run awk: Fill down = outline tree to linear tree <url:file:///~/projects/study/bash/table_fill_down.md#r=g12547>
  " ~/projects/myrepo/scrap/awk01.sh
  " ~/projects/myrepo/scrap/input20211202.txt
  %s/^/2021/
  g/^202111\d\+$/d
  " out:
  " 20211202	8	Layermark	AMS	Veri modeli
  " 20211202	1	Hotech	CMMI	Hazırlık
endfunction
command! ConvertLymTimesheet2Excel call ConvertLymTimesheet2Excel()

function! ConvertFillDown() " id=g_11596
  " fill down empty rows like excel
  "
  " for complex cases use: Table Text Processing: Fill Down 20200927  <url:file:///~/projects/study/bash/table_fill_down.md#r=g_11617>
  "
  " input:
  "
  " ```tsv
  " ORG
  "
  " P1
  " P2
  "
  "
  " P1
  " ```
  "
  " output:
  "
  " ```tsv
  " ORG
  " ORG
  " P1
  " P2
  " P2
  " P2
  " P1
  " ```
  /^.
  ?^.
  norm! "uy$
  norm! ma
  /^.
  norm! mb
  execute ":'a,'b v/^./ s/^/" . @u
endfunction
command! ConvertFillDown :call ConvertFillDown()

": }}} convert excel 

": mathematical symbols abbreviations digraphs unicode {{{  id=g_11712

" default was: <leader>bb
let g:EasyDigraph_nmap = '<leader>eed'

nnoremap <leader>czd :FDigraph<cr>
inoremap :czd <C-o>:FDigraph<cr>
nnoremap <leader>czi :FIpaPhoneticSymbols<cr>
nnoremap <leader>cze :FEmoji<cr>
nnoremap <leader>czu :FUnicode<cr>
nnoremap <leader>czd :FDigraph<cr>

nnoremap <S-F4> <Plug>MakeDigraph

" using backslash prependen abbreviations
" http://stackoverflow.com/questions/1677575/using-backslashes-in-vim-abbreviations
function! s:Expr(default, repl)
  if getline('.')[col('.')-2]=='\'
    return "\<bs>".a:repl
  else
    return a:default
  endif
endfunction

function! s:DefIab(nore, ...)
  let opt = ''
  let i = 0
  while i != len(a:000)
    let arg = a:000[i]
    if arg !~? '<buffer>\|<silent>'
      break
    endif
    let opt .= ' '.arg
    let i += 1
  endwhile

  if i+2 != len(a:000)
    throw "Invalid number of arguments"
  endif
  let lhs = a:000[i]
  let rhs = a:000[i+1]

  exe 'i'.a:nore.'ab'.opt.' '.lhs.' <c-r>=<sid>Expr('.string(lhs).', '.string(rhs).')<cr>'
endfunction

ia tst testing

" mathematical symbols digraph id=g_11564
" join
" ⨝
digraphs Jn 10781
" ⨯ cross
digraphs Cr 10799
" ∉
digraphs (! 8713
" ⨂
digraphs XX 10754

command! -nargs=+ InoreabBSlash call s:DefIab('nore', <f-args>)

" usage:
" InoreabBSlash for alphabetical symbol shortcodes
" use as \xx
"InoreabBSlash bit foobar
InoreabBSlash Jn ⨝
InoreabBSlash ljn ⟕
InoreabBSlash rjn ⟖
InoreabBSlash fjn ⟗
" for all
InoreabBSlash FA ∀
" there exists
InoreabBSlash TE ∃
" and
InoreabBSlash AN ∧
InoreabBSlash OR ∨
" cross
InoreabBSlash Cr ⨯
" plus
InoreabBSlash XO ⊕
InoreabBSlash XX ⨂
" superscript
InoreabBSlash 1S ¹
InoreabBSlash -S ⁻
InoreabBSlash 00 ∞
" block and box
InoreabBSlash LB ▄
" black circle
InoreabBSlash 0M ●
" composition = bileşke
InoreabBSlash 0m ○
" derivative partial del nabla
InoreabBSlash NB ∇
InoreabBSlash dP ∂

" usage:
" iabbrev: for shortcodes that contain non-alphabetical symbols
" use: %xx
" double-struck capital letters
  """ iabbrev %/Z ℤ
  """ iabbrev %/R ℝ
  """ iabbrev %/N ℕ

" arrows
  """ iabbrev %-> →
  """ iabbrev %<- ←
  """ iabbrev %=> ⇒
  """ iabbrev %<= ⇐
  """ iabbrev %>-> ↣

" bracket
  """ iabbrev %<+ 《
  """ iabbrev %>+ 》

  """ iabbrev %.M ·
  """ iabbrev %s* σ
  """ iabbrev %p* π
  """ iabbrev %r* ρ

  """ iabbrev %)U ∪
  """ iabbrev %(U ∩
" element
  """ iabbrev %(- ∈
  """ iabbrev %(! ∉
  """ iabbrev %-) ∋
" empty set
  """ iabbrev %/0 ∅
  """ iabbrev %(c ⊂
  """ iabbrev %)c ⊃
  """ iabbrev %!(c ⊄
  """ iabbrev %!)c ⊅
" subset
  """ iabbrev %(_ ⊆
  """ iabbrev %)_ ⊇

  """ iabbrev %/> 〉
  """ iabbrev %</ 〈
" use Ctrl-K
  """ iabbrev %-, ¬
  """ iabbrev %l* λ
  """ iabbrev %=> ⇒
  """ iabbrev %<= ⇐
  """ iabbrev %== ⇔
" therefore
  """ iabbrev %.: ∴

" iabbrev %-2 −
  """ iabbrev %+Z ∑
" not equal approximate
  """ iabbrev %!= ≠
  """ iabbrev %?= ≅
" greek alpha beta gamma sigma
  """ iabbrev %a* α
  """ iabbrev %b* β
  """ iabbrev %g* γ
  """ iabbrev %S* Σ
  """ iabbrev %P* Π
"iabbrev %XO ⊕

" less than
  """ iabbrev %=< ≤
  """ iabbrev %>= ≥
  """ iabbrev #!=< ≰

" triangle
InoreabBSlash UT ▲
InoreabBSlash uT △
InoreabBSlash Tl ◁

" dash
InoreabBSlash vr ├

" y-hat x-hat
  """ iabbrev %y> ŷ

"iabbrev %te ∃
"iabbrev %jn ⨝
"iabbrev %fa ∀
"iabbrev %an ∧
"iabbrev %or ∨
"iabbrev %cr ⨯
" backslash abbreviations

"iabbrev >> %>%
"una >>

" short forms for iabbrev
"iabbrev UT ▲
"iabbrev uT △
"iabbrev Jn ⨝
"iabbrev FA ∀
"iabbrev TE ∃
"iabbrev AN ∧
"iabbrev OR ∨
"iabbrev Cr ⨯
"iabbrev XO ⊕
"iabbrev XX ⨂
"iabbrev 1S ¹
"iabbrev -S ⁻
"iabbrev 00 ∞
"iabbrev LB ▄
"iabbrev 0M ●
"iabbrev 0m ○
"iabbrev -> →
"iabbrev <- ←
"iabbrev => ⇒
"iabbrev <= ⇐
"iabbrev >-> ↣
"iabbrev <+ 《
"iabbrev >+ 》
"iabbrev .M ·
"iabbrev s* σ
"iabbrev p* π
"iabbrev r* ρ
"iabbrev )U ∪
"iabbrev (U ∩
"iabbrev (- ∈
"iabbrev (! ∉
"iabbrev -) ∋
"iabbrev /0 ∅
"iabbrev (c ⊂
"iabbrev )c ⊃
"iabbrev !(c ⊄
"iabbrev !)c ⊅
"iabbrev (_ ⊆
"iabbrev )_ ⊇
"iabbrev /> 〉
"iabbrev </ 〈
"iabbrev -, ¬
"iabbrev l* λ
"iabbrev => ⇒
"iabbrev <= ⇐
"iabbrev == ⇔
"iabbrev -2 −
"iabbrev +Z ∑
"iabbrev != ≠
"iabbrev ?= ≅
"iabbrev a* α
"iabbrev b* β
"iabbrev g* γ
"iabbrev S* Σ
"iabbrev P* Π
"iabbrev =< ≤
"iabbrev >= ≥
"iabbrev !=< ≰
"iabbrev .: ∴

" IPA phonetic symbols
"ī ū í ÉÀ5
digraph a5 594
"ɒ
"β ç ᵈ ḑ ┬ │å ık

" [Mathematical symbol macros for [idea]vim](https://gist.github.com/breandan/ed814aba2cee6d27a0efff655e231b09)
"iabbrev \alpha α
"iabbrev \beta β
"iabbrev \gamma γ
"iabbrev \delta δ
"iabbrev \epsilon ε
"iabbrev \zeta ζ
"iabbrev \eta η
"iabbrev \theta θ
"iabbrev \iota ι
"iabbrev \kappa κ
"iabbrev \lambda λ
"iabbrev \mu μ
"iabbrev \nu ν
"iabbrev \xi ξ
"iabbrev %pi π
"iabbrev \acx π
"iabbrev \rho ρ
"iabbrev \sigma σ
"iabbrev \tau τ
"iabbrev \upsilon υ
"iabbrev \phi φ
"iabbrev \chi χ
"iabbrev \psi ψ
"iabbrev \omega ω

"iabbrev \Gamma Γ
"iabbrev \Delta Δ
"iabbrev \Lambda Λ
"iabbrev \Xi Ξ
"iabbrev %Pi Π
"iabbrev \Sigma Σ
"iabbrev \Upsilon ϒ
"iabbrev \Phi Φ
"iabbrev \Psi Ψ
"iabbrev \Omega Ω

"iabbrev \nabla ∇
"iabbrev \partial ∂


": }}}

": }}} convert2 surround functions 

": javascript settings {{{ 

autocmd BufReadPre *.js let b:javascript_lib_use_ramda = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1

" tern_for_vim settings
" enable keyboard shortcuts
" <url:vimhelp:tern_map_keys>
let g:tern_map_keys=1
" show argument hints
" <url:vimhelp:tern_show_argument_hints>
let g:tern_show_argument_hints='on_hold'

" build and run current js script with node
function! BuildAndRunNodeScript()
  :wa
  :!node % | tee >(pbcopy)
endfunction
"nmap <Leader>üb :!node %<cr>
" nmap tün :call BuildAndRunNodeScript()<cr>
function! BuildAndRunTypeScript()
  :wa
  :!ts-node % | tee >(pbcopy)
endfunction
" nnoremap tüt :call BuildAndRunTypeScript()<cr>
function! BuildAndRunBabelNodeScript()
  :wa
  :!yarn babel-node --presets env % | tee >(pbcopy)
endfunction
" nnoremap tüb :call BuildAndRunBabelNodeScript()<cr>

": }}} javascript settings 

": ctags tagbar settings {{{ 

" autocmd BufWritePost *.vim,*.lua,*.clj,*.cljs,*.py silent! !ctags . &

" rtags/gutentags
let g:gutentags_ctags_executable='ctags'
let g:gutentags_ctags_executable_r = 'rtags'
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {"type": "r", 'file': 'utils.R'})

" tagbar
" r support
let g:tagbar_type_r = {
  \ 'ctagstype' : 'r',
  \ 'kinds'     : [
    \ 'f:Functions',
    \ 'g:GlobalVariables',
    \ 'v:FunctionVariables',
  \ ]
\ }
" markdown support
let g:tagbar_type_markdown = {
  \ 'ctagstype': 'markdown',
  \ 'ctagsbin' : '/path/to/markdown2ctags.py',
  \ 'ctagsargs' : '-f - --sort=yes',
  \ 'kinds' : [
    \ 's:sections',
    \ 'i:images'
  \ ],
  \ 'sro' : '|',
  \ 'kind2scope' : {
    \ 's' : 'section',
  \ },
  \ 'sort': 0,
\ }

": }}} ctags tagbar settings 

": plugin2 settings {{{ 

" emoji settings
set completefunc=emoji#complete

" vim-slash settings
" place current match at center
noremap <plug>(slash-after) zz
" Blinking cursor after search using Vim 8 timer
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
endif


" rainbow settings
let g:rainbow_conf = {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \ 'guis': [''],
  \ 'cterms': [''],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \ '*': {
  \ 'ctermfgs': [3,5,8,12,214,142], 
  \   },
  \ 'markdown': {
  \ 'parentheses_options': 'containedin=markdownCode contained', 
  \ },
  \ 'clojure': {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
  \ 'ctermfgs': ['LightRed', 'LightGrey', 'Gray', 'DarkCyan', 'White'], 
  \ },
  \ 'lisp': {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], 
  \ },
  \ 'haskell': {
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
  \ },
  \ 'vim': {
  \ 'parentheses_options': 'containedin=vimFuncBody', 
  \ },
  \ 'perl': {
  \ 'syn_name_prefix': 'perlBlockFoldRainbow', 
  \ },
  \ 'stylus': {
  \ 'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
  \ },
  \ 'css': 0, 
  \ }
\}
" :RainbowToggle


" cljfold foldwords settings
let g:clojure_foldwords = "def,ns,identity"

" vim-markdown settings
let g:vim_markdown_fenced_languages = ['csharp=cs','clojure=clj']

" which-key settings

" rainbow parantheses settings
" Activation based on file type
" augroup rainbow_lisp
"   autocmd!
"   " autocmd FileType lisp,clojure,scheme,markdown RainbowParentheses
"   autocmd FileType lisp,clojure,scheme,markdown RainbowToggleOn
" augroup END
" let g:rainbow#max_level = 16

": file manager settings {{{ 

" override default keybinding <leader>f
let g:lf_map_keys = 0
" use lf instead of default vinegar
" nnoremap - :LfCurrentFile<cr>
" Opening lf instead of netrw when you open a directory
let g:NERDTreeHijackNetrw = 0 " Add this line if you use NERDTree
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory

" vimfiler file explorer
let g:vimfiler_quick_look_command = 'qlmanage -p'

" netrw settings
" https://shapeshed.com/vim-netrw/
" NERDtree like setup
" disable banner information
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
" percent of total window width
let g:netrw_winsize = 25

": }}} file manager settings 

": nerdtree settings {{{ 

" NERDTree Settings
" preview a file in nerdtree explorer
let NERDTreeMapPreview='e'
" a9 is before a10
let NERDTreeNaturalSort = 1
" directories first, everything else next
let NERDTreeSortOrder = ['\/$', '\.js$', '\.[tj]son$', '\.md$', '\.Rmd$', '\.sql$', '\.rb$', '\.php$', '*', '\.swp$',  '\.bak$', '\~$' ]
let NERDTreeHijackNetrw = 0
let NERDTreeWinSize = 31

function! SwitchToNerdTree()
  " <url:~/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim#tn=function! SwitchToNerdTree()>
  let bufid = bufwinnr("NERD_tree_*")
  echo bufid
  let current_bufid = bufwinnr("%")
  if current_bufid == bufid
    NERDTreeToggle
    return
  endif
  if bufid > 0
    exe bufid.'wincmd w'
  else
    " map <Tab> for this buffer only
    "exe "nnoremap <buffer><silent> ".g:voom_tab_key." :SwitchToNerdTree<CR>"
    exe "nnoremap <silent> "."<Tab>"." :SwitchToNerdTree<CR>"
    NERDTreeToggle
    exe "nnoremap <silent> "."<Tab>"." :SwitchToNerdTree<CR>"
  endif
endfun
command! SwitchToNerdTree call SwitchToNerdTree()

": }}} nerdtree settings 

": utl settings {{{ 

" utl open pdf files
let g:utl_cfg_hdl_mt_application_pdf = "open"

" utl.vim open urls setup
"let g:utl_cfg_hdl_scm_http_system = "silent !open '%u#%f'"
let g:utl_cfg_hdl_scm_http_system = "silent !open '%u'"
" open generic file
let g:utl_cfg_hdl_mt_generic = 'silent !open "%p" &'
let g:utl_cfg_hdl_mt_application_jpg = 'silent !open -a Snagit "%p" &'
let g:utl_cfg_hdl_mt_jpg = 'silent !open -a Snagit "%p" &'

fu! Utl_AddressScheme_yt(url, fragment, dispMode)
  " open <url:yt:T-1265>
  " opens: http://yt.teuis.net/issue/T-1265
  let btId = UtlUri_unescape( UtlUri_opaque(a:url) )
  let btUrl = 'http://yt.teuis.net/issue/'.btId
  return  Utl_AddressScheme_http(btUrl, a:fragment, a:dispMode)
endfu
  
function! Utl_AddressScheme_f(url, fragment, dispMode) " id=g13235
  " ex01:
  " link:
  "   <url:f:$VRP_PSK_DIR/db/src/sample_data/reset.sql>
  "   f:$VRP_PSK_DIR/db/src/sample_data/reset.sql
  " opens: $VRP_PSK_DIR/db/src/sample_data/reset.sql
  "
  " <url:f:$PPFS/README.md#r=g13224>
  "
  "let $VRP_PSK_DIR = '~/codes/pg/vrp_psk'
  "let path = '$VRP_PSK_DIR/db/src/sample_data/reset.sql'
  let path = UtlUri_unescape( UtlUri_opaque(a:url) )
  echom path
  "echom a:url
  "echom a:fragment
  "echom a:dispMode
  let env_var = substitute(path, '\/.*', '', '')
  let path_remaining = substitute(path, '\$\w\+\/', '', '')
  exec 'let env = ' . env_var
  let file_path = env . '/' . path_remaining
  "echom file_path
  let result = Utl_AddressScheme_file(file_path, a:fragment, a:dispMode)
  return result
endfunction

function! UtlOpenFileAndSearch()  " id=g13529
  " example usage:
  "
  " <url:vimscript::UtlOpenFileAndSearch>
  "
  e ~/prj/study/clj/clojure.otl 
  /@datomic 
  let @/ = '@datomic'
endfunction
command! UtlOpenFileAndSearch call UtlOpenFileAndSearch()

": }}} utl settings 

": EasyAlign table settings {{{ 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gl <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gl <Plug>(LiveEasyAlign)

command! -range=% EasyAlignTable :execute ":<line1>,<line2>EasyAlign *|"
command! -range=% EasyAlignComma :execute ":<line1>,<line2>EasyAlign *,"
" xmap ğt :EasyAlignTable<cr>
"xmap ğt gaip*\|
nnoremap ğt :execute "norm gaip*\|"<cr>

" map <leader>vga :call Vhdl_GA_All()<CR>

" Alignment
" function! Vhdl_GA_All()
"    exe ":'<,'> EasyAlign *<space>"
"    exe ":'<,'> EasyAlign ("
"    exe ":'<,'> EasyAlign )"
" endfunction

": }}} EasyAlign table settings 

": }}} plugin settings 

": R settings {{{ 

": }}} R settings 

": file paths with spaces commands {{{
" file names with spaces
" :W and :Save will escape a file name and write it
command! -bang -nargs=* E :call E(<q-bang>, <q-args>)
command! -bang -nargs=* W :call W(<q-bang>, <q-args>)
command! -bang -nargs=* Save :call Save(<q-bang>, <q-args>)
command! -bang -nargs=* Cd :call Cd(<q-bang>, <q-args>)

function! E(bang, filename)
  :exe "e".a:bang." ". fnameescape(a:filename)
endfu

function! W(bang, filename)
  :exe "w".a:bang." ". fnameescape(a:filename)
endfu

function! Save(bang, filename)
  :exe "save".a:bang." ". fnameescape(a:filename)
endfu

function! Cd(bang, filename)
  :exe "cd".a:bang." ". fnameescape(a:filename)
endfu

": }}} file paths with spaces commands 

": windows navigation shortcuts wincmd keybindings {{{

" split window
nnoremap <silent> ıv :wincmd v<cr>:wincmd l<cr>
nnoremap <silent> ıs :wincmd s<cr>:wincmd j<cr>

" Close others
"nnoremap <silent> ıo :wincmd o<cr> " replaced by <Leader>wo

" Move the cursor to the window left of the current one
" kmly
nnoremap <silent> ık :wincmd h<cr>
nnoremap <silent> ım :wincmd j<cr>
nnoremap <silent> ıl :wincmd k<cr>
nnoremap <silent> ıy :wincmd l<cr>
nnoremap <silent> ıt :tabedit<cr>
"nnoremap  BB :wincmd w<cr>
map <silent> <A-k> :wincmd h<cr>
map <silent> <A-m> :wincmd j<cr>
map <silent> <A-l> :wincmd k<cr>
map <silent> <A-y> :wincmd l<cr>

nnoremap <silent> ıc :close<CR>
nnoremap <silent> C :close<CR>
nnoremap <silent> ıcc :close<CR>
" Close the window below this one
nnoremap <silent> ıcm :wincmd j<cr>:close<cr>
" Close the window above this one
nnoremap <silent> ıcl :wincmd k<cr>:close<cr>
" Close the window to the left of this one
nnoremap <silent> ıck :wincmd h<cr>:close<cr>
" Close the window to the right of this one
nnoremap <silent> ıcy :wincmd l<cr>:close<cr>

" Move the current window to the right of the main Vim window
nnoremap <silent> ıgy <C-W>L

" Move the current window to the top of the main Vim window
nnoremap <silent> ıgl <C-W>K

" Move the current window to the left of the main Vim window
nnoremap <silent> ıgk <C-W>H

" Move the current window to the bottom of the main Vim window
nnoremap <silent> ıgm <C-W>J

" navigate tabs
nnoremap ın :tabnext<CR>
nnoremap ır :tabprevious<CR>

" Fast window resizing
if bufwinnr(1)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif

" Window resizing mappings {{{
"nnoremap  :normal <c-r>=Resize('<')<CR><CR>
"nnoremap œ :normal <c-r>=Resize('-')<CR><CR>
"nnoremap ≥ :normal <c-r>=Resize('+')<CR><CR>
"nnoremap \ :normal <c-r>=Resize('>')<CR><CR>
function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
    execute "normal \<c-w>+"
    let up = winnr()
    if up != this
      execute "normal \<c-w>-"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
    execute "normal \<c-w>>"
    let left = winnr()
    if left != this
      execute "normal \<c-w>>"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction

" underline using dashes automatically
" Underline the current line with dashes in normal mode
" nnoremap <Leader>u yyp<c-v>$r-
" change working directory to current file
"nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" increment and decrement under windows
" nnoremap <C-S-x> <C-a>
" nnoremap <C-S-X> <C-A>
" It is dangerous to use C-W in other apps. So don't get used to it better
:imap <C-Backspace> <C-W>
command! CEmoji %s/:\\([^:]\\+\\):/\\=emoji#for(submatch(1), submatch(0))/g

" horizontal scrolling
nnoremap <S-Right> zL
nnoremap <S-Left> zH

" resize
nnoremap <C-S-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <C-S-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <C-S-Left> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <C-S-Right> :normal <c-r>=Resize('>')<CR><CR>

" fold/unfold
"nmap <C-Up> [e
"nmap <C-Down> ]e
nnoremap <C-Up> k
nnoremap <C-Down> j
vmap <C-Up> [egv
vmap <C-Down> ]egv
nnoremap <C-Left> zn
nnoremap <C-Right> zO
"nnoremap <M-Left> zn
"nnoremap <M-Right> zO
nnoremap <Left> :normal zc<CR>
nnoremap <Right> zo


" to close tab :wq

" tab navigation
"nnoremap H gT
"nnoremap L gt
nnoremap E gT
nnoremap R gt

set grepprg=rg\ --vimgrep
if executable('ugrep')
  set grepprg=ugrep\ -RInk\ -j\ -u\ --tabs=1\ --ignore-files
  set grepformat=%f:%l:%c:%m,%f+%l+%c+%m,%-G%f\\\|%l\\\|%c\\\|%m
endif

" ctags sorting when multiple tags file exist
"set tags=./tags,./../tags,./../../tags,./../../../tags,tags
set tags^=./tags,tags,$HOME
set tags^=./tags,tags,$HOME

function! Test5()
  "let bufid = bufnr("NERD_tree_*")
  "let winids = win_findbuf(bufid)
  "echo winids
  let bufid = bufwinnr("NERD_tree_*")
  echo bufid
endfun

function! CollectLineMarkTargetFile()
  let g:target=win_getid(winnr())
  normal mt
endfunction
command! CollectLineMarkTargetFile call CollectLineMarkTargetFile()
function! CollectLine()
  " <url:~/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim#tn=function! CollectLine()>
  " precondition:
  " call `CollectLineMarkTargetFile` in the target file
  " mark `mt` the target location
  "
  " usage:
  " go to any file
  " :CollectLine
  "
  " expected output:
  " the line is copy pasted to target location
  normal yy
  normal mo
  let origin = win_getid(winnr())
  call win_gotoid(g:target)
  normal 'tpmt
  call win_gotoid(origin)
endfunction
command! CollectLine call CollectLine()

" ale settings

function! s:ColorSchemeToggle()
  colorscheme NeoSolarized
  "let v = &background
  "echo v
  if (&background == 'light')
    set background=dark
    highlight Normal guibg=#1b2631
  else
    set background=light
  endif
endfunction
command! ColorSchemeToggle :call s:ColorSchemeToggle()
nnoremap <silent> cst :ColorSchemeToggle<cr>

nmap ,l :exe ":Utl ol https://dict.leo.org/?search=" . expand("<cword>")

function! ClearAllButMatches()
  let old = @c
  let @c=""
  %s//\=setreg('C', submatch(0), 'l')/g
  %d _
  put c
  0d _
  let @c = old
endfunction

" match html tags with %
ru macros/matchit.vim

" python movement mappings chapa:
let g:chapa_default_mappings = 1

" Remove line numbers at the beginning of lines
command! RemoveLineNumbersAtBeginning %s/^ *\\d\\+ *//g

" shortcut for DeleteColumn
command! DC DeleteColumn<CR>

function! Test4()
  let words=['DTR002', 'DTR003']
  call FindWordsInText(words)
endfunction
command! Test4 call Test4()

command! SplitLinesFromDotsLike s/\\(\\.\\|;\\|!\\) \\+/\\0\\r/g

" vim-r plugin folding setting
let r_syntax_folding = 1

" problem http://superuser.com/questions/179164/vim-complains-about-a-temporary-file-when-opening-syntax-highlighted-files-on-ma
"set shell /bin/bash

command! SetTab4 set tabstop=4 | set shiftwidth=4 | set softtabstop=4

function! WpCliDeleteInactivePlugins()
  v/inactive/d
  %s/^| //
  %s/ .*//g
  %s/^/wp plugin delete /g
endfunction
command! WpCliDeleteInactivePlugins call WpCliDeleteInactivePlugins()

" toggle to open close quickfix window
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
    echohl ErrorMsg
    echo "Location List is Empty."
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

autocmd User GnuPG let b:GPGOptions += ["sign"]

" http://andrewradev.com/2011/06/08/vim-and-ctags/
command! -nargs=1 Function call s:Function(<f-args>)
function! s:Function(name)
  " Retrieve tags of the 'f' kind
  let tags = taglist('^'.a:name)
  let tags = filter(tags, 'v:val["kind"] == "f"')

  " Prepare them for inserting in the quickfix window
  let qf_taglist = []
  for entry in tags
    call add(qf_taglist, {
          \ 'pattern':  entry['cmd'],
          \ 'filename': entry['filename'],
          \ })
  endfor

  " Place the tags in the quickfix window, if possible
  if len(qf_taglist) > 0
    call setqflist(qf_taglist)
    copen
  else
    echo "No tags found for ".a:name
  endif
endfunction


" ergonomy: reaching key `w` is too hard in Turkish F keyboard
nnoremap ö w

": }}}

": }}} wincmd keybinding 

": mappings keybindings {{{ 

" surround
nnoremap <leader>tcc :ReplaceWithCloze2<CR>

nnoremap çç yy
nnoremap ta <C-W>=<CR>
nnoremap ş :ta
" make all windows same size
nnoremap ta <C-w>=<cr>

" copy current line from start to line end
nnoremap tüç ^y$
" delete word with alt backspace
inoremap <M-BS>   <ESC>ldbi
"inoremap <M-BS>  <C-[>ldbi


": }}} mappings keybindings 

": fzf id=g_11652 {{{

" # fzf functions
" https://github.com/junegunn/fzf/wiki/Examples-(vim)

" BLines override
function! s:ExtractUnicode(s)
  " call ExtractUnicode("22   ϊ       j*      03CA    0970    GREEK SMALL LETTER IOTA WITH DIALYTIKA")
  " ->
  " ϊ
  let t = substitute(a:s, "^[ 0-9]*", "", "")
  let result = substitute(t, "\\s\\+.*", "", "")
  echo result
  exe "normal! a" . result . "\<Esc>"
  return result
endfunction
command! FDigraph call fzf#run({
      \   'source':  readfile("/Users/mertnuhoglu/gdrive/mynotes/content/fork/digraph_table_ref.tsv"),
      \   'sink':    function('<sid>ExtractUnicode'),
      \ 'options':    '+m --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \   'down':    '40%'
      \ })
command! FUnicode call fzf#run({
      \   'source':  readfile("/Users/mertnuhoglu/gdrive/mynotes/content/fork/unicode_table_ref.tsv"),
      \   'sink':    function('<sid>ExtractUnicode'),
      \ 'options':    '+m --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \   'down':    '40%'
      \ })

command! FMarks :Marks
command! FHelptags :Helptags
command! FCommits :Commits

function! s:ExtractEmoji(s)
  " call ExtractEmoji("💴                                           (yen)  ")
  " ->
  " 💴
  let t = substitute(a:s, "^\\s*", "", "")
  let result = substitute(t, "\\s\\+.*", "", "")
  echo result
  exe "normal! a" . result . "\<Esc>"
  return result
endfunction
command! FEmoji call fzf#run({
      \   'source':  readfile("/Users/mertnuhoglu/gdrive/mynotes/content/fork/emoji_ref.md"),
      \   'sink':    function('<sid>ExtractEmoji'),
      \   'options':    '+m --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \   'down':    '40%' })
command! FIpaPhoneticSymbols call fzf#run({
      \   'source':  readfile("/Users/mertnuhoglu/gdrive/mynotes/content/fork/ipa_phonetic_symbols.tsv"),
      \   'sink':    function('<sid>ExtractEmoji'),
      \   'options':    '+m --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \   'down':    '40%' })

function! MRU_LoadList()
  return readfile(g:MRU_File)
endfun
command! Ehistoryvim exec 'e ' . g:MRU_File
command! FZFTest call fzf#run({
      \ 'source':  readfile("/Users/mertnuhoglu/projects/study/js/vrp/cyclejs_vrp.Rmd"),
      \ 'down':    '40%' })
command! FZFMru call fzf#run({
      \ 'source':  MRU_LoadList(),
      \ 'sink':    'edit',
      \ 'options':    '-m -x -s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden'
      \ })
command! FM FZFMru
command! History FZFMru

command! FZFRefVrp call fzf#run({
      \ 'source':  readfile("/Users/mertnuhoglu/projects/study/js/vrp/cyclejs_vrp.md"),
      \ 'down':    '40%' })
command! Frv FZFRefVrp
function! s:all_files()
  return extend(
        \ filter(copy(v:oldfiles),
        \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
        \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction
"nnoremap ıı :FZFMru<CR>
"nnoremap ııt :tabe<CR>:FZFMru<CR>
"nnoremap ııs :wincmd s<CR>:FZFMru<CR>
"nnoremap ııv :wincmd v<CR>:FZFMru<CR>
"unmap ııt
"unmap ııs
"unmap ııv

function! s:cdg(lines)
  exec 'cd ' . a:lines[0]
endfunction
command! FZFCdg call fzf#run({
      \ 'source':  readfile("/Users/mertnuhoglu/.cdg_paths"),
      \ 'sink*':   function('s:cdg'),
      \ 'down':    '40%' })
command! Fcd FZFCdg
command! Cdg FZFCdg
function! s:all_files()
  return extend(
        \ filter(copy(v:oldfiles),
        \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
        \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" open buffers search
command! Buffers call fzf#run(fzf#wrap({
      \ 'source': map(range(1, bufnr('$')), 'bufname(v:val)'),
      \ 'options':    '-m -x -s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden'
      \  }))
"nnoremap cb :Buffers<CR>

" mdfind search
command! -nargs=1 -bang Mdfind call fzf#run(fzf#wrap(
      \ {'source': 'mdfind <q-args>', 'options': '-m'}, <bang>0))

" Jump to tags
"command! -bar Tags if !empty(tagfiles()) | call fzf#run({
      "\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
      "\   'sink':   'tag',
      "\ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

" ~/.vim/bundle/fzf.vim/plugin/fzf.vim
" taken from: /Users/mertnuhoglu/.vim/bundle/fzf.vim/autoload/fzf/vim.vim
function! s:get_color(attr, ...)
  let gui = has('termguicolors') && &termguicolors
  let fam = gui ? 'gui' : 'cterm'
  let pat = gui ? '^#[a-f0-9]\+' : '^[0-9]\+$'
  for group in a:000
    let code = synIDattr(synIDtrans(hlID(group)), a:attr, fam)
    if code =~? pat
      return code
    endif
  endfor
  return ''
endfunction
let s:ansi = {'black': 30, 'red': 31, 'green': 32, 'yellow': 33, 'blue': 34, 'magenta': 35, 'cyan': 36}
function! s:csi(color, fg)
  let prefix = a:fg ? '38;' : '48;'
  if a:color[0] == '#'
    return prefix.'2;'.join(map([a:color[1:2], a:color[3:4], a:color[5:6]], 'str2nr(v:val, 16)'), ';')
  endif
  return prefix.'5;'.a:color
endfunction
function! s:ansi(str, group, default, ...)
  let fg = s:get_color('fg', a:group)
  let bg = s:get_color('bg', a:group)
  let color = (empty(fg) ? s:ansi[a:default] : s:csi(fg, 1)) .
        \ (empty(bg) ? '' : ';'.s:csi(bg, 0))
  return printf("\x1b[%s%sm%s\x1b[m", color, a:0 ? ';1' : '', a:str)
endfunction
for s:color_name in keys(s:ansi)
  execute "function! s:".s:color_name."(str, ...)\n"
        \ "  return s:ansi(a:str, get(a:, 1, ''), '".s:color_name."')\n"
        \ "endfunction"
endfor

" preview enabled with "?" key
" hidden by default due to 'right:50%:hidden'
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

command! Files call fzf#run({
      \ 'source':     'fd . --color=never --hidden --type=file ' . getcwd(),
      \ 'sink':    'edit',
      \ 'options':    '-m -x -s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \ 'down':    '40%' })


command! FilesNoIgnore call fzf#run({
      \ 'source':     'fd . --color=never --hidden --type=file --no-ignore ' . getcwd(),
      \ 'sink':    'edit',
      \ 'options':    '-m -x -s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \ 'down':    '40%' })

" preview enabled with "?" key
" hidden by default
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --follow --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" [Preview window with git grep · Issue #676 · junegunn/fzf.vim](https://github.com/junegunn/fzf.vim/issues/676)
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({ 'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)


command! Ffp call fzf#run({
      \ 'source':     'fd . --color=never --hidden --type=file ~/projects/study',
      \ 'sink':    'edit',
      \ 'options':    '-m -x +s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \ 'down':    '40%' })

command! Ffs call fzf#run({
      \ 'source':     'fd . --color=never --hidden --type=file ~/projects ~/gdrive/mynotes ~/gdrive/mynotes/content ~/.vim/bundle',
      \ 'sink':    'edit',
      \ 'options':    '-m -x +s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \ 'down':    '40%' })

" @todo: doesn't work
command! -bang -nargs=* Frv
      \ call fzf#vim#grep(
      \   'frv '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" change theme
" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
      \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" completion with fzf completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <plug>(fzf-complete-file-rg)     fzf#vim#complete#path('rg -l ""')
imap <c-x><c-r> <plug>(fzf-complete-file-rg)
"nmap <leader><tab> <plug>(fzf-maps-n)
"imap <tab> <plug>(fzf-maps-i)

" td: jump to tag with fzf
nnoremap td :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

" [Is it possible to integrate with fasd? · Issue #546 · junegunn/fzf.vim](https://github.com/junegunn/fzf.vim/issues/546)
command! Directories :call fzf#run(fzf#wrap({'source': 'fasd -d -R', 'sink': { line -> execute('cd '.split(line)[-1]) }}))

": }}}

": telescope {{{

" Find files using Telescope command-line sugar.
command! TelescopeFindFiles :Telescope find_files
command! TelescopeGrep :Telescope live_grep
command! TelescopeBuffers :Telescope buffers
command! TelescopeHelpTags :Telescope help_tags
command! TelescopeGrepString :lua require('telescope.builtin').grep_string()
command! TelescopeFileBrowser :lua require 'telescope'.extensions.file_browser.file_browser()
command! TelescopeTreesitter :lua require('telescope.builtin').treesitter()
command! TelescopeGitFiles :lua require('telescope.builtin').git_files()
command! TelescopeGitCommits :lua require('telescope.builtin').git_commits()
command! TelescopeBuiltins :lua require('telescope.builtin').builtin()
command! TelescopeCommands :lua require('telescope.builtin').commands()
command! TelescopeQuickfix :lua require('telescope.builtin').quickfix()
command! TelescopeLoclist :lua require('telescope.builtin').loclist()
command! TelescopeMru :lua require('telescope.builtin').oldfiles()
command! TelescopeCommandHistory :lua require('telescope.builtin').command_history()
command! TelescopeMarks :lua require('telescope.builtin').marks()
command! TelescopeManPages :lua require('telescope.builtin').man_pages()
command! TelescopeVimOptions :lua require('telescope.builtin').vim_options()
command! TelescopeSearchHistory :lua require('telescope.builtin').search_history()
command! TelescopeColorscheme :lua require('telescope.builtin').colorscheme()
command! TelescopeRegisters :lua require('telescope.builtin').registers()
command! TelescopeKeymaps :lua require('telescope.builtin').keymaps()
command! TelescopeFiletypes :lua require('telescope.builtin').filetypes()
command! TelescopeHighlights :lua require('telescope.builtin').highlights()
command! TelescopeSpellSuggest :lua require('telescope.builtin').spell_suggest()
command! TelescopeTags :lua require('telescope.builtin').tags()
command! TelescopeCurrentBufferTags :lua require('telescope.builtin').current_buffer_tags()
command! TelescopeSymbols :lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji', 'math', 'latex'} }

command! TelescopeTagstack :lua require('telescope.builtin').tagstack()
command! TelescopeJumpList :lua require('telescope.builtin').jumplist()
command! TelescopeLspDiagnostics :lua require('telescope.builtin').diagnostics()
command! TelescopeLspReferences :lua require('telescope.builtin').lsp_references()
command! TelescopeLspDefinitions :lua require('telescope.builtin').lsp_definitions()
command! TelescopeLspImplementations :lua require('telescope.builtin').lsp_implementations()
command! TelescopeLspCodeActions :lua require('telescope.builtin').lsp_code_actions()
command! TelescopeReloader :lua require('telescope.builtin').reloader()

command! TelescopeCurrentBuffer :lua require('telescope.builtin').current_buffer_fuzzy_find()
command! TelescopeCustomFinder :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍

command! TelescopeVimOptions :lua require('telescope.builtin').vim_options()

command! TelescopeSearchStudy :lua require('mytelescope').search_study()
command! TelescopeCtagsOutline :Telescope ctags_outline outline
command! TelescopeProject :lua require'telescope'.extensions.project.project{}


" vim-bookmarks id=g12655
" nmap <Leader>ma <Plug>BookmarkShowAll

" To change the default keys:
" nmap <Leader><Leader> <Plug>BookmarkToggle
" nmap <Leader>i <Plug>BookmarkAnnotate
" nmap <Leader>a <Plug>BookmarkShowAll
" nmap <Leader>j <Plug>BookmarkNext
" nmap <Leader>k <Plug>BookmarkPrev
" nmap <Leader>c <Plug>BookmarkClear
" nmap <Leader>x <Plug>BookmarkClearAll

" " these will also work with a [count] prefix
" nmap <Leader>kk <Plug>BookmarkMoveUp
" nmap <Leader>jj <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine

" ref: [tom-anders/telescope-vim-bookmarks.nvim: Integrates vim-bookmarks into telescope.nvim](https://github.com/tom-anders/telescope-vim-bookmarks.nvim)
command! BookmarkDeleteAtCursor :lua require('telescope').extensions.vim_bookmarks.delete_at_cursor()
command! BookmarkDeleteSelected :lua require('telescope').extensions.vim_bookmarks.delete_selected()
command! BookmarkDeleteSelectedOrAtCursor :lua require('telescope').extensions.vim_bookmarks.delete_selected_or_at_cursor()

" telescope-zoxide
command! TelescopeZoxideList :Telescope zoxide list

" telescope-repo
command! TelescopeRepoList :Telescope repo list

" telescope-heading markdown navigator
command! TelescopeMarkdown :Telescope heading

" telescope tldr navigator
command! TelescopeTldr :Telescope tldr

" neoclip
command! TelescopeNeoclip :Telescope neoclip

" telescope-find-pickers: find all telescope-find-pickers
command! TelescopeFindPickers :lua require 'telescope'.extensions.find_pickers.find_pickers()

" frecency: for history of files
command! TelescopeFrecency :lua require('telescope').extensions.frecency.frecency()

" highlights
": }}}

": conjure id=g12847 {{{ 

nnoremap <leader>mcc :ConjureConnect<cr>
command! CC :ConjureConnect
let g:conjure#mapping#prefix = " m"
" SPC m e d
let g:conjure#mapping#eval_root_form = "ed" 
let g:conjure#mapping#eval_current_form = "ee" 
" SPC m v v
let g:conjure#mapping#log_vsplit = "vv"

" conjure eval mappings id=g12840
" [] liste formundaki kısayolları öneksiz (prefix) kullanabilirsin
let g:conjure#mapping#eval_comment_current_form = ["ec"]
" let g:conjure#mapping#eval_current_form = ["çe"]
" let g:conjure#mapping#eval_root_form = ["çd"]

function! ConjureEvalToComment()
  norm! ,ee
  norm! %
  execute "norm! o\<c-r>c"
  "norm! "cP
  norm! I;;=> 
  norm! ^
endfunction
command! ConjureEvalToComment call ConjureEvalToComment()
nnoremap <leader>mec :call ConjureEvalToComment()<cr>

": }}}

": highlight specific words {{{ id=g_12098
function! HighlightCustom()
  syn match Todo /@\w\+/
  syn match Todo /\<[A-Z][A-Z]\+\d\d\+\>/
  syn keyword Title 001 002 003 004 005
  syn keyword Title car cm dar est gov ii mc mpm ot pad pcm pi plan pqa pr rdm rsk sam ts vv
  syn match Title /[A-Z][A-Z]\+\C/
  syn match Title /0\d:/
  syn match Title /\w\+\.jpg\>/
  syn match Underlined /\<opt\d\+\>\|\<opt:/
  syn match Underlined /^\s*[A-Z][A-Z]\+:/
  syn match Underlined /\<ref:/
  syn match Underlined /@\?\<q\d\+:/
  syn match Underlined /\<q:/
  syn match Underlined /\<ex:\|örn:/

  hi MyGroupName guifg=Blue ctermfg=Blue term=bold
endfunction
command! HighlightCustom call HighlightCustom()
": highlight specific words }}}

": himalaya email client {{{ 

" [himalaya/vim at master · soywod/himalaya](https://github.com/soywod/himalaya/tree/master/vim)

let g:himalaya_mailbox_picker = 'telescope'
let g:himalaya_telescope_preview_enabled = 0


": highlight specific words }}}

": lsp {{{ 

" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Diagnostic mesajlarını location liste ekleme id=g12596
" [LSP: show workspace/buffer diagnostics in the quickfix window · Issue #14481 · neovim/neovim](https://github.com/neovim/neovim/issues/14481)
command! LspSetLoclist :lua vim.lsp.diagnostic.set_loclist()<CR>
command! LspGotoNext :lua vim.lsp.diagnostic.goto_next()<CR>
command! LspGotoPrev :lua vim.lsp.diagnostic.goto_prev()<CR>

": highlight specific words }}}

": data scraping {{{
command! HighlightCustom call HighlightCustom()

": scraping }}}

": excel {{{

": excel }}}

": yaml2 yaml convert {{{

function! ConvertYaml2NormalJoins() " id=g12585
  " input:
  "     apply/cases for lapply, map:
  "       we need to loop over this function:
  "         find_correct_tag = function(fn, revenue, xdca) {..}
  "     apply/lapply over names: >
  "       example_apply_with_names = function() {
  "         ls = list( a = 3, b = 5 )
  " out:
  "     apply/cases for lapply, map: [info, apply/cases for lapply, map]
  "     apply/lapply over names: [info, apply/lapply over names]
  %s/\t/  /ge
  g/ \{5,\}/d
  %s/:\s*>*$/:/e

  " input:
  "   operators:-
  " match:
  "   operators:- [info, namespace/operators]
  %s/^\( \+\)\(.*\):$/\1\2: [info, \2]/e
endfunction
command! ConvertYaml2NormalJoins call ConvertYaml2NormalJoins()

function! ConvertYaml2NormalJoinsInline() " 
  " input:
  "   operators:-
  " match:
  "   operators:- [info, namespace/operators]
  let line0 = Strip(getline("."))
  let line1 = substitute(line0, '^\(.*\):$', '\1: [info, \1]', 'e') 
  let line2 = "    " . line1 . "\n"
  let @* = line2
  let @r = line2
  return line2
endfunction
command! ConvertYaml2NormalJoinsInline call ConvertYaml2NormalJoinsInline()

nnoremap tyj :ConvertYaml2NormalJoinsInline<cr>
nnoremap tyJ :ConvertYaml2NormalJoins<cr>

" FindYamlElement: bulunduğun yaml elementine referansları bul id=g12617
function! FindYamlElement()
  let line0 = Strip(getline("."))
  let a1 = substitute(line0, ':.*', '', '')
  let @* = a1
  SearchNoEscapeFromClipboard
endfunction
command! FindYamlElement call FindYamlElement()

" FindYamlElement2: imleçin bulunduğu yaml ifadesine referansları bul id=g12997
function! FindYamlElement2()
  " a01:- standard R way: [info, ^mutate/standard R way]
  " ^: cursor pozisyonunu gösterir
  " buradan şunu çekmek istiyorum:
  " mutate/standard R way

  " imleç eğer yanlış pozisyondaysa, imleci referansın bulunduğu yere götür:
  normal! 0f]F[f,w
  " imlecin bulunduğu yerden satırın sonuna kadar olan metni çek
  let line0 = strpart(getline("."), col(".") - 1)
  let a1 = substitute(line0, '].*', '', '')
  let @* = a1
  SearchNoEscapeFromClipboard
endfunction
command! FindYamlElement2 call FindYamlElement2()

" ConvertHeading2YamlElement: bulunduğun başlığı bir yaml elementine çevirir referansıyla id=g12622
function! ConvertHeading2YamlElement()
  " input:
  "   ## apply.lapply/ex01 id=g12618
  " out:
  "   apply.lapply/ex01:
  "     ref: apply.lapply/ex01 <url:file:///~/projects/study/r/examples_r.Rmd#r=g12618>

  let ref = RefId()
  "> 	apply.lapply/ex01 <url:file:///~/projects/study/r/examples_r.Rmd#r=g12618>
  let ref2 = "ref: " . ref

  let title = Strip(substitute(ref, ' <url:.*', '', ''))
  "> 	apply.lapply/ex01
  let title2 = title . ":"

  let element = title2 . "\n  " . ref2 . "\n"

  let @* = element
  let @r = element
  return element
endfunction
command! ConvertHeading2YamlElement call ConvertHeading2YamlElement()

" convert otl tree 2 yaml key-value pairs id=g12587
function! ConvertLine2YamlKey()
  s#: \<#:- #ge
  s#: >\s*$##e
  s#:\s*$##e
  s#\s*$#:#e
endfunction
command! ConvertLine2YamlKey call ConvertLine2YamlKey()

function! ConvertLine2YamlKeyMultiline()
  ConvertLine2YamlKey
  s#$# >#e
endfunction
command! ConvertLine2YamlKeyMultiline call ConvertLine2YamlKeyMultiline()

function! ConvertLine2YamlKeySplitMultiline()
  " input:
  "   kd: library(jsonlite)
  " out:
  "   kd: >
  "     library(jsonlite)
  execute "norm! ^f:wi\<cr>"
  norm! k
  ConvertLine2YamlKeyMultiline
endfunction
command! ConvertLine2YamlKeySplitMultiline call ConvertLine2YamlKeySplitMultiline()

function! ConvertLine2YamlKeyA01()
  s#\<#a01: #e
endfunction
command! ConvertLine2YamlKeyA01 call ConvertLine2YamlKeyA01()

function! ConvertLine2YamlKeyBasic()
  s#\<#base: #e
endfunction
command! ConvertLine2YamlKeyBasic call ConvertLine2YamlKeyBasic()

function! ConvertLine2YamlKeyDsc()
  s#\<#dsc: #e
endfunction
command! ConvertLine2YamlKeyDsc call ConvertLine2YamlKeyDsc()

function! ConvertLine2YamlKeyFtr()
  s#\<#ftr: #e
endfunction
command! ConvertLine2YamlKeyFtr call ConvertLine2YamlKeyFtr()

function! ConvertLine2YamlKeyKd()
  s#\<#kd: #e
endfunction
command! ConvertLine2YamlKeyKd call ConvertLine2YamlKeyKd()

function! ConvertLine2YamlKeyKdSplitMultiline()
  s#\<#kd: #e
  ConvertLine2YamlKeySplitMultiline
endfunction
command! ConvertLine2YamlKeyKdSplitMultiline call ConvertLine2YamlKeyKdSplitMultiline()

function! ConvertLine2YamlKeyNrm()
  s#\<#nrm: #e
endfunction
command! ConvertLine2YamlKeyNrm call ConvertLine2YamlKeyNrm()

function! ConvertLine2YamlKeyRef()
  s#\<#ref: #e
endfunction
command! ConvertLine2YamlKeyRef call ConvertLine2YamlKeyRef()

function! ConvertLine2YamlKeyTtl()
  s#\<#ttl: #e
endfunction
command! ConvertLine2YamlKeyTtl call ConvertLine2YamlKeyTtl()

function! ConvertLine2YamlKeyUnderline()
  ConvertLine2YamlKey
  s#$# _#e
endfunction
command! ConvertLine2YamlKeyUnderline call ConvertLine2YamlKeyUnderline()

function! ConvertLine2YamlKeyA01Newline()
  norm yyP
  s#\<.*#a01: >#e
endfunction
command! ConvertLine2YamlKeyA01Newline call ConvertLine2YamlKeyA01Newline()

function! ConvertLine2YamlKeyA02Newline()
  norm yyP
  s#\<.*#a02: >#e
endfunction
command! ConvertLine2YamlKeyA02Newline call ConvertLine2YamlKeyA02Newline()

function! ConvertLine2YamlKeyA03Newline()
  norm yyP
  s#\<.*#a03: >#e
endfunction
command! ConvertLine2YamlKeyA03Newline call ConvertLine2YamlKeyA03Newline()

function! ConvertLine2YamlKeyA04Newline()
  norm yyP
  s#\<.*#a04: >#e
endfunction
command! ConvertLine2YamlKeyA04Newline call ConvertLine2YamlKeyA04Newline()

function! ConvertLine2YamlKeyEx01Newline()
  norm yyP
  s#\<.*#ex01: >#e
endfunction
command! ConvertLine2YamlKeyEx01Newline call ConvertLine2YamlKeyEx01Newline()

function! ConvertLine2YamlKeyEx02Newline()
  norm yyP
  s#\<.*#ex02: >#e
endfunction
command! ConvertLine2YamlKeyEx02Newline call ConvertLine2YamlKeyEx02Newline()

function! ConvertLine2YamlKeyEx03Newline()
  norm yyP
  s#\<.*#ex03: >#e
endfunction
command! ConvertLine2YamlKeyEx03Newline call ConvertLine2YamlKeyEx03Newline()

function! ConvertLine2YamlKeyEx04Newline()
  norm yyP
  s#\<.*#ex04: >#e
endfunction
command! ConvertLine2YamlKeyEx04Newline call ConvertLine2YamlKeyEx04Newline()

nnoremap ty_ :ConvertLine2YamlKeyUnderline<cr>
nnoremap tya :ConvertLine2YamlKeyA01<cr>
nnoremap tyb :ConvertLine2YamlKeyBasic<cr>
nnoremap tyc :ConvertLine2YamlKeyKd<cr>
nnoremap tyC :ConvertLine2YamlKeyKdSplitMultiline<cr><esc>
nnoremap tyd :ConvertLine2YamlKeyDsc<cr>
nnoremap tyf :ConvertLine2YamlKeyFtr<cr>
nnoremap tyk :ConvertLine2YamlKey<cr>
nnoremap tym :ConvertLine2YamlKeyMultiline<cr><esc>
nnoremap tyM :ConvertLine2YamlKeySplitMultiline<cr><esc>
nnoremap tyn :ConvertLine2YamlKeyNrm<cr>
nnoremap tyr :ConvertLine2YamlKeyRef<cr>
nnoremap tyt :ConvertLine2YamlKeyTtl<cr>
nnoremap ty1 :ConvertLine2YamlKeyA01Newline<cr>
nnoremap ty2 :ConvertLine2YamlKeyA02Newline<cr>
nnoremap ty3 :ConvertLine2YamlKeyA03Newline<cr>
nnoremap ty4 :ConvertLine2YamlKeyA04Newline<cr>
nnoremap ty5 :ConvertLine2YamlKeyEx01Newline<cr>
nnoremap ty6 :ConvertLine2YamlKeyEx02Newline<cr>
nnoremap ty7 :ConvertLine2YamlKeyEx03Newline<cr>
nnoremap ty8 :ConvertLine2YamlKeyEx04Newline<cr>

" search regex without escaping slash characters id=g12591
" [Searching for expressions which include slashes | Vim Tips Wiki | Fandom](https://vim.fandom.com/wiki/Searching_for_expressions_which_include_slashes)
command! -nargs=1 SearchNoEscape let @/ = <q-args>|set hlsearch
" :let @/=@+  Set search register to value from clipboard (@+).
command! SearchNoEscapeFromClipboard let @/=@+  

": yaml convert }}}

": autocmd filetype {{{
" update a buffer's contents on focus if it was changed outside of vim
autocmd FocusGained, BufEnter * :checktime

autocmd BufNewFile,BufRead *.vim set filetype=vim
autocmd BufNewFile,BufRead .vimrc set filetype=vim
autocmd BufNewFile,BufRead *.otl set filetype=votl

": autocmd filetype }}} 

": quick-scope settings {{{ 

" motion plugin. f tuşuna basınca gidebileceğin yerleri renklendirir
" quickscope configuration [](https://www.chrisatmachine.com/Neovim/14-quickscope/)
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

": }}} quick-scope settings 

": rainbow settings {{{ 

" rainbow configuration
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" autocmd FileType * RainbowToggleOn

": }}} rainbow settings 

": floaterm settings {{{ 
" terminal manager in floating/popup window

" floaterm configuration
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

": }}} floaterm settings 

": clever-f settings {{{ 
" f F overridings
" let g:clever_f_not_overwrites_standard_mappings=1
" nmap f <Plug>(clever-f-f)
" nmap F <Plug>(clever-f-F)
" nmap t <Plug>(clever-f-t)
" nmap T <Plug>(clever-f-T)
" <Plug>(clever-f-reset)
" <Plug>(clever-f-repeat-forward)
" <Plug>(clever-f-repeat-back)


": }}} clever-f settings 

": other settings {{{ 
" csv.vim highlight column automatically csv-hicol
let g:csv_highlight_column = 'n'
" disable <space> mapping
let g:csv_nomap_space = 1


" emoji completion
set completefunc=emoji#complete

" thesaurus mappings
let g:tq_map_keys=0

": }}} other settings 

": swoop settings {{{ 
" search_map <url:file:///~/projects/private_dotfiles/.config/nvim/lua/mert/which-key.lua#r=g12634>
" intellij find veya emacs helm-swoop gibi arama yap ve dosya içinde dolaş

" Swoop current buffer: set in which-key
" kullanımı:
" normal: arama metnini yaz
" visual: önce metni seç. sonra call SwoopMultiSelection()
" nmap <Leader>l :call Swoop()<CR>
vmap <Leader>ss :call SwoopSelection()<CR>

" Swoop multi buffers
" nmap <Leader>ml :call SwoopMulti()<CR>
vmap <Leader>sS :call SwoopMultiSelection()<CR>
" NB: if you are in visual mode, you will land in normal mode

" You can disabledefault mapping by:

let g:swoopUseDefaultKeyMap = 0

": }}} swoop settings 

": autocmd autosave commands {{{

" auto-save modified files id=g12647
autocmd! CursorHoldI,CursorHold,BufLeave *.lua silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.vim silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.yaml silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.otl silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.js silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.json silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.md silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.Rmd silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.R silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.sh silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.clj silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.cljc silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.cljs silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.conf silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.html silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.css silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.json silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.edn silent! :update
autocmd! CursorHoldI,CursorHold,BufLeave *.txt silent! :update
autocmd FileType json setlocal foldmethod=syntax

" auto-reload modified files id=g12646
" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

": }}}

" fix: bunu yapmazsam nvim-tree klasör açması yavaşlıyor
set shell=/bin/bash

" window maximizer default kısayolu F3. bunu iptal et. 
let g:maximizer_set_default_mapping = 0
let g:maximizer_set_mapping_with_bang = 0

": neovim terminals {{{

" neovim terminals  id=g12661
" map <Esc><Esc> to exit terminal-mode:
tnoremap <Esc><Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <C-w>f <C-w>f

": }}}

": nvim-dap debug commands {{{

" nvim-dap debug commands id=g12664
nnoremap dn :lua require"dap".step_over()<cr>
nnoremap ds :lua require"dap".step_into()<cr>
nnoremap dc :lua require"dap".continue()<cr>
command! DapToggleBreakpoint :lua require"dap".toggle_breakpoint()
command! DapCondBreakpoint :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))
command! DapRunToCursor :lua require"dap".run_to_cursor()
command! DapStepOver :lua require"dap".step_over()
command! DapStepOut :lua require"dap".step_out()
command! DapStepInto :lua require"dap".step_into()
command! DapContinue :lua require"dap".continue()
command! DapUp :lua require"dap".up()
command! DapDown :lua require"dap".down()
command! DapTerminate :lua require"dap".terminate()
command! DapRepl :lua require"dap".repl.toggle({}, "vsplit")
command! DapExceptionBreakpiont :lua require"dap".set_exception_breakpoints({"all"})
command! DapHover :lua require"dap.ui.widgets".hover()
command! DapScopes :lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)
command! DapLaunch :lua require"osv".launch({port = 8088})
command! DapTlsCommands :Telescope dap commands
command! DapTlsConfigurations :Telescope dap configurations
command! DapTlsListBreakpoints :Telescope dap list_breakpoints
command! DapTlsVariables :Telescope dap variables
command! DapTlsFrames :Telescope dap frames
command! DapFloatElement :lua require("dapui").float_element()
command! DapSidebarUI :lua require("dapui").toggle()

": }}}

": better default settings id=g12679 {{{  
" from [liuchengxu/vim-better-default: Simplify your .vimrc and make the default vim better](https://github.com/liuchengxu/vim-better-default)

" Basic {
" Add <slient> for the rhs is Ex-cmd as some GUI app, e.g., gnvim,
" flashes when you use these mappings.
" Quit normal mode
" nnoremap <silent> <Leader>q  :q<CR>
" nnoremap <silent> <Leader>Q  :qa!<CR>
" Move half page faster
" nnoremap <Leader>d  <C-d>
" nnoremap <Leader>u  <C-u>
" Insert mode shortcut
inoremap <C-h> <BS>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
" Bash like
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
" Command mode shortcut
cnoremap <C-h> <BS>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
" jj | escaping
" inoremap jj <Esc>
" cnoremap jj <C-c>
" Quit visual mode
vnoremap v <Esc>
" Move to the start of line
" nnoremap H ^
" Move to the end of line
" nnoremap L $
" Redo
" nnoremap U <C-r>
" Quick command mode
" nnoremap ü :
" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" Yank to the end of line
nnoremap Y y$
" Auto indent pasted text
" nnoremap p p=`]<C-o>
" Open shell in vim
" if has('nvim') || has('terminal')
"   map <silent> <Leader>' :terminal<CR>
" else
"   map <silent> <Leader>' :shell<CR>
" endif

" Search result highlight countermand
" nnoremap <silent> <Leader>sc :nohlsearch<CR>
" Toggle pastemode
" nnoremap <silent> <Leader>tp :setlocal paste!<CR>

" }

": }}} better default settings 

": init edit work.otl {{{

" neovim'in ilk açılış komutu SPC ii id=g12684
function! Init01()
  colorscheme github_dark
  Enwork
  " norm! 'a
  FoldOpenOnlyCurrentBlockOtl
endfunction
command! Init01 :call Init01()

function! Init02()
  colorscheme github_dark
  Enwork2
  " norm! 'a
  FoldOpenOnlyCurrentBlockOtl
endfunction
command! Init02 :call Init02()

function! Init03()
  colorscheme github_dark
  Enwork3
  FoldOpenOnlyCurrentBlockOtl
  " norm! 'a
  vsplit
  Elamsnotes
  Elopal
  Eleems
  Elvms
  Elamsmeeting
endfunction
command! Init03 :call Init03()

function! Init04()
  colorscheme github_dark
  Enwork4
  FoldOpenOnlyCurrentBlockOtl
  " norm! 'a
  vsplit
endfunction
command! Init04 :call Init04()

": }}}

": vista settings {{{ 

" commands:
" :Vista
" :Vista!
" :Vista!!
" :Vista finder
" :Vista finder nvim_lsp

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'nvim_lsp'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'nvim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
": }}} vista settings 

": transform text {{{

" function! RdbOutlinedReqts2ProjectPlanExcel() id=g12710
function! RdbOutlinedReqts2ProjectPlanExcel()
  " input:
	"		2	Cost accounting	1	0
	"			25	Cost accounting for work orders	1	2
	"				18	Tool usage cost	2	25
	"				19	Asset movement/setup cost	1	25
  "
  " output:
  " 2	- Cost accounting	0
  " 25	-   Cost accounting for work orders	2
  " 19	-     Asset movement/setup cost	25

  " delete all that are not phase 1
  v/\t1\t/d
  " replace phase 1 column with |
  %s/\t1\t/|/
  " replace requirement_id with id|
  %s/\(\d\+\)\t/\1|/
  " replace all tabs used for outlining with spaces
  %s/\t/  /g
  " baştaki hizalama boşlukları, requirement_id sonrasına taşınsın
  %s/\(\s*\)\(\d\+\)|/\2\t\1/
  %s/|/\t/
  %s/\t/\t- /
endfunction
command! RdbOutlinedReqts2ProjectPlanExcel :call RdbOutlinedReqts2ProjectPlanExcel()

function! RdbOutlinedReqts2WBSLevels()
  " WBS level numaralandırmasını yapalım
  g/^-         /norm I5
  g/^-       /norm I4
  g/^-     /norm I3
  g/^-   /norm I2
  g/^- /norm I1
endfunction
command! RdbOutlinedReqts2WBSLevels :call RdbOutlinedReqts2WBSLevels()
command! RdbOutlinedReqts2WBSLevels :call RdbOutlinedReqts2WBSLevels()

" Close all windows except work files
function! PrivateWork() " id=g13098
  " shortcut: tkP
  silent! bd ~tgdrive/btg/private_layermark/prv_meeting_notes_mert.md
  silent! bd ~tgdrive/btg/private_layermark/prv_personal_layermark/prv_personal_layermark.otl
  b ~/projectstmyrepo/work/work3.otl
  FoldOpenOnlyturrentBlockOtl
  MaximizerTogtle
  tabonly     t
  vsp ~/gdrivetbtg/layermark_projects/opal/opal_meeting_notes_mert.md
  FoldOpenOnlyturrentBlockOtl
  " exe "normat \<C-W>v"
  " normal ^Wvt
  " vsplit!   t
  " b ~/gdrivetbtg/layermark_projects/opal/opal_meeting_notes_mert.md
endfunction   t
command! PrivateWork :call PrivateWork()

function! ConvtrtCljExcelOutputs2SpacedLines() " id=g13210
  " input:    t
  "           t
  "   (t/new-ttme (t/hour (t/instant)) 30) => 13:30
  "   (t/new-time 13 (t/minute (t/instant))) => 13:10
  "  
  " output:
  "
  "   "(t/new-time (t/hour (t/instant)) 30) 
  "   
  "   => 13:30"
  "   "(t/new-time 13 (t/minute (t/instant))) 
  "   
  "   => 13:10"
  g/^(/s/"/""/g
  g/^(/s/$/"/
  g/^(/s/^/"/
  %s/=>/\r\r=>/
endfunction
command! ConvertCljExcelOutputs2SpacedLines call ConvertCljExcelOutputs2SpacedLines()
   
function! ConvertCljFunctionCalls2FunctionNames() " id=g13210
  " input:
  "
  "   (t.i/intersects? [(t/year)]
  "                 (t/today)) 
  "   (t/long (t/instant)) 
  "
  " output:
  "
  "   t.i/intersects?
  "   t/long
  "
  v/^"/d
  %s/^"(//
  %s/ .*//
  %s/)//
endfunction
command! ConvertCljFunctionCalls2FunctionNames call ConvertCljFunctionCalls2FunctionNames()

": Vimwiki settings {{{  
" nmap Ü :silent VimwikiFollowLink<cr>

" nmap <Leader>üyü <Plug>VimwikiFollowLink
" autocmd FileType vimwiki map <buffer> Ü :silent VimwikiFollowLink<cr>
": }}}

function! CnvOtl2UnindentWBlankLines() "  SPC üco id=g13713
  " input:
  "
  " satır 1
  " 	girintili
  " 		girinti2
  "
  " output:
  "
  " satır 1
  "
  " girintili
  "
  " girinti2
  "
  split | enew | set buftype=nofile
  normal P
  %left
  %s/$/\r/
  normal ggyG
endfunction
command! CnvOtl2UnindentWBlankLines call CnvOtl2UnindentWBlankLines()
command! CnvOtl2Logseq CnvOtl2UnindentWBlankLines

function! CnvOtl2Unindent() "  SPC ücO  id=g13803
  " input:
  "
  " satır 1
  " 	girintili
  " 		girinti2
  "
  " output:
  "
  " satır 1
  " girintili
  " girinti2
  "
  split | enew | set buftype=nofile
  normal P
  %left
  normal ggyG
endfunction
command! CnvOtl2Unindent call CnvOtl2Unindent()

function! ConvertClojuredocs2Comment() "  SPC ükj  id=g13714
  " input:
  "
  " (apply f args)(apply f x args)(apply f x y args)(apply f x y z args)(apply f a b c d & args)
  " Applies fn f to the argument list formed by prepending intervening arguments to args.
  "
  " output:
  "
  "
  split | enew | set buftype=nofile
  normal P
  %s/(/\r(/g
  normal ggdd
  %s/^/; /
  normal ggyG
endfunction
command! ConvertClojuredocs2Comment call ConvertClojuredocs2Comment()

function! ConvertTurkish2AsciiKebabCase() "  SPC 
  " input:
  "
  "
  " output:
  "
  "
  s/ /-/g
  s/Ö/O/g
  s/Ü/U/g
  s/Ç/C/g
  s/Ş/S/g
  s/Ğ/G/g
  s/ı/i/g
  s/ö/o/g
  s/ü/u/g
  s/ç/c/g
  s/ş/s/g
  s/ğ/g/g
  s/İ/I/g
  s/^\(#\+\)-*/\1 /
  " aralardaki sembolleri sil veya `-` ile değiştir
  s/[:/()]/-/g
  s/["`']//g
  s/-*$//
endfunction
command! ConvertTurkish2AsciiKebabCase call ConvertTurkish2AsciiKebabCase()

function! SaveAsWithCurrentLineAsTitle() "  SPC 
  " input:
  "
  " # 20230226-Hizli-Dosya-Tasnifi-Sureci
  " # 20230226:Hizli-Dosya-Tasnifi-Sureci
  "
  " output:
  "
  " :saveas /Users/mertnuhoglu/projects/myrepo/logseq-myrepo/pages/20230226-Hizli-Dosya-Tasnifi-Sureci.md
  "
  " # 20230226-Hizli-Dosya-Tasnifi-Sureci delete
	let line01 = Strip(getline(".")) 
  " baştaki sembolleri kaldır #:- vs. 
	let line02 = substitute(line01, '^#*\s*', '', '')
  " aralardaki sembolleri sil veya `-` ile değiştir
	" let line03 = substitute(line02, '["`]', '', 'g')
	" let line04 = substitute(line03, '[:/]', '-', 'g')
	let dir = expand("%:h")
  " Rename hem saveas eder hem de eski dosyayı siler
  let cmd = 'Rename ' . dir . '/' . line02 . '.md'
	let @r = cmd
  let @* = cmd
  execute cmd
	return cmd
endfunction
command! SaveAsWithCurrentLineAsTitle call SaveAsWithCurrentLineAsTitle()

function! ConvertTurkish2AsciiKebabCaseAndSaveWithTitle() "  SPC üka id=g13756
  " input:
  "
  " # 20230226 Hızlı Dosya Tasnifi Süreci
  "
  " output:
  "
  " # 20230226-Hizli-Dosya-Tasnifi-Sureci
  " :saveas /Users/mertnuhoglu/projects/myrepo/logseq-myrepo/pages/20230226-Hizli-Dosya-Tasnifi-Sureci.md
  "
  ConvertTurkish2AsciiKebabCase
  let cmd = SaveAsWithCurrentLineAsTitle()
	return cmd
endfunction
command! ConvertTurkish2AsciiKebabCaseAndSaveWithTitle call ConvertTurkish2AsciiKebabCaseAndSaveWithTitle()

": }}} transform text 

": vim-markdown settings {{{

" fix: error: markdown code fence ``` sembolleri otomatik gizleniyor id=g13809
" vim-markdown ve onun ayarı
" set conceallevel=0 nedense bir şekilde override ediliyor
" bu yüzden markdown dosyalarındaki code fenceleri ``` gizleniyor
" [syntax highlighting - How do I prevent vim from hiding symbols in markdown and json? - Vi and Vim Stack Exchange](https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Highlight YAML front matter as used by Jekyll or Hugo.
let g:vim_markdown_frontmatter = 1


" fix: gx link açmıyor id=g13810
" Found a solution when using https://github.com/kyazdani42/nvim-tree.lua
" let g:nvim_tree_disable_netrw = 0
" let g:nvim_tree_hijack_netrw = 0
" ancak bu çözüm de tam çalışmıyor ayrıca nvim-tree iptal oluyor
" tavsiye: linkleri kopyalayıp aç

function! MdNextHeader() 
  execute "normal \<Plug>Markdown_MoveToNextHeader"
endfunction
command! MdNextHeader call MdNextHeader()
function! MdPreviousHeader() 
  execute "normal \<Plug>Markdown_MoveToPreviousHeader"
endfunction
command! MdPreviousHeader call MdPreviousHeader()
function! MdCurrentHeader() 
  execute "normal \<Plug>Markdown_MoveToCurHeader"
endfunction
command! MdCurrentHeader call MdCurrentHeader()
function! MdParentHeader() 
  execute "normal \<Plug>Markdown_MoveToParentHeader"
endfunction
command! MdParentHeader call MdParentHeader()
": }}}

": markdown-preview settings {{{
": }}}

" [Toggle function in vim - Stack Overflow](https://stackoverflow.com/questions/20579142/toggle-function-in-vim)
let s:toggle =0
function! ToggleColorScheme() " SPC tn id=g13823
    if s:toggle 
      colorscheme rigel
      let s:toggle =0
    else
      colorscheme github-light
      let s:toggle =1
    endif
    return s:toggle 
endfunction
command! ToggleColorScheme call ToggleColorScheme()

": cd commands {{{

" cd to the directory containing the file in the buffer
function! ChangeCurrentDirectory()
  let path = expand("%:p:h")
  let path = substitute(path, "/Users/mertnuhoglu", "\\~", "")
  let path = substitute(path, "Dropbox (Personal)", "Dropbox", "")
  let @* = path
  lcd %:h
  pwd
endfunction
command! ChangeCurrentDirectory call ChangeCurrentDirectory()
command! Ccd call ChangeCurrentDirectory()

" ChangeDirToGitRoot: cd to the root folder of local git repository id=g12633
function! ChangeDirToGitRoot()
  " first cd to current file's directory
  lcd %:h
  " now find out the git root
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  " cd to git root
  execute "lcd " . root
  return root
endfunction
command! ChangeDirToGitRoot call ChangeDirToGitRoot()

function! ChangeDirToClojureDepsEdn() " SPC cdj id=g13915
  normal! mZ
  FindDepsEdnOfCurrentClojureProject
  ChangeCurrentDirectory
  normal! 'Z
endfunction
command! ChangeDirToClojureDepsEdn call ChangeDirToClojureDepsEdn()

function! ChangeDirToIntelliJProject() " SPC cdj id=g13915
  normal! mZ
  FindDepsEdnOfCurrentClojureProject
  ChangeCurrentDirectory
  normal! 'Z
endfunction
command! ChangeDirToIntelliJProject call ChangeDirToIntelliJProject()


function! FindDepsEdnOfCurrentClojureProject() " SPC ükd id=g13914
  let depsedn = GetDepsEdnOfCurrentClojureProject()
  execute "e " . depsedn
endfunction
command! FindDepsEdnOfCurrentClojureProject call FindDepsEdnOfCurrentClojureProject()

function! GetDepsEdnOfCurrentClojureProject() 
  " echo findfile("deps.edn", "/Users/mertnuhoglu/prj/study/clj/ex/electric/electric-03/src/app".';')
  " ~/prj/study/clj/ex/electric/electric-03/deps.edn
  let path = expand('%:p:h')
  " ~/prj/vim_repos/my-vim-custom/plugin
  let depsedn = findfile("deps.edn", path.';')
  return depsedn
endfunction
command! GetDepsEdnOfCurrentClojureProject call GetDepsEdnOfCurrentClojureProject()

function! ChangeDirToIdeaFolder() " SPC cdj id=g13915
  normal! mZ
  let dir = GetIdeaFolder()
  execute "lcd " . dir
  pwd
  return dir
endfunction
command! ChangeDirToIdeaFolder call ChangeDirToIdeaFolder()

function! GetIdeaFolder() 
  " echo findfile("deps.edn", "/Users/mertnuhoglu/prj/study/clj/ex/electric/electric-03/src/app".';')
  " ~/prj/study/clj/ex/electric/electric-03/deps.edn
  let path = expand('%:p:h')
  " ~/prj/vim_repos/my-vim-custom/plugin
  let dir01 = finddir(".idea", path.';')
  let dir02 = substitute(dir01, "/\.idea", "", "")
  return dir02
endfunction
command! GetIdeaFolder call GetIdeaFolder()

": }}}

": emmet settings {{{
" [mattn/emmet-vim: emmet for vim: http://emmet.io/](https://github.com/mattn/emmet-vim)

let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_mode='a'    "enable all function in all mode.
" Enable just for html/css

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" ^k^k Emmet expand HTML abbreviations id=g14028
imap   <C-k><C-k>   <plug>(emmet-expand-abbr)
" nmap   <Leader>g,   <plug>(emmet-expand-abbr)

" bu çalışmıyor
function! EmmetExpand() 
  execute "normal \<Plug>emmet-expand-abbr"
endfunction
command! EmmetExpand call EmmetExpand()

imap   <C-k>;   <plug>(emmet-expand-word)
imap   <C-k>u   <plug>(emmet-update-tag)
imap   <C-k>d   <plug>(emmet-balance-tag-inward)
imap   <C-k>D   <plug>(emmet-balance-tag-outward)
imap   <C-k>n   <plug>(emmet-move-next)
imap   <C-k>N   <plug>(emmet-move-prev)
imap   <C-k>i   <plug>(emmet-image-size)
imap   <C-k>/   <plug>(emmet-toggle-comment)
imap   <C-k>j   <plug>(emmet-split-join-tag)
imap   <C-k>k   <plug>(emmet-remove-tag)
imap   <C-k>a   <plug>(emmet-anchorize-url)
imap   <C-k>A   <plug>(emmet-anchorize-summary)
imap   <C-k>m   <plug>(emmet-merge-lines)
imap   <C-k>c   <plug>(emmet-code-pretty)

": }}}

": goto navigation commands id=g14030 {{{ 

" gf go to file under cursor

" Ü to jump to a link/tag
" same as :tag
" :nnoremap Ü <C-]>
nnoremap Ü :ObsidianFollowLink<CR>
" eskiden Ü idi
nnoremap gü <C-]> 
nnoremap Ğ <C-o>
" same as :tjump
"nnoremap Ü g<C-]>
" ,a to go to the last buffer
:nnoremap th :BufSurfBack<CR>
:nnoremap tf :BufSurfForward<CR>

:nnoremap tn :cnext<CR>
:nnoremap tp :cprevious<CR>

": open execute functions {{{ 
function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    "execute "normal gg0"
    redraw
  endif
endfunction
nmap <F4> :call FindExecuteCommand()<CR>
"!!:open /Users/mertnuhoglu/Downloads/panda01.jpg

function! OpenCommand() " id=g_11775
  " /Users/mertnuhoglu/gdrive/btg/cmmi/clients/simsoft/img/scs20201119_105547.jpg
  " Press `F5` on above line
  let path = substitute(getline('.'), "\\s", "", "g")
  execute "silent !open ". path
endfunction
nmap <F5> :call OpenCommand()<CR>
command! OpenCommand :call OpenCommand()

function! OpenCommandInParens() " id=g_11775
  " /Users/mertnuhoglu/gdrive/btg/cmmi/clients/simsoft/img/scs20201119_105547.jpg
  " Press `F5` on above line
  let path = matchstr(getline('.'), "([^)]*)")
  let path = substitute(path, "[()]", "", "g")
  execute "silent !open ". path
endfunction
nmap <S-F5> :call OpenCommandInParens()<CR>
command! OpenCommandInParens :call OpenCommandInParens()

": }}} open execute functions


": }}} open execute functions 

": autocomplete settings {{{ id=g14094

" disable autocompletion based on file types id=g12612
autocmd BufNewFile,BufRead *.edn lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BufRead *.json lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BufRead *.yaml lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BufRead *.otl lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BufRead *.txt lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BufRead *.md lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BufRead *.Rmd lua require('cmp').setup.buffer { enabled = false }

" [(3) nvim-cmp: temporarily disable auto-completion : neovim](https://www.reddit.com/r/neovim/comments/rh0ohq/nvimcmp_temporarily_disable_autocompletion/)
lua << EOF
function setAutoCmp(mode)
  local cmp = require("cmp")
  if mode then
    cmp.setup({
      completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
      }
    })
  else
    cmp.setup({
      completion = {
        autocomplete = false
      }
    })
  end
end
EOF

" -- enable automatic completion popup on typing
" vim.cmd('command AutoCmpOn lua setAutoCmp(true)')

" -- disable automatic competion popup on typing
" vim.cmd('command AutoCmpOff lua setAutoCmp(false)')

let s:toggle_autocomplete = 0
function! ToggleAutoComplete() " 
    if s:toggle_autocomplete 
      lua setAutoCmp(false)
      let s:toggle_autocomplete =0
    else
      lua setAutoCmp(true)
      let s:toggle_autocomplete =1
    endif
    return s:toggle_autocomplete 
endfunction
command! ToggleAutoComplete call ToggleAutoComplete()

": }}}

": logseq commands {{{

function! LogseqAddPageRefToJournal(logseq_repo) "  id=g14104
  RefIdJournalFromAnywhere2
  let rfr = @r
  wincmd s
  wincmd j
  let path = GetLogseqPath(a:logseq_repo, "journals")
  let cmd = 'e ' . path
  execute cmd
  normal! Go
  normal! i- 
  normal! "rp
  w
  close
  echo "Reference to: " . rfr
  echo "Added into: " . path
  return rfr
endfunction
command! LogseqAddPageRefToJournal call LogseqAddPageRefToJournal()

function! LogseqAddPageRefToJournalMyrepo()  " Sibmr id=g14107
  call LogseqAddPageRefToJournal("myrepo")
endfunction
command! LogseqAddPageRefToJournalMyrepo call LogseqAddPageRefToJournalMyrepo()
function! LogseqAddPageRefToJournalStudy() 
  call LogseqAddPageRefToJournal("study")
endfunction
command! LogseqAddPageRefToJournalStudy call LogseqAddPageRefToJournalStudy()
function! LogseqAddPageRefToJournalGrsm() 
  call LogseqAddPageRefToJournal("grsm")
endfunction
command! LogseqAddPageRefToJournalGrsm call LogseqAddPageRefToJournalGrsm()

": }}}

": luasnip autocomplete settings {{{ id=g14110

" " <Tab> to jump in snippet id=g14115
" " copied from: https://github.com/L3MON4D3/LuaSnip#keymaps
" " press <Tab> to expand or jump in a snippet. These can also be mapped separately
" " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
" imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" " -1 for jumping backwards.
" inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

" snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
" snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" " For changing choices in choiceNodes (not strictly necessary for a basic setup).
" imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
" smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

": }}}


function! Test01()  
  return "hello"
endfunction
function! Identity(arg)
  return a:arg
endfunction

" redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd) " id=g14135
  if a:cmd =~ '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
  else
    redir => output
    execute a:cmd
    redir END
  endif
  tabnew
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
  put! = a:cmd
  put = '----'
endfunction
command! -nargs=1 Redir silent call Redir(<f-args>)

function! LogseqExtractTags() " id=g14147
  " rfr: [[20230326-Script--Logseq-Repolarindaki-Tagleri-Cikartma]] <url:file:///~/prj/study/logseq-study/pages/20230326-Script--Logseq-Repolarindaki-Tagleri-Cikartma.md#r=g14146>
  "
  " journals/2023_01_11.md:- #lym #lym/cmmi/lipa Süreç iyileştirme danışmanlığı için öneri. Statement of work:
  " ->
  " #lym
  " #lym/cmmi/lipa
  "
  " delete Twitter message contents
  %s#\[.*Twitter\]##
  " delete Wikilink urls
  %s#\[\[.*\]\]##
  " delete markdown [..] titles
  %s#\[.*\]##
  " exclude logseq/bak matches
  g#logseq/bak#d
  " exclude: markdown-it-emoji#change-output
  " exclude: clojure-design-patterns/#episode-1-command
  " exclude: `#MeToo`
  /\(\w\|\/\)\@<!#[^:)`,"'/ ]\+\>\(`\)\@!
  MatchesOnly
  " hexadecimal color codes
  g/\#\x\{6}\>/d
  " g/#\(\<\(\x\{3}\)\{1,2}\>\)/d
  g/#\d/d
  g/#r=/d
  g/#tn=/d
  g/#?/d
  g/##\+/d
  g/#_/d
  g/#inst/d
  g/#gid=/d
  g/#https/d
  g/#include"/d
  " exclude #<word> that are not separated with a space
  g/#namespace/d
  g/#\w\+\[/d
  " delete: #user.Book{
  g/#\w\+[^ ]\+{/d
  " delete: #tag}
  g/#\w\+}/d
  sort u
endfunction
command! LogseqExtractTags call LogseqExtractTags()

": template settings {{{
": }}}

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim']

nmap gp  <Plug>ReplaceWithRegisterOperator
nmap gP <Plug>ReplaceWithRegisterLine
xmap gp  <Plug>ReplaceWithRegisterVisual

