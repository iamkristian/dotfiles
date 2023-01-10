""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup pathogen, and colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" Allow unsaved buffers and undo marks for them
set tabstop=2 shiftwidth=2
set cursorline cursorcolumn
set expandtab
set backspace=indent,eol,start
set autoindent
set incsearch
set hlsearch
set ignorecase smartcase
set showmatch
set vb t_vb=
set ruler
set number
set winwidth=79
set cc=79
set virtualedit=all
set laststatus=2
set shell=zsh
filetype plugin indent on
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
" Clear all autocmds in the group
autocmd!
autocmd FileType text setlocal textwidth=78
" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,liquid,haml,eruby,ex,exs,yaml,sass,cucumber,html,php,javascript,sieve set ai sw=2 sts=2 et
" Leave the return key alone when in command line windows, since it's used
" to run commands there.
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()
augroup END

augroup sparkup_types
  autocmd!
  autocmd FileType html,erb,liquid,php,eruby runtime! ftplugin/html/sparkup.vim
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=.tags,.gemtags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
if has("gui_running")
  set guioptions-=T
  set scrolloff=10
  set background=dark
  colorscheme mysolarized
else
  let g:solarized_termtrans=1
  let g:solarized_termcolors=16 " This will fix the too bright background
  set t_Co=16
  set scrolloff=10
  set background=dark
  colorscheme mysolarized
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc cmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed
imap <c-l> <space>=><space>
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
:nnoremap <CR> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set default file encoding and file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set ffs=unix,mac,dos

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
if MySys() == "windows"
set undodir=C:\Windows\Temp
else
set undodir=~/.vim_runtime/undodir
endif
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rubocop
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrubocop_config = '~/.rubocop.yml'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimdiff options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffopt=iwhite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-p mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/.git/*,*/tmp/*,*/vendor/*,*/target/*,*/node_modules/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_switch_buffer=2
let g:ctrlp_open_new_file='t'
let g:ctrlp_open_multiple_files='t'
let g:ctrlp_max_height=10
let g:ctrlp_max_files = 20000
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
let g:ctrlp_follow_symlinks = 1
"let g:ctrlp_working_path_mode = 2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Surround mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:surround_45 = "<% \r %>"  " -
let g:surround_61 = "<%= \r %>" " =
let g:surround_113 = "#{\r}"    " v
let g:surround_35  = "#{\r}"    " #

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extra whitespaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre *.ex,*.liquid,*.eex,*.exs,*.rb,*.js,*.erb,*.scss,*.css,*.md,*.vim,*.xml,*.php,*.html,*.ejs,*.rake,*.adoc,*.sieve %s/\s\+$//e
autocmd BufNewFile,BufRead *.ejs set filetype=html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>s :vsplit %%
map <leader>e :tabe %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>vp :VimuxPromptCommand<CR>
map <Leader>a :call VimuxRunCommand("time bundle exec rspec --fail-fast -c spec "))<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format json
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>j :%!python -m json.tool<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit .vimrc on F10
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F10> :tabe ~/.vimrc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND TARGETS AND FILES
" Thanks Gary Bernhart
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bundle exec rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gc :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>gh :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>gp :CtrlPClearCache<cr>\|:CtrlP public<cr>
map <leader>gs :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>ga :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>
map <leader>f :CtrlP<cr>
map <leader>F :CtrlP %%<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is done nicely by turbux
let g:turbux_command_prefix = 'time'
let g:turbux_command_rspec  = 'rspec --fail-fast -c'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_install_global = 1
autocmd FileType html,css,tsx EmmetInstall
"let g:user_emmet_leader_key=','
let g:tagalong_verbose = 1
let g:user_emmet_mode='a'
