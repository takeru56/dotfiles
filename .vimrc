"syntax関連の設定
set t_Co=256

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

"画面に関する設定
set cursorline
set number


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
call dein#add('todesking/ruby_hl_lvar.vim')
"---------------------------------------------->>>
call dein#end()
"ここまでパッケージ管理--------->
"記述後は、:call dein#install()で実行 


"ここじゃないと反応しなかった
syntax on

"NerdTreeのせっていやらなんやら
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd VimEnter * execute 'NERDTree'

"local変数のハイライトに関する設定
let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'
let g:ruby_hl_lvar_auto_enable = 0

