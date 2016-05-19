" OMIEND .vimrc
if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'orthecreedence/void.vim'
NeoBundle 'ap/vim-css-color'

NeoBundle 'bling/vim-airline.git'

let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    " Use pt in unite grep source.
    " https://github.com/monochromegane/the_platinum_searcher
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    " Use ack in unite grep source.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts =
    \ '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
    " For jvgrep.
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts =
    \ '-i --exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
endif

call neobundle#end()


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ============================================================
" ===
" ============================================================
colorscheme void

set laststatus=2

" シンタックスハイライトを有効化
syntax on

" yank（コピー）した内容をクリップボードに共有
set clipboard=unnamed

" 検索内容をハイライト
set hlsearch

" 検索で大小文字の違いを無視
set ignorecase

" タブ入力を2つの半角スペースに
set expandtab
set tabstop=2
set shiftwidth=2

" 改行時の自動インデント有効化
set autoindent

" インクリメンタルサーチの有効化
set incsearch

" 行番号の表示
set number

nnoremap <silent> UF :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> Uf :<C-u>Unite file_rec/git<CR>
nnoremap <silent> Ub :<C-u>Unite buffer<CR>
nnoremap <silent> Um :<C-u>Unite file_mru<CR>
nnoremap <silent> Ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> Ur :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> Ut :<C-u>Unite tab<CR>

" ============================================================
" === 
" ============================================================
command! -nargs=0 CPView set nolist nonumber 
command! -nargs=0 DevView set list number

command! -nargs=0 Scratch new | setlocal bt=nofile noswf | let b:cmdex_scratch = 1


