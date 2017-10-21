# README

[matsuu/isucon4-qualifier-standalone](https://hub.docker.com/r/matsuu/isucon4-qualifier-standalone/~/dockerfile/)をベースに個人用に扱いやすくしたisucon4のDockerの仮想環境です。

## 使い方

### コンテナの作成と起動
```
$ ./startup.sh
```

### 利用する言語の切り替え
初期状態では Node.js の実装が起動しています。

#### コンテナ未作成
`supervisord.conf`にて希望の言語を`autostart=true`にし、`[isucon_node]`を`autostart=false`に変更する。

#### コンテナ作成済
コンテナ内の`/etc/supervisord.conf`を編集して、コンテナを再起動する。
```
$ docker restart isucon4
```

### ベンチマークの実行
```
$ docker exec isucon4 /home/isucon/benchmarker bench
```

### Linuxの情報
ディストリビューション: CentOS6
Webサーバー ソフトウェア: nginx

### 参考資料
[ISUCON4 予選当日マニュアル](https://gist.github.com/mirakui/e394ed543415852d34a6)
