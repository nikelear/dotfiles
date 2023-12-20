" 新しい行のインデントを現在の行と同じインデントにする
set autoindent
" vi互換を切る
set nocompatible
" タブの代わりに空白文字を挿入する
set expandtab
" インクリメンタルサーチを行う
set incsearch
" 行番号を表示する
set number
" 行番号を現在の行からの相対的な番号にする
set relativenumber
" 対応する括弧を表示する
set showmatch
" 検索時に大文字を含んでいたら大文字/小文字を区別する
set smartcase
" マウスを有効にする
set mouse=a
" シフト移動幅
set shiftwidth=2
" タブの空白数
set tabstop=2

" 文字化け対策
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

" 行番号のカラーを変更
highlight LineNr ctermfg=DarkGray
