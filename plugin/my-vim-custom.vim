
let $MYNOTES = '~/Dropbox/mynotes/'

command! Ezshrc e ~/.zshrc

" split window
nnoremap <silent> ıv :wincmd v<cr>
nnoremap <silent> ıs :wincmd s<cr>

" Close others
nnoremap <silent> ıo :wincmd o<cr>

" Move the cursor to the window left of the current one
" kmly
nnoremap <silent> ık :wincmd h<cr>
nnoremap <silent> ım :wincmd j<cr>
nnoremap <silent> ıl :wincmd k<cr>
nnoremap <silent> ıy :wincmd l<cr>
map <silent> <A-k> :wincmd h<cr>
map <silent> <A-m> :wincmd j<cr>
map <silent> <A-l> :wincmd k<cr>
map <silent> <A-y> :wincmd l<cr>

nnoremap <silent> ıc :close<CR>
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
nmap  ,cd :lcd %:h<CR>:pwd<CR>
command! Cdd :lcd %:h
function! ChangeCurrentDirectory()
	lcd %:h
	pwd
endfunction
command! ChangeCurrentDirectory call ChangeCurrentDirectory()
command! Ccd call ChangeCurrentDirectory()

" make all windows same size
nnoremap çç yy
nnoremap <Leader>a <C-W>=<CR>
nnoremap ş :ta 
nnoremap <Leader>a <C-w>=<cr>

noremap <F3> :VoomToggle markdown<CR>
" copy current line from start to line end
nnoremap <Leader>üç ^y$

let NERDCreateDefaultMappings=0
map <Leader>cc <plug>NERDCommenterComment
map <Leader>cu <plug>NERDCommenterUncomment

" Fast window resizing
if bufwinnr(1)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif

" pretty format with ,ff
map <Leader>ff <Esc>:1,$!xmllint --format -<CR>

" vimfiler
"nnoremap <Leader>cd <Plug>(vimfiler_cd_file)

" insert date automatically
nnoremap üüd "=strftime("%Y%m%d")<CR>P
abbrev üüd <C-R>=strftime("%Y%m%d")<CR>
nnoremap üüt "=strftime("%H%M")<CR>P
abbrev üüt <C-R>=strftime("%H%M")<CR>

" source script again
nnoremap ğğs :w \| so%<CR>
nnoremap üüs :wa<CR>

" unite
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>

"nnoremap <Leader>/ :<C-u>Unite -no-split -silent -buffer-name=ag grep:.<CR>
nnoremap <Leader>/ :Unite -no-split -silent -buffer-name=ag grep<CR>

" Unite file search
nnoremap <C-P> :Unite -keep-focus -no-quit grep<CR>

nnoremap <Leader>ch :set cursorline! nocursorcolumn<CR>

" close current window
" delete buffer without losing split
nmap ğ :bp\|bd #<cr>
nmap Ğ :bd<cr>

" toggle explorer with F2
nnoremap <F2> :VimFilerExplorer<CR>
nnoremap z<F5> :lcd %:h<CR>:VimFilerCurrentDir<CR>
nnoremap <F5> :VimFilerExplorer -find<CR>
nnoremap <S-F4> <Plug>MakeDigraph
nnoremap <F4> :Unite outline<CR>

" to quickly jump between buffers
" noremap <F3> :ls<CR>:b<Space>
nnoremap <F1> :FufBuffer<CR>
nnoremap ıı :FufBuffer<CR>
nnoremap ı :FufBuffer<CR>
nnoremap <S-F1> :args<CR>

" navigate tabs
nnoremap ın :tabnext<CR>
nnoremap ır :tabprevious<CR>
"noremap <A-r> :tabp
"noremap <C-r> :tabp<cr>

nnoremap <silent> <leader>e :call ToggleList("Location List", 'l')<CR>

" quick movements in insert mode 
"inoremap II <Esc>I
"inoremap AA <Esc>A
"inoremap OO <Esc>O
"inoremap DD <Esc>ddi
inoremap ø <Esc>o
inoremap ¿ <Left>
inoremap µ <Down>
inoremap ¬ <Up>
inoremap ¥ <Right>
inoremap æ <End>
"inoremap ≥ <Home>


" Tab to Escape
"nnoremap <A-Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap <Leader><Tab> <Tab>
"inoremap <C-i> <Tab>


" activate command line by t
nnoremap t :

" Filter text
nnoremap <silent> <S-F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

" ctrlp
nnoremap <c-p> :CtrlP $HOME/dropbox_btg<CR>
" CtrlP mappings
let g:ctrlp_prompt_mappings = {
\ 'PrtBS()':              ['<bs>', '<c-]>'],
\ 'PrtDelete()':          ['<del>'],
\ 'PrtDeleteWord()':      ['<c-w>'],
\ 'PrtClear()':           ['<c-u>'],
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
\ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
\ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
\ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
\ 'AcceptSelection("t")': ['<c-t>'],
\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
\ 'ToggleFocus()':        ['<s-tab>'],
\ 'ToggleRegex()':        ['<c-r>'],
\ 'ToggleByFname()':      ['<c-d>'],
\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
\ 'PrtExpandDir()':       ['<tab>'],
\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
\ 'PrtInsert()':          ['<c-\>'],
\ 'PrtCurStart()':        ['<c-a>'],
\ 'PrtCurEnd()':          ['<c-e>'],
\ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
\ 'PrtCurRight()':        ['<c-l>', '<right>'],
\ 'PrtClearCache()':      ['<F5>'],
\ 'PrtDeleteEnt()':       ['<F7>'],
\ 'CreateNewFile()':      ['<c-y>'],
\ 'MarkToOpen()':         ['<c-z>'],
\ 'OpenMulti()':          ['<c-o>'],
\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
\ }

" Window resizing mappings /*{{{*/
nnoremap :normal <c-r>=Resize('<')<CR><CR>
nnoremap œ:normal <c-r>=Resize('-')<CR><CR>
nnoremap ≥:normal <c-r>=Resize('+')<CR><CR>
nnoremap \:normal <c-r>=Resize('>')<CR><CR>
nnoremap <C-S-Up> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <C-S-Down> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <C-S-Left> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <C-S-Right> :normal <c-r>=Resize('>')<CR><CR>
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
" /*}}}*/ 

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>   
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>   
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

function! s:align()
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
:nnoremap Ü <C-]>
" ,a to go to the last buffer
:nnoremap <Leader>h :BufSurfBack<CR>
:nnoremap <Leader>f :BufSurfForward<CR>

:nnoremap <Leader>n :cnext<CR>
:nnoremap <Leader>p :cprevious<CR>


" plehn work
let $PLEHNPROJECT = '$HOME/Dropbox/projects/SEC_Filings/parser/'
command! CdPlehnDocs cd $KEYNOTE/plehn
command! CdPlehnCodes cd $PLEHNPROJECT
command! Cd10k cd $PLEHNPROJECT . 'filings/10k/'
command! ENotes e $PLEHNPROJECT/notes.otl
command! EFlowDocumentationPlehn e $HOME/projects/SEC_Filings/parser/flow.otl
command! EFlowAutomatic e $HOME/projects/SEC_Filings/parser/automatic_flow.otl
command! EMySecFilings e $HOME/.vim/bundle/my-sec-filings/plugin/my-sec-filings.vim

" projects for others
let $EVAMPROJECT = '$HOME/projects/study/study_evammoa'
command! ENotesEvamMoa e $EVAMPROJECT/notes_evam.otl
command! EPragmaNotes e $HOME/Dropbox/IntelligentSearchAssistant/customer_development/meeting_notes_pragma.otl

" notes
command! ECStuff e ~/Dropbox/mynotes/content/code/cstuff.md
command! Ecs ECStuff
command! EStuff e $MYNOTES/stuff.otl
command! Est EStuff
command! TStuff tabnew | b stuff.otl
command! ERefMd e $MYNOTES/content/ref.otl
command! Erm ERefMd 
command! ENotesDscp e ~/Dropbox/mynotes/prj/dscp/notes_dscp.otl
command! Ends ENotesDscp 
command! ENotesMe e ~/Dropbox/Notlar/koza/notesme.otl
command! ENotesVbi e ~/Dropbox/shared/veribilimi_istanbul/notes_vbi.otl
command! EStudyAi  e $HOME/projects/study/study_ai.md
command! Esai EStudyAi
command! EStudyR e ~/projects/study/study_r_20160304.md
command! Esr EStudyR
command! EStudyJava e ~/projects/study/study_java.md
command! EStudyJs e ~/projects/study/study_js.md
command! Esj EStudyJava
command! Esjs EStudyJs
command! EDocItr e ~/Dropbox/mynotes/prj/itr/doc_itr.md
command! Edi EDocItr
command! EDocItr e ~/Dropbox/mynotes/prj/itr/doc_itr.md
command! Edi EDocItr
command! ENotesItr e ~/Dropbox/mynotes/prj/itr/notes_itr.md
command! Eni ENotesItr 
command! Enit ENotesItr 
command! EArticlesR e ~/Dropbox/mynotes/content/articles/articles_r.md
command! Ear EArticlesR 
command! EArticlesJs e ~/Dropbox/mynotes/content/articles/articles_js.md
command! Eajs EArticlesJs 
command! EArticlesJava e ~/Dropbox/mynotes/content/articles/articles_java.md
command! Eaj EArticlesJava 
command! EArticlesDataScience e ~/Dropbox/mynotes/content/articles/articles_datascience.md
command! Eads EArticlesDataScience 
command! EArticlesFp e ~/Dropbox/mynotes/content/articles/articles_fp.md.md
command! Eafp EArticlesFp 
command! EArticlesAi e ~/Dropbox/mynotes/content/articles/articles_ai.md
command! Eaai EArticlesAi 
command! EArticlesSwarm e ~/Dropbox/mynotes/content/articles/articles_swarm.md
command! Easw EArticlesSwarm 
command! ECCode e ~/Dropbox/mynotes/content/code/ccode.md
command! Ecc ECCode 
command! EIdea e ~/Dropbox/mynotes/nx/nproduct/nidea/nidea.md
command! Eid EIdea 
command! Enid EIdea 
command! Enmsd e $HOME/Dropbox/mynotes/msd/notes_msd.otl
command! Enbiz e $HOME/Dropbox/mynotes/biz/notes_biz.otl
command! Enstk e $HOME/Dropbox/mynotes/stk/notes_stk.otl
command! Eness e $HOME/Dropbox/mynotes/ess/notes_ess.otl
command! Enmvpe e $HOME/Dropbox/mynotes/mvpe/notes_mvpe.otl
command! Ensfp e $HOME/Dropbox/mynotes/sfp/notes_sfp.otl

command! ERefR  e $HOME/Dropbox/public/temp/refcard_r2.md
command! EStudyR  e $HOME/projects/study/study_r_20160304.md
command! EIndexNotes e $HOME/Dropbox/mynotes/index_notes.md
command! EActivities e $MYNOTES/activities.otl
command! EBashProfile e $HOME/.bash_profile
command! Ezshrc e $HOME/.zshrc
command! Ezs Ezshrc 

" vim scripts
command! CdVim cd $HOME/.vim
command! EMyVimCustom e $HOME/.vim/bundle/my-vim-custom/plugin/my-vim-custom.vim
command! Emvc EMyVimCustom 
command! EInfoman e $HOME/.vim/bundle/vim-infoman/plugin/vim-infoman.vim
command! EKeybindings e $HOME/.vim/bundle/my-custom-keybindings/plugin/my-custom-keybindings.vim
command! EDataflow e $HOME/.vim/bundle/vim-dataflow-generator-r/plugin/vim-dataflow-generator-r.vim
command! EMyMertProjects e $HOME/.vim/bundle/my-mert-projects/plugin/my-mert-projects.vim

" cd to keynote export/import directory
let $KEYNOTE = '$HOME/Dropbox/Apps/MindMup/'
let $PROJECTS = '$HOME/projects/'
let $NOTATIONALDATA = '$HOME/Dropbox/Apps/Notational Data/'
let $DROPBOX = '$HOME/Dropbox/'
let $MYNOTES = '$HOME/Dropbox/mynotes/'
let $DSCP = '$HOME/projects/dewey/dscp/'
command! CdScripts cd '$HOME/projects/scripts'
command! CdKeynote cd $KEYNOTE
command! CdProjects cd $PROJECTS
" copy file name to system clipboard
command! CdNotationalData cd $NOTATIONALDATA
command! EDersHaftalik :e "$HOME/Dropbox/Apps/Notational Data/ders_ozne_ben_nesne/haftalik_ders.otl"


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

" join symbol digraph2
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
	Esr
	Esj
	Esjs
	b stuff.otl
	b notes_itr.md
endfunction	
command! OpenMinimal call OpenMinimal()

function! OpenStuff()
	cd $MYNOTES
	e activities.otl
	e stuff.otl
	cd content/articles
	OpenFilesRecursively
	cd $MYNOTES/doc
	OpenFilesRecursively
	cd $MYNOTES/01_manage
	OpenFilesRecursively
	cd $MYNOTES/general
	OpenFilesRecursively
	cd $MYNOTES/db
	OpenFilesRecursively
	cd $MYNOTES/code
	OpenFilesRecursively
	cd $MYNOTES/nx
	OpenFilesRecursively
	cd $MYNOTES/prj
	OpenFilesRecursively
	cd $MYNOTES/myhome
	OpenFilesRecursively
	cd $MYNOTES/content/mine
	OpenFilesRecursively
	" ENotesVbi
	" ENotesEvamMoa
	" EPragmaNotes
	E /Users/mertnuhoglu/Dropbox (Personal)/mynotes/content/fork/emoji_ref.md
	EIndexNotes
	b stuff.otl
endfunction	
command! OpenStuff call OpenStuff()

function! OpenItrNotes()
  e /Users/mertnuhoglu/Dropbox/mynotes/prj/itr/doc_itr.md
  e /Users/mertnuhoglu/Dropbox/mynotes/prj/itr/notes_itr.md
	"cd ~/gdrive/i-terative/ortak_sistem
	"OpenFilesRecursively
	"cd ~/Dropbox/mynotes/prj/itr/
	"OpenFilesRecursively
endfunction
command! OpenItrNotes call OpenItrNotes()

function! OpenItrScripts()
	cd ~/projects/itr/itr_scripts
	OpenFilesRecursively
endfunction
command! OpenItrScripts call OpenItrScripts()

function! OpenItrKentGida()
	cd ~/projects/itr/kentgida/
	args **/*.R
	args **/*.js
	args **/*.md
	args **/*.yml
	args **/*.pug
	cd doc

endfunction
command! OpenItrKentGida call OpenItrKentGida()

"nmap <C-Up> [e
"nmap <C-Down> ]e
nmap <C-Up> k
nmap <C-Down> j
vmap <C-Up> [egv
vmap <C-Down> ]egv
nmap <C-Left> zc
nmap <C-Right> zo
nmap <S-Left> zn
nmap <S-Right> zO

" in md + otl files use zn instead of zm 
nnoremap zn :Sotl<cr> \| :norm! zMzrzr<cr> \| :set expandtab \| :retab<cr>
nnoremap zV zMzv
nmap zö zMzvzczOzt
" next section
nmap zj zcjzö
" prev section
nmap zk zckzö

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

