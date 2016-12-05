" =====================================
" Vim Plug
" =====================================
"
call plug#begin('~/.vim/plugged')
"
" Colorscheme pack
  Plug 'noah/vim256-color'
" Commentary (toggle comments with gcc)
  Plug 'tpope/vim-commentary'
" Lightline (statusline/tabline)
  Plug 'itchyny/lightline.vim'
" CSS3 Syntax Support
  Plug 'hail2u/vim-css3-syntax'
" L9 Library (Dependency for Autocomplpop)
  Plug 'eparreno/vim-l9'
" Auto pop up completion suggestions
  Plug 'othree/vim-autocomplpop'
" DelimitMate (Auto-completion for quotes, parens, brackets etc.)
  Plug 'Raimondi/delimitMate'
" Vim Snippets
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'honza/vim-snippets'
"
call plug#end()
" =====================================
" End Vim Plug
" =====================================





" =====================================
" General
" =====================================
  " Set leader key
    let mapleader = "\<Space>"
  " Set leader key + w to save
    nnoremap <Leader>w :w<CR>
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
  " Enable 256 color support
    set term=xterm-256color
" =====================================
" End General
" =====================================



" =====================================
" Plug in settings & customization
" =====================================
"
" Omnicomplete
" =====================================
  filetype plugin on
  set omnifunc=syntaxcomplete#Complete

" Lightline
" =====================================
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


" Colorscheme Settings
" =====================================
  hi MatchParen cterm=bold ctermbg=none  ctermfg=magenta
  set background=dark
  colorscheme railscasts
  highlight LineNr ctermfg=238
  highlight Statement ctermfg=203

" Other
" =====================================
  " Cycle through suggestions with tab
  inoremap <expr> <S-TAB> ((pumvisible())?("\<C-n>"):("j"))
  " Open files
  map <Leader>e :tabedit <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
  map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
  map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
  " AutoExpand brackets and alike (delimitMate)
  let delimitMate_expand_cr = 1
  " Set timeout to avoid delay on e.g 'O'
  :set timeout timeoutlen=3000 ttimeoutlen=100
  " Deactivate auto commention if opening new line from commented line
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" =====================================
" End Plug in settings & customization
" =====================================


" =====================================
" Experimental
" =====================================


" =====================================
" End Experimental
" =====================================