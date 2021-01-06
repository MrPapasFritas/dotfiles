" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
" Plug 'ap/vim-css-color'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'iamcco/markdown-preview.vim' " :MarkdownPreview, :MarkdownPreviewStop
call plug#end()
" Remember to Run :PlugClean and :PlugInstall

" NerdTree Config
nnoremap <silent> - :NERDTreeToggle<CR>
" augroup nerdtree_open
"     autocmd!
"     autocmd VimEnter * NERDTree | wincmd p
" augroup END
let g:NERDTreeIgnore = ['^node_modules$', '^_build$']
let g:NERDTreeQuitOnOpen = 1
" Keys Remap to simulate Ranger
let g:NERDTreeMapActivateNode = 'l'
" /NerdTree Config

" COC Config
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"  Use K to show documentation in preview window
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>
" /COC Config

" FZF key bindings
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Basic Stuff
" Numbering
set nu
" Switch buffers without saving
set hidden
set noshowmode
" Enable editing beyond EOL
set virtualedit=all

" vim-unimpaired buffer mappings
nnoremap <silent> { :bprev<cr>
nnoremap <silent> } :bnext<cr>
" Make horizontal scrolling easier
nnoremap <silent> ) 10zl
nnoremap <silent> ( 10zh

" LightLine
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \             ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'MyFugitive'
      \ },
      \ }
function! MyFugitive()
  return exists('*FugitiveHead') ? ' ' . FugitiveHead() : ''
endfunction

"coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"/coc-snippets

" Indenting
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
" /Indenting

set nowrap
" COLORS
" change the ugly omnicompletion menu colors
let base16colorspace=256
colorscheme base16-monokai
" set termguicolors
highlight Pmenu ctermbg=238 gui=bold
" /COLORS

" RClone Sync after save
function Rclone()
  if stridx(expand("%:p"),$DROPBOX_DIR) == 0
    execute('silent !rclone copyto '.fnameescape(expand('%:p')).' dropbox:'.fnameescape(substitute(expand("%:p"),$DROPBOX_DIR,"",""))." &")
  endif
endfunction
autocmd BufWritePost * call Rclone()
