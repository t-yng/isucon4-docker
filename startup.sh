#!/bin/sh
# ソースの修正をローカルで可能とするために、特殊なことをやっているため起動処理をスクリプトとして定義している

# コンテナを作成
docker run -d --name isucon4 -p 8010:80 matsuu/isucon4-qualifier-standalone:latest

# 作成されたwebappディレクトリの内容をローカルにコピーする
docker cp isucon4:/home/isucon/webapp ./

# ディレクトリをマウントするために一旦コンテナを削除する
docker rm -f isucon4

# ローカルにコピーしたwebappをコンテナにマウントすることで、ローカルでソースコードの変更を可能にする
DIRPATH=$(echo $(pwd))
docker run -d --name isucon4 -v $DIRPATH/webapp:/home/isucon/webapp -p 8010:80 matsuu/isucon4-qualifier-standalone:latest

# supervisord.confをコンテナにコピーする
# 設定を反映させるために、コンテナを再起動する
docker cp supervisord.conf isucon4:/etc/supervisord.conf
docker restart isucon4
