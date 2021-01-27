if has('vim_starting')
  set nocompatible
endif
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" カッコを自動とじする機能
Plug 'cohama/lexima.vim'
" HTMLの閉じカッコを自動でしてくれる機能
Plug 'alvan/vim-closetag'
" タグを自動で閉じでくれる　divでCtrl + E + ,を押すと<div></div>になる
Plug 'mattn/emmet-vim'
" typescriptのカラースキーム
" Plug 'leafgarland/typescript-vim'

" kabasawaさんからもらったtypescriptのカラースキーム
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ianks/vim-tsx'

" lsp 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ghifarit53/tokyonight-vim'

Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

set tabstop=4
set number
set nobackup
set noswapfile
set hlsearch
set autoindent
set shiftwidth=4
set smartindent
set completeopt=menuone,noinsert,noselect,preview
set wildmenu " コマンドモードの補完


" if empty(globpath(&rtp, 'autoload/lsp.vim'))
"   finish
" endif
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" vimclosetagの設定
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
noremap ; :
noremap : ;

inoremap <Esc> :jj

let g:user_emmet_leader_key='<C-E>'

" inoremap <silent>  <BS>
inoremap <silent> jj <ESC>
" inoremap <Space>j <ESC>

set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_disable_italic_comment = 0
let g:airline_theme = "tokyonight"
colorscheme tokyonight

nmap <silent> <C-d> <Plug>(coc-definition)

nmap <silent> cca <Plug>(coc-codeaction)

let g:coc_global_extensions = [
      \'coc-json',
      \'coc-flutter',
      \'coc-tsserver',
      \'coc-go',
      \'coc-git',
      \'coc-highlight',
      \'coc-java',
      \'coc-markdownlint',
      \'coc-phpls',
      \'coc-python',
      \'coc-rls',
      \'coc-rust-analyzer',
      \'coc-stylelint',
      \'coc-sql',
      \'coc-vimlsp',
      \'coc-xml',
      \'coc-yaml',
      \'coc-prettier',
      \'coc-html',
      \'coc-solargraph',
      \'coc-prisma',
      \'coc-sh',
      \'coc-yank',
      \'coc-pairs',
      \'coc-css',
      \'coc-calc',
      \'coc-eslint',
      \'coc-json',
      \'coc-prisma',
      \'coc-sh',
      \'coc-sourcekit',
      \'coc-tailwindcss',
      \'coc-vetur',
      \'coc-clangd',
      \'coc-db'
      \]
