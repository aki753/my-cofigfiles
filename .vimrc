set number
set nobackup
set noswapfile
set hlsearch
set autoindent
set smartindent
set completeopt=menuone,noinsert,noselect,preview
set wildmenu " コマンドモードの補完
set clipboard+=unnamed

set expandtab
set tabstop=2
set shiftwidth=2
set helplang=ja,en
set cursorline

nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
noremap ; :
noremap : ;

inoremap <silent> jj <ESC>
