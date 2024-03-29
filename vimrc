filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'tpope/vim-git'
Bundle 'austintaylor/vim-indentobject'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'visualstar.vim'
Bundle 'milkbikis/IDSearch.vim.git'
Bundle 'textobj-diff'
Bundle 'textobj-entire'
Bundle 'textobj-fold'
Bundle 'textobj-lastpat'
Bundle 'textobj-syntax'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
:set lazyredraw
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-surround'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'endwise.vim'
Bundle 'matchit.zip'
Bundle 'textobj-user'
Bundle 'textobj-rubyblock'
runtime macros/matchit.vim
Bundle 'unimpaired.vim'
Bundle 'errormarker.vim'
Bundle 'abolish.vim'
Bundle 'delimitMate.vim'
Bundle 'camelcasemotion'
Bundle 'railscasts'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'scrooloose/syntastic'
Bundle 'mrueegg/vim_hlint_mode'
Bundle 'snipMate'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'phleet/vim-mercenary'
Bundle 'tpope/vim-haml'
Bundle 'skwp/vim-rspec.git'
Bundle 'groenewege/vim-less'
Bundle 'cakebaker/scss-syntax.vim.git'
Bundle 'skammer/vim-css-color.git'
Bundle 'vim-scripts/grep.vim.git'
autocmd FileType haskell compiler hlint
Bundle 'kchmck/vim-coffee-script.git'

map <C-]> :tjump <C-R><C-W><CR>


"
"
" based on
" http://github.com/jferris/config_files/blob/mastextras/credit_pending_referrals.rb

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap off for everything
set nowrap

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" if has("folding")
  " set foldenable
  " set foldmethod=syntax
  " set foldlevel=1
  " set foldnestmax=2
  " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
" endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 
map <Leader>rt :Rake<CR>

map <Leader>a :Ack 
map <Leader>g :Rgrep 
map <Leader>x :%s/\s\+$//<CR>

map <Leader>ii :call g:IDSearchCustom()<CR>
map <Leader>iw :call g:IDSearchCurrentWord()<CR>
map <Leader>ix :!mkid .<CR>

" Leader shortcuts for Fugitive commands
map <Leader>gb :Gblame C<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
nmap <leader>gL :Gitv<cr>
nmap <leader>gl :Gitv!<cr>
vmap <leader>gl :Gitv!<cr>

map <Leader>hb :HGblame<CR>


" Leader shortcuts for Fuf commands
map <Leader>fb :FufBuffer<CR>
map <Leader>ff :FufCoverageFile<CR>
map <Leader>ft :FufTag<CR>
map <Leader>fc :FufChangeList<CR>
map <Leader>fj :FufJumpList<CR>
map <Leader>fm :FufBufferTag<CR>
map <Leader>fk :FufBookmarkFile<CR>
map <Leader>fa :FufBookmarkFileAdd<CR>
map <Leader>fq :FufQuickFix<CR>
map <Leader>fx :!ctags -R *<CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Move lines up and down
map <C-J> :m +1 <CR>
map <C-K> :m -2 <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

imap <C-L> <Space>=><Space>

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Color scheme
" colorscheme vividchalk
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;

let g:fuf_splitPathMatching=1

" Open URL
command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set hidden
set guioptions-=m
set guioptions-=T

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=blue guibg=blue
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set shortmess=atI
let g:miniBufExplMapCTabSwitchBufs = 1

set ofu=syntaxcomplete#Complete
set completeopt+=longest,menuone
:highlight Pmenu guibg=brown gui=bold

au Bufenter *.hs compiler ghc

let g:haddock_browser = "/usr/bin/google-chrome"
let g:ghc = "/usr/bin/ghc"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir = "/usr/share/doc/ghc6-doc/html/"
let g:syntastic_enable_signs=1

:filetype plugin on
:nmap <c-tab> :bnext<cr>
:nmap <c-s-tab> :bprevious<cr>



autocmd BufReadPost fugitive://* set bufhidden=delete

set autowriteall

let g:fuf_patternSeparator = ';'
let g:Gitv_WipeAllOnClose = 1
highlight diffAdded guifg=#00ff00
highlight diffRemoved guifg=#ff0000

let g:rsenseHome = $RSENSE_HOME
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
