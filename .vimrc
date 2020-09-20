
"****************************** プラグイン管理 ******************************"
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

" キーマップ
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

" インデント周り
set expandtab
set tabstop=2
set shiftwidth=2  "インデントの幅を調整
set softtabstop=2
set autoindent

"***************************** プラグイン設定 *************************************"
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

 call NERDTreeHighlightFile('sh', 'green', 'none', 'green', '#151515')
 call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
 call NERDTreeHighlightFile('go', 'blue', 'none', '#3366FF', '#151515')
 call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
 call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
 call NERDTreeHighlightFile('md', 'yellow', 'none', 'yellow', '#151515')
 call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
 call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
 call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
 call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
 call NERDTreeHighlightFile('coffee', '76', 'none', 'red', '#151515')
 call NERDTreeHighlightFile('js', '76', 'none', '#ffa500', '#151515')
 call NERDTreeHighlightFile('rb', '125', 'none', '#d9322c', '#151515')
 call NERDTreeHighlightFile('haml', '178', 'none', '#d9322c', '#151515')
 call NERDTreeHighlightFile('erb', '178', 'none', '#d9322c', '#151515')
 call NERDTreeHighlightFile('c', '178', 'none', '#d9322c', '#151515')
