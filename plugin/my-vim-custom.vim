" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

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
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
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

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %

set linespace=3
"set guifont=Fira\ Code:h12
set guifont=JetBrains\ Mono:h12
set cursorline

set smartcase       " become case sensitive if you type uppercase characters
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set viminfo='200,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set history=500          " keep 50 lines of command history
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
set timeoutlen=500

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
au! CursorHoldI,CursorHold,BufLeave <buffer> silent! :update

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

" spell check
autocmd BufRead,BufNewFile *.md setlocal nospell
autocmd BufRead,BufNewFile *.otl setlocal nospell
autocmd BufRead,BufNewFile *.txt setlocal nospell
set nospell
" word completion with ^N ^P
set complete+=kspell

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
let $LAYERMARK = '/Users/mertnuhoglu/projects/lym/lym'

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

command! Elopal e ~/gdrive/btg/dcwater_mert/opal/opal_meeting_notes.md
command! Eleems e ~/gdrive/btg/dcwater_mert/eems/eems_meeting_notes_otl.md
command! Elvms e ~/gdrive/btg/dcwater_mert/vms/valve_meeting_notes.md
command! Elamsmeeting e ~/gdrive/btg/dcwater_mert/ams/ams_meeting_notes_otl.md
command! Elamsnotes e ~/gdrive/btg/dcwater_mert/ams/ams_notes.otl

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
let $CMMIMY = '$CMMIMY'
command! Cdfulcro cd /Users/mertnuhoglu/codes/clojure/fulcro/tutorial_tags | :pwd
command! Cdcmmi cd $CMMIMY | :pwd
command! Cdbtgcmmi :Cdcmmi
command! Cdmn cd $MYNOTES | :pwd
command! Cdprojects cd $PROJECTS | :pwd
command! Cdstudy cd $STUDY | :pwd
command! CdMyrepo cd $MYREPO | :pwd
command! Cdmyr cd $MYREPO | :pwd
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

" study/otl/ files
command! Eccode e ~/projects/study/otl/ccode.otl
command! Ecc Eccode
command! Ecodeai  e ~/projects/study/otl/cai.otl
command! Ecoder e ~/projects/study/otl/cr.yaml
command! Ecr Ecoder
command! Ecodejava e ~/projects/study/otl/cjava.otl
command! Ecodeclojure e ~/projects/study/clj/clojure.otl
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

" cmmi files
command! Ecmdict e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/dictionary_cmmi.tsv
command! Ecmpascal e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/meeting_pascal/agenda_pascal.md
command! Ecmp Ecmpascal
command! Ecmleadappraiser e ~/projects/myrepo/prj/cmmi/cmmi_trainings/lead_appraiser_training/lead_appraiser_training_20210704.otl
command! Ecml Ecmleadappraiser
command! Ecmmdd e ~/projects/myrepo/prj/cmmi/cmmi_trainings/lead_appraiser_training/mdd_ref.otl
command! Ecmstudy e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/study_cmmi.otl
command! Ecms Ecmstudy
command! Ecmchecklist e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/gap_analysis_checklist_questions.otl
command! Ecmc Ecmchecklist
command! Ecmartifacts e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/gap_analysis_artifacts_database.otl
command! Ecma Ecmartifacts
command! Ecmfindings e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/gap_analysis_findings_database.otl
command! Ecmf Ecmfindings
command! Ecmmodel e ~/projects/btg/btg_cmmi/logbook/cmmi_model_v20.txt
command! Ecmm Ecmmodel
command! Ecmideas e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/ideas_cmmi.md
command! Ecmid Ecmideas
command! Ecmmpm e /Users/mertnuhoglu/projects/myrepo/prj/cmmi/study_mpm.otl
command! Ecmdictionary e ~/projects/btg/btg_cmmi/logbook/dictionary_cmmi_official.md
command! Ecmd Ecmdictionary

" vim scripts
command! Evmyvim e $HOME/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim
command! Evinfoman e $HOME/.vim/bundle/vim-infoman/plugin/vim-infoman.vim
command! Evkeybindings e $HOME/.vim/bundle/my-custom-keybindings/plugin/my-custom-keybindings.vim
command! Evdataflow e $HOME/.vim/bundle/vim-dataflow-generator-r/plugin/vim-dataflow-generator-r.vim
command! Evmymertprojects e $HOME/.vim/bundle/my-mert-projects/plugin/my-mert-projects.vim

" myrepo notes files
command! Eninfop e /Users/mertnuhoglu/projects/myrepo/otl/infop.otl
command! Enidea e /Users/mertnuhoglu/projects/myrepo/otl/nidea.otl
command! Enid Enidea
command! Enidc e $HOME/projects/myrepo/notes/nproduct/nidea/nidea_content.md
command! Ennotesanki e /Users/mertnuhoglu/projects/myrepo/otl/notes_anki.otl
command! Ensettings e ~/projects/myrepo/otl/nsettings.otl
command! Enregistry e ~/projects/myrepo/otl/registry.otl
command! Enr Enregistry

" mynotes/general files
command! Enconventions e ~/projects/myrepo/notes/general/conventions.md
command! Enconventionsnaming e ~/projects/myrepo/otl/conventions_naming.otl
command! Enprocesses e ~/projects/myrepo/otl/processes.otl
command! Enrules e ~/projects/myrepo/otl/rules.otl
command! Enquality e ~/projects/myrepo/notes/general/quality.md
command! Enkms e ~/projects/myrepo/otl/kms_ideas.otl
command! Enkmsref e ~/projects/myrepo/otl/refcard_kms.otl
command! Ennames e ~/projects/myrepo/otl/names.otl
command! Enotesme e ~/projects/myrepo/otl/notesme.otl
command! Enstandards e ~/projects/myrepo/otl/standards.otl
command! Enpstuff e ~/projects/myrepo/otl/pstuff.otl
command! Enstuff e /Users/mertnuhoglu/projects/myrepo/otl/cstuff.otl
command! Encs Enstuff

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

" rmarkdown support
au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

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

let surround_map = {
  \ 'name' : '+Surround Menu'                         ,
  \ 'q'    : ['SurroundWithDoubleQuotes'         , 'double quotes']          ,
  \ 't'    : ['SurroundWithBackQuotes'           , 'back quotes']            ,
  \ 'b'    : ['SurroundWithBrackets'             , 'brackets']               ,
  \ 's'    : ['SurroundWithBackQuotesUntilSpace' , 'back quotes till space'] ,
  \ }

let remove_map = {
      \ 'name' : '+Remove Menu'                         ,
      \ 'd'    : ['RemoveLineEndingsDosM'         , 'Remove ^M DOS chars']          ,
      \ }

let kustom_map2 = {
      \ 'name': '+Kustom2 Menu',
      \ 'l':                                      ['CommentLinesClj',   'CommentLinesClj'],
      \ }

command! ColorschemeMonokai :colorscheme Monokai
command! ColorschemeMountainDew :colorscheme MountainDew
command! ColorschemeOceanicNext :colorscheme OceanicNext
command! ColorschemePapayaWhip :colorscheme PapayaWhip
command! ColorschemeAyu :colorscheme ayu
command! ColorschemeRigel :colorscheme rigel
command! ColorschemeNightfly :colorscheme nightfly
command! ColorschemeVotlLight :colorscheme votl_light
command! ColorschemeSoftlight :colorscheme softlight

let colorscheme_map = {
      \ 'name': '+Colorscheme Menu',
      \ 'a':                                      ['ColorschemeAyu',   'ayu'],
      \ 'k':                                      ['ColorschemeMonokai',   'Monokai'],
      \ 'm':                                      ['ColorschemeMountainDew',   'MountainDew'],
      \ 'n':                                      ['ColorschemeNightfly',   'Nightfly'],
      \ 'o':                                      ['ColorschemeOceanicNext',   'OceanicNext'],
      \ 'p':                                      ['ColorschemePapayaWhip',   'PapayaWhip'],
      \ 'r':                                      ['ColorschemeRigel',   'Rigel'],
      \ 'v':                                      ['ColorschemeVotlLight',   'VotlLight'],
      \ }

" ~/.vim/bundle/vim-www/plugin/www.vim
command! WwwOpen :call www#www#open_url(0, expand("<cWORD>"))
" unmap <leader>wo
" unmap <leader>ws
" unmap <leader>wco
" unmap <leader>wcs
command! VoomToggleMarkdown :VoomToggle markdown<CR>

let kustom_map = {
  \ 'name': '+Kustom Menu',
  \ ')':    ['OpenCommandInParens',   'Open Path in parantheses'],
  \ 'c':    colorscheme_map,
  \ 'e':    ['CreateExFile2', 'CreateExFile2'],
  \ 'h':    ['HighlightCustom',      'HighlightCustom'],
  \ 'o':    ['OpenFile',      'OpenFile'],
  \ 'O':    ['ToHtmlAndOpenFile',      'ToHtmlAndOpenFile'],
  \ 'l':    ['OpenCommandInParens',   'Open Path in parantheses'],
  \ 'p':    ['OpenCommand',   'Open Path under cursor'],
  \ 's':    ['SearchNoEscapeFromClipboard',   'SearchNoEscapeFromClipboard'],
  \ 't':    ['VoomToggleMarkdown',   'VoomToggle TOC'],
  \ 'u':    ['WwwOpen',      'URL WwwOpen'],
  \ }

command! TabSplit :tab split

let tab_map = {
  \ 'name': '+Tab Terminal menu' ,
  \ 'e':  ['tabe'        , 'tabenew']        ,
  \ 'o':  ['tabonly'        , 'tabonly']        ,
  \ 't':  ['TabSplit'        , 'TabSplit']        ,
  \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
  \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
  \ 'g' : [':FloatermNew lazygit'                           , 'git'],
  \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
  \ 'n' : [':FloatermNew node'                              , 'node'],
  \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
  \ 'p' : [':FloatermNew python'                            , 'python'],
  \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
  \ 'T' : [':FloatermToggle'                                , 'toggle'],
  \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
  \ }

let buffers_map = {
  \ 'name': '+buffers menu' ,
  \ 'b':    ['TelescopeBuffers'        , 'Buffers']        ,
  \ 'n':    [':norm gt'        , 'next tab']        ,
  \ 'p':    [':norm gT'        , 'prev tab']        ,
  \ }

command! ClapFiles :Clap files --hidden
command! ClapBuffers :Clap buffers
command! ClapGrepAll :Clap grep ++query=<cword>
command! ClapGrep :Clap grep
command! ClapWindows :Clap windows
command! ClapHistory :Clap history
command! ClapCommandHistory :Clap command_history
command! ClapJumps :Clap jumps
command! ClapBlines :Clap blines
command! ClapLines :Clap lines
command! ClapFiletypes :Clap filetypes
command! ClapMarks :Clap marks
command! ClapBuffers :Clap buffers

let fzf_map = {
  \ 'name': '+fzf',
  \ 'b':    ['Buffers',        'fzf-buffer']      ,
  \ 'c':    ['Commands',          'Commands'],
  \ 'd':    ['Directories',             'Directories'],
  \ 'F':    ['ClapFiles',             'ClapFiles'],
  \ 'f':    ['Files',             'Files'],
  \ 'g':    ['Rg',             'Rg'],
  \ 'G':    ['ClapGrepAll',             'ClapGrepAll'],
  \ 'l':    ['BLines',            'BLines'],
  \ 'm':    ['Marks',             'Marks'],
  \ 'n':    ['CopyFilename',      'CopyFilename'],
  \ 'p':    ['CopyDirectoryPath', 'CopyDirectoryPath'],
  \ 'r':    ['FZFMru',            'FZFMru'],
  \ 't':    ['ClapFiletypes',            'ClapFiletypes'],
  \ 'u':    ['CopyPathUrl',       'CopyPathUrl'],
  \ 'w':    ['Windows',           'Windows'],
  \ 'y':    ['CopyFilePath',      'CopyFilePath'],
  \ }

" which-key file_map: SPC f id=g12568
let file_map = {
  \ 'name': '+files',
  \ 'b':    ['TelescopeBuffers',          'buffers'],
  \ 'f':    ['TelescopeFindFiles',             'find_files'],
  \ 'F':    ['TelescopeGitFiles',             'git_files'],
  \ 'g':    ['TelescopeGrep',             'live_grep'],
  \ 'G':    ['TelescopeGrepString',             'grep_string'],
  \ 'n':    ['CopyFilename',      'CopyFilename'],
  \ 'p':    ['CopyDirectoryPath', 'CopyDirectoryPath'],
  \ 'r':    ['TelescopeMru',            'mru'],
  \ 'R':    ['TelescopeRepoList',            'TelescopeRepoList'],
  \ 'u':    ['CopyPathUrl',       'CopyPathUrl'],
  \ 'y':    ['CopyFilePath',      'CopyFilePath'],
  \ 'Y':    ['CopyFilePath2',      'CopyFilePath2'],
  \ 'z':    ['TelescopeZoxideList',      'zoxide'],
  \ }

" which-key yaml_map: SPC ü y   id=g12616
let yaml_map = {
  \ 'name': '+yaml_map',
  \ '_':    ['ConvertLine2YamlKeyUnderline', 'ConvertLine2YamlKeyUnderline'],
  \ '/':    ['FindYamlElement', 'FindYamlElement'],
  \ 'a':    ['ConvertLine2YamlKeyA01', 'ConvertLine2YamlKeyA01'],
  \ 'b':    ['ConvertLine2YamlKeyBasic', 'ConvertLine2YamlKeyBasic'],
  \ 'c':    ['ConvertLine2YamlKeyKd', 'ConvertLine2YamlKeyKd'],
  \ 'C':    ['ConvertLine2YamlKeyKdSplitMultiline', 'ConvertLine2YamlKeyKdSplitMultiline'],
  \ 'd':    ['ConvertLine2YamlKeyDsc', 'ConvertLine2YamlKeyDsc'],
  \ 'f':    ['ConvertLine2YamlKeyFtr', 'ConvertLine2YamlKeyFtr'],
  \ 'k':    ['ConvertLine2YamlKey', 'ConvertLine2YamlKey'],
  \ 'm':    ['ConvertLine2YamlKeyMultiline', 'ConvertLine2YamlKeyMultiline'],
  \ 'M':    ['ConvertLine2YamlKeySplitMultiline', 'ConvertLine2YamlKeySplitMultiline'],
  \ 'n':    ['ConvertLine2YamlKeyNrm', 'ConvertLine2YamlKeyNrm'],
  \ 'r':    ['ConvertLine2YamlKeyRef', 'ConvertLine2YamlKeyRef'],
  \ 't':    ['ConvertLine2YamlKeyTtl', 'ConvertLine2YamlKeyTtl'],
  \ '1':    ['ConvertLine2YamlKeyA01Newline', 'ConvertLine2YamlKeyA01Newline'],
  \ '2':    ['ConvertLine2YamlKeyA02Newline', 'ConvertLine2YamlKeyA02Newline'],
  \ '3':    ['ConvertLine2YamlKeyA03Newline', 'ConvertLine2YamlKeyA03Newline'],
  \ '4':    ['ConvertLine2YamlKeyA04Newline', 'ConvertLine2YamlKeyA04Newline'],
  \ '5':    ['ConvertLine2YamlKeyEx01Newline', 'ConvertLine2YamlKeyEx01Newline'],
  \ '6':    ['ConvertLine2YamlKeyEx02Newline', 'ConvertLine2YamlKeyEx02Newline'],
  \ '7':    ['ConvertLine2YamlKeyEx03Newline', 'ConvertLine2YamlKeyEx03Newline'],
  \ '8':    ['ConvertLine2YamlKeyEx04Newline', 'ConvertLine2YamlKeyEx04Newline'],
  \ 'j':    ['ConvertYaml2NormalJoinsInline', 'ConvertYaml2NormalJoinsInline'],
  \ 'J':    ['ConvertYaml2NormalJoins', 'ConvertYaml2NormalJoins'],
  \ }

" which-key lsp_map: SPC ü l  id=g12593
let lsp_map = {
  \ 'name': '+lsp',
  \ 'l':    ['LspSetLoclist',            'LspSetLoclist'],
  \ 'n':    ['LspGotoNext',            'LspGotoNext'],
  \ 'N':    ['LspGotoPrev',            'LspGotoPrev'],
  \ }

" which-key telescope_map: SPC ü t id=g12569
let telescope_map = {
  \ 'name': '+files',
  \ '-':    ['TelescopeFileBrowser',          'file_browser'],
  \ '/':    ['TelescopeSearchHistory',          'search_history'],
  \ ':':    ['TelescopeCommandHistory',          'command_history'],
  \ 'a':    ['TelescopeCurrentBuffer',          'current_buffer_fuzzy_find'],
  \ 'B':    ['TelescopeBuiltins',          'builtin'],
  \ 'c':    ['TelescopeCommands',          'commands'],
  \ 'C':    ['TelescopeColorscheme',          'colorscheme'],
  \ 'h':    ['TelescopeHelpTags',             'help_tags'],
  \ 'H':    ['TelescopeHighlights',             'highlights'],
  \ 'j':    ['TelescopeJumpList',             'jumplist'],
  \ 'k':    ['TelescopeKeymaps',            'keymaps'],
  \ 'l':    ['TelescopeLoclist',             'loclist'],
  \ 'L':    ['TelescopeReloader',             'reloader'],
  \ 'm':    ['TelescopeMarks',             'marks'],
  \ 'M':    ['TelescopeManPages',             'man_pages'],
  \ 'r':    ['TelescopeNeoclip',            'neoclip'],
  \ 'R':    ['TelescopeRegisters',            'registers'],
  \ 'q':    ['TelescopeQuickfix',            'quickfix'],
  \ 's':    ['TelescopeSpellSuggest',            'spell_suggest'],
  \ 'S':    ['TelescopeSymbols',            'symbols'],
  \ 't':    ['TelescopeTags',            'tags'],
  \ 'T':    ['TelescopeFiletypes',            'filetypes'],
  \ 'v':    ['TelescopeVimOptions',            'vim_options'],
  \ }

let align_map = {
  \ 'name': '+align menu' ,
  \ '|':    [':EasyAlignTable'        , 'align']        ,
  \ 'r':    [':EasyAlignTable'        , 'tabonly']        ,
  \ }

" vim-bookmarks id=g12560
let bookmark_map = {
  \ 'name': '+bookmark menu' ,
  \ 'm':    [':BookmarkToggle'        , 'BookmarkToggle']        ,
  \ 'i':    [':BookmarkAnnotate'        , 'BookmarkAnnotate']        ,
  \ 'a':    [':Telescope vim_bookmarks all'        , 'all bookmarks']        ,
  \ 'f':    [':Telescope vim_bookmarks current_file'        , 'current_file']        ,
  \ 'j':    [':BookmarkNext'        , 'BookmarkNext']        ,
  \ 'k':    [':BookmarkPrev'        , 'BookmarkPrev']        ,
  \ 'c':    [':BookmarkDeleteSelectedOrAtCursor'        , 'BookmarkDeleteSelectedOrAtCursor']        ,
  \ 'x':    [':BookmarkClearAll'        , 'BookmarkClearAll']        ,
  \ 'K':    [':BookmarkMoveUp'        , 'BookmarkMoveUp']        ,
  \ 'J':    [':BookmarkMoveDown'        , 'BookmarkMoveDown']        ,
  \ 'g':    [':BookmarkMoveToLine'        , 'BookmarkMoveToLine']        ,
  \ }

let text_map = {
  \ 'name': '+teXt menu' ,
  \ 'a' : align_map,
  \ }

let utl_map = {
  \ 'name' : '+Utl Menu' ,
  \ 'i'    : ['Utl',     'Utl'],
  \ 's'    : ['Utl2',     'Utl split'],
  \ 't'    : ['UtlTab',     'Utl tabe'],
  \ 'v'    : ['Utl3',     'Utl vsplit'],
  \ }

let convert_map = {
  \ 'name' : '+convert_map' ,
  \ 'a'    : ['ConvertAnkiMd',     'ConvertAnkiMd'],
  \ 'A'    : ['ConvertAnkiTsv',     'ConvertAnkiTsv'],
  \ 'b'    : ['ConvertGooglePlayBookNotes',     'ConvertGooglePlayBookNotes'],
  \ 'c'    : ['ConvertCmmiPutAF',     'ConvertCmmiPutAF'],
  \ 'e'    : ['ConvertToExcelFromMultilines',     'ConvertToExcelFromMultilines'],
  \ 'f'    : ['ConvertFillDown',     'ConvertFillDown'],
  \ 'm'    : ['ConvertMarksTxt2MarksTsv',     'ConvertMarksTxt2MarksTsv'],
  \ 'j'    : ['ConvertJavaAttributes2YumlAttributes',     'ConvertJavaAttributes2YumlAttributes'],
  \ 'h'    : ['ConvertHeadersTxt2HeadersFilteredWordsTxt',     'ConvertHeadersTxt2HeadersFilteredWordsTxt'],
  \ 's'    : ['ConvertSubscriptChars2NormalChars',     'ConvertSubscriptChars2NormalChars'],
  \ 't'    : ['ConvertTimesheet2Excel',     'ConvertTimesheet2Excel'],
  \ 'u'    : ['Convert2Unicode',     'Convert2Unicode'],
  \ 'y'    : ['ConvertYoutubeHistory',     'ConvertYoutubeHistory'],
  \ 'U'    : ['ConvertIsoCharsInUtf8',     'ConvertIsoCharsInUtf8'],
  \ }

let custom_map = {
  \ 'name' : '+Custom Menu ü',
  \ 'c'    : kustom_map2,
  \ 'C'    : convert_map,
  \ 'f'    : fzf_map,
  \ 'i'    : utl_map,
  \ 'k'    : kustom_map,
  \ 'l'    : lsp_map,
  \ 'm'    : bookmark_map,
  \ 'r'    : remove_map,
  \ 's'    : surround_map,
  \ 't'    : telescope_map,
  \ 'ü'    : ['OpenFileVsplit',     'OpenFileVsplit'],
  \ 'y'    : yaml_map,
  \ }

let cmmi_files_map = {
      \ 'name' : '+cmmi files',
      \ 'a'    : ['Ecmartifacts', 'gap_analysis_artifacts_database.otl'],
      \ 'c'    : ['Ecmchecklist', 'gap_analysis_checklist_questions.otl'],
      \ 'd'    : ['Ecmdictionary', 'dictionary_cmmi_official.md'],
      \ 'f'    : ['Ecmfindings',  'gap_analysis_findings_database.otl'],
      \ 'l'    : ['Ecmleadappraiser',    'lead_appraiser_training_20210704.otl'],
      \ 'm'    : ['Ecmmodel',  'cmmi_model_v20.txt'],
      \ 'M'    : ['Ecmmdd',  'mdd_ref.otl'],
      \ 'p'    : ['Ecmpascal',    'agenda_pascal.otl'],
      \ 's'    : ['Ecmstudy',     'study_cmmi.otl'],
      \ }

let quickstart_files_map = {
      \ 'name' : '+quickstart indexes' ,
      \ 'c' : ['EquickstartCmmi', 'Quickstart cmmi'],
      \ 'k' : ['EquickstartKms', 'Quickstart Kms'],
      \ 'l' : ['EquickstartLym', 'Quickstart lym'],
      \ 'n' : ['EquickstartNhv', 'Quickstart nhv'],
      \ 'q' : ['EquickstartQuickstarts', 'Quickstart Quickstarts'],
      \ }

let clojure_files_map = {
      \ 'name': '+clojure files',
      \ 'f':    ['Ecodefulcro', 'fulcro.otl'],
      \ 'F':    ['EArticlesFulcro', 'articles_fulcro.otl'],
      \ 'j':    ['Ecodeclojure', 'clojure.otl'],
      \ 'J':    ['EArticlesClojure', 'articles_clojure.otl'],
      \ }

let code_files_map = {
      \ 'name': '+code files',
      \ 'k':    quickstart_files_map,
      \ 'c':    ['Eccode',      'ccode.otl'],
      \ 'd':    ['Ecodedb',     'cdb.otl'],
      \ 'e':    ['Eceng',       'cenglish.otl'],
      \ 'j':    ['Ecodeclojure', 'clojure.otl'],
      \ 'm':    ['Ecemacs',       'cemacs.otl'],
      \ 'r':    ['Ecoder',      'cr.otl'],
      \ 'v':    ['Ecvim',       'cvim.otl'],
      \ }

let example_files_map = {
      \ 'name': '+examples files' ,
      \ 'b':    ['Eexamplesbash'        , 'examples_bash.otl']        ,
      \ 'r':    ['Eexamplesr'        , 'examples_r.otl']        ,
      \ }

let layermark_files_map = {
      \ 'name':   '+layermark files' ,
      \ 'a':    ['Elamsmeeting'        , 'ams_meeting_notes_otl.md']        ,
      \ 'A':    ['Elamsnotes'        , 'ams_notes.otl']        ,
      \ 'e':    ['Eleems'        , 'eems_meeting_notes_otl.md']        ,
      \ 'v':    ['Elvms'        , 'valve_meeting_notes.md']        ,
      \ 'o':    ['Elopal'        , 'opal_meeting_notes.md']        ,
      \ }

let logbook_files_map = {
      \ 'name':   '+logbook files' ,
      \ 'b':      {
        \ 'name': '+logbook files' ,
        \ 'b':    ['Elogbook'        , 'Elogbook']        ,
        \ 'c':    ['ElogbookCmmi'        , 'ElogbookCmmi']        ,
        \ 'l':    ['ElogbookLym'        , 'ElogbookLym']        ,
        \ 'm':    ['ElogbookMyr'        , 'ElogbookMyr']        ,
        \ } ,
        \ }

let note_files_map = {
      \ 'name': '+notes files',
      \ 'c':    cmmi_files_map,
      \ 'a':    ['Ennotesanki',  'notes_anki.otl'],
      \ 'b':    ['Enkms',       'kms_ideas.otl'],
      \ 'i':    ['Enidea',       'nidea.otl'],
      \ 'k':    ['Enrules',       'rules.otl'],
      \ 'm':    ['Enotesme',       'notesme.otl'],
      \ 'n':    ['Ennames',       'names.otl'],
      \ 'p':    ['Enpstuff',     'pstuff.otl'],
      \ 'r':    ['Enregistry',      'registry.otl'],
      \ 's':    ['Enstuff',     'cstuff.otl'],
      \ 't':    ['Enstandards',       'standards.otl'],
      \ 'w':    ['Enwork',      'work.otl'],
      \ }

let ref_files_map = {
      \ 'name': '+ref files',
      \ 'm':    ['Erefmine',        'refmine.otl'],
      \ 'b':    ['Erefbookmarks',   'refbookmarks.otl'],
      \ 'c':    ['Erefcard',        'refcard.otl'],
      \ 'ca':   ['Erefcardarchive', 'refcard_archive.otl'],
      \ 'cd':   ['Erconvertdata', 'rfc_convert_data.md'],
      \ 'cl':   ['Erclojure',       'refcard_clojure.otl'],
      \ }

let study_files_map = {
      \ 'name': '+study files' ,
      \ 'c':    ['Escode'        , 'study_code.md']        ,
      \ 'cl':   ['Esclojure'        , 'study_clojure.md']        ,
      \ 'ij':   ['Estudyintellij'        , 'study_intellij.md']        ,
      \ 'r':    ['Estudyr'        , 'study_r.md']        ,
      \ 's':    ['Estudyspacemacs'        , 'spacemacs.md']        ,
      \ 'v':    ['Esvim'        , 'study_vim.md']        ,
      \ }

let vim_files_map = {
      \ 'name': '+vim files',
      \ 'm':    ['Evmyvim', 'my-vim-custom.vim']        ,
      \ 'i':    ['Evinfoman',     'vim-infoman.vim']        ,
      \ }

let edit_map = {
      \ 'name':   '+edit',
      \ 'b':      logbook_files_map,
      \ 'c':      code_files_map,
      \ 'e':      example_files_map,
      \ 'j':      clojure_files_map,
      \ 'l':      layermark_files_map,
      \ 'n':      note_files_map,
      \ 'r':      ref_files_map,
      \ 's':      study_files_map,
      \ 'v':      vim_files_map,
      \ '?':       ['Buffers',        'fzf-buffer']      ,
      \ }

" nnoremap <Leader>amm  <Plug>(MarkToggle)

let applications_map = {
      \ 'name': '+applications',
      \ 'c':    ['Lflcd',            'Lflcd'],
      \ 'r':    ['Lf',            'Lf'],
      \ 'R':    ['LfCurrentDirectory',            'LfCurrentDirectory'],
      \ }

let project_map = {
      \ 'name': '+project',
      \ 't':    ['FffCurrentDir',            'FffCurrentDir'],
      \ }

command! TabSplit :tab split

function! OnlySplitWindow()
  only
  Utl3
endfunction
command! OnlySplitWindow call OnlySplitWindow()

let window_map = {
      \ 'name': '+window',
      \ 'm':    ['TabSplit',            'tab split'],
      \ 'o':    ['only',            'only'],
      \ 'v':    ['OnlySplitWindow',            'OnlySplitWindow'],
      \ }

command! SessionMkSession :mksession! .quicksave.vim
command! SessionSource :source .quicksave.vim

command! DisableLinter :call lsp#disable_diagnostics_for_buffer()

let major_clojure_toggle_map = {
      \ 'name': '+toggle',
      \ 'l':    ['DisableLinter',            'DisableLinter'],
      \ }

let major_clojure_map = {
      \ 'name': '+major clojure map',
      \ 't' : major_clojure_toggle_map,
      \ }

let session_map = {
      \ 'name': '+session',
      \ 'r':    ['SessionSource',            'mksession! .quicksave.vim'],
      \ 'w':    ['SessionMkSession',            'source .quicksave.vim'],
      \ }

let ref_map = {
      \ 'name': '+ref',
      \ 'i':    ['RefId',            'RefId'],
      \ 'I':    ['RefIdS',            'RefIdS'],
      \ 'l':    ['RefLine',            'RefLine'],
      \ 'n':    ['RefIdNewS',            'RefIdNewS'],
      \ 'p':    ['IdPair',            'IdPair'],
      \ 'w':    ['RefWord',            'RefWord'],
      \ }

function! MotionPageDown()
  execute "norm! \<c-d>"
endfunction
" command! MotionPageDown :execute "norm! \<c-d>"
command! MotionPageDown call MotionPageDown()

let cd_map = {
      \ 'name': '+global c',
      \ 'm':    ['CdMyrepo',            'CdMyrepo'],
      \ 'p':    ['Cdprojects',            'Cdprojects'],
      \ 'r':    ['CdRoot',            'CdRoot'],
      \ 's':    ['Cdstudy',            'Cdstudy'],
      \ }

let global_c_map = {
      \ 'name': '+global c',
      \ 'd' : cd_map,
      \ }

let g:which_key_map =  {
      \ ' ' : ['MotionPageDown',            'MotionPageDown'],
      \ 'a' : applications_map,
      \ 'b' : buffers_map,
      \ 'c' : global_c_map,
      \ 'e' : edit_map,
      \ 'f' : file_map,
      \ 'm' : major_clojure_map,
      \ 'p' : project_map,
      \ 'r' : ref_map,
      \ 'ü' : custom_map,
      \ 's' : session_map,
      \ 't' : tab_map,
      \ 'x' : text_map,
      \ 'ı' : window_map,
      \ }

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

": }}} which-key

": vim-sexp {{{ 
" Default
let g:sexp_mappings = {}

" vim-sexp internal mappings
let s:sexp_mappings = {
		\ 'sexp_outer_list':                'af',
		\ 'sexp_inner_list':                'if',
		\ 'sexp_outer_top_list':            'aF',
		\ 'sexp_inner_top_list':            'iF',
		\ 'sexp_outer_string':              'as',
		\ 'sexp_inner_string':              'is',
		\ 'sexp_outer_element':             'ae',
		\ 'sexp_inner_element':             'ie',
		\ 'sexp_move_to_prev_bracket':      '(',
		\ 'sexp_move_to_next_bracket':      ')',
		\ 'sexp_move_to_prev_element_head': '<M-b>',
		\ 'sexp_move_to_next_element_head': '<M-w>',
		\ 'sexp_move_to_prev_element_tail': 'g<M-e>',
		\ 'sexp_move_to_next_element_tail': '<M-e>',
		\ 'sexp_flow_to_prev_close':        '<M-[>',
		\ 'sexp_flow_to_next_open':         '<M-]>',
		\ 'sexp_flow_to_prev_open':         '<M-{>',
		\ 'sexp_flow_to_next_close':        '<M-}>',
		\ 'sexp_flow_to_prev_leaf_head':    '<M-S-b>',
		\ 'sexp_flow_to_next_leaf_head':    '<M-S-w>',
		\ 'sexp_flow_to_prev_leaf_tail':    '<M-S-g>',
		\ 'sexp_flow_to_next_leaf_tail':    '<M-S-e>',
		\ 'sexp_move_to_prev_top_element':  '[[',
		\ 'sexp_move_to_next_top_element':  ']]',
		\ 'sexp_select_prev_element':       '[e',
		\ 'sexp_select_next_element':       ']e',
		\ 'sexp_indent':                    '==',
		\ 'sexp_indent_top':                '=-',
		\ 'sexp_round_head_wrap_list':      '<LocalLeader>i',
		\ 'sexp_round_tail_wrap_list':      '<LocalLeader>I',
		\ 'sexp_square_head_wrap_list':     '<LocalLeader>[',
		\ 'sexp_square_tail_wrap_list':     '<LocalLeader>]',
		\ 'sexp_curly_head_wrap_list':      '<LocalLeader>{',
		\ 'sexp_curly_tail_wrap_list':      '<LocalLeader>}',
		\ 'sexp_round_head_wrap_element':   '<LocalLeader>w',
		\ 'sexp_round_tail_wrap_element':   '<LocalLeader>W',
		\ 'sexp_square_head_wrap_element':  '<LocalLeader>e[',
		\ 'sexp_square_tail_wrap_element':  '<LocalLeader>e]',
		\ 'sexp_curly_head_wrap_element':   '<LocalLeader>e{',
		\ 'sexp_curly_tail_wrap_element':   '<LocalLeader>e}',
		\ 'sexp_insert_at_list_head':       '<LocalLeader>h',
		\ 'sexp_insert_at_list_tail':       '<LocalLeader>l',
		\ 'sexp_splice_list':               '<LocalLeader>@',
		\ 'sexp_convolute':                 '<LocalLeader>?',
		\ 'sexp_raise_list':                '<LocalLeader>o',
		\ 'sexp_raise_element':             '<LocalLeader>O',
		\ 'sexp_swap_list_backward':        '<M-k>',
		\ 'sexp_swap_list_forward':         '<M-j>',
		\ 'sexp_swap_element_backward':     '<M-h>',
		\ 'sexp_swap_element_forward':      '<M-l>',
		\ 'sexp_emit_head_element':         '<M-S-j>',
		\ 'sexp_emit_tail_element':         '<M-S-k>',
		\ 'sexp_capture_prev_element':      '<M-S-h>',
		\ 'sexp_capture_next_element':      '<M-S-l>',
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


" toggle spell check
nnoremap <leader>tS :setlocal spell! spelllang=en_us<CR>

command! P :pwd
nnoremap <leader>pp :pwd<cr>
nnoremap <leader>cd. :ChangeCurrentDirectory<CR>
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


nnoremap <leader>czd :FDigraph<cr>
inoremap :czd <C-o>:FDigraph<cr>
nnoremap <leader>czi :FIpaPhoneticSymbols<cr>
nnoremap <leader>cze :FEmoji<cr>
nnoremap <leader>czu :FUnicode<cr>
nnoremap <leader>czd :FDigraph<cr>

" toggle full screen for window
" https://stackoverflow.com/a/15584901/29246
"nnoremap ütt :tab split<CR>
"nnoremap üto :tabonly<CR>
"nnoremap <leader>ütt :tab split<CR>
"nnoremap <leader>üto :tabonly<CR>
"nnoremap üte :tabe<CR>
"nnoremap <leader>üte :tabe<CR>

" custom commands. mnemonics: Kustom
nnoremap <leader>üko :OpenFile<cr>

nnoremap <leader>tn :ColorSchemeBrowse<CR>

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
xnoremap ücl :call CommentLines()<CR>
nnoremap ücl :call CommentLines()<CR>
"nnoremap ücl :<c-u>call CommentLines()<CR>

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
let g:ctrlp_max_history = 200

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
nmap zV znzMzv
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
nnoremap üqr :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap üqk "ky:ThesaurusQueryReplace <C-r>k<CR>

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

" pretty format with ,ff
map üff <Esc>:1,$!xmllint --format -<CR>

" insert date automatically
" date for hugo
nnoremap üüh "=strftime("%Y-%m-%dT%H:%M:%S+03:00")<CR>P
abbrev üüh <C-R>=strftime("%Y-%m-%dT%H:%M:%S+03:00")<CR>
nnoremap üüi "=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>P
" abbrev üüi <C-R>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>
iab <expr> üüi strftime("%Y-%m-%dT%H:%M:%S%z")
nnoremap üüd "=strftime("%Y%m%d")<CR>P
iab <expr> üüd strftime("%Y%m%d")
" abbrev üüd <C-R>=strftime("%Y%m%d")<CR>
"nnoremap üüt "=strftime("%H%M")<CR>P
abbrev üüt <C-R>=strftime("%H%M")<CR>
" abbrev üüz <C-R>=test
" iab <expr> dts strftime("%c")

" source script again
nnoremap ğğs :w \| so%<CR>
nnoremap üüs :wa<CR>
" nnoremap üüf  <Plug>(easymotion-s)
map mm <Plug>(easymotion-prefix)

nnoremap üch :set cursorline! nocursorcolumn<CR>

" close current window
" delete buffer without losing split
"nmap ğ :bp\|bd #<cr>
nmap Ğ :bd<cr>

nnoremap <S-F4> <Plug>MakeDigraph

" to quickly jump between buffers
nnoremap <S-F1> :args<CR>

": }}} simple commands 

": convert2 surround functions {{{

": surround settings {{{ 
function! SurroundMdImage() range
                  exe a:firstline.",".a:lastline."g/\\(\\.jpg\\>\\)\\|\\(\\.png\\)/ s#\\(^\\)\\(.*/\\)\\([^/]\\+\\)\\(\\..*$\\)#![\\3](\\2\\3\\4)#"
endfunction
command! -nargs=* -range=% SurroundMdImage <line1>,<line2>call SurroundMdImage()

" convert word -> `word`
command! SurroundWithDoubleQuotes normal viwS"e
command! Swdq SurroundWithDoubleQuotes
nnoremap üsq :Swdq<CR>
command! SurroundWithBackQuotes normal viwS`e
command! Swq SurroundWithBackQuotes
nnoremap üst :Swq<CR>
nnoremap ss :Swq<CR>
" surround with back quotes visual selected area: üst
vnoremap üst <Esc>`>a`<Esc>`<i`<Esc>
vnoremap üsq <Esc>`>a"<Esc>`<i"<Esc>
vnoremap ss <Esc>`>a`<Esc>`<i`<Esc>
vnoremap qq <Esc>`>a'<Esc>`<i'<Esc>
command! SurroundWithBrackets normal viwS]e
command! Swb SurroundWithBrackets
nnoremap üsb :Swb<CR>
command! SurroundWithBackQuotesUntilSpace normal v/\s\|$\<cr\>S`e
nnoremap üss :SurroundWithBackQuotesUntilSpace<CR>
command! ReplaceWithCloze normal viwc[...]
nnoremap ürc :ReplaceWithCloze<CR>
command! ReplaceWithCloze2 normal vt c[...]
nnoremap ürt :ReplaceWithCloze2<CR>

" surround with * for markdown
command! SurroundWithMdBold normal viwS*wviwS*
nnoremap üse viws**<c-r>***
" @todo
nnoremap üsf :SurroundWithMdBold
vnoremap üse s**<c-r>***<esc>

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
vnoremap üe s{{c1::<c-r>"}}<esc>
vnoremap ükk s[...]<esc>
"nnoremap üe de{{c1::}}

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

function! ConvertPIID2Normalize()
                  g/^\d\+\t\+$/d
                  g/^\t\+/d
                  g/^SG\|PF\|GG/d
                  g/^SP\|GP/norm >>>>
endfunction

function! ConvertPIID_PA() " id=g_11462
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

function! ConvertGapReportBulgular()
                  v/\tBulgular\t/d
                  v/:/d
                  v/\d\s*$/norm A       1                     0                     0
                  %s# !0!0\s*$#\t0\t0\t0#
                  %s# !1!0\s*$#\t0\t1\t0#
                  %s# !0!1\s*$#\t1\t0\t1#
                  %s/!/\t/g
                  %s/\t\t\+/\t/
endfunction
function! ConvertGapReportNotlar()
                  v/\tNotlar\t/d
                  g/\tNotlar\s*$/d
                  g/\tNotlar\t\S*\s*$/d
                  v/\t\d$/d
endfunction
function! ConvertGapReportKanitlar()
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

function! ConvertTimesheet2Excel()
  " parametrik: 11 ile başlamayanları içeri hizala
  v/^11\d\+/norm >>
  " run awk: Fill down = outline tree to linear tree <url:file:///~/projects/study/bash/table_fill_down.md#r=g12547>
  " ~/projects/myrepo/scrap/awk01.sh
  " ~/projects/myrepo/scrap/input20211202.txt
  %s/^/2021/
  g/^202111\d\+$/d
endfunction
command! ConvertTimesheet2Excel call ConvertTimesheet2Excel()

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
" iab: for shortcodes that contain non-alphabetical symbols
" use: %xx
" double-struck capital letters
iab %/Z ℤ
iab %/R ℝ
iab %/N ℕ

" arrows
iab %-> →
iab %<- ←
iab %=> ⇒
iab %<= ⇐
iab %>-> ↣

" bracket
iab %<+ 《
iab %>+ 》

iab %.M ·
iab %s* σ
iab %p* π
iab %r* ρ

iab %)U ∪
iab %(U ∩
" element
iab %(- ∈
iab %(! ∉
iab %-) ∋
" empty set
iab %/0 ∅
iab %(c ⊂
iab %)c ⊃
iab %!(c ⊄
iab %!)c ⊅
" subset
iab %(_ ⊆
iab %)_ ⊇

iab %/> 〉
iab %</ 〈
" use Ctrl-K
iab %-, ¬
iab %l* λ
iab %=> ⇒
iab %<= ⇐
iab %== ⇔
" therefore
iab %.: ∴

" iab %-2 −
iab %+Z ∑
" not equal approximate
iab %!= ≠
iab %?= ≅
" greek alpha beta gamma sigma
iab %a* α
iab %b* β
iab %g* γ
iab %S* Σ
iab %P* Π
"iab %XO ⊕

" less than
iab %=< ≤
iab %>= ≥
iab #!=< ≰

" triangle
InoreabBSlash UT ▲
InoreabBSlash uT △
InoreabBSlash Tl ◁

" dash
InoreabBSlash vr ├

" y-hat x-hat
iab %y> ŷ

"iab %te ∃
"iab %jn ⨝
"iab %fa ∀
"iab %an ∧
"iab %or ∨
"iab %cr ⨯
" backslash abbreviations

"iab >> %>%
"una >>

" short forms for iab
"iab UT ▲
"iab uT △
"iab Jn ⨝
"iab FA ∀
"iab TE ∃
"iab AN ∧
"iab OR ∨
"iab Cr ⨯
"iab XO ⊕
"iab XX ⨂
"iab 1S ¹
"iab -S ⁻
"iab 00 ∞
"iab LB ▄
"iab 0M ●
"iab 0m ○
"iab -> →
"iab <- ←
"iab => ⇒
"iab <= ⇐
"iab >-> ↣
"iab <+ 《
"iab >+ 》
"iab .M ·
"iab s* σ
"iab p* π
"iab r* ρ
"iab )U ∪
"iab (U ∩
"iab (- ∈
"iab (! ∉
"iab -) ∋
"iab /0 ∅
"iab (c ⊂
"iab )c ⊃
"iab !(c ⊄
"iab !)c ⊅
"iab (_ ⊆
"iab )_ ⊇
"iab /> 〉
"iab </ 〈
"iab -, ¬
"iab l* λ
"iab => ⇒
"iab <= ⇐
"iab == ⇔
"iab -2 −
"iab +Z ∑
"iab != ≠
"iab ?= ≅
"iab a* α
"iab b* β
"iab g* γ
"iab S* Σ
"iab P* Π
"iab =< ≤
"iab >= ≥
"iab !=< ≰
"iab .: ∴

" IPA phonetic symbols
"ī ū í ÉÀ5
digraph a5 594
"ɒ
"β ç ᵈ ḑ ┬ │å ık

" [Mathematical symbol macros for [idea]vim](https://gist.github.com/breandan/ed814aba2cee6d27a0efff655e231b09)
"iab \alpha α
"iab \beta β
"iab \gamma γ
"iab \delta δ
"iab \epsilon ε
"iab \zeta ζ
"iab \eta η
"iab \theta θ
"iab \iota ι
"iab \kappa κ
"iab \lambda λ
"iab \mu μ
"iab \nu ν
"iab \xi ξ
"iab %pi π
"iab \acx π
"iab \rho ρ
"iab \sigma σ
"iab \tau τ
"iab \upsilon υ
"iab \phi φ
"iab \chi χ
"iab \psi ψ
"iab \omega ω

"iab \Gamma Γ
"iab \Delta Δ
"iab \Lambda Λ
"iab \Xi Ξ
"iab %Pi Π
"iab \Sigma Σ
"iab \Upsilon ϒ
"iab \Phi Φ
"iab \Psi Ψ
"iab \Omega Ω

"iab \nabla ∇
"iab \partial ∂


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
nmap üün :call BuildAndRunNodeScript()<cr>
function! BuildAndRunTypeScript()
  :wa
  :!ts-node % | tee >(pbcopy)
endfunction
nnoremap üüt :call BuildAndRunTypeScript()<cr>
function! BuildAndRunBabelNodeScript()
  :wa
  :!yarn babel-node --presets env % | tee >(pbcopy)
endfunction
nnoremap üüb :call BuildAndRunBabelNodeScript()<cr>

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
:RainbowToggle


" cljfold foldwords settings
let g:clojure_foldwords = "def,ns,identity"

" vim-markdown settings
let g:vim_markdown_fenced_languages = ['csharp=cs','clojure=clj']

" which-key settings

" rainbow parantheses settings
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  " autocmd FileType lisp,clojure,scheme,markdown RainbowParentheses
  autocmd FileType lisp,clojure,scheme,markdown RainbowToggleOn
augroup END
" let g:rainbow#max_level = 16

": file manager settings {{{ 
" use lf instead of default vinegar
nnoremap - :LfCurrentFile<cr>
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

": swoop settings {{{ 
" swoop keymap
nmap ül :call Swoop()<CR>
vmap ül :call SwoopSelection()<CR>
nmap üml :call SwoopMulti()<CR>
vmap üml :call SwoopMultiSelection()<CR>

": }}} swoop settings 

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
  
function! Utl_AddressScheme_f(url, fragment, dispMode)
  " link:
  "   <url:f:$VRP_PSK_DIR/db/src/sample_data/reset.sql>
  "   f:$VRP_PSK_DIR/db/src/sample_data/reset.sql
  " opens: $VRP_PSK_DIR/db/src/sample_data/reset.sql
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
" xmap ğt :EasyAlignTable<cr>
"xmap ğt gaip*\|
nnoremap ğt :execute "norm gaip*\|"<cr>

map <leader>vga :call Vhdl_GA_All()<CR>

" Alignment
function! Vhdl_GA_All()
   exe ":'<,'> EasyAlign *<space>"
   exe ":'<,'> EasyAlign ("
   exe ":'<,'> EasyAlign )"
endfunction

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

": open execute functions{{{ 
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

": wincmd keybinding {{{

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
nnoremap <Leader>u yyp<c-v>$r-
" change working directory to current file
"nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" increment and decrement under windows
" nnoremap <C-S-x> <C-a>
" nnoremap <C-S-X> <C-A>
" It is dangerous to use C-W in other apps. So don't get used to it better
:imap <C-Backspace> <C-W>
" Ü to jump to a link/tag
" same as :tag
:nnoremap Ü <C-]>
" same as :tjump
"nnoremap Ü g<C-]>
" ,a to go to the last buffer
:nnoremap üh :BufSurfBack<CR>
:nnoremap üf :BufSurfForward<CR>

:nnoremap ün :cnext<CR>
:nnoremap üp :cprevious<CR>

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

nmap ür <Plug>ReplaceWithRegisterOperator
nmap ürr <Plug>ReplaceWithRegisterLine
xmap ür <Plug>ReplaceWithRegisterVisual

" surround
nnoremap <leader>ücc :ReplaceWithCloze2<CR>

nnoremap çç yy
nnoremap üa <C-W>=<CR>
nnoremap ş :ta
" make all windows same size
nnoremap üa <C-w>=<cr>

" copy current line from start to line end
nnoremap üüç ^y$
" delete word with alt backspace
inoremap <M-BS>   <ESC>ldbi
"inoremap <M-BS>  <C-[>ldbi


": }}} mappings keybindings 

": fzf id=g_11652 {{{

" # fzf functions
" https://github.com/junegunn/fzf/wiki/Examples-(vim)

" BLines override
" taken from: <url:~/.vim/bundle/fzf.vim/autoload/fzf/vim.vim#tn=function! s:buffer_lines()>
function! s:buffer_lines()
  let linefmt = s:yellow(" %4d ", "LineNr")."\t%s"
  echo linefmt
  return map(getline(1, "$"), 'printf(linefmt, v:key + 1, v:val)')
endfunction
command! BLines2 call fzf#run({
      \ 'source':  s:buffer_lines(),
      \ 'sink':    'edit',
      \ 'options':    '-m -x +s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \ 'down':    '40%' })
command! BLines3 call fzf#vim#md_headers()

" Select Buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction
function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
  "echo a:e
endfunction
nnoremap <silent> <Leader><Enter> :call fzf#run({
      \   'source':  reverse(<sid>buflist()),
      \   'sink':    function('<sid>bufopen'),
      \ 'options':    '+m --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
      \   'down':    '40%'
      \ })<CR>

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

" üd: jump to tag with fzf
nnoremap üd :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

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
command! TelescopeFileBrowser :lua require('telescope.builtin').file_browser()
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
command! TelescopeSymbols :lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }

command! TelescopeTagstack :lua require('telescope.builtin').tagstack()
command! TelescopeJumpList :lua require('telescope.builtin').jumplist()
command! TelescopeLspReferences :lua require('telescope.builtin').lsp_references()
command! TelescopeLspDefinitions :lua require('telescope.builtin').lsp_definitions()
command! TelescopeLspImplementations :lua require('telescope.builtin').lsp_implementations()
command! TelescopeLspCodeActions :lua require('telescope.builtin').lsp_code_actions()
command! TelescopeReloader :lua require('telescope.builtin').reloader()

command! TelescopeCurrentBuffer :lua require('telescope.builtin').current_buffer_fuzzy_find()
command! TelescopeCustomFinder :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍

command! TelescopeVimOptions :lua require('telescope.builtin').vim_options()

command! TelescopeSearchStudy :lua require('mytelescope').search_dotfiles()


" vim-bookmarks
let g:bookmark_no_default_key_mappings = 1
" ref: [tom-anders/telescope-vim-bookmarks.nvim: Integrates vim-bookmarks into telescope.nvim](https://github.com/tom-anders/telescope-vim-bookmarks.nvim)
command! BookmarkDeleteAtCursor :lua require('telescope').extensions.vim_bookmarks.delete_at_cursor()
command! BookmarkDeleteSelected :lua require('telescope').extensions.vim_bookmarks.delete_selected()
command! BookmarkDeleteSelectedOrAtCursor :lua require('telescope').extensions.vim_bookmarks.delete_selected_or_at_cursor()

" telescope-zoxide
command! TelescopeZoxideList :Telescope zoxide list

" telescope-repo
command! TelescopeRepoList :Telescope repo list

" neoclip
command! TelescopeNeoclip :Telescope neoclip

" highlights
": }}}

": conjure {{{

nnoremap <leader>mcc :ConjureConnect<cr>
command! CC :ConjureConnect
let g:conjure#mapping#prefix = " m"
let g:conjure#mapping#eval_root_form = "ed"

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

" FindYamlElement: bulunduğun yaml elementine referansları bul id=g12617
function! FindYamlElement()
  let line0 = Strip(getline("."))
  let a1 = substitute(line0, ':.*', '', '')
  let @* = a1
  SearchNoEscapeFromClipboard
endfunction
command! FindYamlElement call FindYamlElement()

" FindYamlElement: bulunduğun yaml elementine referansları bul id=g12617
function! FindYamlElement()
  " input:
  "   ## apply.lapply/ex01 id=g12618
  " out:
  "   apply.lapply/ex01:
  "     ref: apply.lapply/ex01 <url:file:///~/projects/study/r/examples_r.Rmd#r=g12618>

  let ref = RefId()
  "> 	apply.lapply/ex01 <url:file:///~/projects/study/r/examples_r.Rmd#r=g12618>
  let title = substitute(ref, ' <url:.*', '', '')

endfunction
command! FindYamlElement call FindYamlElement()

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

nnoremap üy_ :ConvertLine2YamlKeyUnderline<cr>
nnoremap üya :ConvertLine2YamlKeyA01<cr>
nnoremap üyb :ConvertLine2YamlKeyBasic<cr>
nnoremap üyc :ConvertLine2YamlKeyKd<cr>
nnoremap üyC :ConvertLine2YamlKeyKdSplitMultiline<cr><esc>
nnoremap üyd :ConvertLine2YamlKeyDsc<cr>
nnoremap üyf :ConvertLine2YamlKeyFtr<cr>
nnoremap üyk :ConvertLine2YamlKey<cr>
nnoremap üym :ConvertLine2YamlKeyMultiline<cr><esc>
nnoremap üyM :ConvertLine2YamlKeySplitMultiline<cr><esc>
nnoremap üyn :ConvertLine2YamlKeyNrm<cr>
nnoremap üyr :ConvertLine2YamlKeyRef<cr>
nnoremap üyt :ConvertLine2YamlKeyTtl<cr>
nnoremap üy1 :ConvertLine2YamlKeyA01Newline<cr>
nnoremap üy2 :ConvertLine2YamlKeyA02Newline<cr>
nnoremap üy3 :ConvertLine2YamlKeyA03Newline<cr>
nnoremap üy4 :ConvertLine2YamlKeyA04Newline<cr>
nnoremap üy5 :ConvertLine2YamlKeyEx01Newline<cr>
nnoremap üy6 :ConvertLine2YamlKeyEx02Newline<cr>
nnoremap üy7 :ConvertLine2YamlKeyEx03Newline<cr>
nnoremap üy8 :ConvertLine2YamlKeyEx04Newline<cr>

" search regex without escaping slash characters id=g12591
" [Searching for expressions which include slashes | Vim Tips Wiki | Fandom](https://vim.fandom.com/wiki/Searching_for_expressions_which_include_slashes)
command! -nargs=1 SearchNoEscape let @/ = <q-args>|set hlsearch
" :let @/=@+  Set search register to value from clipboard (@+).
command! SearchNoEscapeFromClipboard let @/=@+  

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
  let line0 = getline(".")
  let line1 = substitute(line0, '^\( \+\)\(.*\):$', '\1\2: [info, \2]', 'e')
  let @* = line1
endfunction
command! ConvertYaml2NormalJoinsInline call ConvertYaml2NormalJoinsInline()

nnoremap üyj :ConvertYaml2NormalJoinsInline<cr>
nnoremap üyJ :ConvertYaml2NormalJoins<cr>

": yaml convert }}}

": autocmd filetype {{{
" update a buffer's contents on focus if it was changed outside of vim
autocmd FocusGained, BufEnter * :checktime

autocmd BufNewFile,BUfRead *.vim set filetype=vim
autocmd BufNewFile,BUfRead .vimrc set filetype=vim
autocmd BufNewFile,BUfRead *.otl set filetype=votl

" disable autocompletion based on file types id=g12612
autocmd BufNewFile,BUfRead *.otl lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BUfRead *.txt lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BUfRead *.md lua require('cmp').setup.buffer { enabled = false }
autocmd BufNewFile,BUfRead *.Rmd lua require('cmp').setup.buffer { enabled = false }
": autocmd filetype }}} 

