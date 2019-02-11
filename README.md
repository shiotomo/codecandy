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

## 使用技術(Requirements)

- ruby 2.6
- rails 5.1.6
- yarn 1.13.0
- docker 18.09.1
- docker-compose 1.23.2
- typescript 3.2.2
- postgresql
- redis

## 使い方(How to use)
__.env__
```
cp .env.sample .env
```
データベースのホスト、ロールのパスワード、redisサーバのホスト、
TwitterとGitHubとGoogleのAPIキーを.envに設定
(Set Database Host, Role password, Redis Server Host, Twitter, GitHub and Google API key to .env)

__docker__
```
docker-compose build
```

__PostgreSQL__
roleの作成(Create role)  
```
create role code_candy with createdb login password '<PASSWORD>';
```
パスワードは`docker-compose.yml`の`POSTGRES_PASSWORD`に指定したもの。

__Rails__
```
bundle install -j4 --path vendor/bundle
bundle exec rails db:setup
```

__yarn__
```
yarn install
```

__Exec__
```
bundle exec foreman start
```
## LICENSE
MIT
