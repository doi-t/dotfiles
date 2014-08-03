"curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh 
"
"release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

 if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 NeoBundle 'Shougo/neosnippet.vim'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'flazz/vim-colorschemes'
 NeoBundle 'vim-scripts/gtags.vim'
 NeoBundle 'git://github.com/Shougo/neocomplcache.git'
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'git://github.com/Shougo/unite.vim.git'
 NeoBundle 'DoxygenToolkit.vim'
 NeoBundle 'plasticboy/vim-markdown'
 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'tyru/open-browser.vim'

 " You can specify revision/branch/tag.
 NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
"NeoBundle 'git://github.com/Shougo/clang_complete.git'
"NeoBundle 'git://github.com/Shougo/echodoc.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"NeoBundle 'git://github.com/Shougo/vim-vcs.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vinarise.git'

"----------------------------------------------------
"vi非互換モード
"----------------------------------------------------
set nocompatible
"----------------------------------------------------
" neocomplcache関係
"----------------------------------------------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_force_overwrite_completefunc=1
" -------------------- QuickRun ----------------------------- "
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
\
\		'outputter': 'browser',
\
\		'markdown/pandoc': {
\			'command': 'pandoc',
\			'exec': '%c --from=markdown --to=html %o %s %a',
\		},
\
\}
"----------------------------------------------------
" ctrlp.vim
"----------------------------------------------------
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

" " Guess vcs root dir
 let g:ctrlp_working_path_mode = 'ra'
" " Open new file in current window
 let g:ctrlp_open_new_file = 'r'
 let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
 let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'
"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
"----------------------------------------------------
" 基本設定、表示関係
"----------------------------------------------------
" マウスを有効にする
set mouse=a
"ウィンドウを最大化して機動
"au GUIEnter * simalt ~x
"クリップボードを有効にする
set clipboard=autoselect
"バックアップを行わない
set nobackup
"Vimの外部で変更があった場合自動的に読み直す
set autoread
"スワップファイルの作成を行わない(スワップは要る,ex.リモート編集時に切断)
"set noswapfile
"タイトルをウインドウ枠に表示する
set title
"行番号を表示する
set number
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on
"カーソル位置の行を強調
set cursorline
" 検索結果文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
"カラースキーマ
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"----------------------------------------------------
"タブ関係
"----------------------------------------------------
"タブ幅の設定
set tabstop=4
set softtabstop=4
set shiftwidth=4
"tabをスペースに
"set expandtab
"自動インデント
set autoindent
"C言語スタイルの自動インデント
set cindent
"インデントはスマートインデント
set smarttab
"上下のカーソル移動を行単位ではなく、表示上の上下にする
nnoremap j gj
nnoremap k gk
"----------------------------------------------------
" 入力関係
"----------------------------------------------------
"im_control
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
let IM_CtrlIBusPython = 1
set timeout timeoutlen=3000 ttimeoutlen=80
"----------------------------------------------------
" ファイルの前回閉じた時の場所を記憶
"----------------------------------------------------
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
"----------------------------------------------------
" 日本語関係
"----------------------------------------------------
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    "UTF-8用の空白文字可視化
    "set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      "EUC-JP用の空白文字可視化
      "set listchars=tab:>-,trail:-,eol:.,extends:>,precedes:<,nbsp:%
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

