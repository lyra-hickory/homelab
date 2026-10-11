" ---- Plugins ----
call plug#begin()
Plug 'yegappan/lsp'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

" ---- Basics ----
syntax on
filetype plugin indent on
set number relativenumber
set mouse=a
set signcolumn=yes
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set cindent
set background=dark
colorscheme gruvbox
let mapleader = ' '

" ---- clangd ----
let lspServers = [#{
  \ name: 'clangd',
  \ filetype: ['c', 'cpp'],
  \ path: '/usr/bin/clangd',
  \ args: ['--background-index']
  \ }]
autocmd User LspSetup call LspAddServer(lspServers)
autocmd User LspSetup call LspOptionsSet(#{autoHighlightDiags: v:true})

" ---- Keymaps ----
nnoremap gd :LspGotoDefinition<CR>
nnoremap K  :LspHover<CR>
nnoremap <leader>f :LspFormat<CR>
nnoremap ]d :LspDiag next<CR>
nnoremap [d :LspDiag prev<CR>

" ---- Format on save ----
autocmd BufWritePre *.c,*.h silent! LspFormat

" ---- File tree and search ----
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>p :Files<CR>
let g:rooter_patterns = ['.git', 'compile_flags.txt', 'Makefile']
let g:NERDTreeWinSize = 40
let g:NERDTreeShowHidden = 1

" ---- Debugger ----
packadd termdebug
let g:termdebug_wide = 163
nnoremap <F5>  :Continue<CR>
nnoremap <F9>  :Break<CR>
nnoremap <F10> :Over<CR>
nnoremap <F11> :Step<CR>
nnoremap <leader>de :Evaluate<CR>

" ---- Search configs ----
set incsearch    " highlight matches as you type
set hlsearch     " keep matches highlighted
set ignorecase   " /foo matches Foo and foo...
set smartcase    " ...unless you type a capital, then it's exact
nnoremap <leader>h :nohlsearch<CR>

" ---- Terminal ----
set hidden

let g:term_buf = -1
function! ToggleTerm() abort
  let winid = bufwinid(g:term_buf)
  if g:term_buf > 0 && winid != -1
    call win_execute(winid, 'hide')
  elseif g:term_buf > 0 && bufexists(g:term_buf)
    botright 12split
    execute 'buffer' g:term_buf
  else
    botright terminal ++rows=12
    let g:term_buf = bufnr('%')
  endif
endfunction

nnoremap <leader>t :call ToggleTerm()<CR>
tnoremap <C-\>t <C-\><C-n>:call ToggleTerm()<CR>

