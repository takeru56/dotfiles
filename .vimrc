set t_Co=256

"バックグラウンドカラーをvimとターミナルで同じに
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Comment ctermfg=92 guifg=#008800
autocmd ColorScheme * highlight Visual ctermfg=47

"全角スペースハイライト
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
  
"カラースキームの採用"
"set background=dark
"set termguicolors
colorscheme hybrid 

"=======キーバインド========
"escキーの代用設定
noremap <C-j> <esc>
noremap! <C-j> <esc>
"html補完
let g:user_emmet_leader_key='<c-t>'

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

"{}の補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

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
"コード補完
call dein#add('mattn/emmet-vim')
"call dein#add('Shougo/deoplete.nvim')
"call dein#add('roxma/nvim-yarp')
"call dein#add('roxma/vim-hug-neovim-rpc')
"lacal変数のハイライト
call dein#add('Shougo/neocomplete.vim')
call dein#add('todesking/ruby_hl_lvar.vim')
call dein#add("osyo-manga/vim-monster")
"vimでgitを
call dein#add("tpope/vim-fugitive")
"vim-tags
call dein#add("szw/vim-tags")
"unite.vim
call dein#add('Shougo/unite.vim')

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

let g:deoplete#enable_at_startup = 1

"サーチ系
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない

"NerdTreeのサイドバーは拡張子ごとに色変える
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction
    call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', '76', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', '76', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('rb', '125', 'none', '#d9322c', '#151515')
    call NERDTreeHighlightFile('haml', '178', 'none', '#d9322c', '#151515')
    call NERDTreeHighlightFile('erb', '178', 'none', '#d9322c', '#151515')
    call NERDTreeHighlightFile('slim', '178', 'none', '#d9322c', '#151515')

let s:neco_dicts_dir = '/path/to/any/dir/for/dicts'
if isdirectory(s:neco_dicts_dir)
  let g:neocomplete#sources#dictionary#dictionaries = {
  \   'ruby': s:neco_dicts_dir . '/ruby.dict',
  \   'javascript': s:neco_dicts_dir . '/jquery.dict',
  \ }
endif

