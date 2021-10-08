# 以下の2つのパッケージが必要なので、未導入であればインストールする
#install.packages("usethis")
#install.packages("credentials")

# 1.RStudioでgitを使い変更履歴を管理する際、誰が変更しているのかという情報を設定する
#   ために、以下のコマンドを実行する。

usethis::use_git_config(user.name = "YourName", user.email = "your@mail.com")

# ※YourNameとyour@mail.comはgithubに登録したものにする

##### 2. gitの認証情報を保存しているヘルパーを確認する。OSによって異なる ####

credentials::credential_helper_get()

# Windowsでは manager 、Macでは osxkeychainと表示されていればOK。
# 上記以外の場合や、Linuxで、"cache" と表示された場合、次の行のコマンド
# をコメントアウトを外して実行する。

#credentials::credential_helper_set("store")


#### 3. 以下のコマンドを実行すると、ブラウザでgithubのPAT（Personal Access Token）####
####    を生成する画面が開く。

usethis::create_github_token()

# PATの設定はデフォルトでOK。
# Expirationで指定した期間が過ぎるとそのPATは使えなくなるので、再度本手順が必要になる。

#### 4. 一番下の generate Token をクリックする ####

#### 5. PATの情報が表示される。【注意】このページは開いたままにする。 ####
####    一度閉じると手順を最初から行うことになる。

##### 6. 以下のコマンドを実行すると、PATを入力するよう求められるので、前項目で表示され ####
#####    たPATをコピー＆ペーストする

credentials::set_github_pat()

##### 7. 設定を再読み込みするため、Rをrestartする ####

##### 8. 以下のコマンドを実行すると、設定が正しく行われたか確認できる。 ####

usethis::git_sitrep()

