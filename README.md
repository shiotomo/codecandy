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

## 使い方(How to use)
__docker__
  
```
docker-compose build
```
__postgresql__  
roleの作成(Create role)  
`sudo -u postgres psql`後に
```
create role code_candy with createdb login;
```
__cmd__  
git cloneした後、このリポジトリにいる状態(After that, in this repository state)
```
bundle install --path vendor/bundle
bundle exec rails db:setup
```
__.env__
```
cp .env_sample .env
```
TwitterとGitHubとGoogleのAPIキーを.envに設定(Set Twitter, GitHub and Google API key to .env)

## 実行(Execution)
development
```
bundle exec rails s -b=0.0.0.0
```

## LICENSE
MIT
