# chef_cookbook_php56
Chef Cookbooks for php application server with nginx, php5.6, cakePHP3, MariaDB10.0

Windowsでの実施
---------------
- Rubyが入っていないことを確認する。入っている場合、vagrantやchefの内包rubyと競合しやすいので動作保障しない。
- VirtualBoxをインストールする（バージョン問わず）
- vagrantをインストールする（保障バージョンは1.7.2）
- chefDKをインストールする（保障バージョンは0.6.x）
- linux系のターミナルを用意する。(cmderのcmdバージョンで起動するのがお勧め)
- rubyのwindows-31J問題を避けるために環境変数を作成しておく
-- 変数名：RUBYOPT
-- 値:-EUTF-8
- VirtualBoxを立ち上げてみて適当なOSの選択肢を出してみて、64bitの選択肢が出るかどうか調べる。選択肢に64bitが出てこない場合、ファームウェアレベルで仮想化機構が無効になっているので有効化する必要がある。biosで仮想化機構を有効化する。さらにWindows8の場合、Hyper-Vを無効化しておかないとVirtualBoxと競合する。
- ターミナルを開き、グローバルでいいので以下インストールする
vagrant plugin install vagrant-chef-zero
vagrant plugin install vagrant-omnibus
vagrant plugin install ruby-wmi
vagrant plugin install sahara
vagrant plugin install vagrant-share
vagrant plugin install vagrant-vbox-snapshot
vagrant plugin install win32-service

- 以下リポジトリを落とす
git@github.com:KeisukeSatomi/chef_cookbook_php56.git

- リポジトリ直下で以下コマンド
vagrant init
vagrant up --provision

- ブラウザで192.168.100.89を表示する

ここまででcakePHPのページが表示され、特にエラーぽいのがなければOK

※yajil-rubyとffiの不適合エラーは、fatalじゃなくてただの警告なので無視でよい。

