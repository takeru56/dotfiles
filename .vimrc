"let $LANG = "en" " ja: 日本語, en: 英語
"****************************** dein ******************************" 
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')

" begin settings
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 " .toml file
 let g:rc_dir = expand('~/.vim/dein')
 let s:toml = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1}) "起動時に必要でないプラグインは遅延読み込み

 " end settings
 call dein#end()
 call dein#save_state()
endif

" plugin installation check
if dein#check_install()
 call dein#install()
endif

"***************************** 基本設定 *************************************" 
syntax on
colorscheme hybrid
set background=dark
set t_Co=256

noremap <C-j> <esc>
noremap! <C-j> <esc>

set smartindent
set number

set laststatus=2

" 検索周り
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない

" yank to clipboard
set clipboard=unnamed,autoselect

" indent
set expandtab
set tabstop=2
set shiftwidth=2  "インデントの幅を調整
set softtabstop=2

"tab文字,改行文字,スペースを可視化
"set list
"set listchars=tab:»-,trail:- "eol:↲,extends:»,precedes:«,nbsp:%
"hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None "eol, extends, preccedes
"hi SpecialKey ctermbg=NONE ctermfg=darkgrey guibg=NONE guifg=NONE

"***************************** コマンドカスタム *************************************"

":Fish => :bo terminal fish
command Fish :bo terminal fish

"***************************** nerdtree *************************************"
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize=25

"****************************** dein ******************************"
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.cache/dein')

" begin settings
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 " .toml file
 let g:rc_dir = expand('~/.vim/dein')
 let s:toml = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1}) "起動時に必要でないプラグインは遅延読み込み

 " end settings
 call dein#end()
 call dein#save_state()
endif

" plugin installation check
if dein#check_install()
 call dein#install()
endif

"***************************** 基本設定 *************************************"
syntax on
colorscheme hybrid
set background=dark
set t_Co=256

noremap <C-j> <esc>
noremap! <C-j> <esc>

set smartindent
set number

set laststatus=2

" 検索周り
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない

" yank to clipboard
set clipboard=unnamed,autoselect

" indent
set expandtab
set tabstop=2
set shiftwidth=2  "インデントの幅を調整
set softtabstop=2

"tab文字,改行文字,スペースを可視化
"set list
"set listchars=tab:»-,trail:- "eol:↲,extends:»,precedes:«,nbsp:%
"hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None "eol, extends, preccedes
"hi SpecialKey ctermbg=NONE ctermfg=darkgrey guibg=NONE guifg=NONE

nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize=25




