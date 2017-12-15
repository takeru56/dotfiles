"nvim基本設定
"set t_Co=256

"バックグラウンドカラーをvimと>    ターミナルで同じに
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Comment ctermfg=92 guifg=#0088    00
autocmd ColorScheme * highlight Visual ctermfg=47

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

"<<<------パッケージ管理--------------------------------------
let s:dein_path=expand('~/.vim/dein')

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)
  call dein#add('Shougo/dein.vim')
"<<<===========================================================
"カラースキーム
call dein#add('junegunn/seoul256.vim')
"vim-ruby
call dein#add('vim-ruby/vim-ruby')
"nerd-tree
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-endwise')
"コード補完
call dein#add('Shougo/deoplete.nvim')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
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

"============================================================>>>
call dein#end()
call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"--ここまでパッケージ管理----------------------------------->>>

"ここじゃないと反応しなかった
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
colorscheme seoul256

"NerdTreeのせっていやらなんやら
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"local変数のハイライトに関する設定
let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'
let g:ruby_hl_lvar_auto_enable = 0

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
