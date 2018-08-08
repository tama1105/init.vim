# init.vim
neovim設定ファイル
## 導入

>neovimインストール
```
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```
>dein.vimインストール
```
mkdir -p ~/.cache/dein
cd ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```
>python3でneovimのモジュールインストール
```
pip3 install neovim
```
>補足
init.vim は`.config/nvim/`  
`:UpdateRemotePlugins`を実行するとdeoplateのエラーが治った
