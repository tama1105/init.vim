"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/tomato/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/tomato/.cache/dein')
  call dein#begin('/home/tomato/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/tomato/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  "ファイルの一覧表示
  call dein#add('scrooloose/nerdtree')
  "emmet
  call dein#add('mattn/emmet-vim')
  "カラースキーム
  call dein#add('tomasr/molokai')
  "ステータスラインの強化
  call dein#add('itchyny/lightline.vim')
  "indent
  call dein#add('Yggdroot/indentLine')
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })
  "コード補完
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hag-neovim-rpc')
  endif
  " スニペットの補完機能
"  call dein#add("Shougo/neosnippet")
    " スニペット集
"  call dein#add('Shougo/neosnippet-snippets')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
	if !has('nvim')
        	set ttymouse=sgr
	endif
    elseif v:version > 703 || v:version is 703 && has('patch632')
	if !has('nvim')
        set ttymouse=sgr
	endif
    else
        if !has('nvim')
            set ttymouse=xterm2
        endif
    endif
endif
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

"plugin関連
"ctrl+tでファイル一覧表示
nnoremap <silent><C-t> :NERDTreeToggle<CR>
"ctrl + e + , => emmet
let g:user_emmet_leader_key='<c-e>'
" カラースキームmolokai
colorscheme molokai " カラースキームにmolokaiを設定する
set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける
"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
let g:python3_host_prog  = '/usr/bin/python3'
    " Vim起動時にneocompleteを有効にする
    let g:deoplete#enable_at_startup = 1
    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
    let g:deoplete#enable_smart_case = 1
    " 3文字以上の単語に対して補完を有効にする
    let g:deoplete#min_keyword_length = 3
    " 区切り文字まで補完する
    let g:deoplete#enable_auto_delimiter = 1
    " 1文字目の入力から補完のポップアップを表示
    let g:deoplete#auto_completion_start_length = 1
    " バックスペースで補完のポップアップを閉じる
    inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"

    " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"


"End dein Scripts-------------------------

