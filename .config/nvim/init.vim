" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-polyglot'
Plug 'Soares/base16.nvim'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
" Remember to Run :PlugInstall

" NerdTree Config
nnoremap <silent> - :NERDTreeToggle<CR>
augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END
let g:NERDTreeIgnore = ['^node_modules$', '^_build$']
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
" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" /COC Config

" FZF key bindings
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

" Basic Stuff
set nu

" vim-unimpaired buffer mappings
nnoremap { :bprev<cr>
nnoremap } :bnext<cr>

" Indenting
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
" /Indenting

set nowrap
" COLORS
colorscheme monokai
" change the ugly omnicompletion menu colors
highlight Pmenu ctermbg=238 gui=bold
" /COLORS

" RClone Sync after save
function Rclone()
  if stridx(expand("%:p"),$DROPBOX_DIR) == 0
    execute('silent !rclone copyto '.fnameescape(expand('%:p')).' dropbox:'.fnameescape(substitute(expand("%:p"),$DROPBOX_DIR,"",""))." &")
  endif
endfunction
autocmd BufWritePost * call Rclone()
