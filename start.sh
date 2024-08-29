#!/bin/bash

# Cronをバックグラウンドで起動
cron

# 必要なGemをインストール
bundle install

# データベースを準備
bundle exec rails db:prepare

# 以前のPIDファイルを削除
rm -f tmp/pids/server.pid 

# Railsサーバーを起動
./bin/dev