" install vim-plug
" https://github.com/junegunn/vim-plug?tab=readme-ov-file

call plug#begin()

" LSP
" vim-lsp で出来ることをざっくりみれる記事
" https://qiita.com/kitagry/items/216c2cf0066ff046d200
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" auto complate
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" カーソルが当たっている単語をハイライトする
Plug 'dominikduda/vim_current_word'

call plug#end()

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
set incsearch

filetype plugin indent on 

syntax on

nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
noremap ; :
noremap : ;

inoremap <silent> jj <ESC>

" C-] のときに LSP の定義ジャンプを実行し、結果に not uspported が含まれていれば vim のタグジャンプを実行する
" 定義ジャンプとタグジャンプを共存させるために導入
nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"

" ステータスラインにファイル名を出力
" 定義ジャンプの際にどこにいるか分からんため
set statusline=%F
" ステータスラインを常に表示(0: 表示しない、1: 2つ以上ウィンドウがある時だけ表示)
set laststatus=2
" ステータスラインのこれ以降は右寄せ表示
set statusline+=%=
" 現在行数/全行数
set statusline+=[LOW=%l/%L]

" vim-lsp で出たエラー内容をファイルに出力する
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
