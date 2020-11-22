" vim:fileencoding=utf-8:ft=conf:foldmethod=marker

": all {{{

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

let $MYNOTES = '~/gdrive/mynotes/'
let $MYREPO = '~/projects/myrepo'
let $LAYERMARK = '/Users/mertnuhoglu/projects/lym/lym'

command! Ezshrc e ~/.zshrc

" override C-\ C-N to go to Normal mode *
"noremap <press Ctrl-V><press C-ü><press C-n> <press Ctrl-V><C-\><C-n><cr> 
"map <press Ctrl-V><press Ctrl-K> :ls<press Ctrl-V><press Enter>

" split window
nnoremap <silent> ıv :wincmd v<cr>:wincmd l<cr>
nnoremap <silent> ıs :wincmd s<cr>:wincmd j<cr>

" Close others
nnoremap <silent> ıo :wincmd o<cr>

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

" make all windows same size
nnoremap çç yy
nnoremap üa <C-W>=<CR>
nnoremap ş :ta 
nnoremap üa <C-w>=<cr>

noremap <S-F3> :VoomToggle markdown<CR>
noremap <F15> :VoomToggle markdown<CR>
" copy current line from start to line end
nnoremap üüç ^y$
" delete word with alt backspace
inoremap <M-BS>	<ESC>ldbi
"inoremap <M-BS>	<C-[>ldbi

let NERDCreateDefaultMappings=0
map ücc <plug>NERDCommenterComment
map ücu <plug>NERDCommenterUncomment

" Fast window resizing
if bufwinnr(1)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif

" pretty format with ,ff
map üff <Esc>:1,$!xmllint --format -<CR>


" insert date automatically
" date for hugo
nnoremap üüh "=strftime("%Y-%m-%dT%H:%M:%S+03:00")<CR>P
abbrev üüh <C-R>=strftime("%Y-%m-%dT%H:%M:%S+03:00")<CR>
nnoremap üüi "=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>P
abbrev üüi <C-R>=strftime("%Y-%m-%dT%H:%M:%S%z")<CR>
nnoremap üüd "=strftime("%Y%m%d")<CR>P
abbrev üüd <C-R>=strftime("%Y%m%d")<CR>
"nnoremap üüt "=strftime("%H%M")<CR>P
abbrev üüt <C-R>=strftime("%H%M")<CR>

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

" navigate tabs
nnoremap ın :tabnext<CR>
nnoremap ır :tabprevious<CR>
"noremap <A-r> :tabp
"noremap <C-r> :tabp<cr>

nnoremap <silent> üll :call ToggleList("Location List", 'l')<CR>

" quick arrow movements in insert mode 
"inoremap II <Esc>I
"inoremap AA <Esc>A
"inoremap OO <Esc>O
"inoremap DD <Esc>ddi
"inoremap ø <Esc>o
"inoremap ¿ <Left>
"inoremap µ <Down>
"inoremap ¬ <Up>
"inoremap ¥ <Right>
"inoremap æ <End>
"inoremap ≥ <Home>


" Tab to Escape
"nnoremap <A-Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap ü<Tab> <Tab>
"inoremap <C-i> <Tab>


" mnemonics c = command
" mnemonics: c command, m mand
"nnoremap cm :Commands<cr>
" mnemonics: cl = ls = Files
"nnoremap cl :Files<cr>
"nnoremap cw :Windows<cr>
nnoremap cnt :SwitchToNerdTree<cr>
" mnemonics: c command, nt nerdtree
nnoremap cnf :NERDTreeFind<cr>

" Filter text
"nnoremap <silent> <S-F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

" ctrlp
"nnoremap <c-p> :CtrlP $HOME/dropbox_btg<CR>
" CtrlP mappings
"let g:ctrlp_prompt_mappings = {
"\ 'PrtBS()':              ['<bs>', '<c-]>'],
"\ 'PrtDelete()':          ['<del>'],
"\ 'PrtDeleteWord()':      ['<c-w>'],
"\ 'PrtClear()':           ['<c-u>'],
"\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
"\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
"\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
"\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
"\ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
"\ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
"\ 'PrtHistory(-1)':       ['<c-n>'],
"\ 'PrtHistory(1)':        ['<c-p>'],
"\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
"\ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
"\ 'AcceptSelection("t")': ['<c-t>'],
"\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
"\ 'ToggleFocus()':        ['<s-tab>'],
"\ 'ToggleRegex()':        ['<c-r>'],
"\ 'ToggleByFname()':      ['<c-d>'],
"\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
"\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
"\ 'PrtExpandDir()':       ['<tab>'],
"\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
"\ 'PrtInsert()':          ['<c-\>'],
"\ 'PrtCurStart()':        ['<c-a>'],
"\ 'PrtCurEnd()':          ['<c-e>'],
"\ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
"\ 'PrtCurRight()':        ['<c-l>', '<right>'],
"\ 'PrtClearCache()':      ['<F5>'],
"\ 'PrtDeleteEnt()':       ['<F7>'],
"\ 'CreateNewFile()':      ['<c-y>'],
"\ 'MarkToOpen()':         ['<c-z>'],
"\ 'OpenMulti()':          ['<c-o>'],
"\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
"\ }

" Window resizing mappings /*{{{*/
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
command! Cdstudy cd $STUDY | :pwd
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
command! Cdmyr cd $MYREPO | :pwd
command! Edershaftalik :e "$HOME/gdrive/Apps/Notational Data/ders_ozne_ben_nesne/haftalik_ders.otl"

" E commands

" mynotes/ files
command! Estuff e $MYREPO/stuff.otl
command! Est Estuff
command! Eknwl e $MYREPO/knwl.otl
command! TStuff tabnew | b stuff.otl
command! Eindexnotes e $HOME/gdrive/mynotes/index_notes.otl
command! Eactivities e $MYNOTES/activities.otl

" mynotes/content/ files
command! Erefmine e $STUDY/other/refmine.otl
command! Erm Erefmine 
command! EquickstartKms :Utl openLink ~/projects/study/other/refmine.otl#r=g_11660
command! EquickstartQuickstarts :Utl openLink ~/projects/study/other/refmine.otl#r=11708
command! EquickstartCmmi :Utl openLink ~/projects/btg/btg_cmmi/logbook/study_cmmi_summary_20200415.otl#r=g_11704
command! EquickstartLym :Utl openLink ~/projects/lym/lym/study_lym.otl#r=g_11707
command! EquickstartNhv :Utl openLink ~/gdrive/mynotes/prj/stk/nuhoglu_vakfi_personal/study_nhv.otl#r=g_11709
command! Erefcard e $STUDY/other/refcard.otl
command! Erc Erefcard 
command! Erefcardarchive e $STUDY/other/refcard_archive.otl
command! Ercar Erefcardarchive
command! Erclojure e $STUDY/clj/refcard_clojure.otl
command! Ercl Erclojure
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
command! Ecstuff e /Users/mertnuhoglu/projects/myrepo/cstuff.otl
command! Ecs Ecstuff
command! Eccode e ~/projects/study/otl/ccode.otl
command! Ecc Eccode 
command! Ecodeai  e ~/projects/study/otl/cai.otl
command! Ecai Ecodeai
command! Ecoder e ~/projects/study/otl/cr.otl
command! Ecr Ecoder
command! Ecodejava e ~/projects/study/otl/cjava.otl
command! Ecj Ecodejava
command! Ecodedb e ~/projects/study/otl/cdb.otl
command! Ecdb Ecodedb
command! Ecodejs e ~/projects/study/otl/cjs.otl
command! Ecjs Ecodejs
command! Ecodefp e ~/projects/study/otl/cfp.otl
command! Ecfp Ecodefp
command! Ecvim e ~/projects/study/otl/cvim.otl
command! Eceng e ~/projects/study/otl/cenglish.otl
command! Ecnames e ~/projects/study/otl/names.otl
command! Ecn Ecnames

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
command! Essh Estudyshiny
command! Estudyjs e ~/projects/study/js/study_js.Rmd
command! Esjs Estudyjs 
command! Estudyts e ~/projects/study/js/study_ts.Rmd
command! Ests Estudyts 
command! Estudycyclejs e ~/projects/study/js/study_notes_cyclejs.Rmd
command! Escjs Estudycyclejs
command! Estudycyclejsexamples e ~/projects/study/js/study_cyclejs_examples.Rmd
command! Escex Estudycyclejsexamples 
command! Estudydbvrp e ~/projects/study/db/db_vrp.Rmd
command! Edvrp Estudydbvrp
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
command! Estudyspacemacs e ~/projects/study/emacs/study_spacemacs.md
command! Ess Estudyspacemacs
command! Estudyintellij e ~/projects/study/code/study_intellij.md
command! Esij Estudyintellij

" prj/ files  
command! Enotesnhv e ~/gdrive/mynotes/prj/stk/nuhoglu_vakfi_personal/notes_nhv.otl
command! Enotesdscp e ~/gdrive/mynotes/prj/dscp/notes_dscp.otl
command! Ends Enotesdscp 
command! Edocitr e ~/projects/itr/vrp/vrp_doc/doc_itr.md
command! Edi Edocitr
command! Enotesitr e ~/gdrive/mynotes/prj/itr/notes_itr.md
command! Enotespvrp e ~/gdrive/mynotes/prj/itr/notes_pvrp.md
command! Eni Enotesitr 
command! Enkinesin e ~/gdrive/mynotes/prj/biz/startup_projects/kinesin/notes_kinesin.md
command! Enp Enotespvrp 
command! Enit Enotesitr 
command! Enoteskns e $KNS/notes_kinesin.md
command! Enkns Enoteskns
"command! Enotesbzq e ~/gdrive/mynotes/prj/bzq/notes_bzq.md
"command! Enbzq Enotesbzq
"command! Enb Enotesbzq
"command! Edocbzq e ~/gdrive/mynotes/prj/bzq/doc_bzq.md
"command! Edbzq Edocbzq
"command! Edb Edocbzq
"command! Enotessipa e ~/gdrive/mynotes/prj/sipa/notes_sipa.md
"command! Ensipa Enotessipa
"command! Ens Enotessipa
"command! Edocsipa e ~/gdrive/mynotes/prj/sipa/doc_sipa.md
"command! Edsipa Edocsipa
"command! Eds Edocsipa
command! Ecmdict e ~/projects/btg/btg_cmmi/logbook/dictionary_cmmi.tsv
command! Ecmpascal e ~/projects/btg/btg_cmmi/logbook/agenda_pascal.md
command! Ecmp Ecmpascal
command! Ecmstudy e ~/projects/btg/btg_cmmi/logbook/study_cmmi_summary_20200415.otl
command! Ecms Ecmstudy
command! Ecmchecklist e ~/projects/btg/btg_cmmi/process_asset_examples/gap_analysis/gap_analysis_checklist_questions.otl
command! Ecmc Ecmchecklist
command! Ecmartifacts e ~/projects/btg/btg_cmmi/process_asset_examples/gap_analysis/gap_analysis_artifacts_database.otl
command! Ecma Ecmartifacts
command! Ecmmodel e ~/projects/btg/btg_cmmi/logbook/cmmi_model_v20.txt
command! Ecmm Ecmmodel
command! Ecmideas e ~/projects/btg/btg_cmmi/logbook/ideas_cmmi.md
command! Ecmid Ecmideas
command! Ecmmpm e ~/projects/btg/btg_cmmi/logbook/study_mpm.otl

" vim scripts
command! Emyvimcustom e $HOME/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim
command! Emvc Emyvimcustom 
command! Einfoman e $HOME/.vim/bundle/vim-infoman/plugin/vim-infoman.vim
command! Ekeybindings e $HOME/.vim/bundle/my-custom-keybindings/plugin/my-custom-keybindings.vim
command! Edataflow e $HOME/.vim/bundle/vim-dataflow-generator-r/plugin/vim-dataflow-generator-r.vim
command! Emymertprojects e $HOME/.vim/bundle/my-mert-projects/plugin/my-mert-projects.vim

" mynotes/nproduct files
command! Eninfop e ~/projects/myrepo/nx/nproduct/infop/infop.otl
command! Enin Eninfop
command! Enidea e ~/projects/myrepo/nx/nproduct/nidea/nidea.otl
command! Eid Enidea 
command! Enid Enidea 
command! Enidc e $HOME/projects/myrepo/nx/nproduct/nidea/nidea_content.md
command! Enotesanki e ~/projects/myrepo/nx/nproduct/nanki/notes_anki.otl
command! Ena Enotesanki
command! Ensettings e ~/projects/myrepo/nx/nsettings.md
command! Enstt Ensettings 
command! Egstt Enstt
command! Enotes e ~/projects/myrepo/nx/nnote.md
command! Enn Enotes

" mynotes/general files 
command! Egconventions e ~/projects/myrepo/general/conventions.md
command! Egc Egconventions 
command! Egconventionsnaming e ~/projects/myrepo/general/conventions_naming.md
command! Egcn Egconventionsnaming 
command! Egprocesses e ~/projects/myrepo/general/processes.md
command! Egprc Egprocesses
command! Emetrics e ~/projects/myrepo/general/metrics.otl
command! Emt Emetrics
command! Egrules e ~/projects/myrepo/general/rules.otl
command! Egr Egrules
command! Egquality e ~/projects/myrepo/general/quality.md
command! Egq Egquality
command! Egkms e ~/projects/myrepo/general/kms/kms_ideas.md
command! Egkms Egkms
command! Egkmsref e ~/projects/myrepo/general/kms/refcard_kms.md
command! Egkr Egkmsref

" myrepo/gtd files
command! Etb e ~/projects/myrepo/gtd/blgfkr.otl

" mynotes/ other files
command! Epstuff e $MYNOTES/personal/pstuff.md
command! Eps Epstuff
command! Epaste e $PASTE

command! Enmsd e $HOME/gdrive/mynotes/msd/notes_msd.otl
command! Enbiz e $HOME/gdrive/mynotes/biz/notes_biz.otl
command! Enstk e $HOME/gdrive/mynotes/stk/notes_stk.otl
command! Eness e $HOME/gdrive/mynotes/ess/notes_ess.otl
command! Enmvpe e $HOME/gdrive/mynotes/mvpe/notes_mvpe.otl
command! Ensfp e $HOME/gdrive/mynotes/sfp/notes_sfp.otl

" dotfiles
command! Ebashprofile e $HOME/.bash_profile
command! Ezshrc e $HOME/.zshenv
command! Ezs Ezshrc 
command! Efzfrefbash e $HOME/projects/private_dotfiles/fzf/refbash.txt
command! Efrb Efzfrefbash
command! Efzfrefvrp e $HOME/projects/private_dotfiles/vim/refvrp.txt
command! Efrvrp Efzfrefvrp

" gdrive/ files
command! Enotesme e ~/gdrive/notes/koza/notesme.otl
command! Enotesvbi e ~/gdrive/shared/veribilimi_istanbul/notes_vbi.otl

" other files
command! Escim e ~/codes/sc-im/src/doc



" disable automatic bullets in markdown
let g:vim_markdown_new_list_item_indent = 0
autocmd BufNewFile,BufRead * setlocal formatoptions-=r
" disable automatic comment inserts
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

function! OpenFilesRecursively()
	let extensions = "(sql|yuml|yaml|md|otl|sh|txt|csv|R|shaape)"
	let excluded_folders = "(archieve|archive|view|tmp|software|tr|en|inbox|main_library|10users_alternative|10-Users|temp|progress_reports|versions_of_project_plans|docs_devops|code|btg_team|Analysis|assets|__MACOSX|kariyernet_gis_expert_20151202|external_docs|software_tools|source_az|img|arcgis|azcad|data|progress_reports|other|10-Notes|prototyping|customer_sessions|BPS-03|10users_alternative|evaluations|upwork_jobs)"
	let excluded_files = "(_en\.|_tr\.|_az\.md$|_deprecated|conflicted)"
	let cmd = "find -L | ack '." . extensions . "$' | ack -v '/" . excluded_folders . "/' | ack -v '" . excluded_files . "'"
	for i in (split(system(cmd),'\n')) | execute("e ".i) | endfor
endfun
command! OpenFilesRecursively call OpenFilesRecursively()

function! OpenMinimal()
	cd $MYNOTES
	e stuff.otl
  OpenItrNotes
	b notes_itr.md
  :call AutomaticSessions()
endfunction	
command! OpenMinimal call OpenMinimal()

function! OpenRef()
  Erefcard
  tabnew
  Epstuff
  tabnew
  Enid
endfunction	
command! OpenRef call OpenRef()

function! OpenStuff()
	Estuff
endfunction	
command! OpenStuff call OpenStuff()

function! OpenItrNotes()
	Edi
	Eni
endfunction
command! OpenItrNotes call OpenItrNotes()

" in md + otl files use zn instead of zm 
nmap zn :set ft=votl \| :norm! mnzMzrzr'nzm \| :set expandtab \| :retab \| :norm! 'n<cr>
nmap zV znzMzv
nmap zö zMzvzczOzt
" next section
nmap zj zcjzö
nmap <S-RIGHT> zcjzö
" note that ]l [l ]L defined by NextIndent
nmap zJ ]lzO
" prev section
nmap zk zckzö
nmap zK [lzO
" open and go to last child
nmap zÖ zo]Lk
" left hand navigation of otl trees
nmap cö zj
nmap cv zk
" move to prev line with same indentation
" http://vim.wikia.com/wiki/Move_to_next/previous_line_with_same_indentation
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" usage:
"
" [l ]l		prev/next same indent
" [L ]L		prev/next lower indent
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


command! CEmoji %s/:\\([^:]\\+\\):/\\=emoji#for(submatch(1), submatch(0))/g


function! YoutubeSrc2PlaylistLinks()                           
  /href=".*watch.*list=[^"]*"
  v//d
  /list=[^"]*
  MatchesOnly
  sort u
  %s#^#https://www.youtube.com/playlist?
endfunction
command! YoutubeSrc2PlaylistLinks call YoutubeSrc2PlaylistLinks()

command! Tme TableModeEnable
command! Tmd TableModeDisable

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
	"let c = '/qc-kizcddzczc14kgg/10-ANALzcdd/40-TECHzcdddd3jzo5jzojjzojjzo'
	"norm @f
endfunction
command! CleanFileTree call CleanFileTree()

function! UpdateFileTree()
	" not working. @todo
	!baku_tree2
	CleanFileTree
endfunction
command! UpdateFileTree call UpdateFileTree()

" thesaurus mappings
nnoremap üqr :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap üqk "ky:ThesaurusQueryReplace <C-r>k<CR>

" ----- Arrow Keys -----

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

function! AdjustDate(date, offset) 
" id=g_10173
" function! AdjustDate(date, offset) <url:file:///~/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim#r=g_10173>
" parse a date like sprintf and strptime
" https://stackoverflow.com/questions/12325291/parse-a-date-in-vimscript
" use:
" call AdjustDate("2017-10-11",0)
" out:
" 2017-10-11

python << EOF
import vim
import datetime

result = datetime.datetime.strptime(vim.eval("a:date"), "%Y-%m-%d") + \
        datetime.timedelta(days=int(vim.eval("a:offset")))
vim.command("let l:result = '" + result.strftime("%Y-%m-%d") + "'")
vim.command("echo '" + result.strftime("%Y-%m-%d") + "'")
result = result.strftime("%Y-%m-%d")
EOF
return result
endfunction

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

command! Rmarkdown :!R -e 'rmarkdown::render("%")'
command! OpenHtml :execute '!open ' . expand("%:r") . '.html'
command! OpenFile :!open %
command! Ohtml OpenHtml 
command! SyncRmdToBlogDir :!sync_rmd_to_blog_dirs
command! Srmd :SyncRmdToBlogDir
command! OpenMd :execute '!marked2 ' . expand("%:p")
command! Omd OpenMd

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
"nnoremap w e
"nnoremap e w
"onoremap ie iw
"onoremap ae aw
"nnoremap de dw
"nnoremap dw de
"nnoremap ce cw
"nnoremap cw ce


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


" https://stackoverflow.com/questions/1642611/how-to-save-and-restore-multiple-different-sessions-in-vim
" save and restore sessions in vim
function! MakeSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessiondir = $HOME . "/.vim/sessions" 
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction
function! LoadSession()
  "let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessiondir = $HOME . "/.vim/sessions" 
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
" Adding automatons for when entering or leaving Vim
function! AutomaticSessions()
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession()
endfunction

" wrap some text for anki cloze questions
vnoremap üe s{{c1::<c-r>"}}<esc>
vnoremap ükk s[...]<esc>
"nnoremap üe de{{c1::}}

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

" to close tab :wq

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
set conceallevel=1
map ül :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
autocmd BufReadPre *.js let b:javascript_lib_use_ramda = 1
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1

" tern_for_vim settings
" enable keyboard shortcuts
" <url:vimhelp:tern_map_keys>
let g:tern_map_keys=1
" show argument hints
" <url:vimhelp:tern_show_argument_hints>
let g:tern_show_argument_hints='on_hold'
set noshowmode
let g:updatetime=1000

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

command! Smd set ft=markdown
command! Sotl set ft=votl
command! Snw set nowrap
command! Syw set wrap

" tab navigation
"nnoremap H gT
"nnoremap L gt
nnoremap E gT
nnoremap R gt

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

" swoop keymap
nmap ül :call Swoop()<CR>
vmap ül :call SwoopSelection()<CR>
nmap üml :call SwoopMulti()<CR>
vmap üml :call SwoopMultiSelection()<CR>

" vimfiler file explorer
let g:vimfiler_quick_look_command = 'qlmanage -p'
" vimfiler
"nnoremap <Leader>cd <Plug>(vimfiler_cd_file)
"nnoremap gq <Plug>(vimfiler_quick_look)

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
" :Vexplore when you enter vim
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

set grepprg=rg\ --vimgrep

" NERDTree Settings
" preview a file in nerdtree explorer
let NERDTreeMapPreview='e'
" a9 is before a10
let NERDTreeNaturalSort = 1
" directories first, everything else next
let NERDTreeSortOrder = ['\/$', '\.js$', '\.[tj]son$', '\.md$', '\.Rmd$', '\.sql$', '\.rb$', '\.php$', '*', '\.swp$',  '\.bak$', '\~$' ]
let NERDTreeHijackNetrw = 0
let NERDTreeWinSize = 31

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

" vim statusline configured by lightline
function! RelativePath()  
	return expand("%:~:h")
endfunction
function! CurrentDirNameOnly()  
	return expand("%:h:t")
endfunction
" https://github.com/itchyny/lightline.vim/blob/master/README.md
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \    'relativepath': 'CurrentDirNameOnly'
      \ },
      \ }
			"\ 'enable': { 'tabline': 0 },
      "\ 'colorscheme': 'solarized',

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

" ale settings

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
xnoremap ücl :call CommentLines()<CR>
nnoremap ücl :call CommentLines()<CR>
"nnoremap ücl :<c-u>call CommentLines()<CR>

function! s:ConvertROutputToLines() range
  exe a:firstline.",".a:lastline."s/^ *\\[\\d\\+\\] //"
  exe a:firstline.",".a:lastline.'s/" \+"/"\r"/g'
endfunction	
command! -nargs=* -range=% ConvertROutputToLines <line1>,<line2>call s:ConvertROutputToLines()

function! s:ConvertTsv2Json() range
	exe a:firstline.",".a:lastline."s#\t#", "#g"
	exe a:firstline.",".a:lastline."s#^#[#"
	exe a:firstline.",".a:lastline."s#$#]"
	exe a:firstline.",".a:lastline."s#^#["#"
	exe a:firstline.",".a:lastline."s#$#"]#"
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
	%s/	/ /
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

fu! Utl_AddressScheme_yt(url, fragment, dispMode)		
	" open <url:yt:T-1265>
	" opens: http://yt.teuis.net/issue/T-1265
	let btId = UtlUri_unescape( UtlUri_opaque(a:url) )
	let btUrl = 'http://yt.teuis.net/issue/'.btId
	return  Utl_AddressScheme_http(btUrl, a:fragment, a:dispMode)
endfu

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

command! -nargs=* -complete=dir F2 call fff#Run(<q-args>)

command! Eclikes e $LIKED_TWEETS_CSV
command! Ecfollowers e $FOLLOWERS_CSV
command! Eccontacts e $CONTACTS_CSV
command! Ectweets e $TWEETS_CSV
command! Ecmentions e $MENTIONS_CSV
command! Ecpocket e $POCKET_CSV

nmap ,l :exe ":Utl ol https://dict.leo.org/?search=" . expand("<cword>")

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

nnoremap <silent> sw :set wrap<cr>

function! ClearAllButMatches()
    let old = @c
    let @c=""
    %s//\=setreg('C', submatch(0), 'l')/g
    %d _
    put c
    0d _
    let @c = old
endfunction

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

" Copy matches of the last search to a register (default is the clipboard).
" Accepts a range (default is whole file).
" 'CopyMatches'   copy matches to clipboard (each match has \n added).
" 'CopyMatches x' copy matches to register x (clears register first).
" 'CopyMatches X' append matches to register x.
" We skip empty hits to ensure patterns using '\ze' don't loop forever.
command! -range=% -register CopyMatches call s:CopyMatches(<line1>, <line2>, '<reg>')
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

" match html tags with %
ru macros/matchit.vim

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

fun! MyFeed(feed)
split
enew
set buftype=nofile
python b = vim.current.buffer
python import re
python import feedparser;f = feedparser.parse(vim.eval('a:feed'))
python for i in f['items']: b.append('%s {{{1 %s' % (str(i.title), str(i.link)));
            \b.append(str(re.sub(r'<[^>]*?>', '',i.summary_detail.value)).split("\n"))
setlocal  textwidth=120
norm gggqGgg
set foldmethod=marker

endfun

com! VimRssFeed call MyFeed("http://stackoverflow.com/feeds/question/566656")
com! Slashdot call MyFeed("http://rss.slashdot.org/Slashdot/slashdot")
com! MyStack call MyFeed("http://stackoverflow.com/feeds/user/59592")

" python movement mappings chapa:
let g:chapa_default_mappings = 1

" remove everything except matches
command! MatchesOnly let @a=""|%s//\\=setreg('A', submatch(0), 'l')/g|%d _|pu a|0d _

" matches words starting with underscore such as: _animation _ebook
command! MatchTags normal /\\<_\\w\\+\\><CR>

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

fun! MyFeed(feed)
	split
	enew
	set buftype=nofile
	python b = vim.current.buffer
	python import re
	python import feedparser;f = feedparser.parse(vim.eval('a:feed'))
	python for i in f['items']: b.append('%s {{{1 %s' % (str(i.title), str(i.link)));
					\b.append(str(re.sub(r'<[^>]*?>', '',i.summary_detail.value)).split("\n"))
	setlocal  textwidth=120
	norm gggqGgg
	set foldmethod=marker

endfun
com! VimRssFeed call MyFeed("http://stackoverflow.com/feeds/question/566656")
com! Slashdot call MyFeed("http://rss.slashdot.org/Slashdot/slashdot")
com! MyStack call MyFeed("http://stackoverflow.com/feeds/user/59592")

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

" macros for keynote 2 wordpress
let @t = 'I[A](Jd$Kpa)J0JddK'

" macros for python
" convert __init__ parameters into self.initializations
"let @a='d3wO P0wiself.wyw2wdw"0Pj0dw'
" convert __init__ parameters into =None default values
"let @b='wi=Noneww'
"

" macros for vimrepress
" convert image link to markdown syntax
let @l='I![](A)0'
let @i='/http:..i.imgur.com.\w\+.\(png\|jpg\)I![](A)j0'
" convert dropbox image
let @d='/^\w\+\.\(png\|jpg\)$Ihttp://dl.dropbox.com/u/103580364/temp/I![](A)0'
" make http urls to automatic links:
let @m='/httpi</\s\|$i>/rklh'
" add .jpg extension to imgur image links:
let @j = '/imgurA.jpg'

" copy column of csv and put it into the buffer window below
let @x =':Column,mpuGoPG,lL'

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

" custom fold heading text
" uses EightHeaderFolds plugin
" put number of lines at the end of line
"let &foldtext = "EightHeaderFolds( '\\=s:fullwidth-3', 'left', [ repeat( '   ', v:foldlevel - 1 ), '.', '' ], '\\= s:foldlines . \" lines\"', '' )"


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

" fasd integration
" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction


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

function! OpenPlehn()
	CdPlehnCodes
	args *.R
endfunction
command! OpenPlehn call OpenPlehn()

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

" ergonomy: reaching key `w` is too hard in Turkish F keyboard
nnoremap ö w

": }}}

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
	" call ExtractEmoji("💴		(yen)  ")
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

command! Files2 call fzf#run({
\ 'source':     'fd . --color=never --hidden --type=file --no-ignore ' . getcwd(),
\ 'sink':    'edit',
\ 'options':    '-m -x -s --bind "ctrl-p:toggle-preview" --ansi --preview="bat {} --color=always" --preview-window=right:60%:hidden',
\ 'down':    '40%' })

" preview enabled with "?" key
" hidden by default
command! -bang -nargs=* Fr
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:60%')
	\           : fzf#vim#with_preview('right:50%:hidden', '?'),
	\   <bang>0)

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

": }}}

": tabular align text {{{  id=g_11680
if exists(":Tabularize")
  nmap üa= :Tabularize /=<CR>   
  vmap üa= :Tabularize /=<CR>
  nmap üa: :Tabularize /:\zs<CR>   
  vmap üa: :Tabularize /:\zs<CR>
endif

function! s:align()
" then it will call the :Tabularize command each time you insert a | character
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Table alignment. aligns = | etc.
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" tabular end
": }}}

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

let kustom_map = {
		\ 'name': '+Kustom Menu' ,
		\ 'e':    ['CreateExFile2'        , 'CreateExFile2']        ,
		\ 'o':    ['OpenFile'        , 'OpenFile']        ,
		\ } 

let tab_map = {
	\ 'name': '+Tab menu' ,
	\ 'e':    ['tabe'        , 'tabenew']        ,
	\ 'o':    ['tabonly'        , 'tabonly']        ,
	\ } 

let buffers_map = {
	\ 'name': '+buffers menu' ,
	\ 'b':    ['Buffers'        , 'Buffers']        ,
	\ 'n':    [':norm gt'        , 'next tab']        ,
	\ 'p':    [':norm gT'        , 'prev tab']        ,
	\ } 

let files_map = {
	\ 'name': '+files',
	\ 'c':    ['Commands',          'Commands'],
	\ 'f':    ['Files',             'Files'],
	\ 'g':    ['Files2',            'Files2'],
	\ 'l':    ['BLines',            'BLines'],
	\ 'm':    ['Marks',             'Marks'],
	\ 'n':    ['CopyFilename',      'CopyFilename'],
	\ 'p':    ['CopyDirectoryPath', 'CopyDirectoryPath'],
	\ 'r':    ['FZFMru',            'FZFMru'],
	\ 't':    ['F',            'FFF'],
	\ 'u':    ['CopyPathUrl',       'CopyPathUrl'],
	\ 'w':    ['Windows',           'Windows'],
	\ 'y':    ['CopyFilePath',      'CopyFilePath'],
	\ }

let align_map = {
	\ 'name': '+align menu' ,
	\ '|':    [':norm ğt'        , 'align']        ,
	\ 'r':    [':norm ğt'        , 'tabonly']        ,
	\ } 

let text_map = {
	\ 'name': '+teXt menu' ,
	\ 'a' : align_map,
	\ } 

let custom_map = {
	\ 'name' : '+Custom Menu' ,
	\ 'f' : files_map,
	\ 'k' : kustom_map,
  \ 's' : surround_map,
  \ 't' : tab_map,
	\ }

let cmmi_map = {
	\ 'name' : '+cmmi files',
	\ 's'    : ['Ecmstudy',     'study_cmmi_summary_20200415.otl'],
	\ 'a'    : ['Ecmartifacts', 'gap_analysis_artifacts_database.otl'],
	\ 'c'    : ['Ecmchecklist', 'gap_analysis_checklist_questions.otl'],
	\ 'p'    : ['Ecmpascal',    'agenda_pascal.otl'],
	\ }

let quickstart_map = {
	\ 'name' : '+quickstart indexes' ,
  \ 'c' : ['EquickstartCmmi', 'Quickstart cmmi'],
  \ 'k' : ['EquickstartKms', 'Quickstart Kms'],
  \ 'l' : ['EquickstartLym', 'Quickstart lym'],
  \ 'n' : ['EquickstartNhv', 'Quickstart nhv'],
  \ 'q' : ['EquickstartQuickstarts', 'Quickstart Quickstarts'],
	\ }

let code_map = {
	\ 'name' : '+code files',
	\ 'c' : ['Eccode',        'ccode.otl'],
	\ 'r' : ['Ecoder',        'cr.otl'],
	\ 'd' : ['Ecodedb',       'cdb.otl'],
	\ 'k' : quickstart_map,
	\ 'v' : ['Ecvim',         'cvim.otl'],
	\ 'n' : ['Ecnames',       'names.otl'],
	\ 'e' : ['Eceng',         'cenglish.otl'],
	\ 's' : ['Ecstuff',       'cstuff.otl'],
	\ 'm' : cmmi_map,
	\ }

let ref_files_map = {
	\ 'name': '+ref files' ,
	\ 'm':    ['Erefmine'        , 'refmine.otl']        ,
	\ 'b':    ['Erefbookmarks'        , 'refbookmarks.otl']        ,
	\ 'c':    ['Erefcard'        , 'refcard.otl']        ,
	\ 'ca':   ['Erefcardarchive'        , 'refcard_archive.otl']        ,
	\ 'cl':   ['Erclojure'        , 'refcard_clojure.otl']        ,
	\ }

let example_files_map = {
	\ 'name': '+examples files' ,
	\ 'b':    ['Eexamplesbash'        , 'examples_bash.otl']        ,
	\ 'r':    ['Eexamplesr'        , 'examples_r.otl']        ,
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

let notes_files_map = {
	\ 'name': '+notes files' ,
	\ 'id':   ['Enidea'        , 'nidea.otl']        ,
	\ 'in':   ['Eninfop'        , 'infop.otl']        ,
	\ 'a':    ['Enotesanki'        , 'notes_anki.otl']        ,
	\ }

let vim_files_map = {
	\ 'name': '+vim files',
	\ 'm':    ['Emyvimcustom', 'my-vim-custom.vim']        ,
	\ 'i':    ['Einfoman',     'vim-infoman.vim']        ,
	\ }

let study_files_map = {
	\ 'name': '+study files' ,
	\ 'cl':   ['Esclojure'        , 'study_clojure.md']        ,
	\ 'r':    ['Estudyr'        , 'study_r.md']        ,
	\ 'c':    ['Escode'        , 'study_code.md']        ,
	\ 'v':    ['Esvim'        , 'study_vim.md']        ,
	\ 's':    ['Estudyspacemacs'        , 'study_spacemacs.md']        ,
	\ 'ij':   ['Estudyintellij'        , 'study_intellij.md']        ,
	\ }

let edit_map = {
	\ 'name':   '+edit',
	\ 'c':      code_map,
	\ 'e':      example_files_map,
	\ 'g':      {
		\ 'name': '+general files',
		\ 'r':    ['Egrules',        'rules.otl']        ,
		\ },
	\ 'l':      logbook_files_map,
	\ 'n':      notes_files_map,
	\ 'r':      ref_files_map,
	\ 's':      study_files_map,
	\ 'v':      vim_files_map,
 \ '?':       ['Buffers',        'fzf-buffer']      ,
 \ }

let applications_map = {
	\ 'name': '+applications',
	\ 'r':    ['RangerWorkingDirectory',            'RangerWorkingDirectory'],
	\ }

let project_map = {
	\ 'name': '+project',
	\ 't':    ['FffCurrentDir',            'FffCurrentDir'],
	\ }

let g:which_key_map =  {
	\ 'a' : applications_map,
	\ 'b' : buffers_map,
	\ 'e' : edit_map,
	\ 'f' : files_map,
	\ 'p' : project_map,
	\ 'ü' : custom_map,
  \ 'x' : text_map,
	\ }

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <Leader>w <C-w>


": }}}


": compatible keybindings: vim vs spacemacs vim-which-key id=g_11007 {{{ 

" toggle spell check
nnoremap <leader>tS :setlocal spell! spelllang=en_us<CR>

nnoremap <leader>cds :Cdstudy<CR>
command! P :pwd
nnoremap <leader>pp :pwd<cr>
nnoremap <leader>cd. :ChangeCurrentDirectory<CR>

" split window
nnoremap <silent> <leader>ıv :wincmd v<cr>:wincmd l<cr>
nnoremap <silent> <leader>ıs :wincmd s<cr>:wincmd j<cr>

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
nnoremap ütt :tab split<CR>
nnoremap üto :tabonly<CR>
nnoremap <leader>ütt :tab split<CR>
nnoremap <leader>üto :tabonly<CR>
nnoremap üte :tabe<CR>
nnoremap <leader>üte :tabe<CR>

" custom commands. mnemonics: Kustom
nnoremap <leader>üko :OpenFile<cr>

" surround
nnoremap <leader>ürc :ReplaceWithCloze<CR>
nnoremap <leader>ürc :ReplaceWithCloze2<CR>

nnoremap <leader>tn :ColorSchemeBrowse<CR>

nnoremap <leader>üha :QuickhlManualAdd 


" spacemacs end
": }}}

function! ConvertPIID2Normalize()
	g/^\d\+\t\+$/d
	g/^\t\+/d
	g/^SG\|PF\|GG/d
	g/^SP\|GP/norm >>>>
endfunction

function! ConvertPIID_PA() " id=g_11462
	" input:
	" 		SP1.1	Establish and maintain measurement objectives derived from identified information needs and objectives.
	" 1	MADIOS_Ölçüm Planı
	" 2	YBS/YPTS_Ölçüm Planı
	" 		SP1.2	Specify measures to address measurement objectives.
	" output:
	" 		SP1.1	Establish and maintain measurement objectives derived from identified information needs and objectives.
	" SP1.1	1	MADIOS_Ölçüm Planı
	" SP1.1	2	YBS/YPTS_Ölçüm Planı
	" 		SP1.2	Specify measures to address measurement objectives.
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

function! Test()
	g/mertnuhoglu/d
	g/Public/d
	g/hrs ago/d
	g/theodore/norm d4j
	g/^\s*$/,/./-j
endfunction

function! ConvertGapReportBulgular()
	v/\tBulgular\t/d
	v/:/d
	v/\d\s*$/norm A	1	1	0	0
	%s# !0!0\s*$#\t0\t0\t0\t0#
	%s# !1!0\s*$#\t0\t0\t1\t0#
	%s# !0!1\s*$#\t1\t1\t0\t1#
	%s/!/\t/g
	%s/\t\t\+/\t/
endfunction
function! ConvertGapReportNotlar()
	v/\tNotlar\t/d
	g/\tNotlar\s*$/d
	g/\tNotlar\t\w*\s*$/d
	v/\t\d$/d
endfunction
function! ConvertGapReportKanitlar()
	v/\tKanıtlar\t/d
	g/\tKanıtlar\s*$/d
	g/\tKanıtlar\t\w*\s*$/d
	g/\tKanıtlar\t\w*\t\w*\s*$/d
endfunction

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap gl <Plug>(LiveEasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap gl <Plug>(LiveEasyAlign)

command! -range=% EasyAlignTable :execute ":<line1>,<line2>EasyAlign *|"
"xmap ğt :EasyAlignTable<cr>
"xmap ğt gaip*\|

map <leader>vga :call Vhdl_GA_All()<CR>

" Alignment
function! Vhdl_GA_All()
   exe ":'<,'> EasyAlign *<space>"
   exe ":'<,'> EasyAlign ("
   exe ":'<,'> EasyAlign )"
endfunction

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

iab %-2 −
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
"Ā		mynotes altında listesi vardı galiba ā 

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

": fff file manager plugin settings {{{  

" FFF file manager
" [dylanaraps/fff.vim: A plugin for vim/neovim which allows you to use fff as a file opener.](https://github.com/dylanaraps/fff.vim)

function! FindExecuteCommand()
  let line = search('\S*!'.'!:.*')
  if line > 0
    let command = substitute(getline(line), "\S*!"."!:*", "", "")
    execute "silent !". command
    execute "normal gg0"
    redraw
  endif
endfunction
nmap <F3> :call FindExecuteCommand()<CR>
"!!:open /Users/mertnuhoglu/Downloads/panda01.jpg
": }}}

" vertical split
let g:fff#split = "30vnew"
" left sidebar (nerdtree style)
let g:fff#split_direction = "nosplitbelow nosplitright"

function! FffCurrentDir()
	let path = expand("%:p:h")
	exe "F " . path
endfunction
command! FffCurrentDir call FffCurrentDir()

" use fff instead of default vinegar
nnoremap - :FffCurrentDir<cr>
": }}}

