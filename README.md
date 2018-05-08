# CodeCandy

## 使い方
__docker__
  
ubuntuイメージを利用します。
```
docker pull ubuntu
docker commit [ID] codecandy/compile
docker build -t codecandy/compile .
```
__postgresql__  
`sudo -u postgres psql`後に
```
create role code_candy with createdb login;
```
__cmd__  
git cloneした後、このリポジトリにいる状態
```
bundle install --path vendor/bundle
bundle exec rails db:create
bundle exec rails db:migrate
```

## 実行
development
```
bundle exec rails s -b=0.0.0.0
```
