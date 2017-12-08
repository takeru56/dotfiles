"syntax関連の設定
set t_Co=256

"バックグラウンドカラーをvimとターミナルで同じに
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Comment ctermfg=125 guifg=#008800
autocmd ColorScheme * highlight Visual ctermfg=47
  
"カラースキームの採用"
set background=dark
colorscheme hybrid 

"escキーの代用設定
noremap <C-j> <esc>
noremap! <C-j> <esc>

"メインはRubyなのでインデント幅を2で設定
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent

"画面に関する設定
set cursorline
set number
set cursorcolumn

"スワップファイルを作成しない
set nobackup

"<-----------------パッケージ管理
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein'))
"---------------------------------------------->>>
">NerdTree
call dein#add('scrooloose/nerdtree')
">vim-rails
call dein#add('tpope/vim-rails')
">vim-ruby
call dein#add('vim-ruby/vim-ruby')
">endの補完
call dein#add('tpope/vim-endwise')
">lacal変数のハイライト
call dein#add('Shougo/neocomplete.vim')
call dein#add('todesking/ruby_hl_lvar.vim')
call dein#add("osyo-manga/vim-monster")

"---------------------------------------------->>>
call dein#end()
"ここまでパッケージ管理--------->
"記述後は、:call dein#install()で実行 


"ここじゃないと反応しなかった
syntax on

"NerdTreeのせっていやらなんやら
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"local変数のハイライトに関する設定
let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'
let g:ruby_hl_lvar_auto_enable = 0

"スペース、タブの可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
set list listchars=tab:\▸\-

"サーチ系
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない

