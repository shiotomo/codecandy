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

## 使い方(How to use)
__docker__
  
swiftイメージを利用します。(I will use the swift image.)
```
docker pull swift
docker run swift
docker commit [ID] codecandy/compile
docker build -t codecandy/compile .
```
__postgresql__  
`sudo -u postgres psql`後に
```
create role code_candy with createdb login;
```
__cmd__  
git cloneした後、このリポジトリにいる状態(After that, in this repository state)
```
bundle install --path vendor/bundle
bundle exec rails db:create
bundle exec rails db:migrate
```

## 実行(Execution)
development
```
bundle exec rails s -b=0.0.0.0
```

## LICENSE
MIT
