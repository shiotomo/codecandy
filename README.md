# CodeCandy

## このアプリについて(About this application)

プログラミング教育支援システムです。
オンラインコンパイラとして使えます。
エディタも搭載してあるので、このアプリ1つでプログラミングが始められます。

(It is a programming education support system.
It can be used as an online compiler.
Since editor is also equipped, programming can be started with this one application.)

## URL
https://codecandy.tomosse.work

## 対応言語(Supported language)

- C (gcc)
- C (clang)
- C++
- Ruby
- Python3
- Golang
- Node.js
- Java
- Scala
- Swift
- PHP
- Perl
- Bash
- Lua
- Haskell
- Pascal
- TypeScript

## 使い方(How to use)
__.env__
```
cp .env_sample .env
```
データベースのホスト、ロールのパスワード、redisサーバのホスト、
TwitterとGitHubとGoogleのAPIキーを.envに設定
(Set Database Host, Role password, Redis Server Host, Twitter, GitHub and Google API key to .env)

__docker__
```
docker-compose build
docker-compose up redis psql development
```

roleの作成(Create role)  
```
docker-compose run psql psql -h psql -U postgres -c "create role code_candy with createdb login password <PASSWORD>;"
```
パスワードは`docker-compose.yml`の`POSTGRES_PASSWORD`に指定したもの。(デフォルトは`password`)

rails db:setup
```
docker-compose run development bundle exec rails db:setup
```


## LICENSE
MIT
