" RClone Sync after save
function Rclone()
  if stridx(expand("%:p"),$DROPBOX_DIR) == 0
    execute('silent !rclone copyto '.fnameescape(expand('%:p')).' dropbox:'.fnameescape(substitute(expand("%:p"),$DROPBOX_DIR,"",""))." &")
  endif
endfunction
autocmd BufWritePost * call Rclone()
"
"--- Vundle ---
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'ap/vim-buftabline'
Plugin 'sheerun/vim-polyglot'
" Plugin 'neoclide/coc.nvim'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'ap/vim-css-color'
" RUN :PluginInstall at the end!

call vundle#end()
filetype plugin indent on

" Forget being compatible with good ol' vi
set nocompatible

" generate helptags for everything in 'runtimepath'
" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

"Write the old file out when switching between files.
set autowrite

" Why is this not a default
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Set path to current project folder, for finding files
set path+=**

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" vim-unimpaired buffer mappings
nnoremap { :bprev<cr>
nnoremap } :bnext<cr>
" Close buffer without closing window
command Bd bd | vs | bnext

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>


" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set vb
set t_vb=

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

set guioptions=acg

set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

" Search stuff
set wrapscan
set nowrap
set incsearch
set hlsearch
set ignorecase
set smartcase

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Prefer relative line numbering?
"set relativenumber"

"Indent stuff
set smartindent
set autoindent

"Prefer a slightly higher line height
set linespace=3

"Enable code folding
set foldenable

" Set netrw defaults
" Remove  banner
let g:netrw_banner = 0
" Remove  banner
let g:netrw_liststyle = 3
" Open files in previous window
let g:netrw_browse_split = 4
" Set default width
let g:netrw_winsize = 25
" Open on Vim open?
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Maybe use ranger?
let g:ranger_map_keys = 0
nmap - :Ranger<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Make horizontal scrolling easier
nmap <silent> <C-o> 10zl
nmap <silent> <C-i> 10zh
" Select line
vmap il <esc>^v$
" Alright... let's try this out
imap jj <esc>
cmap jj <esc>

" COLORS
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set t_Co=256
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
if has("gui_running")
  colorscheme desert
endif
set guifont=DejaVu\ Sans\ Mono\ 10


"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle /var/www<CR>
au FocusLost * silent! :wa
" disables opaque background                                                
hi Normal ctermbg=none
hi NonText ctermbg=none
" Powerline
set  rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim/

