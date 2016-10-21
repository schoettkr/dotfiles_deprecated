" =====================================
" Vim Plug
" =====================================
"
call plug#begin('~/.vim/plugged')
"
" Single quotes for packages to load!
"
" Nerdtree (treelike filesystem explorer)
  Plug 'scrooloose/nerdtree'
" 
" Commentary (toggle comments with gcc)
  Plug 'tpope/vim-commentary'
"
" Lightline (statusline/tabline)
  Plug 'itchyny/lightline.vim'
"
" Polyglot (collection of language packs)
  Plug 'sheerun/vim-polyglot'
"
" CSS3 Syntax Support
  Plug 'hail2u/vim-css3-syntax'
"
" Multiple cursors (insert cursor at next occurence of selected word with ctrl+n)
  Plug 'terryma/vim-multiple-cursors'
"
" Indent Guides (toggle with <Leader>ig)
  " Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Yggdroot/indentLine'
"
" Vim Completes Me (Auto-completion)
  " Plug 'ajh17/VimCompletesMe'
  " Plug 'Valloric/YouCompleteMe'
" L9 Library (Dependency for Autocomplpop)
  Plug 'eparreno/vim-l9'
" Auto pop up completion suggestions
  Plug 'othree/vim-autocomplpop'

" Vim Snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'

if $TERM == "xterm-256color"
    set t_Co=256
  endif

  " colorscheme base16-material-dark
  " set background=dark

" Improve JS Omnicomplete
  " Plug '1995eaton/vim-better-javascript-completion'

" Improved JS Highlighting 
  " Plug 'othree/yajs.vim'
  " Plug 'jelera/vim-javascript-syntax'
  " Plug 'pangloss/vim-javascript' ==== Didnt notice any change

" Theme
  " Plug 'kristijanhusak/vim-hybrid-material'
" DelimitMate (Auto-completion for quotes, parens, brackets etc.)
  Plug 'Raimondi/delimitMate'

" Syntastic (Syntax checking for various languages)
  " Plug 'scrooloose/syntastic'
"
"
"
"
"
call plug#end()
" =====================================
" End Vim Plug
" =====================================



" General
  " Set leader key
    let mapleader = "\<Space>"
  " Set leader key + w to save
    nnoremap <Leader>w :w<CR>
  " Show line numbers
  " set number
  " Show relative line numbers
    set relativenumber
  " Auto-indent new lines
    set autoindent
  " Use spaces instead of tabs
    set expandtab
  " Number of auto-indent spaces
    set shiftwidth=2
  " Enable smart-indent
    set smartindent 
  " Enable smart-tabs
    set smarttab
  " Number of spaces per tab
    set softtabstop=2
  " Highlight all search results
    set hlsearch
  " Enable smart-case search
    set smartcase
  " Always case-insensitive
    set ignorecase
  " Search while typing
    set incsearch
  " Set columns and color for last column
    " set textwidth=100
    " set colorcolumn=100
  " Highlights all characters after a certain column (115th)
    " augroup vimrc_autocmds
    "   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
    "   autocmd BufEnter * match OverLength /\%115v.*/
    "  augroup END
    "  highlight MatchParen ctermfg=red

" End General

" Omnicomplete
  filetype plugin on
  set omnifunc=syntaxcomplete#Complete


" =====================================
" Plug in settings & customization
" =====================================
"
" =====================================
" Nerdtree
"
" 2x ctrl-w  to change windows
"
" Open nerdtree automatically on vim startup with cursor in other window
  autocmd vimenter * NERDTree
  autocmd vimenter * wincmd p
" Close vim if the only window left open is nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle nerdtree
  map <F7> :NERDTreeToggle<CR>
" Open Nerdtree on rightside
  " let g:NERDTreeWinPos = "right"
" Use relative line numbers
  autocmd FileType nerdtree set relativenumber
  
" End Nerdtree
" =====================================
"
" =====================================
" Lightline
"
" to see the cool statuslines
  set laststatus=2
  if !has('gui_running')
      set t_Co=256
    endif
" to see the cool fonts
  let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
" get rid of default vim mode information
  set noshowmode
" make backgroundcolor of statusline match terminal
  let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
  let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let s:palette.inactive.middle = s:palette.normal.middle
  let s:palette.tabline.middle = s:palette.normal.middle

" End Lightline
" =====================================
"
" =====================================
" Indent Guides
"
  " Disable Indent Guides by default
  let g:indentLine_enabled = 0
  " Set Leaderkey+ig to toggle Indent Guides
  :nmap <Leader>ig  :IndentLinesToggle<CR>
"
" End Indent Guides
" =====================================


" =====================================
" VIM Theme
  " set t_Co=256
  " let g:hybrid_custom_term_colors = 1
  " colorscheme hybrid
  " set background=dark

inoremap <expr> <S-TAB> ((pumvisible())?("\<C-n>"):("j"))

hi MatchParen cterm=bold ctermbg=none  ctermfg=magenta
