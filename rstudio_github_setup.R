# 以下の2つのパッケージが必要なので、未導入であればインストールする
install.packages("usethis")
install.packages("credentials")

# 0.RStudioでgitを使い変更履歴を管理する際、誰が変更しているのかという情報がを設定するために、以下のコマンドを実行する。
usethis::use_git_config(user.name = "YourName", user.email = "your@mail.com")
# ※YourNameとyour@mail.comはgithubに登録したものにする

# 1. 以下のコマンドを実行すると、ブラウザでgithubのPATを生成する画面が開く。
usethis::create_github_token()
#PATの設定はデフォルトでOK。Expirationで指定した期間が過ぎるとそのPATは使えなくなるので、再度本手順が必要になる
# 2. 一番下の generate Token をクリックする
# 3. PATの情報が表示される。【注意】このページは開いたままにする。一度閉じると手順を最初から行うことになる。
# 4. 以下のコマンドを実行すると、PATを入力するよう求められるので、前項目で表示されたPATをコピー＆ペーストする
credentials::credential_helper_set("store") # 
credentials::credential_helper_get()

credentials::set_github_pat()
# 5. 設定を再読み込みするため、Rをrestartする
# 6. 以下のコマンドを実行すると、設定が正しく行われたか確認できる。
usethis::git_sitrep()
