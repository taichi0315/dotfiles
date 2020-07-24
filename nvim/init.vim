" Color scheme
set background=dark
colorscheme hybrid

" Standard config
set clipboard+=unnamed    " クリップボード連携
set cursorline            " カーソル行にラインを表示
set expandtab             " タブ入力を複数の空白入力に置き換える
set mouse=a               " 全てのモードでマウス操作を有効化
set shiftwidth=2          " インデント幅を指定
set showmatch matchtime=1 " 対応する括弧をハイライト
set smartindent           " 改行時のインデントを自動化
set tabstop=2             " タブ幅を指定
set updatetime=250        " ファイルの読み込み更新頻度
set number                " 行番号を表示
set ignorecase            " 大文字小文字を区別しない
set smartcase             " 大文字検索時、大文字小文字を区別する
set wrapscan              " 検索結果が最後までいったら最初に戻る
set fileencoding=utf-8    " ファイル書き込み時の文字コードをutf-8にする
set nobackup              " ファイル変更後に保存されるバックアップの~ファイルを作成しない
set noswapfile            " ファイル編集中に保存されるバックアップの.swpファイルを作成しない
set scrolloff=30          " スクロールをした際にカーソルも移動する

" For ESC key mapping
inoremap <silent> jj <ESC>

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Add plugIn by dein
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')

  " Syntax highlight of Languages
  call dein#add('derekwyatt/vim-scala')       " Scala
  call dein#add('gre/play2vim')               " Play
  call dein#add('leafgarland/typescript-vim') " Typescript
  call dein#add('fatih/vim-go')               " Go
  call dein#add('digitaltoad/vim-pug')        " Pug

  " vim-airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " fzf
  call dein#add('junegunn/fzf', {'build': './install --all'})
  call dein#add('junegunn/fzf.vim')

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
