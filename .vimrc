" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect
set nocompatible

" ========== General Config ==========

set number                        " show line numbers
set backspace=indent,eol,start    " allow backspace in insert mode
set history=1000                  " store lots of :cmdline history
set showcmd                       " show incomplete cmds down from the bottom
set nobackup                      " do not create backup files
set nowritebackup
set showmode                      " show current mode on the bottom
set novisualbell                  " no sounds
set autoread                      " reload files changed outside vim
set encoding=utf-8                " set the default encoding to utf-8
set autochdir                     " pwd is always the file edited
set laststatus=2                  " always display the status line
set hidden                        " hides buffers instead of closes them
set ruler                         " show the cursor position at all times
set fileformats=unix,dos,mac      " prefer unix over windows over os9 formats

" turn on syntax highlighting
syntax on

" ========== Install Plugins ==========
filetype off

call plug#begin()

Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/syntastic'
Plug 'cakebaker/scss-syntax.vim'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plug 'elzr/vim-json'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-buftabline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gevans/vim-ginkgo'
Plug 'zhaocai/GoldenView.Vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'zchee/deoplete-go'
Plug 'Shougo/deoplete.nvim'
Plug 'mhinz/vim-sayonara'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'moorereason/vim-markdownfmt'
Plug 'hynek/vim-python-pep8-indent'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-scripts/c.vim'
Plug 'w0rp/ale'
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'delphinus/vim-firestore'
Plug 'amadeus/vim-mjml'

call plug#end()

" ========== Indentation ==========

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set textwidth=80
set colorcolumn=-1
set linebreak
set wrap

" ========== Completion ==========

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~,*.exe,*.dll,*.manifest
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.jpeg
set wildignore+=*.hg,*.git,*.svn
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=go/pkg
set wildignore+=go/bin
set wildignore+=*.pyc
set wildignore+=*.orig

" ========== Search ==========

set noshowmatch
set noshowmode
set incsearch
set hlsearch
set ignorecase
set smartcase

" ========== Split windows ==========

set splitright    " split vertical windows to the right of the current window
set splitbelow    " split horizontal windows below the current window

" split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ========== Filetypes ==========

au BufNewFile,BufRead *.vim setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json,*.avsc setlocal expandtab ts=2 sw=2

augroup filetypedetect
  au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  au BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  au BufNewFile,BufRead .env.* setf sh
augroup END

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" js indent
autocmd BufNewFile,BufRead *.js setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

" ========== Plugin Configs ==========
" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  CtrlPBufTag
endfunc
command! MyCtrlPTag call MyCtrlPTag()

nmap <C-g> :MyCtrlPTag<cr>
imap <C-g> <esc>:MyCtrlPTag<cr>

" ==================== Ale ====================
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype vue setlocal ts=2 sw=2 sts=0 expandtab

" ==================== Vim-go ====================
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['errcheck']
let g:go_metalinter_command = 'go build'
let g:go_list_type = "quickfix"
let g:go_oracle_tags="daemon unit integration"
let g:syntastic_javascript_checkers = ['jshint']

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)

au FileType go nmap <leader>r  <Plug>(go-run)

au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>dt  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)

au FileType go nmap <Leader>e <Plug>(go-rename)

" neovim specific
if has('nvim')
  au FileType go nmap <leader>rt <Plug>(go-run-tab)
  au FileType go nmap <Leader>rs <Plug>(go-run-split)
  au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
endif

" I like these more!
augroup go
  autocmd!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
  let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
  let g:deoplete#sources#go#align_class = 1


  " Use partial fuzzy matches like YouCompleteMe
  call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
  call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
  call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])
endif

" ==================== GoldenView ====================
let g:goldenview__enable_default_mapping = 0
autocmd filetype * :EnableGoldenViewAutoResize


" ==================== Lightline ====================
"
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified', 'ctrlpmark' ],
      \             [ 'go'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'go'] ],
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'percent': 'LightLinePercent',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'go': 'LightLineGo',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ }

let g:lightline.colorscheme = 'gruvbox'


function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  " return ''
  return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

" =================== syntastic =====================
let g:syntastic_go_checkers = ['goerrcheck', 'golint','errcheck', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" ==================== c-vim ========================
let  g:C_UseTool_cmake    = 'yes'
let  g:C_UseTool_doxygen = 'yes'

" ========== Etc. ==========

" allow saving as sudo
cmap w!! w !sudo tee > dev/null %

" Map omega to alt-z
inoremap <C-S-z> Ω

" Remove search highlight
nnoremap <silent> <leader><space> :noh<CR>

