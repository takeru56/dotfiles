"基本設定
set encoding=utf-8
scriptencoding utf-8
set t_Co=256

"バックグラウンドカラーをvimとターミナルで同じに
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Comment ctermfg=92 guifg=#008800
autocmd ColorScheme * highlight Visual ctermfg=47

"全角スペースハイライト
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/

set list
set listchars=tab:\|\ 
hi SpecialKey guifg=#333333
  
"カラースキームの採用"
colorscheme hybrid 

set clipboard=unnamed,autoselect
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
let g:indent_guides_enable_on_vim_startup = 1

"画面に関する設定
set number
set showmatch  

"スワップファイルを作成しない
set nobackup
set noswapfile

"%で対応するカッコへジャンプ
set showmatch
source $VIMRUNTIME/macros/matchit.vim

"行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"クリップボードからペーストする時の自動インデントを防ぐ
if &term =~ "xterm"
 let &t_SI .= "\e[?2004h"
 let &t_EI .= "\e[?2004l"
 let &pastetoggle = "\e[201~"

 function XTermPasteBegin(ret)
     set paste
     return a:ret
 endfunction

 inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"<----------------------------------パッケージ管理
if &compatible
set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.vim/dein'))
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
"lacal変数のハイライト
call dein#add('Shougo/neocomplete.vim')
" call dein#add('Shougo/neocomplcache')
call dein#add('todesking/ruby_hl_lvar.vim')
"call dein#add("osyo-manga/vim-monster")
"vimでgitを
call dein#add("tpope/vim-fugitive")
"vim-tags
call dein#add("szw/vim-tags")
"unite.vim
call dein#add('Shougo/unite.vim')
"カラーコードプレビュー
call dein#add('gorodinskiy/vim-coloresque')
"複数選択変種を可能に
call dein#add('terryma/vim-multiple-cursors')
"ステータスラインを美く
call dein#add('itchyny/lightline.vim')
"coffeescriptをハイライト
call dein#add('kchmck/vim-coffee-script')
"vimでジャバスクリプト
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
"選択してctr+kでコメントアウト
call dein#add("tyru/caw.vim.git")
"インデントラインを表示する
call dein#add("nathanaelkane/vim-indent-guides")
"検索
call dein#add("ctrlpvim/ctrlp.vim")
"カッコの補完
call dein#add("cohama/lexima.vim")
"差分を左側に表示する
call dein#add("airblade/vim-gitgutter")
"vimでRiot.jsのsyntaxをする
call dein#add("ryym/vim-riot")

"---------------------------------------------->>>
call dein#end()
call dein#save_state()
endif
filetype plugin indent on
"ここまでパッケージ管理--------------------------->
"記述後は、:call dein#install()で実行 


"ここじゃないと反応しなかった
syntax on

let g:jsx_ext_required = 0

"NerdTreeのせっていやらなんやら
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeWinSize=25

"local変数のハイライトに関する設定
let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'
let g:ruby_hl_lvar_auto_enable = 0

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

"自動補完に関する設定-------------------------------------->>>>
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"自動補完で用いるsense用の設定----------------------------->>>

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("/Users/takeru/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1


nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

"vim-indent-guidesの設定
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=darkgreen
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']


" かっこ補完==========================>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
"カッコ補完===========================>
